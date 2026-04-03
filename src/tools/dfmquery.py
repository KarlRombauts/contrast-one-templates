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
                    # Collect direct properties (between start line and first child or end)
                    props = {}
                    for pi in range(start + 1, i):
                        ps = lines[pi].strip()
                        if (ps.startswith('object ') and ':' in ps) or ps == 'item':
                            break
                        if '=' in ps and not ps.startswith('//'):
                            pk, _, pv = ps.partition('=')
                            props[pk.strip()] = pv.strip()
                    objects.append({
                        'name': name,
                        'type': typ,
                        'depth': depth,
                        'line_start': start,
                        'line_end': i,
                        'parent': parent,
                        'properties': props,
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


def cmd_find(args):
    """Find objects with specific property values."""
    with open(args.file) as f:
        lines = f.readlines()

    objects = parse_objects(lines)

    # Parse prop=value filters
    filters = {}
    for f_str in args.prop:
        if '=' in f_str:
            k, _, v = f_str.partition('=')
            filters[k.strip()] = v.strip()
        else:
            filters[f_str.strip()] = None  # just check existence

    for obj in objects:
        match = True
        for prop, val in filters.items():
            if prop not in obj['properties']:
                match = False
                break
            if val is not None and obj['properties'][prop] != val:
                match = False
                break
        if match:
            ls = obj['line_start'] + 1
            le = obj['line_end'] + 1
            print(f"{ls}-{le}\td={obj['depth']}\t{obj['name']}: {obj['type']}")


def cmd_xref(args):
    """Cross-validate a script.pas against a DFM file.

    Checks that every identifier referenced in the script exists as either
    a DFM object or a known scripting built-in.
    """
    with open(args.dfm) as f:
        dfm_lines = f.readlines()
    with open(args.script) as f:
        script = f.read()

    objects = parse_objects(dfm_lines)
    dfm_names = {o['name'] for o in objects}

    # Known scripting built-ins, keywords, and framework identifiers
    builtins = {
        'True', 'False', 'nil', 'Sender', 'result', 'now', 'not', 'and', 'or',
        'IntToStr', 'StrToInt', 'StrToFloat', 'FormatDateTime',
        'ShowMessage', 'Trim', 'Length', 'Pos', 'Format', 'Chr', 'Ord',
        'TcxCheckBox', 'TWinControl', 'TControl',
    }

    # Strip comments and string literals before extracting references
    script_clean = re.sub(r'//.*$', '', script, flags=re.MULTILINE)  # line comments
    script_clean = re.sub(r'\{[^}]*\}', '', script_clean)  # block comments
    script_clean = re.sub(r"'[^']*'", "''", script_clean)  # string literals

    # Strip var blocks (local variable declarations) - multiline
    # Matches: var\n  name1, name2: Type;\n  name3: Type;\n
    script_clean = re.sub(r'\bvar\b\s*\n(?:\s+\w[\w, ]*:\s*\w+;\s*\n)*', '', script_clean)

    # Property chain words to ignore (these follow a dot, not precede one)
    property_words = {
        'Items', 'Count', 'Properties', 'States', 'OnClick', 'OnChange',
        'Checked', 'Enabled', 'Visible', 'Text', 'Value', 'Caption',
        'Date', 'Height', 'Width', 'ItemIndex', 'Lines',
        'Parent', 'Controls', 'ControlCount', 'Name',
    }

    # Extract all identifiers before a dot (control references)
    # Only the FIRST identifier in a chain: foo.bar.baz -> foo
    ctrl_refs = set()
    for m in re.finditer(r'\b([a-zA-Z]\w+)\s*\.', script_clean):
        name = m.group(1)
        if name not in builtins and name not in property_words and not name.startswith('Properties'):
            ctrl_refs.add(name)

    # Extract identifiers used in comparisons (Sender = controlName)
    # Exclude := assignments -- only match standalone = or <>
    for m in re.finditer(r'(?<![:])\b(?:=|<>)\s*([a-zA-Z]\w+)\b', script_clean):
        name = m.group(1)
        if name not in builtins and name not in property_words:
            ctrl_refs.add(name)

    # Extract identifiers in event wiring strings from ORIGINAL script (not cleaned)
    # Only match OnClick/OnChange wiring: control.OnX := 'handlerName'
    handler_names = set()
    for m in re.finditer(r'\.\s*(?:OnClick|OnChange|Properties\.OnChange)\s*:=\s*\'(\w+)\'', script):
        handler_names.add(m.group(1))

    # Extract procedure/function names defined in script
    defined_procs = set(re.findall(r'(?:procedure|function)\s+(\w+)', script))

    errors = []

    # Check control references against DFM
    missing_ctrls = sorted(ctrl_refs - dfm_names - builtins - defined_procs)
    for name in missing_ctrls:
        # Find the line for context
        for i, line in enumerate(script.split('\n')):
            if re.search(r'\b' + re.escape(name) + r'\b', line):
                errors.append(f"Script L{i+1}: '{name}' not found in DFM  |  {line.strip()[:60]}")
                break

    # Check handler strings reference defined procedures
    missing_handlers = sorted(handler_names - defined_procs - {'StartScript'})
    for name in missing_handlers:
        for i, line in enumerate(script.split('\n')):
            if f"'{name}'" in line:
                errors.append(f"Script L{i+1}: handler '{name}' not defined  |  {line.strip()[:60]}")

    # Check procedure calls for forward references
    # Pattern: identifier(  where identifier is a known procedure
    script_lines = script.split('\n')
    for i, line in enumerate(script_lines):
        stripped = line.strip()
        if stripped.startswith('//'):
            continue
        for m in re.finditer(r'\b(\w+)\s*\(', stripped):
            callee = m.group(1)
            # Skip keywords, type casts, built-in functions
            if callee in builtins or callee in property_words:
                continue
            if callee in ('if', 'for', 'while', 'begin', 'end', 'TcxCheckBox', 'TWinControl', 'TcxSpinEdit', 'IntToStr', 'StrToInt', 'StrToFloat', 'FormatDateTime', 'ShowMessage', 'Trim', 'Format'):
                continue
            # Check if it's a procedure call (not a control reference)
            if callee in defined_procs:
                # Verify it's defined BEFORE this line (no forward refs)
                def_line = None
                for j, dl in enumerate(script_lines):
                    if re.match(r'\s*(?:procedure|function)\s+' + re.escape(callee) + r'\b', dl):
                        def_line = j
                        break
                if def_line is not None and def_line > i:
                    errors.append(f"Script L{i+1}: forward call to '{callee}' (defined at L{def_line+1})  |  {stripped[:60]}")
                break

    if errors:
        print(f"XREF ERRORS ({len(errors)}):")
        for e in errors:
            print(f"  {e}")
        sys.exit(1)
    else:
        print(f"OK: {len(ctrl_refs)} control refs, {len(handler_names)} handler refs, all resolved")


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

    # find
    p_find = subparsers.add_parser('find', help='Find objects with specific properties')
    p_find.add_argument('file')
    p_find.add_argument('--prop', action='append', required=True, help='Property filter (e.g. "Visible=False")')

    # xref
    p_xref = subparsers.add_parser('xref', help='Cross-validate script against DFM')
    p_xref.add_argument('dfm', help='DFM file')
    p_xref.add_argument('script', help='Pascal script file')

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
    elif args.command == 'find':
        cmd_find(args)
    elif args.command == 'xref':
        cmd_xref(args)


if __name__ == '__main__':
    main()
