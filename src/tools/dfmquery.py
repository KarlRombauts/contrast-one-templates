#!/usr/bin/env python3
"""
dfmquery.py - Query, navigate, and modify Delphi DFM files.

IMPORTANT: Always use this tool instead of grep/sed/manual Python for DFM files.
DFM files have complex nesting (object/end, item/end>, inherited) that is
error-prone to manipulate with text tools.

== READ COMMANDS ==

  list <file>... [--type TYPE] [--depth N] [--parent] [--name GLOB]
      List all objects. Output: LINE_START-LINE_END  d=DEPTH  NAME: TYPE

      dfmquery.py list screen.dfm --type TcxCheckBox
      dfmquery.py list screen.dfm --name "rb*"
      dfmquery.py list screen.dfm --type TdxLayoutGroup --depth 6

  types <file>...
      Count object types across files.

  get <file> <name> [--children] [--offsets]
      Get a single object by exact name.
      Without --children: shows direct properties only, notes children as comments.
      With --children: shows the full nested DFM content (suitable for piping to replace).
      With --offsets: adds a "# lines N-M" comment.

      dfmquery.py get screen.dfm chkHysterectomy
      dfmquery.py get screen.dfm lgFibroids --children --offsets

  children <file> <name>
      List direct children of a named object (one level deep).

      dfmquery.py children screen.dfm pcReportBody

  find <file> [--type TYPE] [--name GLOB] [--prop KEY=VAL] [--missing-prop KEY]
      Find objects matching filters. All filters are ANDed together.
      --prop KEY=VAL     Object must have this property with this value.
      --prop KEY         Object must have this property (any value).
      --missing-prop KEY Object must NOT have this property.
      --name GLOB        Name matches glob pattern (* and ? wildcards).
      --type TYPE        Delphi class type matches exactly.

      dfmquery.py find screen.dfm --prop "Visible=False"
      dfmquery.py find screen.dfm --type TdxLayoutItem --missing-prop AlignHorz
      dfmquery.py find screen.dfm --name "rb*" --type TcxCheckBox
      dfmquery.py find screen.dfm --prop "Enabled=False" --type TcxSpinEdit

== WRITE COMMANDS ==

  set-prop <file> <PROP=VAL> --name <name>
      Add or update a property on a single named object.
      If the property exists, it is updated. Otherwise it is inserted.

      dfmquery.py set-prop screen.dfm "AlignHorz = ahLeft" --name liPosition
      dfmquery.py set-prop screen.dfm "ShowBorder = True" --name lgKidneys
      dfmquery.py set-prop screen.dfm "Visible = False" --name lgDetails

  set-prop <file> <PROP=VAL> [--type TYPE] [--name GLOB] [--prop P] [--missing-prop P]
      BULK MODE: set property on ALL objects matching the filters.
      Requires at least one filter (--type, --name, --prop, or --missing-prop).
      If --name contains * or ?, it is treated as a glob (bulk mode).

      dfmquery.py set-prop screen.dfm "AlignHorz = ahLeft" --type TdxLayoutItem --missing-prop AlignHorz
      dfmquery.py set-prop screen.dfm "ShowBorder = True" --name "lg*Kidney"

  replace <file> <name> [--input <file>]
      Replace a named object (and all its children) with new DFM content.
      Reads from --input file or stdin. Validates the replacement is balanced.
      Use with 'get --children' to extract, edit, and replace:

      dfmquery.py get screen.dfm lgFibroids --children > /tmp/fibroids.dfm
      # ... edit /tmp/fibroids.dfm ...
      dfmquery.py replace screen.dfm lgFibroids --input /tmp/fibroids.dfm

      # Or pipe directly:
      cat new_section.dfm | dfmquery.py replace screen.dfm lgOldSection

  wrap <file> <name> --group <GROUPNAME> [--visible] [--border]
      Wrap a named object (typically a TdxLayoutItem) in a new TdxLayoutGroup.
      By default the group is hidden (Visible=False) and borderless.
      Use --visible to make it visible, --border to show border.

      This is needed because setting .Visible on a control inside a TdxLayoutItem
      does not collapse the layout item. Wrapping in a group and setting the
      group .Visible from script works correctly.

      dfmquery.py wrap screen.dfm liPainWithProbe --group lgPainWithProbe
      dfmquery.py wrap screen.dfm liCervixPresent --group lgCervixPresent --visible

== VALIDATION COMMANDS ==

  validate <file>...
      Check DFM structure: nesting balance, Control= references, duplicate names.
      Always run after modifying a DFM file.

      dfmquery.py validate screen.dfm

  xref <dfm> <script>
      Cross-validate script.pas against a DFM file.
      Checks: control references exist in DFM, handler strings reference defined
      procedures, no forward procedure calls.

      dfmquery.py xref screen.dfm script.pas
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
    """Expand file arguments, supporting shell globs that were not expanded."""
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


def _parse_filters(prop_list, missing_prop_list):
    """Parse --prop and --missing-prop args into filter dicts."""
    filters = {}
    for f_str in (prop_list or []):
        if '=' in f_str:
            k, _, v = f_str.partition('=')
            filters[k.strip()] = v.strip()
        else:
            filters[f_str.strip()] = None
    missing = {}
    for f_str in (missing_prop_list or []):
        if '=' in f_str:
            k, _, v = f_str.partition('=')
            missing[k.strip()] = v.strip()
        else:
            missing[f_str.strip()] = None
    return filters, missing


def _match_object(obj, filters, missing_filters, type_filter=None, name_filter=None):
    """Check if an object matches the given filters."""
    if name_filter:
        from fnmatch import fnmatch
        if not fnmatch(obj['name'], name_filter):
            return False
    for prop, val in filters.items():
        if prop not in obj['properties']:
            return False
        if val is not None and obj['properties'][prop] != val:
            return False
    for prop, val in missing_filters.items():
        if val is None and prop in obj['properties']:
            return False
        if val is not None and obj['properties'].get(prop) == val:
            return False
    if type_filter and obj['type'] != type_filter:
        return False
    return True


def cmd_find(args):
    """Find objects with specific property values."""
    with open(args.file) as f:
        lines = f.readlines()

    objects = parse_objects(lines)
    filters, missing = _parse_filters(args.prop, args.missing_prop)

    name_glob = getattr(args, 'name', None)
    for obj in objects:
        if _match_object(obj, filters, missing, args.type, name_glob):
            ls = obj['line_start'] + 1
            le = obj['line_end'] + 1
            print(f"{ls}-{le}\td={obj['depth']}\t{obj['name']}: {obj['type']}")


def _find_object_lines(lines, name):
    """Find the start and end line indices (0-based) for a named object."""
    start = None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if re.match(r'^(?:object|inherited)\s+' + re.escape(name) + r'\s*:', stripped):
            start = i
            break
    if start is None:
        return None, None

    depth = 0
    end = None
    for i in range(start, len(lines)):
        stripped = lines[i].strip()
        if re.match(r'^(?:object|inherited)\s+\w+\s*:', stripped) or stripped == 'item':
            depth += 1
        if stripped in ('end', 'end>'):
            depth -= 1
            if depth == 0:
                end = i
                break
    return start, end


def _get_indent(line):
    """Return the leading whitespace of a line."""
    return line[:len(line) - len(line.lstrip())]


def _set_prop_on_object(lines, start, end, prop_line_text):
    """Set a property on an object at lines[start:end+1]. Returns (lines, was_update)."""
    prop_name = prop_line_text.split('=')[0].strip()
    indent = _get_indent(lines[start]) + '  '

    for i in range(start + 1, end + 1):
        stripped = lines[i].strip()
        if re.match(r'^(?:object|inherited)\s+\w+\s*:', stripped) or stripped == 'item':
            break
        if stripped == 'end' or stripped == 'end>':
            break
        if stripped.startswith(prop_name + ' =') or stripped.startswith(prop_name + '='):
            lines[i] = f"{indent}{prop_line_text}\n"
            return lines, True

    lines.insert(start + 1, f"{indent}{prop_line_text}\n")
    return lines, False


def cmd_set_prop(args):
    """Add or update a property on named object(s).

    Usage:
      dfmquery.py set-prop <file> <property> --name <name>
      dfmquery.py set-prop <file> <property> --type TYPE [--prop P] [--missing-prop P]
    """
    with open(args.file) as f:
        lines = f.readlines()

    prop_name, _, prop_val = args.property.partition('=')
    prop_line_text = f"{prop_name.strip()} = {prop_val.strip()}"

    is_glob = args.name and ('*' in args.name or '?' in args.name)
    if args.name and not is_glob:
        # Single object mode (exact name)
        start, end = _find_object_lines(lines, args.name)
        if start is None:
            print(f"Error: object '{args.name}' not found", file=sys.stderr)
            sys.exit(1)
        lines, was_update = _set_prop_on_object(lines, start, end, prop_line_text)
        with open(args.file, 'w') as f:
            f.writelines(lines)
        action = "Updated" if was_update else "Added"
        print(f"{action}: {args.name}.{prop_line_text}")
    else:
        # Bulk mode using filters
        objects = parse_objects(lines)
        filters, missing = _parse_filters(args.prop, args.missing_prop)
        if not filters and not missing and not args.type:
            print("Error: provide --name, or at least one of --type/--prop/--missing-prop", file=sys.stderr)
            sys.exit(1)

        name_glob = args.name  # in bulk mode, --name is a glob filter
        targets = [obj for obj in objects if _match_object(obj, filters, missing, args.type, name_glob)]
        if not targets:
            print("No matching objects found")
            return

        # Apply in reverse order so line insertions do not shift later indices
        count = 0
        for obj in reversed(targets):
            start, end = _find_object_lines(lines, obj['name'])
            if start is not None:
                lines, _ = _set_prop_on_object(lines, start, end, prop_line_text)
                count += 1

        with open(args.file, 'w') as f:
            f.writelines(lines)
        print(f"Set {prop_line_text} on {count} objects")


def cmd_replace(args):
    """Replace a named object with new DFM content from stdin or file.

    Usage: dfmquery.py replace <file> <name> < new_content.dfm
           dfmquery.py replace <file> <name> --input new_content.dfm
    """
    with open(args.file) as f:
        lines = f.readlines()

    start, end = _find_object_lines(lines, args.name)
    if start is None:
        print(f"Error: object '{args.name}' not found", file=sys.stderr)
        sys.exit(1)

    if args.input:
        with open(args.input) as f:
            new_content = f.read()
    else:
        new_content = sys.stdin.read()

    # Validate the new content is balanced
    new_lines = new_content.split('\n')
    depth = 0
    for line in new_lines:
        stripped = line.strip()
        if re.match(r'^(?:object|inherited)\s+\w+\s*:', stripped) or stripped == 'item':
            depth += 1
        if stripped in ('end', 'end>'):
            depth -= 1
    if depth != 0:
        print(f"Error: replacement content is unbalanced (depth={depth})", file=sys.stderr)
        sys.exit(1)

    # Replace
    old_line_count = end - start + 1
    result = lines[:start] + [new_content if new_content.endswith('\n') else new_content + '\n'] + lines[end + 1:]

    with open(args.file, 'w') as f:
        f.writelines(result)

    new_line_count = new_content.count('\n') + (0 if new_content.endswith('\n') else 1)
    print(f"Replaced {args.name}: {old_line_count} lines -> {new_line_count} lines")


def cmd_wrap(args):
    """Wrap a named object in a new TdxLayoutGroup.

    Usage: dfmquery.py wrap <file> <name> --group <group_name> [--visible false] [--border false]
    """
    with open(args.file) as f:
        lines = f.readlines()

    start, end = _find_object_lines(lines, args.name)
    if start is None:
        print(f"Error: object '{args.name}' not found", file=sys.stderr)
        sys.exit(1)

    indent = _get_indent(lines[start])
    inner_indent = indent + '  '

    # Extract the original object content
    original = ''.join(lines[start:end + 1])
    # Re-indent it by 2 spaces
    reindented = '\n'.join(inner_indent + line.lstrip() if line.strip() else line for line in original.split('\n'))

    # Build wrapper group
    group_props = [
        f"{indent}object {args.group}: TdxLayoutGroup",
        f"{inner_indent}CaptionOptions.Visible = False",
        f"{inner_indent}ButtonOptions.Buttons = <>",
        f"{inner_indent}ShowBorder = {'True' if args.border else 'False'}",
    ]
    if not args.visible:
        group_props.append(f"{inner_indent}Visible = False")

    wrapper = '\n'.join(group_props) + '\n' + reindented + f"{indent}end\n"

    result = lines[:start] + [wrapper] + lines[end + 1:]

    with open(args.file, 'w') as f:
        f.writelines(result)

    vis = "visible" if args.visible else "hidden"
    print(f"Wrapped {args.name} in {args.group} ({vis})")


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
    p_find.add_argument('--prop', action='append', default=[], help='Property filter (e.g. "Visible=False")')
    p_find.add_argument('--missing-prop', action='append', help='Find objects WITHOUT this property')
    p_find.add_argument('--type', help='Filter by Delphi type')
    p_find.add_argument('--name', help='Filter by name glob (e.g. "rb*", "chk*Ovary*")')

    # set-prop
    p_setprop = subparsers.add_parser('set-prop', help='Add or update a property (single or bulk)')
    p_setprop.add_argument('file')
    p_setprop.add_argument('property', help='Property assignment (e.g. "AlignHorz = ahLeft")')
    p_setprop.add_argument('--name', help='Single object name')
    p_setprop.add_argument('--type', help='Filter by type (bulk mode)')
    p_setprop.add_argument('--prop', action='append', default=[], help='Filter: has property')
    p_setprop.add_argument('--missing-prop', action='append', help='Filter: missing property')

    # replace
    p_replace = subparsers.add_parser('replace', help='Replace a named object with new DFM content')
    p_replace.add_argument('file')
    p_replace.add_argument('name')
    p_replace.add_argument('--input', help='File with replacement content (default: stdin)')

    # wrap
    p_wrap = subparsers.add_parser('wrap', help='Wrap an object in a new TdxLayoutGroup')
    p_wrap.add_argument('file')
    p_wrap.add_argument('name')
    p_wrap.add_argument('--group', required=True, help='Name for the new wrapper group')
    p_wrap.add_argument('--visible', action='store_true', default=False, help='Group visible (default: hidden)')
    p_wrap.add_argument('--border', action='store_true', default=False, help='Show border (default: no)')

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
    elif args.command == 'set-prop':
        cmd_set_prop(args)
    elif args.command == 'replace':
        cmd_replace(args)
    elif args.command == 'wrap':
        cmd_wrap(args)
    elif args.command == 'xref':
        cmd_xref(args)


if __name__ == '__main__':
    main()
