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
