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
