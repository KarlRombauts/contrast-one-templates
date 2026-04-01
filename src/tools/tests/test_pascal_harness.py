"""Bridge to run PascalScript test harness from pytest."""

import subprocess
from pathlib import Path


PASCAL_TEST_DIR = Path(__file__).resolve().parent.parent.parent / "tests" / "pascal"


def test_pascal_harness():
    """Run the PascalScript unit tests via the compiled FPC test runner."""
    runner = PASCAL_TEST_DIR / "TestRunner"
    if not runner.exists():
        # Try building first
        result = subprocess.run(
            ["make", "build"],
            cwd=str(PASCAL_TEST_DIR),
            capture_output=True,
            text=True,
        )
        if result.returncode != 0:
            raise RuntimeError(
                f"Failed to build Pascal test runner:\n{result.stderr}"
            )

    result = subprocess.run(
        [str(runner), "--all", "--format=plain"],
        cwd=str(PASCAL_TEST_DIR),
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Pascal tests failed:\n{result.stdout}\n{result.stderr}"
