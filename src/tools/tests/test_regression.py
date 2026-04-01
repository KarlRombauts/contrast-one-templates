"""Regression tests: verify migrated exams match their originals.

For each migrated exam, builds via GPP and compares the function names
against the original monolithic script to ensure nothing was lost.
"""

import subprocess
import sys
from pathlib import Path

import pytest

TOOLS_DIR = Path(__file__).parent.parent
SCRIPTS_DIR = TOOLS_DIR.parent
ORIGINALS_DIR = SCRIPTS_DIR / 'originals'

sys.path.insert(0, str(TOOLS_DIR))
from pascal_parser import parse


def get_function_names(source: str) -> set:
    """Extract lowercase function names from Pascal source."""
    result = parse(source)
    return {f.name.lower() for f in result.functions}


def build_exam(exam: str) -> str:
    """Build an exam via GPP and return the output content."""
    input_file = SCRIPTS_DIR / exam / 'script.pas'
    if not input_file.exists():
        pytest.skip(f'{exam}/script.pas not found (not yet migrated)')

    # Check if the script has #include directives (i.e., it's been migrated)
    content = input_file.read_text()
    if '#include' not in content:
        pytest.skip(f'{exam} not yet migrated to modular format')

    output_file = SCRIPTS_DIR / 'build' / f'{exam}.pas'
    output_file.parent.mkdir(parents=True, exist_ok=True)

    result = subprocess.run(
        ['gpp', '-I.', '-o', str(output_file), str(input_file)],
        cwd=str(SCRIPTS_DIR),
        capture_output=True, text=True,
    )
    assert result.returncode == 0, f'GPP failed: {result.stderr}'
    return output_file.read_text()


MIGRATED_EXAMS = [
    'earlyT1Singleton',
    '20week',
    'gynae',
    'pe12week',
    't3Singleton',
    't3twins',
]


@pytest.mark.parametrize('exam', MIGRATED_EXAMS)
def test_migrated_exam_has_all_functions(exam):
    """Verify GPP-built output contains every function from the original."""
    original_file = ORIGINALS_DIR / f'{exam}.pas'
    if not original_file.exists():
        pytest.skip(f'No original for {exam}')

    original_names = get_function_names(original_file.read_text())

    built_source = build_exam(exam)
    built_names = get_function_names(built_source)

    missing = original_names - built_names
    assert not missing, f'Functions missing from built output: {missing}'


def get_shared_function_names() -> set:
    """Collect all function names defined in shared/ files (not variants)."""
    shared_dir = SCRIPTS_DIR / 'shared'
    names = set()
    for f in shared_dir.rglob('*.pas'):
        if 'variants' in str(f):
            continue
        text = f.read_text()
        lines = text.split('\n')
        clean = [l for l in lines if not l.strip().startswith('#')]
        result = parse('\n'.join(clean))
        for fn in result.functions:
            names.add(fn.name.lower())
    return names


@pytest.mark.parametrize('exam', MIGRATED_EXAMS)
def test_migrated_exam_has_no_extra_functions(exam):
    """Verify GPP-built output doesn't introduce unexpected functions.

    Extra functions from shared library files are tolerated because shared
    files bundle related functions together and some exams may not use every
    function in a shared file.  Only truly unexpected extras (not from any
    shared file) are flagged as failures.
    """
    original_file = ORIGINALS_DIR / f'{exam}.pas'
    if not original_file.exists():
        pytest.skip(f'No original for {exam}')

    original_names = get_function_names(original_file.read_text())

    built_source = build_exam(exam)
    built_names = get_function_names(built_source)

    extra = built_names - original_names
    shared_names = get_shared_function_names()
    unexpected = extra - shared_names
    assert not unexpected, (
        f'Unexpected extra functions in built output: {unexpected}'
        f'\n(Also has {len(extra - unexpected)} tolerated extras from shared files)'
    )
