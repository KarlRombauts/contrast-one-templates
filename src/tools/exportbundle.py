#!/usr/bin/env python3
"""
exportbundle.py - Bundle and extract Contrast One export files.

Usage:
  exportbundle.py extract <export_file> <output_dir>
  exportbundle.py bundle <input_dir> <export_file> [--watch]
  exportbundle.py inspect <export_file>

Commands:
  extract    Split a binary export into its 5 component files
  bundle     Combine component files into a binary export
  inspect    Show section offsets and sizes without extracting

The input directory for 'bundle' must contain:
  screen.dfm, script.pas, graph.xml, mappings.csv, template.rtf

Missing files are allowed -- empty sections will be written.
"""

import sys
import struct
import argparse
import time
from pathlib import Path


SECTION_NAMES = ['screen.dfm', 'script.pas', 'graph.xml', 'mappings.csv', 'template.rtf']
SECTION_LABELS = ['DFM', 'Script', 'Graph', 'Mappings', 'RTF']
MAGIC = b'\x00\x00\x00\x00'


def read_sections(data):
    """Parse binary export into list of (label, offset, length, content) tuples."""
    sections = []
    pos = 4  # skip magic header

    for i, label in enumerate(SECTION_LABELS):
        if pos + 4 > len(data):
            break

        length = struct.unpack('<I', data[pos:pos + 4])[0]
        content_start = pos + 4
        content_end = content_start + length

        if content_end > len(data):
            # Last section might extend to end of file
            content_end = len(data)
            length = content_end - content_start

        content = data[content_start:content_end]
        sections.append((label, content_start, length, content))
        pos = content_end

    return sections


def cmd_extract(args):
    export_path = Path(args.export_file)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    with open(export_path, 'rb') as f:
        data = f.read()

    if data[:4] != MAGIC:
        print(f"Warning: unexpected magic bytes: {data[:4].hex(' ')}", file=sys.stderr)

    sections = read_sections(data)

    for (label, offset, length, content), filename in zip(sections, SECTION_NAMES):
        out_path = output_dir / filename
        with open(out_path, 'wb') as f:
            f.write(content)
        print(f"  {label:10s} -> {out_path}  ({length:,} bytes)")

    print(f"\nExtracted {len(sections)} sections to {output_dir}/")


def _do_bundle(input_dir, export_path):
    """Bundle component files into a single export. Returns total bytes written."""
    components = []
    for filename, label in zip(SECTION_NAMES, SECTION_LABELS):
        file_path = input_dir / filename
        if file_path.exists():
            with open(file_path, 'rb') as f:
                content = f.read()
            print(f"  {label:10s} <- {file_path}  ({len(content):,} bytes)")
        else:
            content = b''
            print(f"  {label:10s} <- (empty, {file_path} not found)")
        components.append(content)

    with open(export_path, 'wb') as f:
        f.write(MAGIC)
        for content in components:
            f.write(struct.pack('<I', len(content)))
            f.write(content)

    total = export_path.stat().st_size
    print(f"\nBundled -> {export_path}  ({total:,} bytes)")
    return total


def _get_mtimes(input_dir):
    """Get dict of filename -> mtime for component files that exist."""
    mtimes = {}
    for filename in SECTION_NAMES:
        file_path = input_dir / filename
        if file_path.exists():
            mtimes[filename] = file_path.stat().st_mtime
    return mtimes


def cmd_bundle(args):
    input_dir = Path(args.input_dir)
    export_path = Path(args.export_file)

    _do_bundle(input_dir, export_path)

    if args.watch:
        print(f"\nWatching {input_dir} for changes (Ctrl+C to stop)...")
        last_mtimes = _get_mtimes(input_dir)
        try:
            while True:
                time.sleep(1)
                current_mtimes = _get_mtimes(input_dir)
                if current_mtimes != last_mtimes:
                    changed = [f for f in SECTION_NAMES
                               if current_mtimes.get(f) != last_mtimes.get(f)]
                    print(f"\n--- Changed: {', '.join(changed)} ---")
                    _do_bundle(input_dir, export_path)
                    last_mtimes = current_mtimes
        except KeyboardInterrupt:
            print("\nStopped.")


def cmd_inspect(args):
    with open(args.export_file, 'rb') as f:
        data = f.read()

    print(f"File: {args.export_file}  ({len(data):,} bytes)")
    print(f"Magic: {data[:4].hex(' ')}")
    print()

    sections = read_sections(data)

    for (label, offset, length, content), filename in zip(sections, SECTION_NAMES):
        preview = content[:60].decode('ascii', errors='replace').replace('\r\n', '\\n').replace('\n', '\\n')
        print(f"  {label:10s}  offset=0x{offset:06x}  length={length:>8,}  {preview[:50]}")

    accounted = 4 + sum(4 + length for _, _, length, _ in sections)
    if accounted != len(data):
        print(f"\n  Warning: {len(data) - accounted} unaccounted bytes at end of file")


def cmd_roundtrip(args):
    """Extract then re-bundle and compare."""
    import tempfile

    with open(args.export_file, 'rb') as f:
        original = f.read()

    sections = read_sections(original)

    # Re-bundle from parsed sections
    rebuilt = bytearray(MAGIC)
    for label, offset, length, content in sections:
        rebuilt.extend(struct.pack('<I', len(content)))
        rebuilt.extend(content)

    if bytes(rebuilt) == original:
        print(f"OK: round-trip produces identical output ({len(original):,} bytes)")
    else:
        print(f"MISMATCH: original={len(original):,} rebuilt={len(rebuilt):,}")
        # Find first difference
        for i in range(min(len(original), len(rebuilt))):
            if original[i] != rebuilt[i]:
                print(f"  First diff at byte 0x{i:x}: orig=0x{original[i]:02x} rebuilt=0x{rebuilt[i]:02x}")
                break
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(description='Bundle and extract Contrast One export files')
    subparsers = parser.add_subparsers(dest='command', required=True)

    p_extract = subparsers.add_parser('extract', help='Extract export into component files')
    p_extract.add_argument('export_file')
    p_extract.add_argument('output_dir')

    p_bundle = subparsers.add_parser('bundle', help='Bundle component files into export')
    p_bundle.add_argument('input_dir')
    p_bundle.add_argument('export_file')
    p_bundle.add_argument('--watch', '-w', action='store_true',
                          help='Watch input files and re-bundle on changes')

    p_inspect = subparsers.add_parser('inspect', help='Show section info without extracting')
    p_inspect.add_argument('export_file')

    p_rt = subparsers.add_parser('roundtrip', help='Verify extract+rebundle produces identical output')
    p_rt.add_argument('export_file')

    args = parser.parse_args()

    if args.command == 'extract':
        cmd_extract(args)
    elif args.command == 'bundle':
        cmd_bundle(args)
    elif args.command == 'inspect':
        cmd_inspect(args)
    elif args.command == 'roundtrip':
        cmd_roundtrip(args)


if __name__ == '__main__':
    main()
