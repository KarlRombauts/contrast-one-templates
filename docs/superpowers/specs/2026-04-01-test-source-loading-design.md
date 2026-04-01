# Test Source Loading: Eliminate Hardcoded Functions in Pascal Tests

## Problem

The Pascal test suite (`src/tests/pascal/tests/`) embeds business logic functions as string constants (e.g. `PURE_UTILS_SOURCE`, `FIBROID_SOURCE`). This means every function exists in two places: the source file and the test file. When a source function changes, the test copy is stale and must be manually updated.

Some test copies also silently fix source bugs (missing semicolons) and adapt PascalScript-incompatible syntax, creating hidden divergence.

## Design

### Part 1: Fix source files for PascalScript compatibility

Make `Scripts/shared/` source files work in both Delphi and PascalScript:

- **Type `Sender` parameters** — Change ~28 `procedure Foo(Sender)` to `procedure Foo(Sender: TObject)` across all shared files. Standard Delphi, no behavior change.
- **Fix `InitCaps`** (`utils/formatting.pas`) — Replace `result[1] := chr(...)` with a local-variable approach that works in both runtimes.
- **Fix missing semicolons** — Scattered syntax bugs in `eddHandling.pas`, `fibroids.pas`, etc.
- **Wire up `Format()`** — `PSRegistration.pas` has `Format_P` implemented but never registered. Add compile-time (`AddDelphiFunction`) and runtime (`RegisterDelphiFunction`) registration.

### Part 2: Tests load source files at runtime

Replace embedded string constants with runtime file loading:

- Add a helper function that reads a `.pas` file and strips GPP preprocessor directives (`#include`, `#ifndef`, `#define`, `#endif`), returning clean PascalScript source.
- Each test's `SetUp` loads the specific source files it needs via this helper, concatenates them, and passes the result to `CompileScript`.
- Paths are relative to the test runner working directory, pointing at `Scripts/shared/`.

**Test files affected:**
| Test | Currently embeds | Will load from |
|------|-----------------|----------------|
| TestPureUtils | `PURE_UTILS_SOURCE` | `utils/strUtils.pas`, `utils/formatting.pas`, `utils/articles.pas`, `utils/formUtils.pas` |
| TestGestationalAge | `GESTATIONAL_AGE_SOURCE` | `obstetric/gestationalAge.pas` |
| TestClinicalHistory | `CLINICAL_HISTORY_SOURCE` | `obstetric/clinicalHistory.pas`, `utils/formatting.pas` |
| TestEDDHandling | `EDD_HANDLING_SOURCE` | `obstetric/eddHandling.pas`, `obstetric/gestationalAge.pas` |
| TestFibroids | `FIBROID_SOURCE` | `gynae/fibroids.pas`, `gynae/fibroidUI.pas`, `utils/formatting.pas` |

**What stays as inline strings:** Test scaffolding — control variable declarations, setup/teardown procedures, `Check_*` wrapper functions. These are test-specific, not duplicated business logic.

### Part 3: What doesn't change

- **TestStubControls.pas** — Tests stub infrastructure, not business logic. Stays inline.
- **Test architecture** — `ScriptHost` + `CompileScript` + `CallFunctionByName` pattern unchanged.
- **Test coverage scope** — Same functions tested as today. Currently-skipped functions remain untested.
