"""Integration tests for the full GPP -> funcsplit -> reversesync pipeline."""

import shutil
import subprocess
import sys
from pathlib import Path

import pytest

TOOLS_DIR = Path(__file__).parent.parent
FIXTURES_DIR = Path(__file__).parent / 'fixtures' / 'integration'


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

@pytest.fixture
def work_dir(tmp_path):
    """Copy integration fixtures into a tmp directory and return it."""
    shutil.copytree(FIXTURES_DIR, tmp_path / 'fixtures')
    return tmp_path / 'fixtures'


def run_gpp(work_dir, input_file, output_file):
    """Run GPP with the work_dir as the include path."""
    return subprocess.run(
        ['/opt/homebrew/bin/gpp', '-I.', '-o', str(output_file), str(input_file)],
        cwd=str(work_dir),
        capture_output=True,
        text=True,
    )


def run_funcsplit(work_dir, *args):
    """Run funcsplit.py as a subprocess inside work_dir."""
    cmd = [sys.executable, str(TOOLS_DIR / 'funcsplit.py')] + list(args)
    return subprocess.run(cmd, cwd=str(work_dir), capture_output=True, text=True)


def run_reversesync(work_dir, mapping, export):
    """Run reversesync.py as a subprocess inside work_dir."""
    cmd = [sys.executable, str(TOOLS_DIR / 'reversesync.py'), str(mapping), str(export)]
    return subprocess.run(cmd, cwd=str(work_dir), capture_output=True, text=True)


# ---------------------------------------------------------------------------
# Tests
# ---------------------------------------------------------------------------

def test_gpp_build(work_dir):
    """GPP can build sample_exam/script.pas and the output contains all functions."""
    output = work_dir / 'built.pas'
    result = run_gpp(work_dir, 'sample_exam/script.pas', output)

    assert result.returncode == 0, f"GPP failed: {result.stderr}"
    assert output.exists()

    content = output.read_text()

    # All function/procedure names should be present
    for name in ['StrToFloatDef', 'AddFullStop', 'GetFindings', 'cbOptionOnClick', 'StartScript']:
        assert name in content, f"Expected '{name}' in GPP output"

    # No preprocessor directives should remain
    for directive in ['#include', '#ifndef', '#define', '#endif']:
        assert directive not in content, f"GPP output still contains '{directive}'"


def test_gpp_include_guards(work_dir):
    """Including strUtils.pas twice still produces StrToFloatDef exactly once."""
    double_include = work_dir / 'double_include.pas'
    double_include.write_text(
        '#include "sample_shared/utils/strUtils.pas"\n'
        '#include "sample_shared/utils/strUtils.pas"\n'
    )

    output = work_dir / 'double_built.pas'
    result = run_gpp(work_dir, 'double_include.pas', output)

    assert result.returncode == 0, f"GPP failed: {result.stderr}"
    content = output.read_text()
    assert content.count('StrToFloatDef') == 1, (
        f"Expected StrToFloatDef exactly once, found {content.count('StrToFloatDef')} times"
    )


def test_build_then_split(work_dir):
    """After GPP build, funcsplit list shows all 7 function names."""
    output = work_dir / 'built.pas'
    gpp_result = run_gpp(work_dir, 'sample_exam/script.pas', output)
    assert gpp_result.returncode == 0, f"GPP failed: {gpp_result.stderr}"

    split_result = run_funcsplit(work_dir, 'list', str(output))
    assert split_result.returncode == 0, f"funcsplit failed: {split_result.stderr}"

    listed = split_result.stdout
    for name in [
        'StrToFloatDef', 'AddFullStop', 'GetFindings',
        'ProduceMergeFieldData', 'cbOptionOnClick',
        'InitializeScreen', 'StartScript',
    ]:
        assert name in listed, f"Expected '{name}' in funcsplit list output"


def test_build_then_reversesync_no_changes(work_dir):
    """reversesync against a freshly built export detects no changes."""
    output = work_dir / 'built.pas'
    gpp_result = run_gpp(work_dir, 'sample_exam/script.pas', output)
    assert gpp_result.returncode == 0, f"GPP failed: {gpp_result.stderr}"

    sync_result = run_reversesync(work_dir, 'mapping.json', str(output))
    assert sync_result.returncode == 0, f"reversesync failed: {sync_result.stderr}"
    assert 'No changes detected' in sync_result.stdout


def test_build_then_reversesync_with_edits(work_dir):
    """reversesync against simulated_edit.pas reports the changed file and new text."""
    sync_result = run_reversesync(work_dir, 'mapping.json', 'simulated_edit.pas')
    assert sync_result.returncode == 0, f"reversesync failed: {sync_result.stderr}"

    output = sync_result.stdout
    assert 'report.pas' in output, "Expected 'report.pas' in reversesync output"
    assert 'Normal anatomy with normal growth' in output, (
        "Expected changed text in reversesync output"
    )


def test_full_roundtrip(work_dir):
    """Full roundtrip: build, detect diff, apply edit, rebuild, verify new content."""
    built = work_dir / 'built.pas'
    gpp_result = run_gpp(work_dir, 'sample_exam/script.pas', built)
    assert gpp_result.returncode == 0, f"GPP failed: {gpp_result.stderr}"

    # simulated_edit.pas should differ from the fresh build
    built_content = built.read_text()
    simulated_content = (work_dir / 'simulated_edit.pas').read_text()
    assert built_content != simulated_content, (
        "simulated_edit.pas should differ from the fresh build"
    )

    # reversesync detects the change
    sync_result = run_reversesync(work_dir, 'mapping.json', 'simulated_edit.pas')
    assert 'report.pas' in sync_result.stdout

    # Manually apply the edit: update report.pas in the source tree
    report_path = work_dir / 'sample_exam' / 'report.pas'
    report_content = report_path.read_text()
    updated_report = report_content.replace(
        "result := 'Normal anatomy';",
        "result := 'Normal anatomy with normal growth';",
    )
    report_path.write_text(updated_report)

    # Rebuild with GPP
    rebuilt = work_dir / 'rebuilt.pas'
    gpp_result2 = run_gpp(work_dir, 'sample_exam/script.pas', rebuilt)
    assert gpp_result2.returncode == 0, f"GPP rebuild failed: {gpp_result2.stderr}"

    rebuilt_content = rebuilt.read_text()
    assert 'Normal anatomy with normal growth' in rebuilt_content, (
        "Rebuilt output should contain the edited string"
    )


def test_new_function_in_export(work_dir):
    """A new function in the export that is not in the mapping is reported as UNPLACED."""
    edited = work_dir / 'with_new_func.pas'
    base = (work_dir / 'simulated_edit.pas').read_text()
    new_func = (
        '\n\nfunction BrandNew: String;\n'
        'begin\n'
        "  result := 'brand new';\n"
        'end;\n'
    )
    edited.write_text(base + new_func)

    sync_result = run_reversesync(work_dir, 'mapping.json', str(edited))
    assert sync_result.returncode == 0, f"reversesync failed: {sync_result.stderr}"

    output = sync_result.stdout
    assert 'UNPLACED' in output, "Expected 'UNPLACED' in output for new function"
    assert 'BrandNew' in output, "Expected 'BrandNew' in UNPLACED section"


def test_deleted_function_in_export(work_dir):
    """A function removed from the export but still in the mapping is reported as REMOVED."""
    # Remove cbOptionOnClick from simulated_edit.pas
    lines = (work_dir / 'simulated_edit.pas').read_text().splitlines()

    filtered = []
    skip = False
    for line in lines:
        if line.strip().startswith('procedure cbOptionOnClick'):
            skip = True
        if skip:
            if line.strip() == 'end;':
                skip = False  # consume the closing end; and stop skipping
                continue
            continue
        filtered.append(line)

    edited = work_dir / 'without_func.pas'
    edited.write_text('\n'.join(filtered) + '\n')

    sync_result = run_reversesync(work_dir, 'mapping.json', str(edited))
    assert sync_result.returncode == 0, f"reversesync failed: {sync_result.stderr}"

    output = sync_result.stdout.lower()
    assert 'removed' in output, "Expected 'REMOVED' in output for deleted function"
    assert 'cboptiononclick' in output, "Expected 'cbOptionOnClick' in REMOVED section"
