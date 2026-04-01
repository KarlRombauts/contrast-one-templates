#!/usr/bin/env python3
"""CLI tool for splitting Pascal scripts into individual function files."""

import argparse
import json
import sys
from pathlib import Path

from pascal_parser import parse


def cmd_list(args):
    """Print all function/procedure signatures, one per line."""
    source = Path(args.input).read_text(encoding='utf-8')
    result = parse(source)
    for func in result.functions:
        print(func.signature)


def cmd_extract(args):
    """Print a single function's body to stdout. Exit 1 if not found."""
    source = Path(args.input).read_text(encoding='utf-8')
    result = parse(source)
    for func in result.functions:
        if func.name.lower() == args.name.lower():
            print(func.body)
            return
    print(f"Error: function '{args.name}' not found", file=sys.stderr)
    sys.exit(1)


def cmd_split(args):
    """Write each function to its own file, plus _preamble.pas and _postamble.pas."""
    source = Path(args.input).read_text(encoding='utf-8')
    result = parse(source)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    for func in result.functions:
        out_path = output_dir / f"{func.name}.pas"
        out_path.write_text(func.body + '\n', encoding='utf-8')

    if result.preamble and result.preamble.strip():
        (output_dir / '_preamble.pas').write_text(result.preamble + '\n', encoding='utf-8')

    if result.postamble and result.postamble.strip():
        (output_dir / '_postamble.pas').write_text(result.postamble + '\n', encoding='utf-8')


def cmd_categorize(args):
    """Group functions into files per mapping. Unmapped go to _remaining.pas."""
    source = Path(args.input).read_text(encoding='utf-8')
    result = parse(source)
    mapping = json.loads(Path(args.mapping).read_text(encoding='utf-8'))

    # Build lookup: name (lowercase) -> FuncDef
    func_by_name = {f.name.lower(): f for f in result.functions}

    # Track which functions have been assigned to a target file
    assigned = set()

    # Write grouped files
    for target_path, func_names in mapping.items():
        bodies = []
        for name in func_names:
            func = func_by_name.get(name.lower())
            if func is None:
                print(f"Warning: function '{name}' not found in source", file=sys.stderr)
            else:
                bodies.append(func.body)
                assigned.add(func.name.lower())

        if bodies:
            out_path = Path(target_path)
            out_path.parent.mkdir(parents=True, exist_ok=True)
            out_path.write_text('\n\n'.join(bodies) + '\n', encoding='utf-8')

    # Remaining (unmapped) functions
    remaining = [f for f in result.functions if f.name.lower() not in assigned]
    if remaining:
        remaining_text = '\n\n'.join(f.body for f in remaining) + '\n'
        Path('_remaining.pas').write_text(remaining_text, encoding='utf-8')

    # Preamble and postamble
    if result.preamble and result.preamble.strip():
        Path('_preamble.pas').write_text(result.preamble + '\n', encoding='utf-8')

    if result.postamble and result.postamble.strip():
        Path('_postamble.pas').write_text(result.postamble + '\n', encoding='utf-8')


def main():
    parser = argparse.ArgumentParser(
        description='Split Pascal scripts into individual function files.'
    )
    subparsers = parser.add_subparsers(dest='command', required=True)

    # list subcommand
    list_parser = subparsers.add_parser('list', help='Print all function/procedure signatures')
    list_parser.add_argument('input', help='Input Pascal source file')

    # extract subcommand
    extract_parser = subparsers.add_parser('extract', help='Print a single function body')
    extract_parser.add_argument('name', help='Function/procedure name to extract')
    extract_parser.add_argument('input', help='Input Pascal source file')

    # split subcommand
    split_parser = subparsers.add_parser('split', help='Write each function to its own file')
    split_parser.add_argument('output_dir', help='Output directory')
    split_parser.add_argument('input', help='Input Pascal source file')

    # categorize subcommand
    categorize_parser = subparsers.add_parser('categorize', help='Group functions by mapping')
    categorize_parser.add_argument('mapping', help='JSON mapping file')
    categorize_parser.add_argument('input', help='Input Pascal source file')

    args = parser.parse_args()

    if args.command == 'list':
        cmd_list(args)
    elif args.command == 'extract':
        cmd_extract(args)
    elif args.command == 'split':
        cmd_split(args)
    elif args.command == 'categorize':
        cmd_categorize(args)


if __name__ == '__main__':
    main()
