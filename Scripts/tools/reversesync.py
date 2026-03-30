#!/usr/bin/env python3
"""reversesync.py — Diff an app-exported Pascal script against modular source files.

Usage:
    reversesync.py <mapping.json> <modified_export.pas> [--apply]

The mapping JSON maps source file paths to lists of function names:
    {
        "shared/utils/strUtils.pas": ["StrToFloatDef", "StrToIntDef"],
        "report.pas": ["GetFindings", "ProduceMergeFieldData"]
    }
"""

import argparse
import difflib
import json
import os
import re
import sys

from pascal_parser import parse


# ---------------------------------------------------------------------------
# Normalization
# ---------------------------------------------------------------------------

def normalize(text: str) -> str:
    """Normalize Pascal source text for comparison.

    - Strip trailing whitespace from each line
    - Remove non-ASCII characters
    - Remove trailing blank lines
    """
    lines = text.split('\n')
    # Strip trailing whitespace and non-ASCII characters per line
    normalized = []
    for line in lines:
        # Remove non-ASCII characters
        line = re.sub(r'[^\x00-\x7F]', '', line)
        # Strip trailing whitespace
        line = line.rstrip()
        normalized.append(line)
    # Remove trailing blank lines
    while normalized and normalized[-1] == '':
        normalized.pop()
    return '\n'.join(normalized)


# ---------------------------------------------------------------------------
# Diffing
# ---------------------------------------------------------------------------

def diff_function(func_name: str, source_body: str, export_body: str) -> list:
    """Return unified diff lines comparing source_body and export_body.

    Both bodies are normalized before comparison. Returns an empty list when
    the two versions are identical after normalization.
    """
    source_norm = normalize(source_body)
    export_norm = normalize(export_body)

    source_lines = source_norm.splitlines(keepends=True)
    export_lines = export_norm.splitlines(keepends=True)

    # Ensure lines end with newline for clean diff output
    if source_lines and not source_lines[-1].endswith('\n'):
        source_lines[-1] += '\n'
    if export_lines and not export_lines[-1].endswith('\n'):
        export_lines[-1] += '\n'

    diff = list(difflib.unified_diff(
        source_lines,
        export_lines,
        fromfile=f'source: {func_name}',
        tofile=f'modified: {func_name}',
        lineterm='',
    ))
    return diff


# ---------------------------------------------------------------------------
# Main logic
# ---------------------------------------------------------------------------

def run_sync(mapping_path: str, export_path: str, apply: bool = False) -> None:
    """Main synchronization logic — prints diff report to stdout.

    Args:
        mapping_path: Path to the mapping JSON file.
        export_path:  Path to the app-exported Pascal file.
        apply:        Placeholder for future write-back functionality.
    """
    # ------------------------------------------------------------------
    # Load mapping JSON
    # ------------------------------------------------------------------
    with open(mapping_path, 'r', encoding='utf-8') as fh:
        mapping_raw: dict = json.load(fh)

    # Build reverse map: function_name -> source_file_path
    func_to_file: dict[str, str] = {}
    for source_file, func_names in mapping_raw.items():
        for name in func_names:
            func_to_file[name] = source_file

    # ------------------------------------------------------------------
    # Parse the export file
    # ------------------------------------------------------------------
    with open(export_path, 'r', encoding='utf-8', errors='replace') as fh:
        export_source = fh.read()

    export_result = parse(export_source)
    export_funcs: dict[str, object] = {f.name: f for f in export_result.functions}

    # ------------------------------------------------------------------
    # Categorize functions
    # ------------------------------------------------------------------
    unplaced: list = []      # In export but NOT in mapping
    removed: list = []       # In mapping but NOT in export

    for name in export_funcs:
        if name not in func_to_file:
            unplaced.append(name)

    for name, source_file in func_to_file.items():
        if name not in export_funcs:
            removed.append((name, source_file))

    # ------------------------------------------------------------------
    # Diff functions grouped by source file
    # ------------------------------------------------------------------
    # file_path -> list of diff blocks (each block is a list of diff lines)
    file_diffs: dict[str, list] = {}

    # Cache parsed source files to avoid re-reading
    parsed_sources: dict[str, object] = {}

    for name, export_func in export_funcs.items():
        if name not in func_to_file:
            continue  # Will be reported as UNPLACED

        source_file = func_to_file[name]

        # Read and parse source file (cached)
        if source_file not in parsed_sources:
            if not os.path.isfile(source_file):
                # Try relative to cwd (already is — just note if missing)
                parsed_sources[source_file] = None
            else:
                with open(source_file, 'r', encoding='utf-8', errors='replace') as fh:
                    src = fh.read()
                parsed_sources[source_file] = parse(src)

        source_result = parsed_sources[source_file]
        if source_result is None:
            # Source file missing — treat as a change (can't compare)
            block = [
                f'--- source: {name}\n',
                f'+++ modified: {name}\n',
                f'@@ source file not found: {source_file} @@\n',
            ]
            file_diffs.setdefault(source_file, []).append(block)
            continue

        source_func_map: dict[str, object] = {f.name: f for f in source_result.functions}

        if name not in source_func_map:
            # Function exists in export and mapping but not in source file
            block = [
                f'--- source: {name}\n',
                f'+++ modified: {name}\n',
                f'@@ function not found in source file @@\n',
            ]
            file_diffs.setdefault(source_file, []).append(block)
            continue

        source_func = source_func_map[name]
        diff_lines = diff_function(name, source_func.body, export_func.body)

        if diff_lines:
            file_diffs.setdefault(source_file, []).append(diff_lines)

    # ------------------------------------------------------------------
    # Preamble diff (if _preamble.pas exists in cwd)
    # ------------------------------------------------------------------
    preamble_file = '_preamble.pas'
    preamble_diffs: list = []

    if os.path.isfile(preamble_file):
        with open(preamble_file, 'r', encoding='utf-8', errors='replace') as fh:
            preamble_source = fh.read()

        source_preamble_norm = normalize(preamble_source)
        export_preamble_norm = normalize(export_result.preamble)

        if source_preamble_norm != export_preamble_norm:
            source_lines = source_preamble_norm.splitlines(keepends=True)
            export_lines = export_preamble_norm.splitlines(keepends=True)
            if source_lines and not source_lines[-1].endswith('\n'):
                source_lines[-1] += '\n'
            if export_lines and not export_lines[-1].endswith('\n'):
                export_lines[-1] += '\n'
            preamble_diffs = list(difflib.unified_diff(
                source_lines,
                export_lines,
                fromfile='source: preamble',
                tofile='modified: preamble',
                lineterm='',
            ))

    # ------------------------------------------------------------------
    # Render output
    # ------------------------------------------------------------------
    has_output = bool(file_diffs or preamble_diffs or unplaced or removed)

    if not has_output:
        print('No changes detected.')
        return

    # Preamble diffs first
    if preamble_diffs:
        print(f'=== {preamble_file} ===')
        for line in preamble_diffs:
            print(line)
        print()

    # Per-file diffs
    for source_file, blocks in sorted(file_diffs.items()):
        print(f'=== {source_file} ===')
        for block in blocks:
            for line in block:
                print(line, end='')
        print()

    # Unplaced
    if unplaced:
        print('=== UNPLACED (new or renamed functions) ===')
        for name in sorted(unplaced):
            func = export_funcs[name]
            line_count = len(func.body.splitlines())
            print(f'  function {name} ({line_count} lines)')
        print()

    # Removed
    if removed:
        print('=== REMOVED (in mapping but missing from export) ===')
        for name, source_file in sorted(removed):
            print(f'  {name} (was in {source_file})')
        print()


# ---------------------------------------------------------------------------
# CLI entry point
# ---------------------------------------------------------------------------

def main() -> None:
    parser = argparse.ArgumentParser(
        description='Diff an app-exported Pascal script against modular source files.',
    )
    parser.add_argument('mapping', help='Path to the mapping JSON file.')
    parser.add_argument('export', help='Path to the app-exported Pascal file.')
    parser.add_argument(
        '--apply',
        action='store_true',
        default=False,
        help='(Placeholder) Apply diffs back to source files. Not yet implemented.',
    )
    args = parser.parse_args()

    run_sync(args.mapping, args.export, apply=args.apply)


if __name__ == '__main__':
    main()
