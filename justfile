# Contrast One build system
# Usage: just <command>

scripts_dir := "Scripts"
tools_dir := scripts_dir / "tools"
build_dir := scripts_dir / "build"
venv_python := ".venv/bin/python3"

# List available commands
default:
    @just --list

# Build all migrated exams via GPP
build:
    bash {{tools_dir}}/build.sh

# Build a single exam (e.g., just build-exam earlyT1Singleton)
build-exam exam:
    mkdir -p {{build_dir}}
    cd {{scripts_dir}} && gpp -I. -o build/{{exam}}.pas {{exam}}/script.pas

# Run the full test suite
test:
    cd {{tools_dir}} && {{venv_python}} -m pytest tests/ -v

# Run only parser unit tests
test-parser:
    cd {{tools_dir}} && {{venv_python}} -m pytest tests/test_funcsplit_parser.py -v

# Run only integration tests
test-integration:
    cd {{tools_dir}} && {{venv_python}} -m pytest tests/test_integration.py -v

# Run only regression tests (compare built output against originals)
test-regression:
    cd {{tools_dir}} && {{venv_python}} -m pytest tests/test_regression.py -v

# List functions in an exam script (e.g., just list-functions earlyT1Singleton)
list-functions exam:
    cd {{tools_dir}} && {{venv_python}} funcsplit.py list ../{{exam}}/script.pas

# Extract a single function from an exam (e.g., just extract-function earlyT1Singleton StrToFloatDef)
extract-function exam name:
    cd {{tools_dir}} && {{venv_python}} funcsplit.py extract {{name}} ../{{exam}}/script.pas

# Reverse-sync an app export against source files (e.g., just reverse-sync earlyT1Singleton /path/to/export.pas)
reverse-sync exam export_path:
    cd {{tools_dir}} && {{venv_python}} reversesync.py ../{{exam}}/mapping.json {{export_path}}

# Build and verify: build all exams then run regression tests
verify: build test-regression

# Set up the Python virtual environment
setup:
    cd {{tools_dir}} && python3 -m venv .venv && .venv/bin/pip install pytest

# Show function counts for all exam scripts (original vs built if available)
stats:
    #!/usr/bin/env bash
    cd "{{tools_dir}}"
    printf "%-20s %-12s %s\n" "Exam" "Original" "Built"
    printf "%-20s %-12s %s\n" "----" "--------" "-----"
    for exam in earlyT1Singleton 20week gynae pe12week t3Singleton t3twins; do
        orig_count="-"
        if [ -f "../originals/${exam}.pas" ]; then
            orig_count=$({{venv_python}} -c "
    from pascal_parser import parse; from pathlib import Path
    print(len(parse(Path('../originals/${exam}.pas').read_text()).functions))")
        fi
        built_count="-"
        if [ -f "../build/${exam}.pas" ]; then
            built_count=$({{venv_python}} -c "
    from pascal_parser import parse; from pathlib import Path
    print(len(parse(Path('../build/${exam}.pas').read_text()).functions))")
        fi
        printf "%-20s %-12s %s\n" "$exam" "$orig_count" "$built_count"
    done

# Clean build artifacts
clean:
    rm -rf {{build_dir}}
