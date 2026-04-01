"""Unit tests for reversesync.py."""

import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).parent.parent))
from reversesync import normalize, diff_function, run_sync


# ---------------------------------------------------------------------------
# Helper
# ---------------------------------------------------------------------------

SIMPLE_FUNC = "function {name}: Integer;\nbegin\n  result := 1;\nend;"


def make_mapping(tmp_path, mapping: dict) -> Path:
    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps(mapping))
    return mapping_file


# ---------------------------------------------------------------------------
# Tests for run_sync
# ---------------------------------------------------------------------------


def test_no_changes(tmp_path, capsys, monkeypatch):
    """Identical source and export produce 'No changes detected'."""
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'No changes detected' in captured.out


def test_modified_function(tmp_path, capsys):
    """Changed body is reported with source file path and new value."""
    source_file = tmp_path / 'utils.pas'
    source_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text("function Foo: Integer;\nbegin\n  result := 42;\nend;\n")

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert str(source_file) in captured.out
    assert 'result := 42' in captured.out


def test_new_function(tmp_path, capsys):
    """Function in export but not in mapping is reported as UNPLACED."""
    source_file = tmp_path / 'utils.pas'
    source_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function NewFunc: Integer;\nbegin\n  result := 99;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'UNPLACED' in captured.out
    assert 'NewFunc' in captured.out


def test_deleted_function(tmp_path, capsys):
    """Function in mapping but absent from export is reported as REMOVED."""
    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function Bar: Integer;\nbegin\n  result := 2;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo', 'Bar']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'REMOVED' in captured.out
    assert 'bar' in captured.out.lower()


def test_multiple_changes_same_file(tmp_path, capsys):
    """Two changed functions mapped to the same source appear under one file header."""
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

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo', 'Bar']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()

    # The source file header should appear exactly once
    assert captured.out.count(str(source_file)) == 1
    # Both diffs should be present
    assert 'result := 10' in captured.out
    assert 'result := 20' in captured.out


def test_changes_across_files(tmp_path, capsys):
    """Changed functions mapped to different source files each show their own header."""
    source_a = tmp_path / 'alpha.pas'
    source_a.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    source_b = tmp_path / 'beta.pas'
    source_b.write_text("function Bar: Integer;\nbegin\n  result := 2;\nend;\n")

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 10;\nend;\n\n"
        "function Bar: Integer;\nbegin\n  result := 20;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {
        str(source_a): ['Foo'],
        str(source_b): ['Bar'],
    })

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert str(source_a) in captured.out
    assert str(source_b) in captured.out


# ---------------------------------------------------------------------------
# Tests for normalize / diff_function
# ---------------------------------------------------------------------------


def test_whitespace_normalization():
    """Trailing spaces in source vs. none in export produce no diff."""
    source_body = "function Foo: Integer;\nbegin\n  result := 1;   \nend;"
    export_body = "function Foo: Integer;\nbegin\n  result := 1;\nend;"
    assert diff_function('Foo', source_body, export_body) == []


def test_encoding_normalization():
    """Non-ASCII character in export is stripped, producing no diff."""
    source_body = "function Foo: Integer;\nbegin\n  result := 1;\nend;"
    # Insert a non-breaking space (U+00A0) after the semicolon
    export_body = "function Foo: Integer;\nbegin\n  result := 1;\u00A0\nend;"
    assert diff_function('Foo', source_body, export_body) == []


# ---------------------------------------------------------------------------
# Preamble test
# ---------------------------------------------------------------------------


def test_globals_changed(tmp_path, capsys, monkeypatch):
    """Changed global preamble is detected and reported as 'preamble'."""
    monkeypatch.chdir(tmp_path)

    # Create the preamble file in cwd (tmp_path)
    preamble_file = tmp_path / '_preamble.pas'
    preamble_file.write_text("Var GFlag: Boolean;\n")

    # Source file with a mapped function
    source_file = tmp_path / 'utils.pas'
    source_file.write_text("function Foo: Integer;\nbegin\n  result := 1;\nend;\n")

    # Export has expanded globals before the function
    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "Var GFlag: Boolean; GNewFlag: Integer;\n\n"
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'preamble' in captured.out.lower()


# ---------------------------------------------------------------------------
# Workflow edge-case tests (audit batch)
# ---------------------------------------------------------------------------


def test_function_reordering_no_diff(tmp_path, capsys, monkeypatch):
    """User reorders functions in the app editor — no bodies changed.

    Source has Alpha then Beta; export has Beta then Alpha.
    Should report 'No changes detected.'
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Alpha: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function Beta: Integer;\nbegin\n  result := 2;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Beta: Integer;\nbegin\n  result := 2;\nend;\n\n"
        "function Alpha: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Alpha', 'Beta']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'No changes detected' in captured.out


def test_function_renamed(tmp_path, capsys, monkeypatch):
    """User renames GetOldName to GetNewName in the app.

    Mapping still references GetOldName.  GetOldName should be REMOVED,
    GetNewName should be UNPLACED.
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function GetOldName: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function GetNewName: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['GetOldName']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'REMOVED' in captured.out
    assert 'GetOldName' in captured.out
    assert 'UNPLACED' in captured.out
    assert 'GetNewName' in captured.out


def test_single_line_addition(tmp_path, capsys, monkeypatch):
    """User adds one debug line inside a function body.

    Source: result := 1;
    Export: WriteLn('debug');  result := 1;
    Should detect the diff.
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  WriteLn('debug');\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert str(source_file) in captured.out
    assert "WriteLn" in captured.out


def test_function_copied_and_modified(tmp_path, capsys, monkeypatch):
    """Export has original Foo unchanged plus a new FooCopy with tweaked body.

    FooCopy should be UNPLACED; Foo should show no diff.
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function FooCopy: Integer;\nbegin\n  result := 99;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'UNPLACED' in captured.out
    assert 'FooCopy' in captured.out
    # Foo itself should NOT be reported as changed — only the unplaced section
    # The source file header should not appear (no diffs for Foo)
    assert str(source_file) not in captured.out


def test_code_added_between_functions(tmp_path, capsys, monkeypatch):
    """User adds global code between two functions in the export.

    The inter-function code lands in the preamble or postamble.
    At minimum it must not be silently lost.
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Alpha: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function Beta: Integer;\nbegin\n  result := 2;\nend;\n"
    )

    # Export adds a global var block before the first function
    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "Var GTemp: Integer;\n\n"
        "function Alpha: Integer;\nbegin\n  result := 1;\nend;\n\n"
        "function Beta: Integer;\nbegin\n  result := 2;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Alpha', 'Beta']})

    # Create an empty _preamble.pas so the preamble diff is checked
    preamble_file = tmp_path / '_preamble.pas'
    preamble_file.write_text('')

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    # The preamble change should surface (the new Var block)
    assert 'preamble' in captured.out.lower() or 'GTemp' in captured.out


def test_crlf_line_endings(tmp_path, capsys, monkeypatch):
    """Export uses CRLF, source uses LF.  Bodies are otherwise identical.

    normalize() should strip \\r so the result is 'No changes detected.'
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_bytes(
        b"function Foo: Integer;\r\nbegin\r\n  result := 1;\r\nend;\r\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'No changes detected' in captured.out


def test_blank_line_differences(tmp_path, capsys, monkeypatch):
    """Export has extra blank lines inside a function body.

    This is a real content difference and should be reported as a change.
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n\n\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    # Extra blank lines inside the body are a real difference
    assert str(source_file) in captured.out


def test_tabs_vs_spaces(tmp_path, capsys, monkeypatch):
    """Source uses spaces, export uses tabs for indentation.

    Without tab-normalization this is a reportable change.
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n\tresult := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    # Tabs vs spaces is a real content difference — should produce a diff
    assert str(source_file) in captured.out


def test_function_signature_changed(tmp_path, capsys, monkeypatch):
    """User adds a parameter to the function signature.

    Source: function Foo: Integer;
    Export: function Foo(x: Integer): Integer;
    Body otherwise same. Should detect as a modification.
    """
    monkeypatch.chdir(tmp_path)

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo(x: Integer): Integer;\nbegin\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert str(source_file) in captured.out


def test_preamble_comment_added(tmp_path, capsys, monkeypatch):
    """Export has a new comment before the first function, no function changes.

    If _preamble.pas exists, the preamble diff should be detected.
    """
    monkeypatch.chdir(tmp_path)

    preamble_file = tmp_path / '_preamble.pas'
    preamble_file.write_text('')

    source_file = tmp_path / 'utils.pas'
    source_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "// New comment added by user\n\n"
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(source_file): ['Foo']})

    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'preamble' in captured.out.lower()


def test_missing_source_file(tmp_path, capsys, monkeypatch):
    """Mapping points to a source file that doesn't exist on disk.

    Should not crash.  Should report that the source file is missing.
    """
    monkeypatch.chdir(tmp_path)

    missing_source = tmp_path / 'does_not_exist.pas'

    export_file = tmp_path / 'export.pas'
    export_file.write_text(
        "function Foo: Integer;\nbegin\n  result := 1;\nend;\n"
    )

    mapping_file = make_mapping(tmp_path, {str(missing_source): ['Foo']})

    # Should not raise
    run_sync(str(mapping_file), str(export_file))
    captured = capsys.readouterr()
    assert 'not found' in captured.out.lower() or str(missing_source) in captured.out
