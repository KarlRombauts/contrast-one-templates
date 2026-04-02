#!/usr/bin/env python3
"""
dfmquery.py - Query and navigate Delphi DFM files.

Usage:
  dfmquery.py list <file>... [--type TYPE] [--depth N] [--parent]
  dfmquery.py types <file>...
  dfmquery.py get <file> <name> [--children] [--offsets]
  dfmquery.py children <file> <name>
  dfmquery.py validate <file>...

Commands:
  list       List all objects, optionally filtered by type or depth
  types      Count object types across one or more files
  get        Get a single object by name, optionally with children
  children   List direct children of a named object
  validate   Check nesting balance and Control= references

Options:
  --type TYPE   Filter by Delphi type (e.g. TcxCheckBox, TdxLayoutGroup)
  --depth N     Only show objects at nesting depth N
  --parent      Show parent name in list output
  --children    Include the full nested content of the object
  --offsets     Show start/end line numbers

Output format (list/children):
  Each line: LINE_START-LINE_END  DEPTH  NAME: TYPE  [parent: PARENT]

Output format (types):
  Each line: COUNT  TYPE

Output format (get):
  The raw DFM content of the object (including children if --children)

Examples:
  # List all checkboxes
  dfmquery.py list screen.dfm --type TcxCheckBox

  # List across multiple files with parent info
  dfmquery.py list src/exams/*/screen.dfm --type TcxRadioGroup --parent

  # Count types across all exams
  dfmquery.py types src/exams/*/screen.dfm

  # Get a specific object without children
  dfmquery.py get screen.dfm chkHysterectomy

  # Get a tab with all its children
  dfmquery.py get screen.dfm tsUterus --children

  # List direct children of a page control
  dfmquery.py children screen.dfm pcReportBody

  # Validate multiple files
  dfmquery.py validate src/exams/*/screen.dfm
"""

import sys
import re
import glob
import argparse
from collections import Counter


def parse_objects(lines):
    """Parse all objects from DFM lines, tracking nesting.

    Returns list of dicts:
      name, type, depth, line_start (0-indexed), line_end (0-indexed, inclusive),
      parent_name (or None)
    """
    objects = []
    stack = []  # list of (name, type, line_start, depth)

    for i, line in enumerate(lines):
        stripped = line.strip()

        # Object or inherited opening
        m = re.match(r'^(object|inherited)\s+(\w+)\s*:\s*(\w+)', stripped)
        if m:
            name = m.group(2)
            typ = m.group(3)
            depth = len(stack)
            parent = stack[-1][0] if stack else None
            stack.append((name, typ, i, depth))
            continue

        # item opening (inside Properties.Items = < ... >)
        if stripped == 'item':
            stack.append(('__item__', 'item', i, len(stack)))
            continue

        # end or end> closing
        if stripped == 'end' or stripped == 'end>':
            if stack:
                name, typ, start, depth = stack.pop()
                if name != '__item__':
                    parent = stack[-1][0] if stack else None
                    objects.append({
                        'name': name,
                        'type': typ,
                        'depth': depth,
                        'line_start': start,
                        'line_end': i,
                        'parent': parent,
                    })
            continue

    return objects


def expand_files(file_args):
    """Expand file arguments, supporting shell globs that weren't expanded."""
    files = []
    for pattern in file_args:
        expanded = glob.glob(pattern)
        if expanded:
            files.extend(sorted(expanded))
        else:
            files.append(pattern)  # let it fail on open with a clear error
    return files


def cmd_list(args):
    files = expand_files(args.files)
    multi = len(files) > 1
    show_parent = getattr(args, 'parent', False)

    for filepath in files:
        with open(filepath) as f:
            lines = f.readlines()

        objects = parse_objects(lines)

        for obj in objects:
            if args.type and obj['type'] != args.type:
                continue
            if args.depth is not None and obj['depth'] != args.depth:
                continue

            ls = obj['line_start'] + 1
            le = obj['line_end'] + 1
            prefix = f"{filepath}:" if multi else ""
            suffix = f"\t[parent: {obj['parent']}]" if show_parent and obj['parent'] else ""
            print(f"{prefix}{ls}-{le}\td={obj['depth']}\t{obj['name']}: {obj['type']}{suffix}")


def cmd_types(args):
    files = expand_files(args.files)
    counts = Counter()

    for filepath in files:
        with open(filepath) as f:
            lines = f.readlines()
        objects = parse_objects(lines)
        for obj in objects:
            counts[obj['type']] += 1

    for typ, count in counts.most_common():
        print(f"{count}\t{typ}")


def cmd_get(args):
    with open(args.file) as f:
        lines = f.readlines()

    objects = parse_objects(lines)

    target = None
    for obj in objects:
        if obj['name'] == args.name:
            target = obj
            break

    if not target:
        print(f"Error: object '{args.name}' not found", file=sys.stderr)
        sys.exit(1)

    if args.offsets:
        print(f"# lines {target['line_start']+1}-{target['line_end']+1}")

    if args.children:
        # Print the entire section including all children
        for i in range(target['line_start'], target['line_end'] + 1):
            print(lines[i], end='')
    else:
        # Print just the object's direct properties (stop at first child object)
        depth = 0
        for i in range(target['line_start'], target['line_end'] + 1):
            stripped = lines[i].strip()

            if i == target['line_start']:
                print(lines[i], end='')
                depth = 1
                continue

            # Check if we're entering a child object
            if (re.match(r'^(object|inherited)\s+\w+\s*:', stripped) or stripped == 'item') and depth == 1:
                # Skip children - just note them
                child_m = re.match(r'^(object|inherited)\s+(\w+)\s*:\s*(\w+)', stripped)
                if child_m:
                    print(f"  // child: {child_m.group(2)}: {child_m.group(3)}")
                if stripped == 'item':
                    depth += 1
                else:
                    depth += 1
                continue

            if depth > 1:
                # Inside a child, skip
                if stripped == 'end' or stripped == 'end>':
                    depth -= 1
                elif re.match(r'^(object|inherited)\s+\w+\s*:', stripped) or stripped == 'item':
                    depth += 1
                continue

            if stripped == 'end' or stripped == 'end>':
                if depth == 1:
                    print(lines[i], end='')
                    break
                depth -= 1
                continue

            # Handle Properties.Items = < ... end> inline collections
            # These contain 'item' / 'end' pairs that we need to include
            print(lines[i], end='')


def cmd_children(args):
    with open(args.file) as f:
        lines = f.readlines()

    objects = parse_objects(lines)

    # Find children where parent == args.name
    children = [o for o in objects if o['parent'] == args.name]

    if not children:
        # Check if parent exists
        parent_exists = any(o['name'] == args.name for o in objects)
        if not parent_exists:
            print(f"Error: object '{args.name}' not found", file=sys.stderr)
            sys.exit(1)
        print(f"(no children)")
        return

    for obj in children:
        ls = obj['line_start'] + 1
        le = obj['line_end'] + 1
        print(f"{ls}-{le}\td={obj['depth']}\t{obj['name']}: {obj['type']}")


def _validate_one(filepath):
    """Validate a single DFM file. Returns (filepath, errors, obj_count, line_count)."""
    with open(filepath) as f:
        lines = f.readlines()

    errors = []

    # 1. Check nesting balance
    depth = 0
    in_item = 0  # track item block depth for better error messages
    for i, line in enumerate(lines):
        stripped = line.strip()
        if re.match(r'^(object|inherited)\s+\w+\s*:', stripped):
            depth += 1
        elif stripped == 'item':
            depth += 1
            in_item += 1
        if stripped == 'end' or stripped == 'end>':
            depth -= 1
            if in_item > 0:
                in_item -= 1
        if depth < 0:
            context = " (inside Properties.Items block)" if in_item > 0 else ""
            errors.append(f"Line {i+1}: nesting depth went negative{context}")
            break

    if depth != 0:
        context = f" ({in_item} unclosed item blocks)" if in_item > 0 else ""
        errors.append(f"Nesting imbalance: final depth = {depth} (expected 0){context}")

    # 2. Check Control= references
    objects = parse_objects(lines)
    obj_names = {o['name'] for o in objects}

    for i, line in enumerate(lines):
        m = re.match(r'\s*Control\s*=\s*(\w+)', line)
        if m:
            ref = m.group(1)
            if ref not in obj_names:
                errors.append(f"Line {i+1}: Control = {ref} references non-existent object")

    # 3. Check for duplicate names
    name_counts = Counter(o['name'] for o in objects)
    for name, count in name_counts.items():
        if count > 1:
            errors.append(f"Duplicate object name: {name} ({count} times)")

    obj_count = len(objects)
    return filepath, errors, obj_count, len(lines)


def cmd_validate(args):
    files = expand_files(args.files)
    any_errors = False

    for filepath in files:
        label = filepath if len(files) > 1 else ""
        fp, errors, obj_count, line_count = _validate_one(filepath)

        if errors:
            any_errors = True
            if label:
                print(f"{label}:")
            print(f"ERRORS ({len(errors)}):")
            for e in errors:
                print(f"  {e}")
        else:
            prefix = f"{label}: " if label else ""
            print(f"{prefix}OK: {obj_count} objects, {line_count} lines, balanced")

    if any_errors:
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(description='Query and navigate Delphi DFM files')
    subparsers = parser.add_subparsers(dest='command', required=True)

    # list
    p_list = subparsers.add_parser('list', help='List objects')
    p_list.add_argument('files', nargs='+', metavar='file')
    p_list.add_argument('--type', help='Filter by Delphi type')
    p_list.add_argument('--depth', type=int, help='Filter by nesting depth')
    p_list.add_argument('--parent', action='store_true', help='Show parent name')

    # types
    p_types = subparsers.add_parser('types', help='Count object types')
    p_types.add_argument('files', nargs='+', metavar='file')

    # get
    p_get = subparsers.add_parser('get', help='Get an object by name')
    p_get.add_argument('file')
    p_get.add_argument('name')
    p_get.add_argument('--children', action='store_true', help='Include nested children')
    p_get.add_argument('--offsets', action='store_true', help='Show line offsets')

    # children
    p_children = subparsers.add_parser('children', help='List direct children')
    p_children.add_argument('file')
    p_children.add_argument('name')

    # validate
    p_validate = subparsers.add_parser('validate', help='Validate DFM structure')
    p_validate.add_argument('files', nargs='+', metavar='file')

    args = parser.parse_args()

    if args.command == 'list':
        cmd_list(args)
    elif args.command == 'types':
        cmd_types(args)
    elif args.command == 'get':
        cmd_get(args)
    elif args.command == 'children':
        cmd_children(args)
    elif args.command == 'validate':
        cmd_validate(args)


if __name__ == '__main__':
    main()
