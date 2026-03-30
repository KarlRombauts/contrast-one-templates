# GPP Migration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the custom Python preprocessor with GPP, extract shared code into a modular library, and build tooling for splitting/reverse-syncing Pascal scripts — piloted on the earlyT1Singleton exam.

**Architecture:** A Python parser (`pascal_parser.py`) provides the core parsing logic shared by two CLI tools: `funcsplit.py` (splits monolithic scripts into modules) and `reversesync.py` (diffs app-exported scripts back to source files using a mapping JSON). GPP handles preprocessing `#include` directives to reassemble the modular sources into monolithic output.

**Tech Stack:** Python 3, pytest, GPP (Generic PreProcessor), bash

**Spec:** `docs/superpowers/specs/2026-03-30-gpp-migration-design.md`

---

## File Map

| File | Action | Responsibility |
|---|---|---|
| `Scripts/tools/pascal_parser.py` | Create | Core parser: tokenizes Pascal, extracts functions/procedures |
| `Scripts/tools/funcsplit.py` | Create | CLI: --list, --extract, --split, --categorize modes |
| `Scripts/tools/reversesync.py` | Create | CLI: diffs exported script against source files via mapping JSON |
| `Scripts/tools/build.sh` | Create | Builds all exams via GPP |
| `Scripts/tools/tests/conftest.py` | Create | Shared pytest fixtures |
| `Scripts/tools/tests/test_funcsplit_parser.py` | Create | Parser unit tests (18 edge cases) |
| `Scripts/tools/tests/test_funcsplit_modes.py` | Create | CLI mode tests (7 tests) |
| `Scripts/tools/tests/test_reversesync.py` | Create | Reverse-sync unit tests (9 tests) |
| `Scripts/tools/tests/test_integration.py` | Create | End-to-end pipeline tests (8 tests) |
| `Scripts/tools/tests/fixtures/integration/` | Create | Fixture files for integration tests |

---

### Task 1: Install and Validate GPP

**Files:**
- None (system setup)

- [ ] **Step 1: Install GPP**

```bash
brew install gpp
```

- [ ] **Step 2: Verify GPP processes includes**

Create a temporary test:

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts"
mkdir -p /tmp/gpp-test
cat > /tmp/gpp-test/header.pas << 'EOF'
#ifndef __HEADER
#define __HEADER
function Helper: Integer;
begin
  result := 1;
end;
#endif
EOF

cat > /tmp/gpp-test/main.pas << 'EOF'
#include "/tmp/gpp-test/header.pas"
#include "/tmp/gpp-test/header.pas"

procedure Main;
begin
  Helper;
end;
EOF

gpp -o /tmp/gpp-test/output.pas /tmp/gpp-test/main.pas
cat /tmp/gpp-test/output.pas
```

Expected: `Helper` function appears exactly once. No `#include`, `#ifndef`, `#define`, or `#endif` lines in output.

- [ ] **Step 3: Clean up test files**

```bash
rm -rf /tmp/gpp-test
```

- [ ] **Step 4: Commit**

Nothing to commit — system setup only.

---

### Task 2: Pascal Parser Core — Tokenizer

**Files:**
- Create: `Scripts/tools/pascal_parser.py`

- [ ] **Step 1: Write the parser module**

```python
"""Pascal parser for extracting functions/procedures from Contrast One scripts.

Handles:
- Single-quoted string literals (with '' escaping)
- Line comments (//)
- Block comments ({ } and (* *))
- Nested BEGIN/END, TRY/EXCEPT, CASE/END blocks
- Nested function/procedure declarations
- Case-insensitive keyword matching
"""

import re
from dataclasses import dataclass


@dataclass
class FuncDef:
    """A parsed function or procedure definition."""
    name: str
    kind: str  # 'function' or 'procedure'
    signature: str  # Full first line
    body: str  # Complete text including signature through closing end;
    start_line: int  # 0-based
    end_line: int  # 0-based, inclusive


@dataclass
class ParseResult:
    """Result of parsing a Pascal source file."""
    functions: list  # List[FuncDef]
    preamble: str  # Lines before the first function
    postamble: str  # Lines after the last function's end


def clean_lines(lines: list) -> list:
    """Remove string literals and comments from lines for safe keyword scanning.

    Returns a list of cleaned lines where strings are replaced with spaces
    and comments are blanked out. Tracks multi-line block comment state.
    """
    cleaned = []
    in_brace = False
    in_paren_star = False

    for line in lines:
        out = []
        i = 0
        while i < len(line):
            # Continue multi-line block comment { }
            if in_brace:
                if line[i] == '}':
                    in_brace = False
                out.append(' ')
                i += 1
                continue

            # Continue multi-line block comment (* *)
            if in_paren_star:
                if line[i] == '*' and i + 1 < len(line) and line[i + 1] == ')':
                    in_paren_star = False
                    out.append('  ')
                    i += 2
                else:
                    out.append(' ')
                    i += 1
                continue

            ch = line[i]

            # String literal
            if ch == "'":
                out.append(' ')
                i += 1
                while i < len(line):
                    if line[i] == "'":
                        if i + 1 < len(line) and line[i + 1] == "'":
                            out.append('  ')
                            i += 2
                        else:
                            out.append(' ')
                            i += 1
                            break
                    else:
                        out.append(' ')
                        i += 1
                continue

            # Line comment //
            if ch == '/' and i + 1 < len(line) and line[i + 1] == '/':
                out.append(' ' * (len(line) - i))
                break

            # Block comment {
            if ch == '{':
                in_brace = True
                out.append(' ')
                i += 1
                continue

            # Block comment (*
            if ch == '(' and i + 1 < len(line) and line[i + 1] == '*':
                in_paren_star = True
                out.append('  ')
                i += 2
                continue

            out.append(ch)
            i += 1

        cleaned.append(''.join(out))

    return cleaned


def _is_func_start(cleaned_line: str) -> bool:
    """Check if a cleaned line starts a function or procedure declaration."""
    stripped = cleaned_line.strip().upper()
    return stripped.startswith('FUNCTION ') or stripped.startswith('PROCEDURE ')


BLOCK_OPENERS = frozenset(['BEGIN', 'TRY', 'CASE'])


def _parse_one_function(lines: list, cleaned: list, start: int) -> tuple:
    """Parse a single function/procedure starting at line `start`.

    Handles nested function/procedure declarations by recursively
    consuming their BEGIN/END pairs before the outer function's BEGIN.

    Returns (FuncDef, end_line_index).
    """
    original = lines[start]
    match = re.search(r'(?:function|procedure)\s+(\w+)', original, re.IGNORECASE)
    name = match.group(1) if match else 'unknown'
    kind = 'function' if cleaned[start].strip().upper().startswith('FUNCTION') else 'procedure'

    block_depth = 0
    i = start + 1

    while i < len(lines):
        # Before the outer function's first BEGIN (block_depth == 0),
        # check for nested function/procedure declarations and consume them.
        if block_depth == 0 and _is_func_start(cleaned[i]):
            _, nested_end = _parse_one_function(lines, cleaned, i)
            i = nested_end + 1
            continue

        # Scan for block keywords in the cleaned line
        tokens = re.findall(r'\b[A-Za-z_]\w*\b', cleaned[i].upper())
        for token in tokens:
            if token in BLOCK_OPENERS:
                block_depth += 1
            elif token == 'END':
                block_depth -= 1
                if block_depth == 0:
                    body = '\n'.join(lines[start:i + 1])
                    func = FuncDef(
                        name=name,
                        kind=kind,
                        signature=original.strip(),
                        body=body,
                        start_line=start,
                        end_line=i,
                    )
                    return func, i

        i += 1

    # Unclosed function — return what we have
    body = '\n'.join(lines[start:])
    return FuncDef(name=name, kind=kind, signature=original.strip(),
                   body=body, start_line=start, end_line=len(lines) - 1), len(lines) - 1


def parse(source: str) -> ParseResult:
    """Parse Pascal source code and extract all top-level functions/procedures.

    Returns a ParseResult with:
    - functions: list of FuncDef (top-level only; nested funcs are part of parent body)
    - preamble: text before the first function
    - postamble: text after the last function's closing end
    """
    lines = source.split('\n')
    cleaned = clean_lines(lines)

    functions = []
    first_func_line = None
    last_func_end = -1
    i = 0

    while i < len(lines):
        if _is_func_start(cleaned[i]):
            if first_func_line is None:
                first_func_line = i
            func, end_line = _parse_one_function(lines, cleaned, i)
            functions.append(func)
            last_func_end = end_line
            i = end_line + 1
        else:
            i += 1

    if first_func_line is None:
        return ParseResult(functions=[], preamble=source, postamble='')

    preamble = '\n'.join(lines[:first_func_line]).rstrip('\n')
    postamble = '\n'.join(lines[last_func_end + 1:]).strip('\n')

    return ParseResult(functions=functions, preamble=preamble, postamble=postamble)
```

- [ ] **Step 2: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/pascal_parser.py
git commit -m "feat: add Pascal parser core module for function extraction"
```

---

### Task 3: Parser Unit Tests — Basic Extraction

**Files:**
- Create: `Scripts/tools/tests/__init__.py`
- Create: `Scripts/tools/tests/conftest.py`
- Create: `Scripts/tools/tests/test_funcsplit_parser.py`

- [ ] **Step 1: Create test infrastructure**

`Scripts/tools/tests/__init__.py` — empty file.

`Scripts/tools/tests/conftest.py`:

```python
"""Shared pytest fixtures for tools tests."""

import sys
from pathlib import Path

# Add tools directory to path so we can import pascal_parser
sys.path.insert(0, str(Path(__file__).parent.parent))
```

- [ ] **Step 2: Write basic parser tests**

`Scripts/tools/tests/test_funcsplit_parser.py`:

```python
"""Unit tests for pascal_parser — basic extraction cases."""

from pascal_parser import parse


def test_simple_function():
    source = """\
function Foo: Integer;
begin
  result := 42;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == 'Foo'
    assert f.kind == 'function'
    assert f.start_line == 0
    assert f.end_line == 3
    assert 'result := 42' in f.body


def test_simple_procedure():
    source = """\
procedure DoStuff;
begin
  x := 1;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == 'DoStuff'
    assert f.kind == 'procedure'


def test_nested_begin_end():
    source = """\
function Foo: Integer;
begin
  if x > 0 then
  begin
    result := 1;
  end
  else
  begin
    result := 2;
  end;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 10


def test_nested_try_except():
    source = """\
function SafeConvert(s: string): Integer;
begin
  try
    result := StrToInt(s);
  except
    result := 0;
  end;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].name == 'SafeConvert'
    assert result.functions[0].end_line == 7


def test_nested_case():
    source = """\
procedure HandleCase(x: Integer);
begin
  case x of
    1: begin
         DoA;
       end;
    2: begin
         DoB;
       end;
  end;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 10


def test_multiple_functions():
    source = """\
function First: Integer;
begin
  result := 1;
end;

function Second: Integer;
begin
  result := 2;
end;"""
    result = parse(source)
    assert len(result.functions) == 2
    assert result.functions[0].name == 'First'
    assert result.functions[1].name == 'Second'


def test_function_with_var_block():
    source = """\
function Foo: Integer;
var
  x: Integer;
  y: String;
begin
  x := 42;
  result := x;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert 'var' in result.functions[0].body.lower()
    assert result.functions[0].start_line == 0
    assert result.functions[0].end_line == 7


def test_empty_function():
    source = """\
procedure DoNothing;
begin
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 2


def test_global_var_section():
    source = """\
Var
  GWarning: Boolean;

function Foo: Integer;
begin
  result := 1;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert 'GWarning' in result.preamble
    assert result.functions[0].name == 'Foo'


def test_semicolon_variations():
    source = """\
function Foo: Integer;
begin
  result := 1;
end;

function Bar: Integer;
begin
  result := 2;
end"""
    result = parse(source)
    assert len(result.functions) == 2
    assert result.functions[1].name == 'Bar'


def test_postamble():
    source = """\
function Foo: Integer;
begin
  result := 1;
end;

StartScript;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert 'StartScript' in result.postamble
```

- [ ] **Step 3: Run tests to verify they pass**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -m pytest tests/test_funcsplit_parser.py -v
```

Expected: all 11 tests PASS.

- [ ] **Step 4: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/tests/
git commit -m "test: add basic parser unit tests for pascal_parser"
```

---

### Task 4: Parser Unit Tests — Edge Cases (Strings, Comments, Nesting)

**Files:**
- Modify: `Scripts/tools/tests/test_funcsplit_parser.py`

- [ ] **Step 1: Add edge case tests**

Append to `Scripts/tools/tests/test_funcsplit_parser.py`:

```python
def test_string_containing_begin():
    source = """\
function Foo: String;
begin
  result := 'BEGIN something';
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 3


def test_string_containing_end():
    source = """\
function Foo: String;
begin
  result := 'END';
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 3


def test_escaped_quotes():
    source = """\
function Foo: String;
begin
  result := 'it''s a test';
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 3


def test_line_comment():
    source = """\
function Foo: Integer;
begin
  // END; BEGIN; this should be ignored
  result := 1;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 4


def test_block_comment_braces():
    source = """\
function Foo: Integer;
begin
  { END; BEGIN; this is a comment }
  result := 1;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 4


def test_block_comment_parens():
    source = """\
function Foo: Integer;
begin
  (* END; BEGIN; this is a comment *)
  result := 1;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 4


def test_mixed_case_keywords():
    source = """\
Function Foo: Integer;
Begin
  result := 1;
End;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].name == 'Foo'
    assert result.functions[0].end_line == 3


def test_nested_function():
    source = """\
procedure Outer;
  function Inner: Integer;
  begin
    result := 1;
  end;
begin
  x := Inner;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].name == 'Outer'
    assert result.functions[0].end_line == 7
    assert 'Inner' in result.functions[0].body


def test_multiline_block_comment():
    source = """\
function Foo: Integer;
begin
  { this comment
    spans multiple
    lines END; BEGIN; }
  result := 1;
end;"""
    result = parse(source)
    assert len(result.functions) == 1
    assert result.functions[0].end_line == 6


def test_preamble_with_comments():
    source = """\
// *** Global Variables ***
Var
  GFlag: Boolean;

function Foo: Integer;
begin
  result := 1;
end;"""
    result = parse(source)
    assert '// *** Global Variables ***' in result.preamble
    assert 'GFlag' in result.preamble
    assert len(result.functions) == 1
```

- [ ] **Step 2: Run all parser tests**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -m pytest tests/test_funcsplit_parser.py -v
```

Expected: all 21 tests PASS.

- [ ] **Step 3: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/tests/test_funcsplit_parser.py
git commit -m "test: add parser edge case tests for strings, comments, nesting"
```

---

### Task 5: Validate Parser Against Real Script

**Files:**
- None modified (validation only)

- [ ] **Step 1: Run parser against earlyT1Singleton**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -c "
from pascal_parser import parse
from pathlib import Path

source = Path('../earlyT1Singleton/script.pas').read_text()
result = parse(source)
print(f'Functions found: {len(result.functions)}')
print(f'Preamble lines: {len(result.preamble.splitlines())}')
print(f'Postamble: {repr(result.postamble[:50])}')
print()
for f in result.functions:
    print(f'{f.kind}: {f.name} (lines {f.start_line}-{f.end_line})')
"
```

Expected: 91 functions found (matching the count from `getFuncDefs.py`).

- [ ] **Step 2: Cross-reference with getFuncDefs.py output**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts"
python3 getFuncDefs.py earlyT1Singleton/script.pas /tmp/old_funcdefs.txt

cd tools
python -c "
from pascal_parser import parse
from pathlib import Path
import re

source = Path('../earlyT1Singleton/script.pas').read_text()
result = parse(source)
new_names = sorted([f.name.lower() for f in result.functions])

old_text = Path('/tmp/old_funcdefs.txt').read_text()
old_names = sorted([re.search(r'(?:function|procedure)\s+(\w+)', line, re.IGNORECASE).group(1).lower()
                     for line in old_text.strip().splitlines()
                     if re.search(r'(?:function|procedure)\s+(\w+)', line, re.IGNORECASE)])

if new_names == old_names:
    print(f'PASS: Both found {len(new_names)} functions with matching names')
else:
    missing = set(old_names) - set(new_names)
    extra = set(new_names) - set(old_names)
    if missing: print(f'MISSING: {missing}')
    if extra: print(f'EXTRA: {extra}')
"
```

Expected: `PASS: Both found 91 functions with matching names`

- [ ] **Step 3: Fix any discrepancies**

If the counts or names don't match, debug by comparing the specific functions that differ. Adjust `pascal_parser.py` if needed, then re-run tests.

---

### Task 6: funcsplit.py CLI

**Files:**
- Create: `Scripts/tools/funcsplit.py`

- [ ] **Step 1: Write the CLI tool**

```python
#!/usr/bin/env python3
"""CLI tool for splitting Pascal scripts into modular files.

Usage:
  funcsplit.py --list <input.pas>
  funcsplit.py --extract <name> <input.pas>
  funcsplit.py --split <output_dir> <input.pas>
  funcsplit.py --categorize <mapping.json> <input.pas>
"""

import argparse
import json
import sys
from pathlib import Path

from pascal_parser import parse


def cmd_list(args):
    """Print all function/procedure signatures."""
    source = Path(args.input).read_text()
    result = parse(source)
    for f in result.functions:
        print(f.signature)


def cmd_extract(args):
    """Extract a single function body to stdout."""
    source = Path(args.input).read_text()
    result = parse(source)
    for f in result.functions:
        if f.name.lower() == args.name.lower():
            print(f.body)
            return
    print(f"Error: function '{args.name}' not found", file=sys.stderr)
    sys.exit(1)


def cmd_split(args):
    """Split all functions into individual files."""
    source = Path(args.input).read_text()
    result = parse(source)
    out_dir = Path(args.output_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    for f in result.functions:
        path = out_dir / f"{f.name}.pas"
        path.write_text(f.body + '\n')
        print(f"  {path}")

    if result.preamble.strip():
        path = out_dir / '_preamble.pas'
        path.write_text(result.preamble + '\n')
        print(f"  {path}")

    if result.postamble.strip():
        path = out_dir / '_postamble.pas'
        path.write_text(result.postamble + '\n')
        print(f"  {path}")


def cmd_categorize(args):
    """Split functions into grouped files based on a mapping JSON."""
    source = Path(args.input).read_text()
    result = parse(source)
    mapping = json.loads(Path(args.mapping).read_text())

    # Build reverse lookup: function name (lowercase) -> target file
    func_to_file = {}
    for target_file, func_names in mapping.items():
        for name in func_names:
            func_to_file[name.lower()] = target_file

    # Group functions by target file
    grouped = {}
    remaining = []
    for f in result.functions:
        target = func_to_file.get(f.name.lower())
        if target:
            grouped.setdefault(target, []).append(f)
        else:
            remaining.append(f)

    # Warn about functions in mapping but not in source
    found_names = {f.name.lower() for f in result.functions}
    for name in func_to_file:
        if name.lower() not in found_names:
            print(f"  WARNING: '{name}' in mapping but not found in source", file=sys.stderr)

    # Write grouped files
    for target_file, funcs in grouped.items():
        path = Path(target_file)
        path.parent.mkdir(parents=True, exist_ok=True)
        content = '\n\n'.join(f.body for f in funcs) + '\n'
        path.write_text(content)
        print(f"  {path} ({len(funcs)} functions)")

    # Write remaining
    if remaining:
        path = Path('_remaining.pas')
        content = '\n\n'.join(f.body for f in remaining) + '\n'
        path.write_text(content)
        print(f"  {path} ({len(remaining)} unmapped functions)")

    # Write preamble
    if result.preamble.strip():
        path = Path('_preamble.pas')
        path.write_text(result.preamble + '\n')
        print(f"  {path}")

    # Write postamble
    if result.postamble.strip():
        path = Path('_postamble.pas')
        path.write_text(result.postamble + '\n')
        print(f"  {path}")


def main():
    parser = argparse.ArgumentParser(description='Split Pascal scripts into modular files')
    subparsers = parser.add_subparsers(dest='command', required=True)

    p_list = subparsers.add_parser('list', help='Print function signatures')
    p_list.add_argument('input', help='Input .pas file')

    p_extract = subparsers.add_parser('extract', help='Extract a single function')
    p_extract.add_argument('name', help='Function name')
    p_extract.add_argument('input', help='Input .pas file')

    p_split = subparsers.add_parser('split', help='Split into individual files')
    p_split.add_argument('output_dir', help='Output directory')
    p_split.add_argument('input', help='Input .pas file')

    p_cat = subparsers.add_parser('categorize', help='Split by mapping JSON')
    p_cat.add_argument('mapping', help='Mapping JSON file')
    p_cat.add_argument('input', help='Input .pas file')

    args = parser.parse_args()
    commands = {
        'list': cmd_list,
        'extract': cmd_extract,
        'split': cmd_split,
        'categorize': cmd_categorize,
    }
    commands[args.command](args)


if __name__ == '__main__':
    main()
```

- [ ] **Step 2: Quick smoke test**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python funcsplit.py list ../earlyT1Singleton/script.pas | head -5
```

Expected: first 5 function signatures printed.

- [ ] **Step 3: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/funcsplit.py
git commit -m "feat: add funcsplit CLI with list, extract, split, categorize modes"
```

---

### Task 7: funcsplit Mode Tests

**Files:**
- Create: `Scripts/tools/tests/test_funcsplit_modes.py`

- [ ] **Step 1: Write mode tests**

```python
"""Unit tests for funcsplit.py CLI modes."""

import json
import subprocess
import sys
from pathlib import Path

import pytest

TOOLS_DIR = Path(__file__).parent.parent
FUNCSPLIT = TOOLS_DIR / 'funcsplit.py'

SAMPLE_SOURCE = """\
Var
  GFlag: Boolean;

function Alpha: Integer;
begin
  result := 1;
end;

function Beta: String;
begin
  result := 'hello';
end;

procedure Gamma;
begin
  DoStuff;
end;

StartScript;
"""


def run_funcsplit(*args, input_text=None):
    """Run funcsplit.py and return (returncode, stdout, stderr)."""
    cmd = [sys.executable, str(FUNCSPLIT)] + list(args)
    result = subprocess.run(cmd, capture_output=True, text=True, input=input_text)
    return result.returncode, result.stdout, result.stderr


def test_list_mode(tmp_path):
    src = tmp_path / 'test.pas'
    src.write_text(SAMPLE_SOURCE)
    rc, out, _ = run_funcsplit('list', str(src))
    assert rc == 0
    lines = out.strip().splitlines()
    assert len(lines) == 3
    assert 'Alpha' in lines[0]
    assert 'Beta' in lines[1]
    assert 'Gamma' in lines[2]


def test_extract_single(tmp_path):
    src = tmp_path / 'test.pas'
    src.write_text(SAMPLE_SOURCE)
    rc, out, _ = run_funcsplit('extract', 'Beta', str(src))
    assert rc == 0
    assert "result := 'hello'" in out


def test_extract_nonexistent(tmp_path):
    src = tmp_path / 'test.pas'
    src.write_text(SAMPLE_SOURCE)
    rc, _, err = run_funcsplit('extract', 'Missing', str(src))
    assert rc == 1
    assert 'not found' in err


def test_split_creates_files(tmp_path):
    src = tmp_path / 'test.pas'
    src.write_text(SAMPLE_SOURCE)
    out_dir = tmp_path / 'out'
    rc, _, _ = run_funcsplit('split', str(out_dir), str(src))
    assert rc == 0
    assert (out_dir / 'Alpha.pas').exists()
    assert (out_dir / 'Beta.pas').exists()
    assert (out_dir / 'Gamma.pas').exists()
    assert (out_dir / '_preamble.pas').exists()
    assert (out_dir / '_postamble.pas').exists()


def test_categorize_creates_grouped_files(tmp_path):
    src = tmp_path / 'test.pas'
    src.write_text(SAMPLE_SOURCE)
    mapping = tmp_path / 'mapping.json'
    mapping.write_text(json.dumps({
        str(tmp_path / 'utils.pas'): ['Alpha', 'Beta'],
        str(tmp_path / 'actions.pas'): ['Gamma'],
    }))
    rc, _, _ = run_funcsplit('categorize', str(mapping), str(src))
    assert rc == 0
    assert (tmp_path / 'utils.pas').exists()
    assert (tmp_path / 'actions.pas').exists()
    utils_content = (tmp_path / 'utils.pas').read_text()
    assert 'Alpha' in utils_content
    assert 'Beta' in utils_content


def test_categorize_remaining(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)
    src = tmp_path / 'test.pas'
    src.write_text(SAMPLE_SOURCE)
    mapping = tmp_path / 'mapping.json'
    mapping.write_text(json.dumps({
        str(tmp_path / 'utils.pas'): ['Alpha'],
    }))
    rc, _, _ = run_funcsplit('categorize', str(mapping), str(src))
    assert rc == 0
    remaining = tmp_path / '_remaining.pas'
    assert remaining.exists()
    content = remaining.read_text()
    assert 'Beta' in content
    assert 'Gamma' in content


def test_categorize_missing_function(tmp_path):
    src = tmp_path / 'test.pas'
    src.write_text(SAMPLE_SOURCE)
    mapping = tmp_path / 'mapping.json'
    mapping.write_text(json.dumps({
        str(tmp_path / 'utils.pas'): ['Alpha', 'NonExistent'],
    }))
    rc, _, err = run_funcsplit('categorize', str(mapping), str(src))
    assert rc == 0  # not fatal
    assert 'NonExistent' in err
```

- [ ] **Step 2: Run mode tests**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -m pytest tests/test_funcsplit_modes.py -v
```

Expected: all 7 tests PASS.

- [ ] **Step 3: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/tests/test_funcsplit_modes.py
git commit -m "test: add funcsplit CLI mode tests"
```

---

### Task 8: reversesync.py

**Files:**
- Create: `Scripts/tools/reversesync.py`

- [ ] **Step 1: Write the reverse-sync tool**

```python
#!/usr/bin/env python3
"""Reverse-sync tool: diffs an app-exported script against modular source files.

Uses pascal_parser to extract functions from the export, maps them to source
files via a mapping JSON, and presents per-file diffs.

Usage:
  reversesync.py <mapping.json> <modified_export.pas> [--apply]
"""

import argparse
import difflib
import json
import re
import sys
from pathlib import Path

from pascal_parser import parse


def normalize(text: str) -> str:
    """Normalize text for diffing: strip trailing whitespace, remove non-ASCII."""
    lines = text.splitlines()
    lines = [re.sub(r'[^\x00-\x7F]', '', line).rstrip() for line in lines]
    # Remove trailing blank lines
    while lines and not lines[-1].strip():
        lines.pop()
    return '\n'.join(lines)


def build_source_map(mapping: dict, result) -> dict:
    """Build function name -> source file path lookup from mapping JSON."""
    func_to_file = {}
    for target_file, func_names in mapping.items():
        for name in func_names:
            func_to_file[name.lower()] = target_file
    return func_to_file


def get_source_function(source_file: str, func_name: str):
    """Extract a function body from a source file by name."""
    path = Path(source_file)
    if not path.exists():
        return None
    source = path.read_text()
    result = parse(source)
    for f in result.functions:
        if f.name.lower() == func_name.lower():
            return f.body
    return None


def diff_function(func_name: str, source_body: str, export_body: str) -> list:
    """Generate a unified diff between source and export versions of a function."""
    source_lines = normalize(source_body).splitlines(keepends=True)
    export_lines = normalize(export_body).splitlines(keepends=True)
    return list(difflib.unified_diff(
        source_lines, export_lines,
        fromfile=f'source: {func_name}',
        tofile=f'modified: {func_name}',
    ))


def run_sync(mapping_path: str, export_path: str, apply: bool = False):
    """Main reverse-sync logic."""
    mapping = json.loads(Path(mapping_path).read_text())
    export_source = Path(export_path).read_text()
    export_result = parse(export_source)

    func_to_file = build_source_map(mapping, export_result)

    # Group export functions by source file
    file_changes = {}  # source_file -> list of (func_name, diff_lines)
    unplaced = []
    export_names = set()

    for f in export_result.functions:
        export_names.add(f.name.lower())
        target = func_to_file.get(f.name.lower())

        if target is None:
            unplaced.append(f)
            continue

        source_body = get_source_function(target, f.name)
        if source_body is None:
            unplaced.append(f)
            continue

        diff = diff_function(f.name, source_body, f.body)
        if diff:
            file_changes.setdefault(target, []).append((f.name, diff))

    # Check for deleted functions (in mapping but not in export)
    deleted = []
    all_mapped_names = set()
    for func_names in mapping.values():
        for name in func_names:
            all_mapped_names.add(name.lower())
    for name in all_mapped_names:
        if name not in export_names:
            deleted.append(name)

    # Check for preamble/postamble changes
    # (Compare globals section if present)
    preamble_diff = None
    if export_result.preamble.strip():
        # Look for _preamble.pas or Var section in source files
        preamble_path = Path('_preamble.pas')
        if preamble_path.exists():
            source_preamble = preamble_path.read_text()
            diff = list(difflib.unified_diff(
                normalize(source_preamble).splitlines(keepends=True),
                normalize(export_result.preamble).splitlines(keepends=True),
                fromfile='source: preamble',
                tofile='modified: preamble',
            ))
            if diff:
                preamble_diff = diff

    # Output results
    has_changes = False

    for source_file, changes in sorted(file_changes.items()):
        print(f'\n=== {source_file} ===')
        for func_name, diff_lines in changes:
            print(''.join(diff_lines))
        has_changes = True

    if preamble_diff:
        print('\n=== globals/preamble ===')
        print(''.join(preamble_diff))
        has_changes = True

    if unplaced:
        print('\n=== UNPLACED (new or renamed functions) ===')
        for f in unplaced:
            print(f'  {f.kind} {f.name} ({f.end_line - f.start_line + 1} lines)')
        has_changes = True

    if deleted:
        print('\n=== REMOVED (in mapping but missing from export) ===')
        for name in sorted(deleted):
            file = func_to_file.get(name, '?')
            print(f'  {name} (was in {file})')
        has_changes = True

    if not has_changes:
        print('No changes detected.')


def main():
    parser = argparse.ArgumentParser(description='Reverse-sync exported script to source files')
    parser.add_argument('mapping', help='Mapping JSON file')
    parser.add_argument('export', help='Modified export .pas file')
    parser.add_argument('--apply', action='store_true', help='Apply changes (not yet implemented)')
    args = parser.parse_args()
    run_sync(args.mapping, args.export, args.apply)


if __name__ == '__main__':
    main()
```

- [ ] **Step 2: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/reversesync.py
git commit -m "feat: add reversesync tool for diffing app exports against source"
```

---

### Task 9: reversesync Unit Tests

**Files:**
- Create: `Scripts/tools/tests/test_reversesync.py`

- [ ] **Step 1: Write reverse-sync tests**

```python
"""Unit tests for reversesync.py."""

import json
from pathlib import Path

import pytest

import sys
sys.path.insert(0, str(Path(__file__).parent.parent))

from reversesync import normalize, diff_function, run_sync


def test_no_changes(tmp_path, capsys):
    """Identical function bodies produce no diff."""
    body = "function Foo: Integer;\nbegin\n  result := 1;\nend;"

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(body + '\n')

    export_file = tmp_path / 'export.pas'
    export_file.write_text(body + '\n')

    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps({str(source_file): ['Foo']}))

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'No changes detected' in captured.out


def test_modified_function(tmp_path, capsys):
    """Changed function body detected and attributed to correct source file."""
    source_file = tmp_path / 'utils.pas'
    source_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text("function Foo: Integer;\nbegin\n  result := 42;\nend;\n")

    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps({str(source_file): ['Foo']}))

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert str(source_file) in captured.out
    assert 'result := 42' in captured.out


def test_new_function(tmp_path, capsys):
    """Function in export but not in mapping flagged as unplaced."""
    source_file = tmp_path / 'utils.pas'
    source_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function NewFunc: String;\nbegin\n  result := 'new';\nend;\n"
    )

    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps({str(source_file): ['Foo']}))

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'UNPLACED' in captured.out
    assert 'NewFunc' in captured.out


def test_deleted_function(tmp_path, capsys):
    """Function in mapping but missing from export flagged as removed."""
    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function Bar: Integer;\nbegin\n  result := 2;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps({str(source_file): ['Foo', 'Bar']}))

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'REMOVED' in captured.out
    assert 'bar' in captured.out.lower()


def test_multiple_changes_same_file(tmp_path, capsys):
    """Two changed functions in same source file grouped together."""
    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function Bar: Integer;\nbegin\n  result := 2;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 10;\nend;\n\n"
        "function Bar: Integer;\nbegin\n  result := 20;\nend;\n"
    )

    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps({str(source_file): ['Foo', 'Bar']}))

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert str(source_file) in captured.out
    assert 'result := 10' in captured.out
    assert 'result := 20' in captured.out


def test_changes_across_files(tmp_path, capsys):
    """Changes in different source files reported separately."""
    shared_file = tmp_path / 'shared.pas'
    shared_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    exam_file = tmp_path / 'exam.pas'
    exam_file.write_text("function Bar: String;\nbegin\n  result := 'old';\nend;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 99;\nend;\n\n"
        "function Bar: String;\nbegin\n  result := 'new';\nend;\n"
    )

    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps({
        str(shared_file): ['Foo'],
        str(exam_file): ['Bar'],
    }))

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert str(shared_file) in captured.out
    assert str(exam_file) in captured.out


def test_whitespace_normalization():
    """Trailing whitespace differences are ignored."""
    diff = diff_function('Foo',
                         'function Foo: Integer;  \nbegin  \n  result := 1;  \nend;  ',
                         'function Foo: Integer;\nbegin\n  result := 1;\nend;')
    assert diff == []


def test_encoding_normalization():
    """Non-ASCII characters stripped before diffing."""
    source = "function Foo: Integer;\nbegin\n  result := 1;\nend;"
    export = "function Foo: Integer;\nbegin\n  result := 1;\u00A0\nend;"
    diff = diff_function('Foo', source, export)
    assert diff == []


def test_globals_changed(tmp_path, capsys):
    """Preamble/globals changes detected."""
    preamble_file = tmp_path / '_preamble.pas'
    preamble_file.write_text("Var\n  GFlag: Boolean;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "Var\n  GFlag: Boolean;\n  GNewFlag: Integer;\n\n"
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    mapping_file = tmp_path / 'mapping.json'
    source_file = tmp_path / 'utils.pas'
    source_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")
    mapping_file.write_text(json.dumps({str(source_file): ['Foo']}))

    import os
    os.chdir(tmp_path)
    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'preamble' in captured.out.lower()
```

- [ ] **Step 2: Run reverse-sync tests**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -m pytest tests/test_reversesync.py -v
```

Expected: all 9 tests PASS.

- [ ] **Step 3: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/tests/test_reversesync.py
git commit -m "test: add reversesync unit tests"
```

---

### Task 10: Integration Test Fixtures

**Files:**
- Create: `Scripts/tools/tests/fixtures/integration/sample_shared/utils/strUtils.pas`
- Create: `Scripts/tools/tests/fixtures/integration/sample_shared/utils/formatting.pas`
- Create: `Scripts/tools/tests/fixtures/integration/sample_exam/report.pas`
- Create: `Scripts/tools/tests/fixtures/integration/sample_exam/uiHandlers.pas`
- Create: `Scripts/tools/tests/fixtures/integration/sample_exam/script.pas`
- Create: `Scripts/tools/tests/fixtures/integration/mapping.json`
- Create: `Scripts/tools/tests/fixtures/integration/simulated_edit.pas`

- [ ] **Step 1: Create shared fixture files**

`Scripts/tools/tests/fixtures/integration/sample_shared/utils/strUtils.pas`:

```pascal
#ifndef __SHARED_UTILS_STRUTILS
#define __SHARED_UTILS_STRUTILS

function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  try
    result := StrToFloat(inString);
  except
    result := inDefault;
  end;
end;

#endif
```

`Scripts/tools/tests/fixtures/integration/sample_shared/utils/formatting.pas`:

```pascal
#ifndef __SHARED_UTILS_FORMATTING
#define __SHARED_UTILS_FORMATTING

function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.'
    else
      result := inStr;
  end
  else
    result := '';
end;

#endif
```

- [ ] **Step 2: Create exam-specific fixture files**

`Scripts/tools/tests/fixtures/integration/sample_exam/report.pas`:

```pascal
function GetFindings: String;
begin
  result := 'Normal anatomy';
end;

procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Add('Findings=''' + GetFindings + '''');
end;
```

`Scripts/tools/tests/fixtures/integration/sample_exam/uiHandlers.pas`:

```pascal
procedure cbOptionOnClick(Sender);
begin
  if Sender.Checked then
    lblStatus.Caption := 'Selected';
end;
```

`Scripts/tools/tests/fixtures/integration/sample_exam/script.pas`:

```pascal
#include "sample_shared/utils/strUtils.pas"
#include "sample_shared/utils/formatting.pas"

#include "sample_exam/report.pas"
#include "sample_exam/uiHandlers.pas"

Var
  GFlag: Boolean;

procedure InitializeScreen;
begin
  GFlag := False;
end;

procedure StartScript;
begin
  InitializeScreen;
end;

StartScript;
```

- [ ] **Step 3: Create mapping JSON**

`Scripts/tools/tests/fixtures/integration/mapping.json`:

```json
{
  "sample_shared/utils/strUtils.pas": ["StrToFloatDef"],
  "sample_shared/utils/formatting.pas": ["AddFullStop"],
  "sample_exam/report.pas": ["GetFindings", "ProduceMergeFieldData"],
  "sample_exam/uiHandlers.pas": ["cbOptionOnClick"],
  "sample_exam/script.pas": ["InitializeScreen", "StartScript"]
}
```

- [ ] **Step 4: Create simulated edit fixture**

`Scripts/tools/tests/fixtures/integration/simulated_edit.pas` — this is what the GPP output would look like after someone edited `GetFindings` in the app:

```pascal
function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  try
    result := StrToFloat(inString);
  except
    result := inDefault;
  end;
end;

function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.'
    else
      result := inStr;
  end
  else
    result := '';
end;

function GetFindings: String;
begin
  result := 'Normal anatomy with normal growth';
end;

procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Add('Findings=''' + GetFindings + '''');
end;

procedure cbOptionOnClick(Sender);
begin
  if Sender.Checked then
    lblStatus.Caption := 'Selected';
end;

Var
  GFlag: Boolean;

procedure InitializeScreen;
begin
  GFlag := False;
end;

procedure StartScript;
begin
  InitializeScreen;
end;

StartScript;
```

- [ ] **Step 5: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/tests/fixtures/
git commit -m "test: add integration test fixtures for GPP pipeline"
```

---

### Task 11: Integration Tests

**Files:**
- Create: `Scripts/tools/tests/test_integration.py`

- [ ] **Step 1: Write integration tests**

```python
"""Integration tests: full GPP build -> funcsplit -> reversesync pipeline."""

import json
import subprocess
import shutil
import sys
from pathlib import Path

import pytest

TOOLS_DIR = Path(__file__).parent.parent
FIXTURES_DIR = Path(__file__).parent / 'fixtures' / 'integration'


@pytest.fixture
def work_dir(tmp_path):
    """Copy fixtures to a temp directory for isolated testing."""
    shutil.copytree(FIXTURES_DIR, tmp_path / 'fixtures')
    return tmp_path / 'fixtures'


def run_gpp(work_dir, input_file, output_file):
    """Run GPP from the fixtures directory."""
    result = subprocess.run(
        ['gpp', '-o', str(output_file), str(input_file)],
        cwd=str(work_dir),
        capture_output=True, text=True,
    )
    return result


def run_funcsplit(work_dir, *args):
    """Run funcsplit.py."""
    cmd = [sys.executable, str(TOOLS_DIR / 'funcsplit.py')] + list(args)
    return subprocess.run(cmd, cwd=str(work_dir), capture_output=True, text=True)


def run_reversesync(work_dir, mapping, export):
    """Run reversesync.py."""
    cmd = [sys.executable, str(TOOLS_DIR / 'reversesync.py'), str(mapping), str(export)]
    return subprocess.run(cmd, cwd=str(work_dir), capture_output=True, text=True)


def test_gpp_build(work_dir):
    """GPP output contains all functions, no preprocessor directives remain."""
    output = work_dir / 'build.pas'
    result = run_gpp(work_dir, work_dir / 'sample_exam' / 'script.pas', output)
    assert result.returncode == 0, f"GPP failed: {result.stderr}"

    content = output.read_text()
    assert 'StrToFloatDef' in content
    assert 'AddFullStop' in content
    assert 'GetFindings' in content
    assert 'cbOptionOnClick' in content
    assert 'StartScript' in content
    assert '#include' not in content
    assert '#ifndef' not in content
    assert '#define' not in content
    assert '#endif' not in content


def test_gpp_include_guards(work_dir):
    """Include guards prevent duplicate function inclusion."""
    # Create a script that includes strUtils twice
    script = work_dir / 'double_include.pas'
    script.write_text(
        '#include "sample_shared/utils/strUtils.pas"\n'
        '#include "sample_shared/utils/strUtils.pas"\n'
    )
    output = work_dir / 'double_build.pas'
    result = run_gpp(work_dir, script, output)
    assert result.returncode == 0

    content = output.read_text()
    assert content.count('function StrToFloatDef') == 1


def test_build_then_split(work_dir):
    """Round-trip: build with GPP, then extract functions, verify they match."""
    output = work_dir / 'build.pas'
    run_gpp(work_dir, work_dir / 'sample_exam' / 'script.pas', output)

    result = run_funcsplit(work_dir, 'list', str(output))
    assert result.returncode == 0
    names = [line.split('(')[0].split(':')[0].split()[-1]
             for line in result.stdout.strip().splitlines()]
    expected = ['StrToFloatDef', 'AddFullStop', 'GetFindings',
                'ProduceMergeFieldData', 'cbOptionOnClick',
                'InitializeScreen', 'StartScript']
    assert sorted(n.lower() for n in names) == sorted(n.lower() for n in expected)


def test_build_then_reversesync_no_changes(work_dir):
    """Reverse-sync against identical output reports no changes."""
    output = work_dir / 'build.pas'
    run_gpp(work_dir, work_dir / 'sample_exam' / 'script.pas', output)

    mapping = work_dir / 'mapping.json'
    result = run_reversesync(work_dir, mapping, output)
    assert 'No changes detected' in result.stdout


def test_build_then_reversesync_with_edits(work_dir):
    """Reverse-sync against simulated edit detects correct changes."""
    mapping = work_dir / 'mapping.json'
    simulated = work_dir / 'simulated_edit.pas'

    result = run_reversesync(work_dir, mapping, simulated)
    assert 'report.pas' in result.stdout
    assert 'Normal anatomy with normal growth' in result.stdout


def test_full_roundtrip(work_dir):
    """Build -> simulate edit -> reverse-sync -> apply -> rebuild -> verify."""
    # Build original
    output = work_dir / 'build.pas'
    run_gpp(work_dir, work_dir / 'sample_exam' / 'script.pas', output)
    original_content = output.read_text()

    # Verify simulated edit differs
    simulated = work_dir / 'simulated_edit.pas'
    assert simulated.read_text() != original_content

    # Reverse-sync detects the change
    mapping = work_dir / 'mapping.json'
    result = run_reversesync(work_dir, mapping, simulated)
    assert 'GetFindings' in result.stdout

    # Apply the edit manually (simulate accepting the change)
    report = work_dir / 'sample_exam' / 'report.pas'
    content = report.read_text()
    content = content.replace("'Normal anatomy'", "'Normal anatomy with normal growth'")
    report.write_text(content)

    # Rebuild
    run_gpp(work_dir, work_dir / 'sample_exam' / 'script.pas', output)
    rebuilt = output.read_text()
    assert 'Normal anatomy with normal growth' in rebuilt


def test_new_function_in_export(work_dir):
    """New function in simulated edit is flagged as unplaced."""
    simulated = work_dir / 'simulated_edit_new.pas'
    content = (work_dir / 'simulated_edit.pas').read_text()
    content += "\nfunction BrandNew: Integer;\nbegin\n  result := 999;\nend;\n"
    simulated.write_text(content)

    mapping = work_dir / 'mapping.json'
    result = run_reversesync(work_dir, mapping, simulated)
    assert 'UNPLACED' in result.stdout
    assert 'BrandNew' in result.stdout


def test_deleted_function_in_export(work_dir):
    """Deleted function flagged as removed."""
    simulated = work_dir / 'simulated_edit_deleted.pas'
    content = (work_dir / 'simulated_edit.pas').read_text()
    # Remove cbOptionOnClick from the export
    lines = content.splitlines()
    filtered = []
    skip = False
    for line in lines:
        if 'procedure cbOptionOnClick' in line:
            skip = True
        if skip and line.strip().startswith('end;'):
            skip = False
            continue
        if not skip:
            filtered.append(line)
    simulated.write_text('\n'.join(filtered))

    mapping = work_dir / 'mapping.json'
    result = run_reversesync(work_dir, mapping, simulated)
    assert 'REMOVED' in result.stdout
    assert 'cbOptionOnClick' in result.stdout.lower()
```

- [ ] **Step 2: Run integration tests**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -m pytest tests/test_integration.py -v
```

Expected: all 8 tests PASS.

- [ ] **Step 3: Run full test suite**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -m pytest tests/ -v
```

Expected: all 45 tests PASS (21 parser + 7 modes + 9 reversesync + 8 integration).

- [ ] **Step 4: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/tests/test_integration.py
git commit -m "test: add integration tests for full GPP pipeline"
```

---

### Task 12: build.sh

**Files:**
- Create: `Scripts/tools/build.sh`

- [ ] **Step 1: Write the build script**

```bash
#!/bin/bash
# Build all exam scripts using GPP.
# Run from the Scripts/ directory.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_DIR="${SCRIPTS_DIR}/build"

mkdir -p "$BUILD_DIR"

EXAMS=(earlyT1Singleton 20week gynae pe12week t3Singleton t3twins)

if [ $# -gt 0 ]; then
    EXAMS=("$@")
fi

cd "$SCRIPTS_DIR"

for exam in "${EXAMS[@]}"; do
    input="${exam}/script.pas"
    output="${BUILD_DIR}/${exam}.pas"

    if [ ! -f "$input" ]; then
        echo "SKIP: $input not found"
        continue
    fi

    echo "Building $exam..."
    gpp -o "$output" "$input"
    echo "  -> $output"
done

echo "Done."
```

- [ ] **Step 2: Make executable**

```bash
chmod +x "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools/build.sh"
```

- [ ] **Step 3: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/tools/build.sh
git commit -m "feat: add build.sh for building all exams via GPP"
```

---

### Task 13: Run Full Test Suite and Verify

**Files:**
- None modified (verification only)

- [ ] **Step 1: Run complete test suite**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python -m pytest tests/ -v --tb=short
```

Expected: all 45 tests PASS.

- [ ] **Step 2: Verify parser against all exam scripts**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
for exam in earlyT1Singleton 20week gynae pe12week t3Singleton t3twins; do
    count=$(python -c "
from pascal_parser import parse
from pathlib import Path
source = Path('../${exam}/script.pas').read_text()
result = parse(source)
print(len(result.functions))
")
    echo "$exam: $count functions"
done
```

Expected: function counts for each exam (earlyT1Singleton: 91, others will vary).

- [ ] **Step 3: Update CLAUDE.md with new tooling commands**

Add the new build/test commands to CLAUDE.md:

```markdown
## New Tooling (GPP Migration)

### Build
\`\`\`bash
# Build all exams
cd Scripts && bash tools/build.sh

# Build single exam
cd Scripts && gpp -o build/earlyT1Singleton.pas earlyT1Singleton/script.pas
\`\`\`

### Tools
\`\`\`bash
# List functions in a script
python Scripts/tools/funcsplit.py list Scripts/earlyT1Singleton/script.pas

# Extract a single function
python Scripts/tools/funcsplit.py extract StrToFloatDef Scripts/earlyT1Singleton/script.pas

# Reverse-sync an app export against source
python Scripts/tools/reversesync.py Scripts/earlyT1Singleton/mapping.json exported_script.pas
\`\`\`

### Tests
\`\`\`bash
cd Scripts/tools && python -m pytest tests/ -v
\`\`\`
```

- [ ] **Step 4: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add CLAUDE.md
git commit -m "docs: update CLAUDE.md with GPP tooling commands"
```

---

### Task 14: Generate earlyT1Singleton Mapping JSON

**Files:**
- Create: `Scripts/earlyT1Singleton/mapping.json`

This task creates the function-to-file mapping for earlyT1Singleton. The mapping assigns each of the 91 functions to either a shared file or an exam-specific file.

- [ ] **Step 1: Generate the mapping**

Run this script to produce the mapping by cross-referencing `allFuncDefs.pas` (which has per-function duplication counts) with the earlyT1Singleton function list:

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python3 -c "
from pascal_parser import parse
from pathlib import Path
import re
import json

# Parse earlyT1Singleton
source = Path('../earlyT1Singleton/script.pas').read_text()
result = parse(source)
func_names = [f.name for f in result.functions]

# Load shared function counts from allFuncDefs.pas
shared_funcs = {}
for line in Path('../allFuncDefs.pas').read_text().strip().splitlines():
    parts = line.strip().split()
    if len(parts) >= 3:
        count = int(parts[0])
        match = re.search(r'(?:function|procedure)\s+(\w+)', line, re.IGNORECASE)
        if match and count > 1:
            shared_funcs[match.group(1).lower()] = count

# Categorize each function
mapping = {
    'shared/utils/strUtils.pas': [],
    'shared/utils/formatting.pas': [],
    'shared/utils/dateUtils.pas': [],
    'shared/utils/articles.pas': [],
    'shared/utils/formUtils.pas': [],
    'shared/obstetric/eddHandling.pas': [],
    'shared/obstetric/gestationalAge.pas': [],
    'shared/obstetric/clinicalHistory.pas': [],
    'shared/gynae/fibroids.pas': [],
    'shared/gynae/fibroidUI.pas': [],
    'report.pas': [],
    'embryo.pas': [],
    'nips.pas': [],
    'uiHandlers.pas': [],
    'script.pas': [],
}

# Auto-categorize based on name patterns and shared count
str_utils = {'strtofloatdef', 'strtointdef', 'stringreplace', 'stringreplaceall'}
formatting = {'initcaps', 'includecomma', 'addfullstop', 'addfullstoptoend', 'paddecimalplaces',
              'getnumberstring', 'removedecimalpointatend'}
date_utils = {'getfulldatestring'}
articles = {'getindefinatearticle', 'getvaluesuffix'}
form_utils = {'checkformcomplete', 'addtoresult', 'cbtogglecheckonclick', 'max'}
edd = {'cbeddprincipleonchange', 'cblmpdateonchange', 'populateeddcontrols',
       'destatededdonchange', 'demufweddonchange', 'demenstrualeddonchange',
       'deovulationeddonchange', 'deivfeddonchange', 'cbdateofconceptiononchange',
       'setransferdayonchange', 'cbusseddonchange'}
gest_age = {'getweeksfromduedate', 'getdaysfromduedate', 'getweeksfromlmpdate',
            'getdaysfromlmpdate', 'getgestweeks', 'getgestdays',
            'getlmpweeks', 'getlmpdays'}
clinical = {'getclinicalindicators', 'getclinicalhistory',
            'cxccbreferralindicatorschange', 'getobstetrichistory',
            'getclinicalhistorychange', 'cxccbobstetrichistorychange'}
fibroids = {'getfibroidcount', 'getfibroidallclear', 'getsinglecloseorclear',
            'getcavdistortioncount', 'getsinglefibroiddimensions', 'getsinglefibroid',
            'getfibroidstring', 'getfibroiddesc', 'getlargestfibroid', 'getfibroidavg',
            'getsinglefibroidcavity', 'gethasdistortion', 'getfibroidconcl',
            'getfibroid', 'getfibroidcavity'}
fibroid_ui = {'spfibroidcountonchange', 'cbfibroidsvisualisedonclick',
              'cbfibroidstypeonchange', 'toggleclosetocervixfibroid'}
embryo_funcs = {'getebmheartmotion', 'getfetalheartrate', 'getheartratelabel',
                'islivepregnancy', 'getembryotransfercount', 'getfrozen'}
nips_funcs = {'getnipsstring', 'getnipsconclusion'}
report_funcs = {'getfindings', 'getconclusion', 'getlivefindings', 'getliveconclusion',
                'getmissedmiscarriagefinding', 'getmissedmiscarriageconclusion',
                'getenterededd', 'getcompositedate', 'getpregnancyredated',
                'producemergeorder', 'producemergefielddata'}
entry_points = {'startscript', 'initializescreen'}
# UI handlers: everything else that's exam-specific and starts with cb/btn/edt/se
ui_patterns = {'cbnaturalmedicationonchange', 'cbclinicalhistoryonchange',
               'cbclinicalhistorychange', 'cbyolksacyes1onclick', 'cbyolksacno1onclick',
               'cbheartmotionvisyes1onclick', 'cbheartmotionvisno1onclick',
               'cbembryo1notvisualised1onclick', 'cbembryo1visualised1onclick',
               'cbpreigheamyesonclick', 'cbpreigheamnoonclick',
               'edtembrosize1onchange', 'edtyolksacsize1onchange',
               'btnpregnancyredatedonclick'}

for name in func_names:
    lower = name.lower()
    if lower in str_utils:
        mapping['shared/utils/strUtils.pas'].append(name)
    elif lower in formatting:
        mapping['shared/utils/formatting.pas'].append(name)
    elif lower in date_utils:
        mapping['shared/utils/dateUtils.pas'].append(name)
    elif lower in articles:
        mapping['shared/utils/articles.pas'].append(name)
    elif lower in form_utils:
        mapping['shared/utils/formUtils.pas'].append(name)
    elif lower in edd:
        mapping['shared/obstetric/eddHandling.pas'].append(name)
    elif lower in gest_age:
        mapping['shared/obstetric/gestationalAge.pas'].append(name)
    elif lower in clinical:
        mapping['shared/obstetric/clinicalHistory.pas'].append(name)
    elif lower in fibroids:
        mapping['shared/gynae/fibroids.pas'].append(name)
    elif lower in fibroid_ui:
        mapping['shared/gynae/fibroidUI.pas'].append(name)
    elif lower in embryo_funcs:
        mapping['shared/obstetric/embryo.pas' if lower in shared_funcs else 'embryo.pas'].append(name)
    elif lower in nips_funcs:
        mapping['nips.pas'].append(name)
    elif lower in report_funcs:
        mapping['report.pas'].append(name)
    elif lower in entry_points:
        mapping['script.pas'].append(name)
    elif lower in ui_patterns:
        mapping['uiHandlers.pas'].append(name)
    else:
        print(f'  UNCATEGORIZED: {name}')

# Remove empty keys
mapping = {k: v for k, v in mapping.items() if v}

# Print summary
total = sum(len(v) for v in mapping.values())
print(f'Mapped {total}/{len(func_names)} functions:')
for k, v in mapping.items():
    print(f'  {k}: {len(v)} functions')

Path('../earlyT1Singleton/mapping.json').write_text(json.dumps(mapping, indent=2) + '\n')
print(f'\nWritten to earlyT1Singleton/mapping.json')
"
```

Expected: all 91 functions categorized. Any `UNCATEGORIZED` functions need manual assignment.

- [ ] **Step 2: Review the mapping**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts"
cat earlyT1Singleton/mapping.json | python3 -m json.tool
```

Verify the mapping looks correct — shared utility functions in `shared/`, exam-specific in local files.

- [ ] **Step 3: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/earlyT1Singleton/mapping.json
git commit -m "feat: add earlyT1Singleton function-to-file mapping"
```

---

### Task 15: Extract & Split earlyT1Singleton

**Files:**
- Create: `Scripts/shared/` directory tree
- Create: `Scripts/earlyT1Singleton/report.pas`
- Create: `Scripts/earlyT1Singleton/nips.pas`
- Create: `Scripts/earlyT1Singleton/embryo.pas`
- Create: `Scripts/earlyT1Singleton/uiHandlers.pas`
- Modify: `Scripts/earlyT1Singleton/script.pas` (becomes thin entry point)

- [ ] **Step 1: Create shared directory structure**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts"
mkdir -p shared/utils shared/obstetric shared/gynae
```

- [ ] **Step 2: Back up the original script**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts"
cp earlyT1Singleton/script.pas earlyT1Singleton/script.pas.original
```

- [ ] **Step 3: Run funcsplit categorize**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts"
python tools/funcsplit.py categorize earlyT1Singleton/mapping.json earlyT1Singleton/script.pas
```

Expected: files created in `shared/` and `earlyT1Singleton/` per the mapping. Check for a `_remaining.pas` — if it exists, those functions need manual assignment.

- [ ] **Step 4: Add include guards to shared files**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python3 -c "
from pathlib import Path

shared_dir = Path('../shared')
for pas_file in shared_dir.rglob('*.pas'):
    # Generate guard name from path: shared/utils/strUtils.pas -> __SHARED_UTILS_STRUTILS
    rel = pas_file.relative_to(shared_dir.parent)
    guard = '__' + str(rel).replace('/', '_').replace('.pas', '').upper()

    content = pas_file.read_text()
    wrapped = f'#ifndef {guard}\n#define {guard}\n\n{content}\n\n#endif\n'
    pas_file.write_text(wrapped)
    print(f'  {pas_file}: guard {guard}')
"
```

- [ ] **Step 5: Create the entry point script.pas**

Replace `Scripts/earlyT1Singleton/script.pas` with a thin entry point. The exact `#include` list depends on which shared files were created in step 3. Build the entry point:

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts/tools"
python3 -c "
from pathlib import Path
from pascal_parser import parse
import json

# Read the mapping to know which shared files this exam uses
mapping = json.loads(Path('../earlyT1Singleton/mapping.json').read_text())

# Read original for preamble/postamble
original = Path('../earlyT1Singleton/script.pas.original').read_text()
result = parse(original)

# Build include list
shared_includes = []
local_includes = []
for target_file in mapping:
    if target_file.startswith('shared/'):
        shared_includes.append(target_file)
    elif target_file != 'script.pas':
        local_includes.append(target_file)

# Read entry point functions from script.pas (if it was created by categorize)
entry_funcs = ''
script_target = Path('../earlyT1Singleton/script.pas')
if script_target.exists():
    entry_funcs = script_target.read_text()

# Assemble entry point
lines = ['// earlyT1Singleton entry point']
lines.append('')
lines.append('// Shared libraries')
for inc in sorted(shared_includes):
    lines.append(f'#include \"{inc}\"')
lines.append('')
lines.append('// Exam modules')
for inc in sorted(local_includes):
    lines.append(f'#include \"{inc}\"')
lines.append('')

# Add preamble (globals)
if result.preamble.strip():
    lines.append(result.preamble)
    lines.append('')

# Add entry point functions (StartScript, InitializeScreen)
if entry_funcs.strip():
    lines.append(entry_funcs)

# Add postamble
if result.postamble.strip():
    lines.append('')
    lines.append(result.postamble)

Path('../earlyT1Singleton/script.pas').write_text('\n'.join(lines) + '\n')
print('Entry point written to earlyT1Singleton/script.pas')
"
```

- [ ] **Step 6: Build with GPP and diff against original**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One/Scripts"
mkdir -p build
gpp -o build/earlyT1Singleton.pas earlyT1Singleton/script.pas

# Diff against original (ignoring whitespace/blank lines)
diff -wB earlyT1Singleton/script.pas.original build/earlyT1Singleton.pas
```

Expected: minimal or no differences. Any differences should only be whitespace or blank line changes. If there are functional differences, debug which function was lost or duplicated.

- [ ] **Step 7: Commit**

```bash
cd "/Users/karl/Code 2/Contrast One Updates/code/Contrast One"
git add Scripts/shared/ Scripts/earlyT1Singleton/
git commit -m "feat: extract earlyT1Singleton into shared library + modular files"
```
