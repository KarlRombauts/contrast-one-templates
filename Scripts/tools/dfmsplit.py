#!/usr/bin/env python3
"""Split a DFM file into logical blocks with GPP #include directives.

Usage:
    python3 dfmsplit.py split <input.dfm> <output_dir> [--config <config.json>]
    python3 dfmsplit.py tree <input.dfm>

The 'tree' command prints the object hierarchy with line numbers.
The 'split' command splits the DFM into a skeleton + part files.
"""

import re
import sys
import json
import os
from dataclasses import dataclass, field
from pathlib import Path


@dataclass
class DfmNode:
    """A node in the DFM object tree."""
    kind: str          # 'object' or 'inherited'
    name: str          # component name
    type_name: str     # component type (e.g. TcxTabSheet)
    start_line: int    # 1-based line number of the 'object' line
    end_line: int = 0  # 1-based line number of the matching 'end'
    indent: int = 0    # number of leading spaces
    children: list = field(default_factory=list)
    properties: list = field(default_factory=list)  # (line_number, text) tuples

    @property
    def caption(self):
        for _, text in self.properties:
            m = re.match(r"\s*Caption\s*=\s*'(.*)'", text)
            if m:
                return m.group(1)
        return None

    def tree_str(self, depth=0):
        cap = f" [{self.caption}]" if self.caption else ""
        lines = [f"{'  ' * depth}{self.kind} {self.name}: {self.type_name}"
                 f"  (L{self.start_line}-{self.end_line}){cap}"]
        for child in self.children:
            lines.append(child.tree_str(depth + 1))
        return "\n".join(lines)


OBJ_RE = re.compile(r'^(\s*)(object|inherited)\s+(\w+)\s*:\s*(\S+)\s*$')
END_RE = re.compile(r'^(\s*)end\s*$')
ITEM_RE = re.compile(r'^(\s*)item\s*$')
ITEM_END_RE = re.compile(r'^(\s*)end>\s*$')  # 'end>' closes last item + collection


def _clean_lines(lines: list[str]) -> list[str]:
    """Strip non-printable characters and binary trailers from DFM exports.

    Contrast One exports append a binary trailer (e.g. 'LQ\\x01') after
    the final 'end' keyword. We strip non-printables and also clean up
    any trailing garbage after a line-starting 'end'.
    """
    cleaned = []
    for line in lines:
        # Strip non-printable characters
        line = re.sub(r'[^\x09\x0a\x0d\x20-\x7e]', '', line)
        # Clean trailing garbage after 'end' (but preserve 'end>' for collections)
        line = re.sub(r'^(\s*end)[^>\s].*$', r'\1', line)
        cleaned.append(line)
    return cleaned


def parse_dfm(lines: list[str]) -> tuple[list[str], DfmNode | None]:
    """Parse DFM lines into a tree. Returns (header_lines, root_node).

    header_lines are any lines before the first object declaration.
    Handles 'item'/'end' pairs inside collection properties by tracking
    nesting depth separately so they don't consume object-level 'end's.
    """
    lines = _clean_lines(lines)
    header = []
    root = None
    stack = []       # DfmNode stack
    item_depth = 0   # track nested item/end pairs

    for i, line in enumerate(lines, 1):
        # 'end>' closes the last item AND the collection — treat as item close
        if ITEM_END_RE.match(line):
            if item_depth > 0:
                item_depth -= 1
            if stack:
                stack[-1].properties.append((i, line))
            continue

        # Track item/end pairs (collection entries) separately
        if ITEM_RE.match(line):
            item_depth += 1
            if stack:
                stack[-1].properties.append((i, line))
            continue

        m = END_RE.match(line)
        if m:
            if item_depth > 0:
                # This 'end' closes an 'item', not an 'object'
                item_depth -= 1
                if stack:
                    stack[-1].properties.append((i, line))
                continue
            if stack:
                stack[-1].end_line = i
                stack.pop()
                continue

        m = OBJ_RE.match(line)
        if m:
            indent = len(m.group(1))
            node = DfmNode(
                kind=m.group(2),
                name=m.group(3),
                type_name=m.group(4),
                start_line=i,
                indent=indent,
            )
            if not stack:
                root = node
            else:
                stack[-1].children.append(node)
            stack.append(node)
            continue

        if stack:
            stack[-1].properties.append((i, line))
        else:
            header.append(line)

    return header, root


def find_node(root: DfmNode, name: str) -> DfmNode | None:
    """Find a node by name (depth-first)."""
    if root.name == name:
        return root
    for child in root.children:
        result = find_node(child, name)
        if result:
            return result
    return None


def extract_lines(all_lines: list[str], start: int, end: int) -> list[str]:
    """Extract lines[start-1:end] (1-based inclusive)."""
    return all_lines[start - 1:end]


@dataclass
class SplitSpec:
    """Specifies a block to extract into its own file."""
    node_name: str     # DfmNode.name to extract
    filename: str      # output filename (relative to output dir)


def split_dfm(input_path: str, output_dir: str, specs: list[SplitSpec]):
    """Split a DFM file according to the given specs."""
    input_path = Path(input_path)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    raw_lines = input_path.read_text().splitlines()
    all_lines = _clean_lines(raw_lines)
    _, root = parse_dfm(all_lines)

    if not root:
        print("Error: no root object found", file=sys.stderr)
        sys.exit(1)

    # Resolve specs to nodes and their line ranges
    extractions = []  # (start_line, end_line, filename, node)
    for spec in specs:
        node = find_node(root, spec.node_name)
        if not node:
            print(f"Warning: node '{spec.node_name}' not found, skipping",
                  file=sys.stderr)
            continue
        extractions.append((node.start_line, node.end_line, spec.filename, node))

    # Sort by start line
    extractions.sort(key=lambda x: x[0])

    # Check for overlaps
    for i in range(len(extractions) - 1):
        if extractions[i][1] >= extractions[i + 1][0]:
            print(f"Error: overlapping extractions: {extractions[i][2]} and "
                  f"{extractions[i + 1][2]}", file=sys.stderr)
            sys.exit(1)

    # Write extracted files — dedented to column 0 for readability.
    # DFM indentation is cosmetic (Delphi parses object/end nesting),
    # so the reassembled file won't have identical whitespace but will
    # be functionally equivalent.
    for start, end, filename, node in extractions:
        part_lines = extract_lines(all_lines, start, end)
        indent = node.indent
        dedented = []
        for line in part_lines:
            if line[:indent] == " " * indent:
                dedented.append(line[indent:])
            else:
                dedented.append(line.lstrip())
        part_path = output_dir / filename
        part_path.parent.mkdir(parents=True, exist_ok=True)
        part_path.write_text("\n".join(dedented) + "\n")
        print(f"  Wrote {part_path} ({end - start + 1} lines)")

    # Build skeleton: #include at the node's natural indentation level
    # so the skeleton reads naturally in context.
    skeleton_lines = []
    skip_until = 0
    for i, line in enumerate(all_lines, 1):
        if i <= skip_until:
            continue

        # Check if this line starts an extracted block
        extracted = None
        for start, end, filename, node in extractions:
            if i == start:
                extracted = (start, end, filename, node)
                break

        if extracted:
            start, end, filename, node = extracted
            indent = " " * node.indent
            skeleton_lines.append(f'{indent}#include "screen/{filename}"')
            skip_until = end
        else:
            skeleton_lines.append(line)

    skeleton_path = output_dir / "screen.dfm"
    skeleton_path.write_text("\n".join(skeleton_lines) + "\n")
    print(f"  Wrote {skeleton_path} (skeleton, {len(skeleton_lines)} lines)")


def cmd_tree(input_path: str):
    """Print the object hierarchy."""
    all_lines = _clean_lines(Path(input_path).read_text().splitlines())
    _, root = parse_dfm(all_lines)
    if root:
        print(root.tree_str())
    else:
        print("No objects found.")


def cmd_split(input_path: str, output_dir: str, config_path: str | None = None):
    """Split the DFM using a config file or auto-detect."""
    if config_path:
        config = json.loads(Path(config_path).read_text())
        specs = [SplitSpec(**s) for s in config["splits"]]
    else:
        # Auto-detect: split all TcxTabSheet and top-level TcxGroupBox children
        all_lines = Path(input_path).read_text().splitlines()
        _, root = parse_dfm(all_lines)
        if not root:
            print("No objects found.", file=sys.stderr)
            sys.exit(1)

        print("No config provided. Use --config or the tree command to plan splits.")
        print("\nObject tree:")
        print(root.tree_str())
        sys.exit(0)

    split_dfm(input_path, output_dir, specs)


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        sys.exit(1)

    cmd = sys.argv[1]
    if cmd == "tree":
        cmd_tree(sys.argv[2])
    elif cmd == "split":
        config = None
        if "--config" in sys.argv:
            idx = sys.argv.index("--config")
            config = sys.argv[idx + 1]
        cmd_split(sys.argv[2], sys.argv[3], config)
    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)


if __name__ == "__main__":
    main()
