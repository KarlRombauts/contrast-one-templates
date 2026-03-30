# PascalScript Test Harness Design

## Purpose

Enable unit testing of PascalScript functions used in Contrast One ultrasound reporting templates. The harness runs the **actual Pascal source code** through an embedded PascalScript interpreter, with stub DevExpress controls, so refactoring can be validated against real test cases.

## Architecture

```
FPCUnit Console Runner
    │
    ├── Test suites (TestStrUtils, TestGestAge, TestClinHistory, ...)
    │       │
    │       ▼
    │   ScriptHost (loads & calls script functions)
    │       │
    │       ▼
    │   PascalScript Engine (compiler + runtime)
    │       │
    │       ├── Stub Controls Registry (TcxCheckBox, TcxComboBox, ...)
    │       │     └── FindComponent lookup (flat name → object dictionary)
    │       │
    │       └── GPP-built script.pas (the actual code under test)
    │
    └── Makefile (GPP prebuild → FPC compile → run)
```

### Flow

1. `Makefile` calls `gpp` to assemble monolithic `script.pas` from modular source files
2. `ScriptHost` loads the assembled script into PascalScript, compiles to bytecode
3. Stub control classes are registered with PascalScript under DevExpress type names
4. Test cases populate stub controls with known values
5. Test cases call individual script functions via `ScriptHost`
6. Assertions check return values and/or stub control state changes

## Stub Control Classes

Based on actual API usage across all script files (~21,700 property accesses), the following stubs cover the full surface:

### TStubComponent (base)

All stubs inherit from this. Provides:
- `Name: string` — component name for FindComponent resolution
- `Owner: TStubComponent` — component hierarchy
- Registration in a flat name→object dictionary for `FindComponent` lookups

### TStubTextEdit

Covers: `edtBPD`, `edtEmbroSize1`, `edtPresentComplaintOther`, `edtCRL`, etc.

| Property | Type | Access |
|----------|------|--------|
| `Text` | `string` | read/write |
| `Enabled` | `Boolean` | read/write |
| `Visible` | `Boolean` | read/write |

### TStubCheckBox

Covers: `cbEmbryo1Visualised1`, `cbYolkSacYes1`, `cbHeartMotionVisYes1`, `cbIrregularCycle`, etc.

| Property | Type | Access |
|----------|------|--------|
| `Checked` | `Boolean` | read/write |
| `Enabled` | `Boolean` | read/write |
| `Visible` | `Boolean` | read/write |
| `Parent` | `TStubComponent` | read |

### TStubComboBox

Covers: `cbEDDPrinciple`, `cbHeartMotion1`, `cbFibroidsType1`, `cbPregnancyOutcome`, etc.

| Property | Type | Access |
|----------|------|--------|
| `ItemIndex` | `Integer` | read/write |
| `Text` | `string` | read/write |
| `Enabled` | `Boolean` | read/write |
| `Properties.Items.Count` | `Integer` | read |
| `Properties.Items[i]` | `string` | read |

Note: `Properties` is an intermediate object with an `Items` sub-object to match the DevExpress nested property pattern.

### TStubCheckComboBox

Covers: `cxccbReferralIndicators`, `cbClinicalHistory`, `cxccbMensturalBleeding`, `cxccbClinicalHistory`, etc.

| Property | Type | Access |
|----------|------|--------|
| `States[i]` | `Integer` | read/write (indexed) |
| `ShortDescription[i]` | `string` | read (indexed) |
| `Properties.Items.Count` | `Integer` | read |
| `Enabled` | `Boolean` | read/write |

### TStubSpinEdit

Covers: `seHeartBPM1`, `seTransferDay`, `seNumberTransferred`, `spFibroidCount`, etc.

| Property | Type | Access |
|----------|------|--------|
| `Value` | `Integer` | read/write |
| `Enabled` | `Boolean` | read/write |
| `Visible` | `Boolean` | read/write |

### TStubDateEdit

Covers: `deExamDate`, `deLMPDate`, `deStatedEDD`, `deMenstrualEDD`, `deConceptionDate`, etc.

| Property | Type | Access |
|----------|------|--------|
| `Date` | `TDateTime` | read/write |
| `Enabled` | `Boolean` | read/write |

### TStubGroupBox

Covers: `gbEDDDating`, `gbFibroid1`..`gbFibroid10`, `cxGroupBox10`, etc.

| Property | Type | Access |
|----------|------|--------|
| `Height` | `Integer` | read/write |
| `Visible` | `Boolean` | read/write |

### TStubPageControl

Covers: `pcEDDPrinciple`, `cxpcReportMainPage`.

| Property | Type | Access |
|----------|------|--------|
| `Properties.ActivePage` | `TStubComponent` | read/write |

### TStubTabSheet

Covers: `cxtsFetus1`, `tsFibroids`, etc.

| Property | Type | Access |
|----------|------|--------|
| `TabVisible` | `Boolean` | read/write |
| `Owner` | `TStubComponent` | read |

### TStubLabel

Covers: `lblMedication`, `lblCycleDays`, etc.

| Property | Type | Access |
|----------|------|--------|
| `Caption` | `string` | read/write |
| `Visible` | `Boolean` | read/write |

## Component Registry

Scripts use `TWinControl(Owner).FindComponent('controlName' + IntToStr(i))` for dynamic component lookup (fibroids, embryo measurements). The harness provides:

- A flat `TDictionary<string, TStubComponent>` mapping control names to stub instances
- `RegisterControl(Name, StubInstance)` called during test setup
- `FindComponent(Name)` resolves against this dictionary
- Case-insensitive lookup (PascalScript is case-insensitive)

### Parent/child relationships

`cbToggleCheckOnClick` iterates `Sender.Parent.Controls[i]`. The registry supports:
- Setting `Parent` on stubs
- Parent maintains a `Controls: array of TStubComponent` list
- `ControlCount` returns the array length

## ScriptHost API

```pascal
TScriptHost = class
  // Load and compile a GPP-built script file
  function LoadScript(const FileName: string): Boolean;
  function GetCompileError: string;

  // Register stub controls (before calling script functions)
  procedure RegisterControl(const Name: string; Control: TStubComponent);

  // Call script functions/procedures
  function CallFunction(const Name: string; const Args: array of Variant): Variant;
  procedure CallProcedure(const Name: string; const Args: array of Variant);

  // Access stubs to assert side effects
  function GetControl(const Name: string): TStubComponent;
  function TextEdit(const Name: string): TStubTextEdit;
  function CheckBox(const Name: string): TStubCheckBox;
  function ComboBox(const Name: string): TStubComboBox;
  function SpinEdit(const Name: string): TStubSpinEdit;
  function DateEdit(const Name: string): TStubDateEdit;

  // Teardown
  procedure ClearControls;
end;
```

## PascalScript Registration

Two-phase registration required by PascalScript:

### Compile-time (OnUses callback)

Registers type names and function signatures so scripts compile:
- All stub classes under their `Tcx*` names (`TcxCheckBox`, `TcxComboBox`, etc.)
- Built-in functions the scripts depend on: `StrToFloat`, `StrToInt`, `IntToStr`, `Pos`, `Copy`, `Length`, `Trim`, `Format`, `FormatDateTime`, `Trunc`, `Now`, `Ord`, `Chr`, `ShowMessage`
- `TWinControl` with `FindComponent`, `ControlCount`, `Controls[i]`
- The `is` operator for type checking (`Controls[i] is TcxCheckBox`)

### Runtime (before execution)

Registers property getter/setter procedures and method implementations:
- Each property needs a read procedure and optionally a write procedure
- `FindComponent` implemented against the flat registry
- `ShowMessage` implemented as a no-op or captured to a list for assertion

## Test Structure

### Test suites by source file

| Test file | Source file | Functions covered |
|-----------|-----------|-------------------|
| `TestStrUtils.pas` | `shared/utils/strUtils.pas` | `StrToFloatDef`, `StrToIntDef`, `StringReplace`, `StringReplaceAll` |
| `TestFormatting.pas` | `shared/utils/formatting.pas` | `InitCaps`, `IncludeComma`, `AddFullStop`, `AddFullstopToEnd`, `PadDecimalPlaces`, `GetNumberString`, `RemoveDecimalPointAtEnd`, `GetIntegerMeasuredString` |
| `TestArticles.pas` | `shared/utils/articles.pas` | `GetIndefinateArticle` |
| `TestGestationalAge.pas` | `shared/obstetric/gestationalAge.pas` | `GetWeeksFromDueDate`, `GetDaysFromDueDate`, `GetWeeksFromLMPDate`, `GetDaysFromLMPDate` |
| `TestDateUtils.pas` | `shared/utils/dateUtils.pas` | `GetFullDateString` |
| `TestFormUtils.pas` | `shared/utils/formUtils.pas` | `CheckFormComplete`, `AddToResult`, `Max`, `Min`, `cbToggleCheckOnClick` |
| `TestClinicalHistory.pas` | `shared/obstetric/clinicalHistory.pas` | `GetClinicalIndicators`, `GetClinicalHistory`, `cxccbReferralIndicatorsChange` |
| `TestEDDHandling.pas` | `shared/obstetric/eddHandling.pas` | `cbEDDPrincipleOnChange`, `cbLMPDateOnChange`, `PopulateEDDControls` |

### Test patterns

**Pure function (no stubs needed):**
```pascal
procedure TTestStrUtils.TestStrToFloatDef_ValidInput;
begin
  AssertEquals(3.14, Host.CallFunction('StrToFloatDef', ['3.14', 0.0]), 0.001);
end;

procedure TTestStrUtils.TestStrToFloatDef_InvalidInput;
begin
  AssertEquals(42.0, Host.CallFunction('StrToFloatDef', ['not_a_number', 42.0]), 0.001);
end;
```

**UI-coupled function (stubs populated in test):**
```pascal
procedure TTestClinicalHistory.TestGetClinicalIndicators_TwoSelected;
var
  Combo: TStubCheckComboBox;
begin
  Combo := Host.CheckComboBox('cxccbReferralIndicators');
  Combo.SetItems(['Previous CS', 'Twins', 'Bleeding', 'Other'], [1, 0, 1, 0]);

  AssertEquals('Previous CS.  Bleeding.', Host.CallFunction('GetClinicalIndicators', []));
end;
```

**Side-effect test (asserts control state after event handler):**
```pascal
procedure TTestEDDHandling.TestCbEDDPrinciple_LMPSelected;
begin
  Host.ComboBox('cbEDDPrinciple').ItemIndex := 2;
  Host.CallProcedure('cbEDDPrincipleOnChange', [nil]);

  AssertEquals(80, Host.GroupBox('gbEDDDating').Height);
  AssertTrue(Host.Label('lblMedication').Visible);
end;
```

## Project Layout

```
Scripts/tests/pascal/
  vendor/
    pascalscript/              -- PascalScript source (git submodule)
  src/
    TestRunner.pas             -- FPCUnit console entry point
    ScriptHost.pas             -- PascalScript wrapper: load, compile, call
    StubControls.pas           -- All stub classes
    StubRegistry.pas           -- FindComponent registry + typed accessors
    PSRegistration.pas         -- Compile-time + runtime registration
  tests/
    TestStrUtils.pas
    TestFormatting.pas
    TestArticles.pas
    TestGestationalAge.pas
    TestDateUtils.pas
    TestFormUtils.pas
    TestClinicalHistory.pas
    TestEDDHandling.pas
  Makefile
```

## Build and Run

### Prerequisites

- `fpc` — Free Pascal Compiler (`brew install fpc`)
- `gpp` — Generic PreProcessor (already installed)
- PascalScript source — cloned into `vendor/`

### Makefile targets

```makefile
# Pre-build scripts with GPP
prebuild:
	cd ../../ && gpp -I. -o tests/pascal/build/earlyT1Singleton.pas earlyT1Singleton/script.pas

# Compile test runner
build: prebuild
	fpc -Fu./vendor/pascalscript/Source -Fu./src -Fu./tests -o./TestRunner src/TestRunner.pas

# Run all tests
test: build
	./TestRunner --all --format=plain

# Run a specific suite
test-suite: build
	./TestRunner --suite=$(SUITE)
```

### Integration with existing pytest

A pytest test can shell out to the Pascal test runner:
```python
def test_pascal_harness():
    result = subprocess.run(['Scripts/tests/pascal/TestRunner', '--all'], capture_output=True)
    assert result.returncode == 0
```

## Open Questions and Risks

### Untyped Sender parameters

Script event handlers use `procedure cbSomethingOnClick(Sender)` without a type annotation. PascalScript may interpret this as `Variant` or `TObject`. The registration needs to handle passing stub objects as untyped `Sender` arguments. Mitigation: test with a simple event handler first and adjust registration if needed.

### The `is` operator with stubs

`cbToggleCheckOnClick` uses `Controls[i] is TcxCheckBox`. PascalScript needs to recognise stubs registered as `TcxCheckBox` for runtime type checks. Mitigation: register stub classes under the exact DevExpress names so RTTI matches.

### Nested property objects

`cxccbReferralIndicators.Properties.Items.Count` requires intermediate objects (`Properties` with an `Items` sub-object). The stubs need small wrapper objects for the `.Properties` chain. This is straightforward but adds boilerplate to the registration code.

### PascalScript built-in function compatibility

Some functions used in scripts (`Format`, `FormatDateTime`, `Pos`, `Copy`, `Trim`, `Now`) may not be built into PascalScript by default. They may need explicit registration as wrappers around FPC's `SysUtils`/`DateUtils` equivalents. Mitigation: compile a minimal script using each function and add missing registrations incrementally.

### GetLMPWeeks/GetLMPDays use `Now`

Two functions in `gestationalAge.pas` call `Now`, making them non-deterministic. Tests for these will need either a fixed `Now` override or date-relative assertions.
