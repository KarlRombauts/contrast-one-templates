"""Unit tests for pascal_parser.parse() — basic extraction and edge cases."""

from pascal_parser import parse


# ---------------------------------------------------------------------------
# Basic extraction (11 tests)
# ---------------------------------------------------------------------------


class TestBasicExtraction:
    """Tests for core parsing of functions, procedures, preamble, postamble."""

    def test_simple_function(self):
        """Basic function with BEGIN/END: extracts name, body, line range."""
        src = "\n".join([
            "function Add(a, b: Integer): Integer;",
            "begin",
            "  Result := a + b;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Add"
        assert f.kind == "function"
        assert f.start_line == 0
        assert f.end_line == 3
        assert "Result := a + b;" in f.body
        assert f.body.startswith("function Add")

    def test_simple_procedure(self):
        """Handles procedure keyword."""
        src = "\n".join([
            "procedure DoStuff;",
            "begin",
            "  WriteLn('hello');",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "DoStuff"
        assert f.kind == "procedure"

    def test_nested_begin_end(self):
        """Nested BEGIN/END blocks: depth tracked correctly."""
        src = "\n".join([
            "procedure Outer;",
            "begin",
            "  if True then",
            "  begin",
            "    WriteLn('inner');",
            "  end;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Outer"
        assert f.start_line == 0
        assert f.end_line == 6

    def test_nested_try_except(self):
        """TRY/EXCEPT/END inside function: TRY counted as block opener."""
        src = "\n".join([
            "procedure Safe;",
            "begin",
            "  try",
            "    DoSomething;",
            "  except",
            "    ShowMessage('err');",
            "  end;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Safe"
        assert f.start_line == 0
        assert f.end_line == 7

    def test_nested_case(self):
        """CASE/END inside function: CASE counted as block opener."""
        src = "\n".join([
            "function Choose(x: Integer): String;",
            "begin",
            "  case x of",
            "    1: Result := 'one';",
            "    2: Result := 'two';",
            "  end;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Choose"
        assert f.start_line == 0
        assert f.end_line == 6

    def test_multiple_functions(self):
        """Two functions back-to-back: both extracted with correct boundaries."""
        src = "\n".join([
            "function First: Integer;",
            "begin",
            "  Result := 1;",
            "end;",
            "",
            "function Second: Integer;",
            "begin",
            "  Result := 2;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 2
        assert result.functions[0].name == "First"
        assert result.functions[0].start_line == 0
        assert result.functions[0].end_line == 3
        assert result.functions[1].name == "Second"
        assert result.functions[1].start_line == 5
        assert result.functions[1].end_line == 8

    def test_function_with_var_block(self):
        """VAR declarations before BEGIN included in function body."""
        src = "\n".join([
            "function Compute: Integer;",
            "var",
            "  x: Integer;",
            "begin",
            "  x := 42;",
            "  Result := x;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Compute"
        assert "var" in f.body
        assert "x: Integer;" in f.body
        assert f.start_line == 0
        assert f.end_line == 6

    def test_empty_function(self):
        """Function with only BEGIN/END."""
        src = "\n".join([
            "procedure Noop;",
            "begin",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Noop"
        assert f.start_line == 0
        assert f.end_line == 2

    def test_global_var_section(self):
        """VAR block before first function: extracted as preamble."""
        src = "\n".join([
            "unit MyUnit;",
            "",
            "var",
            "  GlobalVar: Integer;",
            "",
            "function Foo: Integer;",
            "begin",
            "  Result := GlobalVar;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        assert "GlobalVar: Integer;" in result.preamble
        assert "unit MyUnit;" in result.preamble
        assert result.functions[0].name == "Foo"

    def test_semicolon_variations(self):
        """`end;` vs `end` at final function."""
        # 'end' without semicolon should still close the function
        src = "\n".join([
            "function WithSemicolon: Integer;",
            "begin",
            "  Result := 1;",
            "end;",
            "",
            "function WithoutSemicolon: Integer;",
            "begin",
            "  Result := 2;",
            "end",
        ])
        result = parse(src)
        assert len(result.functions) == 2
        assert result.functions[0].name == "WithSemicolon"
        assert result.functions[1].name == "WithoutSemicolon"
        assert result.functions[1].end_line == 8

    def test_postamble(self):
        """Code after last function captured as postamble."""
        src = "\n".join([
            "function Foo: Integer;",
            "begin",
            "  Result := 1;",
            "end;",
            "",
            "initialization",
            "  GlobalInit;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        assert "initialization" in result.postamble
        assert "GlobalInit;" in result.postamble


# ---------------------------------------------------------------------------
# Edge cases (10 tests)
# ---------------------------------------------------------------------------


class TestEdgeCases:
    """Tests for string literals, comments, mixed case, and nested declarations."""

    def test_string_containing_begin(self):
        """`result := 'BEGIN something';` ignored as keyword."""
        src = "\n".join([
            "function Greet: String;",
            "begin",
            "  Result := 'BEGIN something';",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Greet"
        assert f.start_line == 0
        assert f.end_line == 3

    def test_string_containing_end(self):
        """`result := 'END';` doesn't decrement depth."""
        src = "\n".join([
            "function Msg: String;",
            "begin",
            "  Result := 'END';",
            "  WriteLn(Result);",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Msg"
        assert f.end_line == 4

    def test_escaped_quotes(self):
        """`result := 'it''s';` handled correctly."""
        src = "\n".join([
            "function Quote: String;",
            "begin",
            "  Result := 'it''s a test';",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Quote"
        assert f.end_line == 3

    def test_line_comment(self):
        """`// END; BEGIN;` ignored."""
        src = "\n".join([
            "function Commented: Integer;",
            "begin",
            "  // END; BEGIN;",
            "  Result := 1;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Commented"
        assert f.end_line == 4

    def test_block_comment_braces(self):
        """`{ END; BEGIN; }` ignored."""
        src = "\n".join([
            "function Braces: Integer;",
            "begin",
            "  { END; BEGIN; }",
            "  Result := 1;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Braces"
        assert f.end_line == 4

    def test_block_comment_parens(self):
        """`(* END; BEGIN; *)` ignored."""
        src = "\n".join([
            "function ParenStar: Integer;",
            "begin",
            "  (* END; BEGIN; *)",
            "  Result := 2;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "ParenStar"
        assert f.end_line == 4

    def test_mixed_case_keywords(self):
        """`Begin`, `END`, `end;` all handled."""
        src = "\n".join([
            "Function MixCase: Integer;",
            "Begin",
            "  Result := 1;",
            "END;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "MixCase"
        assert f.kind == "function"
        assert f.start_line == 0
        assert f.end_line == 3

    def test_nested_function(self):
        """Procedure containing a local function: inner BEGIN/END don't close outer."""
        src = "\n".join([
            "procedure Outer;",
            "  function Inner: Integer;",
            "  begin",
            "    Result := 1;",
            "  end;",
            "begin",
            "  WriteLn(Inner);",
            "end;",
        ])
        result = parse(src)
        # Only the outer function should be a top-level entry
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "Outer"
        assert f.start_line == 0
        assert f.end_line == 7
        # The inner function body should be part of the outer function's body
        assert "function Inner" in f.body

    def test_multiline_block_comment(self):
        """Multi-line `{ ... }` with keywords inside."""
        src = "\n".join([
            "function MultiComment: Integer;",
            "begin",
            "  {",
            "    BEGIN END TRY CASE",
            "  }",
            "  Result := 3;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        f = result.functions[0]
        assert f.name == "MultiComment"
        assert f.end_line == 6

    def test_preamble_with_comments(self):
        """Comments before first function in preamble."""
        src = "\n".join([
            "// This is a header comment",
            "{ Author: someone }",
            "(* Version 1.0 *)",
            "",
            "function First: Integer;",
            "begin",
            "  Result := 0;",
            "end;",
        ])
        result = parse(src)
        assert len(result.functions) == 1
        assert "// This is a header comment" in result.preamble
        assert "{ Author: someone }" in result.preamble
        assert "(* Version 1.0 *)" in result.preamble
        assert result.functions[0].name == "First"


# ---------------------------------------------------------------------------
# Critical edge-case tests from audit (12 tests)
# ---------------------------------------------------------------------------


def test_end_else_begin_without_semicolons():
    """end without semicolon before else must NOT close the function."""
    src = "\n".join([
        "function GetIndefinateArticle(inValue: Integer; inDoCaps: Boolean): string;",
        "var",
        "  vTemp: string;",
        "begin",
        "  result := '';",
        "  vTemp := IntToStr(inValue);",
        "  if inValue = 8 then",
        "  begin",
        "    result := 'An'",
        "  end",
        "  else",
        "  begin",
        "    result := 'A'",
        "  end;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "GetIndefinateArticle"
    assert f.start_line == 0
    assert f.end_line == 14


def test_if_then_without_begin_end():
    """Simple if/else without begin/end blocks."""
    src = "\n".join([
        "function Min(a, b: Integer): Integer;",
        "begin",
        "  if a > b then",
        "    result := b",
        "  else",
        "    result := a;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "Min"
    assert f.start_line == 0
    assert f.end_line == 6


def test_for_loop_with_begin_end():
    """for loop with begin/end doesn't break parsing."""
    src = "\n".join([
        "procedure DoLoop;",
        "var",
        "  i: Integer;",
        "begin",
        "  for i := 0 to 10 do",
        "  begin",
        "    DoSomething(i);",
        "  end;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "DoLoop"
    assert f.start_line == 0
    assert f.end_line == 8


def test_compiler_directives_between_functions():
    """Include guards / compiler directives are preamble/postamble, not function bodies."""
    src = "\n".join([
        "#ifndef __GUARD",
        "#define __GUARD",
        "",
        "function Foo: Integer;",
        "begin",
        "  result := 1;",
        "end;",
        "",
        "function Bar: Integer;",
        "begin",
        "  result := 2;",
        "end;",
        "",
        "#endif",
    ])
    result = parse(src)
    assert len(result.functions) == 2
    assert result.functions[0].name == "Foo"
    assert result.functions[1].name == "Bar"
    assert "#ifndef __GUARD" in result.preamble
    assert "#define __GUARD" in result.preamble
    assert "#endif" in result.postamble


def test_function_with_untyped_parameter():
    """Contrast One scripting engine pattern: parameter without type."""
    src = "\n".join([
        "procedure cbToggleCheckOnClick(Sender)",
        "var",
        "  i: Integer;",
        "begin",
        "  if Sender.Checked then",
        "    i := 1;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "cbToggleCheckOnClick"
    assert f.start_line == 0
    assert f.end_line == 6


def test_deeply_nested_case_with_begin_end():
    """Multiple begin/end pairs inside case arms all balance correctly."""
    src = "\n".join([
        "procedure HandleCase(sender);",
        "begin",
        "  case cbEDDPrinciple.ItemIndex of",
        "    1: begin",
        "         gbEDDDating.Height := 47;",
        "       end;",
        "    2: begin",
        "         gbEDDDating.Height := 80;",
        "       end;",
        "    3: begin",
        "         gbEDDDating.Height := 80;",
        "       end;",
        "  end;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "HandleCase"
    assert f.start_line == 0
    assert f.end_line == 13


def test_multiple_end_on_same_line():
    """end;end; on same line -- first closes try, second closes function."""
    src = "\n".join([
        "function Foo: Integer;",
        "begin",
        "  try",
        "    result := 1;",
        "  except",
        "    result := 0;",
        "  end;end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "Foo"
    assert f.end_line == 6


def test_string_with_embedded_single_quotes_complex():
    """Triple-quote pattern (escaped quotes) doesn't break string parsing."""
    src = "\n".join([
        "procedure AddData;",
        "begin",
        "  lbData.Items.Add('Field=''' + GetValue + '''');",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "AddData"
    assert f.start_line == 0
    assert f.end_line == 3


def test_comment_between_signature_and_begin():
    """Comment between function signature and var/begin is inside the function body."""
    src = "\n".join([
        "function Foo: Integer;",
        "// This function does something",
        "var",
        "  x: Integer;",
        "begin",
        "  result := 1;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "Foo"
    assert f.start_line == 0
    assert f.end_line == 6
    assert "// This function does something" in f.body


def test_multiline_paren_star_comment():
    """Keywords in multi-line (* *) comment are ignored."""
    src = "\n".join([
        "function Foo: Integer;",
        "begin",
        "  (* This is",
        "     a multiline comment",
        "     with END and BEGIN keywords *)",
        "  result := 1;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "Foo"
    assert f.start_line == 0
    assert f.end_line == 6


def test_function_reordering_preserves_all():
    """All 5 functions extracted in source order with correct names."""
    funcs = ["Alpha", "Bravo", "Charlie", "Delta", "Echo"]
    parts = []
    for name in funcs:
        parts.extend([
            f"function {name}: Integer;",
            "begin",
            "  result := 1;",
            "end;",
            "",
        ])
    src = "\n".join(parts).rstrip("\n")
    result = parse(src)
    assert len(result.functions) == 5
    for i, name in enumerate(funcs):
        assert result.functions[i].name == name


def test_real_world_getindefinatearticle():
    """Critical end else begin pattern from real codebase."""
    src = "\n".join([
        "function GetIndefinateArticle(inValue: Integer; inDoCaps: Boolean): string;",
        "var",
        "  vTemp: string;",
        "begin",
        "  result := '';",
        "  vTemp := IntToStr(inValue);",
        "  if ((length(vTemp) > 0) and (vTemp[1] = '8')) or (inValue = 11) or (inValue = 18) then",
        "  begin",
        "    if inDoCaps then",
        "      result := 'An'",
        "    else",
        "      result := 'an'",
        "  end",
        "  else",
        "  begin",
        "    if inDoCaps then",
        "      result := 'A';",
        "    else",
        "      result := 'a';",
        "  end;",
        "end;",
    ])
    result = parse(src)
    assert len(result.functions) == 1
    f = result.functions[0]
    assert f.name == "GetIndefinateArticle"
    assert f.start_line == 0
    assert f.end_line == 20
