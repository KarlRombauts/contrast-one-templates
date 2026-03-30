# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Contrast One is a medical ultrasound reporting system for obstetric and gynecological imaging. It generates clinical reports for pregnancy and gynecology ultrasound examinations. The application is built in **Object Pascal (Delphi)** using **DevExpress UI components**, with **Python** scripts for build tooling.

## Build System

The project uses **GPP** (Generic PreProcessor) to assemble modular Pascal source files into monolithic scripts, and Python tools for parsing/splitting.

### Key Commands

```bash
# Build all exams (from anywhere)
bash Scripts/tools/build.sh

# Build a single exam (from Scripts/ directory)
cd Scripts && gpp -I. -o build/earlyT1Singleton.pas earlyT1Singleton/script.pas

# List functions in a script
cd Scripts/tools && python3 funcsplit.py list ../earlyT1Singleton/script.pas

# Extract a single function
cd Scripts/tools && python3 funcsplit.py extract StrToFloatDef ../earlyT1Singleton/script.pas

# Reverse-sync an app export against source files
cd Scripts/tools && python3 reversesync.py ../earlyT1Singleton/mapping.json exported_script.pas

# Decompose an exported binary template into its component files
./filesplit.sh <export_file> <output_directory>

# Run tests
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

### GPP Preprocessor Directives

GPP handles these directives in Pascal source files:
- `#include "path/file.pas"` — inlines file contents
- `#ifndef` / `#define` / `#endif` — include guards to prevent double-inclusion
- `#define KEY value` — macro substitution

### Legacy Tools (being replaced)

- `Scripts/builder.py` — old preprocessor (replaced by GPP)
- `Scripts/funcExtract.py` / `Scripts/getFuncDefs.py` — old function extractors (replaced by `funcsplit.py`)

## Architecture

### Template Structure

Each exam type is a self-contained template consisting of five component files:

| File | Purpose |
|------|---------|
| `script.pas` | Business logic: calculations, validation, report generation |
| `screen.dfm` | DevExpress UI form definition (layout, controls, tabs) |
| `graph.xml` | Medical reference growth charts with percentile data |
| `mappings.csv` | Maps UI controls to medical codes (LOINC, custom codes) |
| `template.rtf` | Rich text report output template |

### Directory Layout

- **`Scripts/<exam>/`** — Decomposed, editable source templates (the working copies)
- **`Exports/<exam>/`** — Decomposed templates extracted from binary exports
- **`Exports/<ExamName>`** (no extension) — Raw binary export files from the application
- **`20 Week Singleton/`** — Working development files for the 20-week scan
- **`Duplicates/`** — Archived/backup versions

### Exam Types

| Directory slug | Exam |
|---|---|
| `20week` | 20-week singleton pregnancy scan |
| `earlyT1Singleton` | Early first trimester dating scan |
| `gynae` | Gynecological (non-pregnant) imaging |
| `pe12week` | 12-week scan with pre-eclampsia screening |
| `t3Singleton` | Third trimester singleton |
| `t3twins` | Third trimester twins |

### Code Patterns in script.pas Files

- UI controls use DevExpress naming: `TcxLabel`, `TcxCheckBox`, `TcxComboBox`, `TcxPageControl`
- Pascal `BEGIN`/`END` blocks track nesting (important for funcExtract.py parsing)
- `TRY`/`EXCEPT` and `CASE`/`END` count as block-level constructs
- Global warning flags (e.g., `GLiquorWarning`, `GPlacentaWarning`) control report sections
- Common utility functions (`StrToFloatDef`, `StrToIntDef`, `InitCaps`, `GetIndefinateArticle`) are duplicated across exam scripts

### Mappings Format (mappings.csv)

Maps medical codes to UI control names with optional unit conversions:
- `11820-8=edtBPD` — LOINC code to control, with mm-to-cm conversion
- `99003-1=deSelectedEDD` — Custom code to date control
- `P125005|C11820-8` — Calculated/reference fields
