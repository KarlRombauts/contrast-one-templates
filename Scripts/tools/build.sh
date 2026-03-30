#!/bin/bash
# Build all exam scripts using GPP.
# Run from anywhere — resolves paths relative to this script.

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
    gpp -I. -o "$output" "$input"
    echo "  -> $output"
done

echo "Done."
