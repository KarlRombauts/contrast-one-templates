# GPP Migration & Codebase Cleanup Design

## Problem

The 6 exam scripts share ~60-70% of their code (utility functions, obstetric calculations, fibroid logic, etc.) via copy-paste duplication. The largest script (`gynae`) is 6,822 lines. A custom Python preprocessor (`builder.py`) exists but lacks conditionals, error reporting, circular-include detection, and source tracking. Other developers edit scripts inside the application's built-in editor, making reverse-sync from compiled output back to source files a requirement.

## Contrast One Host API Reference

The scripts run inside an embedded scripting engine in the Contrast One application, not the Delphi compiler. This engine provides its own API surface that is not standard Pascal/Delphi. Tools like `funcsplit.py` must treat these as known externals, not undefined references.

### Host-Provided Function

| Function | Signature | Purpose |
|---|---|---|
| `GetGraphPercentile` | `(graphString: String, gestation: Real, value: Real): Real` | Looks up a percentile from XML growth chart data. Returns a fraction (multiply by 100 for %). 46 calls across 20week, t3Singleton, t3twins. |
| `GetOriginalDating` | `(param: String): unknown` | Currently commented out in 4 scripts. May be deprecated or unused. |

### Host-Provided Controls (not declared in scripts)

| Control | Type | Purpose |
|---|---|---|
| `lbMergeDataMergeFields` | ListBox | Passes key=value pairs to the report template engine |
| `lbMergeDataMergeOrder` | ListBox | Specifies report section ordering |
| `deExamDate` | DateEdit | Pre-populated with the examination date |
| `mmoGraphData` | Memo | Contains XML graph/percentile chart data |
| `cxGraphData` | Memo | Working buffer for parsing graph XML |

### Non-Standard Control Properties (Contrast One extensions to DevExpress)

| Property | Description | Usage |
|---|---|---|
| `.ShortDescription[i]` | Short text label for item `i` in a checked combo box | 17 uses across all 6 scripts |
| `.States[i]` | Get/set checked state (0 or 1) of item `i` in a checked combo box | 109 uses across all 6 scripts |
| `.Selection` | Selected index of a combo box (alternative to `.ItemIndex`) | 319 uses in gynae |
| `.HideTabs` | Boolean — hides tab headers on a page control | earlyT1Singleton, pe12week |

### Host Scripting Engine Conventions

**String-based event binding** — event handlers are assigned as string literals, not procedure references. This is unique to the Contrast One scripting engine:
```pascal
cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';
edtBPD.Properties.OnChange := 'getBiometryPercentiles';
```

**Host-provided global variable** — `GWarning` is a Boolean used in `InitializeScreen` in 4 scripts but never declared in any script's `Var` section. It is injected by the host.

**Required entry points** — the host calls these procedures in every script:
- `StartScript` — binds event handlers on form load
- `InitializeScreen` — sets initial control states
- `ProduceMergeFieldData` — generates report data as key=value pairs into `lbMergeDataMergeFields`
- `ProduceMergeOrder` — specifies report section ordering into `lbMergeDataMergeOrder`
- `CheckFormComplete` — validates form before report generation (returns Boolean)

**Report template merge field system:**
- Data: `lbMergeDataMergeFields.Items.Add('FieldName=''value''')`  (single-quote delimiters in obstetric scripts, double-quote in gynae)
- Sections: `lbMergeDataMergeOrder.Items.Add('SectionName')` with `<BR>` for line breaks
- Inline formatting: `#|#+BOLD...#/#` (bold), `#|#+UNDE...#/#` (underline), `#|#+SUPS...#/#` (superscript)
- `##` — placeholder marker for missing/unfilled data

## Solution

Replace `builder.py` with GPP (Generic PreProcessor), extract shared code into a domain-grouped library, split exam-specific code into clinical domain modules, and build a reverse-sync tool for round-tripping changes from compiled output back to source files.

## Directory Structure

```
Scripts/
  shared/
    utils/
      strUtils.pas          # StrToFloatDef, StrToIntDef, StringReplace, StringReplaceAll
      formatting.pas        # InitCaps, IncludeComma, AddFullStop, PadDecimalPlaces, GetNumberString
      dateUtils.pas         # GetFullDateString
      articles.pas          # GetIndefinateArticle, GetValueSuffix
      formUtils.pas         # CheckFormComplete, AddToResult, cbToggleCheckOnClick
    obstetric/
      eddHandling.pas       # EDD controls, PopulateEDDControls, deStatedEDDOnChange
      gestationalAge.pas    # GetWeeksFromDueDate, GetDaysFromDueDate, GetGestWeeks, GetGestDays
      biometry.pas          # getBiometryPercentiles, GetPerGraph, GetGraphXValue
      anatomy.pas           # GetAnatomy, SetAbnormalCheckes, anatomy warnings
      placenta.pas          # GetPlacenta, GetPlacenta1Measure, cord insertion
      liquor.pas            # GetLiquor5Centile, GetLiquor95Centile
      doppler.pas           # UAPI, MCAPI, CPR, MoM ranges
      clinicalHistory.pas   # GetClinicalHistory, GetClinicalIndicators, GetObstetricHistory
    gynae/
      fibroids.pas          # GetSingleFibroid, GetFibroidDimensions, GetFibroidString, counts
      fibroidUI.pas         # spFibroidCountOnChange, cbFibroidsVisualisedOnClick
  earlyT1Singleton/
    script.pas              # Entry point (~50 lines): imports, globals, StartScript, InitializeScreen
    report.pas              # Findings, conclusions, merge fields (~200 lines)
    nips.pas                # NIPS screening logic (~50 lines)
    embryo.pas              # Embryo/pregnancy assessment (~150 lines)
    uiHandlers.pas          # Click/change event handlers (~150 lines)
    mapping.json            # Function-to-file mapping (used by funcsplit and reversesync)

  20week/
    script.pas
    report.pas
    ... (exam-specific modules, similar pattern)

  gynae/
    script.pas
    report.pas
    ...

  pe12week/
    script.pas
    report.pas
    ...

  t3Singleton/
    script.pas
    report.pas
    ...

  t3twins/
    script.pas
    report.pas
    ...

  build/                    # GPP output directory (gitignored)
    earlyT1Singleton.pas
    20week.pas
    gynae.pas
    pe12week.pas
    t3Singleton.pas
    t3twins.pas

  tools/
    funcsplit.py            # Pascal function parser and extractor
    reversesync.py          # Diff modified export back to source files using function extraction + mapping
    build.sh                # Builds all exams via GPP
```

## GPP Setup

Install: `brew install gpp`

GPP replaces `builder.py` with battle-tested equivalents:

| builder.py | GPP |
|---|---|
| `#include "file"` | `#include "file"` (native) |
| `#import "file"` (deduplicated) | `#include "file"` with `#ifndef`/`#define` include guards |
| `#define KEY value` / `{{KEY}}` | `#define KEY value` / `KEY` (native) |

### Include Guards

Each shared file uses an include guard to prevent double-inclusion (replacing the `#import` dedup behaviour):

```pascal
#ifndef __SHARED_UTILS_STRUTILS
#define __SHARED_UTILS_STRUTILS

function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  // ...
end;

#endif
```

### Build Command

All GPP commands run from the `Scripts/` directory so relative `#include` paths resolve correctly. Output is clean Pascal with no preprocessor artifacts.

```bash
# Single exam
cd Scripts
gpp -o build/earlyT1Singleton.pas earlyT1Singleton/script.pas

# All exams (via build.sh)
for exam in earlyT1Singleton 20week gynae pe12week t3Singleton t3twins; do
  gpp -o "build/${exam}.pas" "${exam}/script.pas"
done
```

## Exam Entry Point Structure

Each exam's `script.pas` is a thin file that imports shared modules and its own domain files:

```pascal
// -- earlyT1Singleton/script.pas --

// Shared utilities
#include "shared/utils/strUtils.pas"
#include "shared/utils/formatting.pas"
#include "shared/utils/dateUtils.pas"
#include "shared/utils/articles.pas"
#include "shared/utils/formUtils.pas"

// Shared obstetric
#include "shared/obstetric/eddHandling.pas"
#include "shared/obstetric/gestationalAge.pas"
#include "shared/obstetric/clinicalHistory.pas"

// Shared gynae
#include "shared/gynae/fibroids.pas"
#include "shared/gynae/fibroidUI.pas"

// Exam-specific modules
#include "report.pas"
#include "nips.pas"
#include "embryo.pas"
#include "uiHandlers.pas"

// Globals
Var
  GLiquorWarning, GPlacentaWarning : Boolean;

// Entry points
procedure InitializeScreen;
begin
  // ...
end;

procedure StartScript;
begin
  InitializeScreen;
end;
```

## Tool 1: funcsplit.py

A proper recursive-descent Pascal parser that extracts functions and procedures from monolithic scripts. Used for the initial migration and ongoing maintenance.

### Improvements Over funcExtract.py

- **Proper parsing**: Handles `BEGIN`/`END`/`TRY`/`CASE` keywords inside string literals and comments without false matches
- **String awareness**: Tracks single-quoted Pascal strings so `'END'` doesn't decrement block depth
- **Comment awareness**: Skips `//` line comments and `{ }` / `(* *)` block comments
- **Nested function support**: Handles nested procedures/functions correctly
- **Output modes**:
  - `--list`: Print function signatures only (replaces getFuncDefs.py)
  - `--extract <name>`: Extract a single function body to stdout
  - `--split <output_dir>`: Split all functions into individual files
  - `--categorize <mapping.json>`: Split functions into grouped files based on a mapping

### Categorize Mode

For the initial migration, a JSON mapping file defines which functions go where:

```json
{
  "shared/utils/strUtils.pas": ["StrToFloatDef", "StrToIntDef", "StringReplace", "StringReplaceAll"],
  "shared/utils/formatting.pas": ["InitCaps", "IncludeComma", "AddFullStop", "PadDecimalPlaces"],
  "report.pas": ["GetFindings", "GetConclusion", "ProduceMergeFieldData", "ProduceMergeOrder"],
  "uiHandlers.pas": ["cbYolkSacYes1OnClick", "cbYolkSacNo1OnClick"]
}
```

Running `funcsplit.py --categorize mapping.json earlyT1Singleton/script.pas` writes each group to its target file. Functions not in the mapping go to a `_remaining.pas` file for manual triage.

## Tool 2: reversesync.py

Uses `funcsplit.py`'s parser and the mapping JSON to extract functions from a modified export, map them back to their source files, and present per-file diffs for review. No reliance on comments or markers in the compiled output — the mapping JSON is the single source of truth.

### Workflow

```
1. Developer A builds:        gpp -o build/exam.pas exam/script.pas
2. Compiled output imported into application
3. Developer B edits in application's script editor
4. Export from application, `Scripts/tools/filesplit.sh` to get modified script
5. Reverse-sync:              reversesync.py mapping.json modified_exam.pas
6. Developer A reviews per-file diffs and manually applies changes
```

### How It Works

1. Parse the modified export using `funcsplit.py`'s parser to extract all function/procedure bodies
2. For each extracted function, look up its source file in the mapping JSON
3. Read the current version of that function from its source file
4. Diff the two versions (using Python `difflib`)
5. Present a per-source-file diff showing what changed

### Output Format

```
=== shared/utils/strUtils.pas ===
No changes.

=== report.pas ===
--- source: GetFindings
+++ modified: GetFindings
@@ -3,3 +3,4 @@
   result := 'Normal anatomy';
+  result := result + ' with normal growth';
   end;

Accept changes to report.pas? [y/n/d(iff)]
```

### Edge Cases

- **Renamed functions**: Functions in the export not found in the mapping are flagged as "unplaced" — may be new functions or renames that need manual assignment
- **New functions**: Reported separately with their full body so you can decide which source file to add them to (and update the mapping JSON)
- **Deleted functions**: Functions in the mapping but missing from the export are flagged as "removed in app"
- **Whitespace/encoding differences**: Normalize before diffing (the app's export pipeline strips non-ASCII and control characters via `filesplit.sh`)
- **Non-function code changes**: Global variables or code outside any function is diffed separately and reported as "globals/preamble changes"

## Migration Plan

### Phase 1: Tooling (earlyT1Singleton pilot)

1. Install GPP (`brew install gpp`)
2. Verify GPP works on a trivial Pascal file with `#include` and `#ifndef`/`#define` guards — confirm clean output with no leftover preprocessor directives
3. Build `funcsplit.py` with proper Pascal parsing
4. Test `funcsplit.py` against `earlyT1Singleton/script.pas` — verify it correctly identifies all 91 functions
5. Validate output matches `getFuncDefs.py` output (regression check)

### Phase 2: funcsplit.py Tests

Build tests alongside the tool. Tests use pytest. Unit tests use inline Pascal snippets.

#### Directory Structure

```
Scripts/
  tools/
    tests/
      conftest.py                     # Shared pytest fixtures and helpers
      test_funcsplit_parser.py        # Unit: Pascal parser edge cases
      test_funcsplit_modes.py         # Unit: --list, --extract, --split, --categorize
      test_reversesync.py             # Unit: diffing, mapping lookup, edge cases (Phase 4)
      test_integration.py             # Integration: full pipeline end-to-end (Phase 5)
      fixtures/
        integration/
          sample_shared/              # Minimal shared library for integration tests
            utils/
              strUtils.pas
              formatting.pas
          sample_exam/
            script.pas                # Entry point with #includes
            report.pas
            uiHandlers.pas
          mapping.json                # Mapping for the sample exam
          simulated_edit.pas          # Modified export simulating app edits
```

#### Unit Tests: funcsplit.py Parser (`test_funcsplit_parser.py`)

Inline Pascal snippets testing edge cases:

| Test | Input | Verifies |
|---|---|---|
| `test_simple_function` | Basic function with BEGIN/END | Correctly extracts name, body, line range |
| `test_simple_procedure` | Basic procedure | Handles both function and procedure keywords |
| `test_nested_begin_end` | Function with nested BEGIN/END blocks | Block depth tracked correctly, doesn't exit early |
| `test_nested_try_except` | TRY/EXCEPT/END inside function | TRY counted as block opener |
| `test_nested_case` | CASE/END inside function | CASE counted as block opener |
| `test_string_containing_begin` | `result := 'BEGIN something';` | Keywords inside string literals are ignored |
| `test_string_containing_end` | `result := 'END';` | END inside string literal doesn't decrement depth |
| `test_escaped_quotes` | `result := 'it''s';` | Pascal escaped quotes (doubled single-quote) handled |
| `test_line_comment` | `// END; BEGIN;` | Keywords in line comments are ignored |
| `test_block_comment_braces` | `{ END; BEGIN; }` | Keywords in `{ }` block comments are ignored |
| `test_block_comment_parens` | `(* END; BEGIN; *)` | Keywords in `(* *)` block comments are ignored |
| `test_nested_function` | Procedure containing a local function | Inner function's BEGIN/END don't close outer |
| `test_multiple_functions` | Two functions back-to-back | Both extracted correctly with correct boundaries |
| `test_function_with_var_block` | Function with VAR declarations before BEGIN | VAR section included in function body |
| `test_empty_function` | Function with only BEGIN/END | Handles minimal function body |
| `test_mixed_case_keywords` | `Begin`, `END`, `end;` | Case-insensitive keyword matching |
| `test_global_var_section` | VAR block before any function | Extracted as preamble, not part of a function |
| `test_semicolon_variations` | `end;` vs `end` at final function | Handles both with/without trailing semicolon |

#### Unit Tests: funcsplit.py Modes (`test_funcsplit_modes.py`)

| Test | Verifies |
|---|---|
| `test_list_mode` | `--list` prints all function signatures |
| `test_extract_single` | `--extract FuncName` outputs one function body |
| `test_extract_nonexistent` | `--extract Missing` exits with error |
| `test_split_creates_files` | `--split outdir` creates one file per function |
| `test_categorize_creates_grouped_files` | `--categorize mapping.json` writes functions to mapped files |
| `test_categorize_remaining` | Unmapped functions go to `_remaining.pas` |
| `test_categorize_missing_function` | Function in mapping but not in source is warned, not fatal |

### Phase 3: Extract & Split (earlyT1Singleton)

1. Create `shared/` directory structure
2. Create the function-to-file mapping JSON at `earlyT1Singleton/mapping.json`
3. Run `funcsplit.py --categorize` to extract shared functions into `shared/` files
4. Add include guards to each shared file
5. Create earlyT1Singleton's modular entry point (`script.pas` + `report.pas`, `nips.pas`, `embryo.pas`, `uiHandlers.pas`)
6. Build with GPP: `gpp -o build/earlyT1Singleton.pas earlyT1Singleton/script.pas`
7. Diff GPP output against original monolithic script — must be functionally identical

### Phase 4: Reverse-Sync Tool + Tests

1. Build `reversesync.py`
2. Write `test_reversesync.py` unit tests:

| Test | Verifies |
|---|---|
| `test_no_changes` | Identical function bodies produce no diff |
| `test_modified_function` | Changed function body detected and attributed to correct source file |
| `test_new_function` | Function in export but not in mapping flagged as "unplaced" |
| `test_deleted_function` | Function in mapping but missing from export flagged as "removed" |
| `test_multiple_changes_same_file` | Two functions in the same source file both changed — grouped in output |
| `test_changes_across_files` | Changes in shared and exam-specific files reported separately |
| `test_globals_changed` | Non-function code (VAR block, preamble) changes detected |
| `test_whitespace_normalization` | Trailing whitespace / blank line differences ignored |
| `test_encoding_normalization` | Non-ASCII stripped before diffing (matches filesplit.sh behaviour) |

3. All unit tests must pass before proceeding

### Phase 5: Integration Tests + Round-Trip Validation

1. Create test fixture files in `tests/fixtures/integration/`
2. Write `test_integration.py`:

| Test | Steps | Verifies |
|---|---|---|
| `test_gpp_build` | Build fixture exam with GPP | Output contains all included functions, no preprocessor directives remain |
| `test_gpp_include_guards` | Build with a shared file included twice | Function only appears once in output |
| `test_build_then_split` | Build, then funcsplit the output | Round-trip: extracted functions match originals |
| `test_build_then_reversesync_no_changes` | Build, reverse-sync against same output | No diffs reported |
| `test_build_then_reversesync_with_edits` | Build, reverse-sync against `simulated_edit.pas` | Correct diffs attributed to correct source files |
| `test_full_roundtrip` | Build -> simulate edit -> reverse-sync -> apply changes -> rebuild -> verify | Full pipeline produces expected output |
| `test_new_function_in_export` | Simulated edit adds a new function | Flagged as unplaced, not silently dropped |
| `test_deleted_function_in_export` | Simulated edit removes a function | Flagged as removed |

3. All integration tests must pass
4. Manual round-trip validation: import GPP-built output into the application, verify the exam works, export, run `filesplit.sh`, run reverse-sync — should show no meaningful diffs (only whitespace/encoding)
5. If unexpected diffs appear, adjust normalization in reversesync.py and update tests

### Phase 6: Migrate Remaining Exams

One at a time, in order of size (smallest first):
1. `pe12week` (2,094 lines)
2. `20week` (2,542 lines)
3. `t3Singleton` (2,445 lines)
4. `t3twins` (3,119 lines)
5. `gynae` (6,822 lines)

For each: create exam-specific mapping JSON, run `funcsplit.py --categorize`, build entry point, verify GPP output matches original. Run full test suite after each migration.

The shared files grow incrementally — each new exam may contribute functions that weren't shared before (functions appearing in 2+ exams get promoted to shared).

### Phase 7: Cleanup

1. Create `build.sh` to build all exams
2. Remove `builder.py`, `funcExtract.py`, `getFuncDefs.py` (replaced by GPP and funcsplit.py)
3. Remove shell helper scripts (`getDuplicateFuncDefs.sh`, `getFuncCounts.sh`, `getStrictDuplicateFuncDefs.sh`)
4. Remove `allFuncDefs.pas`, `allFullFuncDefs.pas`, `out.pas` (generated artifacts)
5. Add `build/` to `.gitignore`
6. Update CLAUDE.md with new build commands

## Running Tests

```bash
cd Scripts/tools
pip install pytest
pytest                          # run all tests
pytest test_funcsplit_parser.py  # parser unit tests only
pytest test_integration.py      # integration tests only
pytest -v                       # verbose output
pytest -x                       # stop on first failure
```
