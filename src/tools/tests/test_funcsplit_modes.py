"""Tests for funcsplit.py CLI modes (list, extract, split, categorize)."""

import json
import subprocess
import sys
from pathlib import Path

import pytest

FUNCSPLIT = Path(__file__).parent.parent / 'funcsplit.py'

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


def run_funcsplit(*args):
    """Run funcsplit.py as a subprocess and return the CompletedProcess."""
    return subprocess.run(
        [sys.executable, str(FUNCSPLIT)] + list(args),
        capture_output=True,
        text=True,
    )


# ---------------------------------------------------------------------------
# Tests
# ---------------------------------------------------------------------------


def test_list_mode(tmp_path):
    """list prints 3 signatures (Alpha, Beta, Gamma)."""
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    result = run_funcsplit('list', str(src_file))

    assert result.returncode == 0
    lines = [line for line in result.stdout.splitlines() if line.strip()]
    assert len(lines) == 3
    names = ' '.join(lines)
    assert 'Alpha' in names
    assert 'Beta' in names
    assert 'Gamma' in names


def test_extract_single(tmp_path):
    """extract Beta returns body containing 'hello'."""
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    result = run_funcsplit('extract', 'Beta', str(src_file))

    assert result.returncode == 0
    assert 'hello' in result.stdout


def test_extract_nonexistent(tmp_path):
    """extract Missing exits with code 1, stderr says 'not found'."""
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    result = run_funcsplit('extract', 'Missing', str(src_file))

    assert result.returncode == 1
    assert 'not found' in result.stderr.lower()


def test_split_creates_files(tmp_path):
    """split creates Alpha.pas, Beta.pas, Gamma.pas, _preamble.pas, _postamble.pas."""
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)
    out_dir = tmp_path / 'output'

    result = run_funcsplit('split', str(out_dir), str(src_file))

    assert result.returncode == 0
    assert (out_dir / 'Alpha.pas').exists()
    assert (out_dir / 'Beta.pas').exists()
    assert (out_dir / 'Gamma.pas').exists()
    assert (out_dir / '_preamble.pas').exists()
    assert (out_dir / '_postamble.pas').exists()


def test_categorize_creates_grouped_files(tmp_path):
    """categorize with mapping creates correct grouped files."""
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    mapping = {
        str(tmp_path / 'group_ab.pas'): ['Alpha', 'Beta'],
        str(tmp_path / 'group_g.pas'): ['Gamma'],
    }
    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps(mapping))

    result = run_funcsplit('categorize', str(mapping_file), str(src_file))

    assert result.returncode == 0
    group_ab = tmp_path / 'group_ab.pas'
    group_g = tmp_path / 'group_g.pas'
    assert group_ab.exists()
    assert group_g.exists()
    ab_content = group_ab.read_text()
    assert 'Alpha' in ab_content
    assert 'Beta' in ab_content
    g_content = group_g.read_text()
    assert 'Gamma' in g_content


def test_categorize_remaining(tmp_path, monkeypatch):
    """Unmapped functions go to _remaining.pas."""
    monkeypatch.chdir(tmp_path)

    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    # Only map Alpha; Beta and Gamma are unmapped
    mapping = {
        str(tmp_path / 'just_alpha.pas'): ['Alpha'],
    }
    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps(mapping))

    result = run_funcsplit('categorize', str(mapping_file), str(src_file))

    assert result.returncode == 0
    remaining = tmp_path / '_remaining.pas'
    assert remaining.exists()
    content = remaining.read_text()
    assert 'Beta' in content
    assert 'Gamma' in content


def test_categorize_missing_function(tmp_path):
    """Function in mapping but not in source produces warning in stderr, not a fatal error."""
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    mapping = {
        str(tmp_path / 'group.pas'): ['Alpha', 'NonExistent'],
    }
    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps(mapping))

    result = run_funcsplit('categorize', str(mapping_file), str(src_file))

    assert result.returncode == 0
    assert 'NonExistent' in result.stderr
    # The file should still be created with Alpha
    group_file = tmp_path / 'group.pas'
    assert group_file.exists()
    assert 'Alpha' in group_file.read_text()


# ---------------------------------------------------------------------------
# Workflow edge-case tests (audit batch)
# ---------------------------------------------------------------------------


def test_extract_case_insensitive(tmp_path):
    """extract with uppercase name BETA still finds 'function Beta'."""
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    result = run_funcsplit('extract', 'BETA', str(src_file))

    assert result.returncode == 0
    assert 'hello' in result.stdout


def test_categorize_duplicate_function_in_mapping(tmp_path):
    """Foo appears in two different target files in the mapping.

    The function body should end up in the first target file encountered.
    The second target file may get it too (dict ordering) or warn — either
    way the tool must not crash.
    """
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)

    mapping = {
        str(tmp_path / 'first.pas'): ['Alpha'],
        str(tmp_path / 'second.pas'): ['Alpha'],
    }
    mapping_file = tmp_path / 'mapping.json'
    mapping_file.write_text(json.dumps(mapping))

    result = run_funcsplit('categorize', str(mapping_file), str(src_file))

    # Must not crash
    assert result.returncode == 0
    # At least one of the target files must contain Alpha
    first = tmp_path / 'first.pas'
    second = tmp_path / 'second.pas'
    first_has = first.exists() and 'Alpha' in first.read_text()
    second_has = second.exists() and 'Alpha' in second.read_text()
    assert first_has or second_has


def test_split_file_contents(tmp_path):
    """After splitting, verify the CONTENT of individual files — not just existence.

    Alpha.pas must contain the full function body including signature and end.
    """
    src_file = tmp_path / 'sample.pas'
    src_file.write_text(SAMPLE_SOURCE)
    out_dir = tmp_path / 'output'

    result = run_funcsplit('split', str(out_dir), str(src_file))

    assert result.returncode == 0

    alpha_content = (out_dir / 'Alpha.pas').read_text()
    assert 'function Alpha' in alpha_content
    assert 'result := 1' in alpha_content
    assert 'end;' in alpha_content

    beta_content = (out_dir / 'Beta.pas').read_text()
    assert 'function Beta' in beta_content
    assert "'hello'" in beta_content
    assert 'end;' in beta_content

    gamma_content = (out_dir / 'Gamma.pas').read_text()
    assert 'procedure Gamma' in gamma_content
    assert 'DoStuff' in gamma_content
    assert 'end;' in gamma_content


def test_list_with_no_functions(tmp_path):
    """Source file with only global code and no functions.

    list should produce empty output (no signatures to print).
    """
    src_file = tmp_path / 'globals_only.pas'
    src_file.write_text("Var\n  GFlag: Boolean;\n\nStartScript;\n")

    result = run_funcsplit('list', str(src_file))

    assert result.returncode == 0
    # No function signatures in output
    lines = [line for line in result.stdout.splitlines() if line.strip()]
    assert len(lines) == 0
