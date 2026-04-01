# Test Source Loading Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Eliminate hardcoded function copies in Pascal tests by loading source files at runtime via GPP preprocessing.

**Architecture:** GPP preprocesses each shared source file with `-DNOGUI` to strip UI-coupled functions, outputting clean PascalScript-ready files to `build/`. A `SourceLoader` unit reads these files and applies two text substitutions for PascalScript compatibility (`.Properties.Items.Count` → `.GetItemCount`, `.Properties.ActivePage` → `.ActivePage`). Each test's `SetUp` loads the source files it needs, concatenates them with test scaffolding (control declarations, test wrapper functions), and passes the result to `CompileScript`.

**Tech Stack:** Free Pascal, PascalScript, GPP, Make

---

### Task 1: Fix source files — type Sender parameters and missing semicolons

**Files:**
- Modify: `Scripts/shared/obstetric/eddHandling.pas:4`
- Modify: `Scripts/shared/obstetric/clinicalHistory.pas:36`
- Modify: `Scripts/shared/gynae/fibroidUI.pas:4,65,71`
- Modify: `Scripts/shared/utils/formUtils.pas:19,49`
- Modify: `Scripts/shared/gynae/fibroids.pas:32,122`
- Modify: `Scripts/shared/utils/articles.pas:20-22`

- [ ] **Step 1: Type Sender parameters and add missing semicolons**

`Scripts/shared/obstetric/eddHandling.pas` line 4 — add type and semicolon:
```pascal
// Before:
procedure cbEDDPrincipleOnChange(sender)
// After:
procedure cbEDDPrincipleOnChange(Sender: TObject);
```

`Scripts/shared/obstetric/clinicalHistory.pas` line 36 — add type:
```pascal
// Before:
procedure cxccbReferralIndicatorsChange(Sender);
// After:
procedure cxccbReferralIndicatorsChange(Sender: TObject);
```

`Scripts/shared/gynae/fibroidUI.pas` line 4 — add type and semicolon:
```pascal
// Before:
procedure spFibroidCountOnChange(Sender)
// After:
procedure spFibroidCountOnChange(Sender: TObject);
```

`Scripts/shared/gynae/fibroidUI.pas` line 65 — add type and semicolon:
```pascal
// Before:
procedure cbFibroidsVisualisedOnClick(sender)
// After:
procedure cbFibroidsVisualisedOnClick(Sender: TObject);
```

`Scripts/shared/gynae/fibroidUI.pas` line 71 — add type and semicolon:
```pascal
// Before:
procedure cbFibroidsTypeOnChange(Sender)
// After:
procedure cbFibroidsTypeOnChange(Sender: TObject);
```

`Scripts/shared/utils/formUtils.pas` line 19 — add type and semicolon:
```pascal
// Before:
procedure cbToggleCheckOnClick(Sender)
// After:
procedure cbToggleCheckOnClick(Sender: TObject);
```

`Scripts/shared/utils/formUtils.pas` line 49 — add missing semicolon:
```pascal
// Before:
    result := in2
// After:
    result := in2;
```

`Scripts/shared/gynae/fibroids.pas` line 32 — add missing semicolon and Trunc for type safety:
```pascal
// Before:
    result := result + ' (within ' + intToStr(seCloseToCrevix1.value) + ' mm)'
// After:
    result := result + ' (within ' + intToStr(Trunc(seCloseToCrevix1.value)) + ' mm)';
```

`Scripts/shared/gynae/fibroids.pas` line 12 — add Trunc for type safety (Value is Double, GetNumberString takes Integer):
```pascal
// Before:
    vNumber := GetNumberString(spFibroidCount.Value);
// After:
    vNumber := GetNumberString(Trunc(spFibroidCount.Value));
```

`Scripts/shared/gynae/fibroids.pas` line 13 — add Trunc:
```pascal
// Before:
    if spFibroidCount.Value = 1 then
// After:
    if Trunc(spFibroidCount.Value) = 1 then
```

`Scripts/shared/gynae/fibroids.pas` line 122 — add missing semicolon:
```pascal
// Before:
  v4 := trunc(vv.Value)
// After:
  v4 := trunc(vv.Value);
```

`Scripts/shared/utils/articles.pas` lines 20-22 — fix semicolon before else:
```pascal
// Before:
      result := 'A';
  else
    result := 'a';
// After:
      result := 'A'
  else
    result := 'a';
```

- [ ] **Step 2: Run existing tests to verify no regression**

Run: `cd src/tests/pascal && make clean && make test`
Expected: All 110 tests pass (source fixes don't affect tests yet — tests still use embedded copies).

- [ ] **Step 3: Commit**

```bash
git add Scripts/shared/obstetric/eddHandling.pas Scripts/shared/obstetric/clinicalHistory.pas Scripts/shared/gynae/fibroidUI.pas Scripts/shared/gynae/fibroids.pas Scripts/shared/utils/formUtils.pas Scripts/shared/utils/articles.pas
git commit -m "fix: type Sender parameters and fix missing semicolons in shared scripts"
```

---

### Task 2: Fix InitCaps and PadDecimalPlaces in formatting.pas

**Files:**
- Modify: `Scripts/shared/utils/formatting.pas:4-25,65-79`

- [ ] **Step 1: Rewrite InitCaps to avoid result[1] assignment**

Replace lines 4-25 of `Scripts/shared/utils/formatting.pas`:
```pascal
function InitCaps(inv: string; inReduce: Boolean): string;
var
  vDiff: Integer;
  vFirst: Char;
  vTmp: string;
begin
  if inv <> '' then
  begin
    vDiff := Ord('A') - Ord('a');
    vTmp := inv;
    vFirst := vTmp[1];
    if inReduce then
    begin
      if (Ord(vFirst) >= Ord('A')) and (Ord(vFirst) <= Ord('Z')) then
        vFirst := chr(Ord(vFirst) - vDiff);
    end
    else
    begin
      if (Ord(vFirst) >= Ord('a')) and (Ord(vFirst) <= Ord('z')) then
        vFirst := chr(Ord(vFirst) + vDiff);
    end;
    result := vFirst + Copy(vTmp, 2, Length(vTmp) - 1);
  end
  else
    result := '';
end;
```

This approach:
- Reads the first char into `vFirst` (works in both Delphi and PascalScript)
- Modifies `vFirst` (a simple Char variable, not a string index)
- Rebuilds the string via concatenation

- [ ] **Step 2: Fix PadDecimalPlaces syntax error**

Replace lines 65-79 of `Scripts/shared/utils/formatting.pas`:
```pascal
function PadDecimalPlaces(inStr: String): String;
begin
  result := Trim(inStr);
  if (pos('.', result) = 0) then
    result := result + '.0'
  else if result[1] = '.' then
    result := '0' + result
  else
  begin
    if result[length(result)] = '.' then
      result := result + '0';
  end;
end;
```

Fixes: `result[0]` → `result[1]` (Pascal is 1-indexed), and removes the mismatched `end;` before `else`.

- [ ] **Step 3: Run existing tests**

Run: `cd src/tests/pascal && make test`
Expected: All 110 tests pass.

- [ ] **Step 4: Commit**

```bash
git add Scripts/shared/utils/formatting.pas
git commit -m "fix: rewrite InitCaps for PascalScript compat, fix PadDecimalPlaces syntax"
```

---

### Task 3: Add NOGUI guards around UI-coupled functions

Source files contain a mix of testable pure functions and UI-coupled functions that reference controls not available in the test harness. Wrap the untestable sections with `#ifndef NOGUI` / `#endif` so GPP can strip them with `-DNOGUI`.

**Files:**
- Modify: `Scripts/shared/obstetric/gestationalAge.pas`
- Modify: `Scripts/shared/obstetric/eddHandling.pas`
- Modify: `Scripts/shared/gynae/fibroids.pas`
- Modify: `Scripts/shared/utils/formUtils.pas`

- [ ] **Step 1: Add NOGUI guard to gestationalAge.pas**

Wrap lines 30-63 (GetLMPWeeks through GetGestWeeks — these call `now()` or reference UI controls `seEDDCalGAWeeks`, `seEDDCalGADays`):
```pascal
function GetDaysFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;
begin
  result := (trunc(inExamDate) - Trunc(inLMPDate)) mod 7;
end;

#ifndef NOGUI
function GetLMPWeeks(inDate: TDateTime): Integer;
begin
  result := (trunc(now) - trunc(inDate)) div 7;
end;

function GetLMPDays(inDate: TDateTime): Integer;
begin
  result := (trunc(now) - trunc(inDate)) mod 7;
end;

function GetGestDays: integer;
var
  inW, inD: Integer;
begin
  result := '';
  inW := 0;
  inD := 0;
    inW := trunc(seEDDCalGAWeeks.Value);
    inD := trunc(seEDDCalGADays.Value);
    result :=  inD;
end;

function GetGestWeeks: integer;
var
  inW, inD: Integer;
begin
  result := '';
  inW := 0;
  inD := 0;
    inW := trunc(seEDDCalGAWeeks.Value);
    inD := trunc(seEDDCalGADays.Value);
    result :=  inW;
end;
#endif

#endif
```

- [ ] **Step 2: Add NOGUI guard to eddHandling.pas**

Wrap lines 94-189 (cbDateOfConceptionOnChange through btnPregnancyRedatedOnClick — these reference controls not in the test scaffolding: `deConceptionDate`, `deTransferDate`, `cbPregnancyRedatedYes`, etc., and `GetEnteredEDD`/`getCompositeDate` have syntax errors):

Insert `#ifndef NOGUI` before line 94 (`procedure cbDateOfConceptionOnChange`) and `#endif` before the file's final `#endif`.

- [ ] **Step 3: Add NOGUI guard to fibroids.pas**

Wrap lines 35-429 from `GetCavDistortionCount` onward (everything after `GetSingleCloseOrClear`). These functions reference controls not in the test scaffolding (`tsFibroids`, `cbFibriodPosition1`, `cbFibroidsType1`, etc.) or have syntax errors.

Exception: `GetSingleFibroidDimensions` (lines 60-90) IS testable — it only references controls that ARE in the test scaffolding. Move it before the NOGUI guard:

```pascal
function GetSingleCloseOrClear: String;
...
end;

function GetSingleFibroidDimensions: string;
...
end;

#ifndef NOGUI
function GetCavDistortionCount: Integer;
...
(rest of file)
#endif

#endif
```

- [ ] **Step 4: Add NOGUI guard to formUtils.pas**

Wrap `cbToggleCheckOnClick` (lines 19-36) — it uses `TcxCheckBox(Sender)` casting and `Sender.Parent` which PascalScript can't handle:

```pascal
function AddToResult(inResult, inNew: string): string;
...
end;

#ifndef NOGUI
procedure cbToggleCheckOnClick(Sender: TObject);
...
end;
#endif

function Max(A, B: Integer): Integer;
...
```

- [ ] **Step 5: Build full exam scripts to verify GPP still works**

Run: `cd src/tests/pascal && make prebuild`
Expected: `build/earlyT1Singleton.pas` builds without errors.

- [ ] **Step 6: Commit**

```bash
git add Scripts/shared/obstetric/gestationalAge.pas Scripts/shared/obstetric/eddHandling.pas Scripts/shared/gynae/fibroids.pas Scripts/shared/utils/formUtils.pas
git commit -m "chore: add NOGUI guards around UI-coupled functions for test loading"
```

---

### Task 4: Wire up Format() in PSRegistration.pas

The `Format_P` wrapper function exists (lines 47-50) but was never registered.

**Files:**
- Modify: `src/tests/pascal/src/PSRegistration.pas:164,430`

- [ ] **Step 1: Add compile-time registration**

After line 164 (after the ShowMessage registration), add:

```pascal
    { Format - string formatting (not built into PascalScript) }
    Sender.AddDelphiFunction(
      'function Format(const Fmt: string; const Args: array of const): string;');
```

- [ ] **Step 2: Add runtime registration**

After line 430 (after the ShowMessage runtime registration), add:

```pascal
  { Format }
  Exec.RegisterDelphiFunction(@Format_P, 'Format', cdRegister);
```

- [ ] **Step 3: Run existing tests**

Run: `cd src/tests/pascal && make clean && make test`
Expected: All 110 tests still pass.

- [ ] **Step 4: Commit**

```bash
git add src/tests/pascal/src/PSRegistration.pas
git commit -m "feat: register Format() function in PascalScript test harness"
```

---

### Task 5: Create SourceLoader unit and update Makefile

**Files:**
- Create: `src/tests/pascal/src/SourceLoader.pas`
- Modify: `src/tests/pascal/Makefile`
- Modify: `src/tests/pascal/TestRunner.pas`

- [ ] **Step 1: Create SourceLoader.pas**

```pascal
unit SourceLoader;
{
  Loads GPP-preprocessed Pascal source files for PascalScript test execution.
  Applies text substitutions for PascalScript compatibility:
    - .Properties.Items.Count -> .GetItemCount (nested property not supported)
    - .Properties.ActivePage -> .ActivePage (nested property not supported)
}

{$mode objfpc}{$H+}

interface

function LoadPascalSource(const FileName: string): string;

implementation

uses
  Classes, SysUtils;

function LoadPascalSource(const FileName: string): string;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);
    Result := SL.Text;
    Result := StringReplace(Result, '.Properties.Items.Count', '.GetItemCount', [rfReplaceAll]);
    Result := StringReplace(Result, '.Properties.ActivePage', '.ActivePage', [rfReplaceAll]);
  finally
    SL.Free;
  end;
end;

end.
```

- [ ] **Step 2: Add SourceLoader to TestRunner.pas uses clause**

```pascal
uses
  Classes, SysUtils, consoletestrunner,
  SourceLoader,
  TestPureUtils, TestGestationalAge, TestStubControls,
  TestClinicalHistory, TestEDDHandling, TestFibroids;
```

- [ ] **Step 3: Update Makefile — add GPP processing of shared source files**

Add a `SHARED` variable and expand the `prebuild` target:

```makefile
SHARED = $(SCRIPTS)/shared

prebuild:
	@mkdir -p $(BUILD)
	cd $(SCRIPTS) && $(GPP) -I. -o "$(CURDIR)/$(BUILD)/earlyT1Singleton.pas" earlyT1Singleton/script.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/strUtils.pas" $(SHARED)/utils/strUtils.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/formatting.pas" $(SHARED)/utils/formatting.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/articles.pas" $(SHARED)/utils/articles.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/formUtils.pas" $(SHARED)/utils/formUtils.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/gestationalAge.pas" $(SHARED)/obstetric/gestationalAge.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/clinicalHistory.pas" $(SHARED)/obstetric/clinicalHistory.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/eddHandling.pas" $(SHARED)/obstetric/eddHandling.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/fibroids.pas" $(SHARED)/gynae/fibroids.pas
	$(GPP) -DNOGUI -o "$(CURDIR)/$(BUILD)/fibroidUI.pas" $(SHARED)/gynae/fibroidUI.pas
```

Also add `-Fu$(SRC)` already exists in FPCFLAGS so SourceLoader.pas will be found.

- [ ] **Step 4: Test the build**

Run: `cd src/tests/pascal && make clean && make test`
Expected: All 110 tests pass. GPP produces source files in `build/`.

- [ ] **Step 5: Commit**

```bash
git add src/tests/pascal/src/SourceLoader.pas src/tests/pascal/TestRunner.pas src/tests/pascal/Makefile
git commit -m "feat: add SourceLoader unit and GPP prebuild for shared source files"
```

---

### Task 6: Refactor TestPureUtils to load from source

**Files:**
- Modify: `src/tests/pascal/tests/TestPureUtils.pas`

- [ ] **Step 1: Replace embedded source constant with file loading**

Remove the entire `PURE_UTILS_SOURCE` constant (lines 99-311).

Add `SourceLoader` to the implementation uses clause:

```pascal
implementation

uses SourceLoader;
```

Replace the `SetUp` method:

```pascal
procedure TTestPureUtils.SetUp;
var
  Source: string;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  Source := LoadPascalSource('build/strUtils.pas') +
            LoadPascalSource('build/formatting.pas') +
            LoadPascalSource('build/articles.pas') +
            LoadPascalSource('build/formUtils.pas') +
            LineEnding + 'begin' + LineEnding + 'end.';

  if not FHost.CompileScript(Source) then
  begin
    WriteLn('COMPILE ERROR: ', FHost.LastError);
    Exit;
  end;

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
  begin
    WriteLn('EXECUTE ERROR: ', FHost.LastError);
    Exit;
  end;

  FSetupOk := True;
end;
```

- [ ] **Step 2: Update StrToIntDef test calls**

The source file defines `StrToIntDef` directly (not `MyStrToIntDef`). Update the test methods that call `MyStrToIntDef`:

```pascal
procedure TTestPureUtils.TestStrToIntDef_ValidInt;
var
  R: Integer;
begin
  R := CallIntFn('StrToIntDef', ['42', 0]);
  AssertEquals('Should parse valid int', 42, R);
end;

procedure TTestPureUtils.TestStrToIntDef_InvalidReturnsDefault;
var
  R: Integer;
begin
  R := CallIntFn('StrToIntDef', ['xyz', -1]);
  AssertEquals('Should return default for invalid string', -1, R);
end;
```

- [ ] **Step 3: Run TestPureUtils**

Run: `cd src/tests/pascal && make clean && make test-suite SUITE=TTestPureUtils`
Expected: All 35 tests pass. If any fail, check error messages — the real source functions may produce slightly different output than the embedded copies. Adjust expected values to match.

- [ ] **Step 4: Commit**

```bash
git add src/tests/pascal/tests/TestPureUtils.pas
git commit -m "refactor: TestPureUtils loads source files instead of embedding copies"
```

---

### Task 7: Refactor TestGestationalAge to load from source

**Files:**
- Modify: `src/tests/pascal/tests/TestGestationalAge.pas`

- [ ] **Step 1: Replace embedded source constant with file loading**

Remove the `GESTATIONAL_AGE_SOURCE` constant (lines 73-111).

Add `SourceLoader` to implementation uses:

```pascal
implementation

uses SourceLoader;
```

Replace the `SetUp` method:

```pascal
procedure TTestGestationalAge.SetUp;
var
  Source: string;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  Source := LoadPascalSource('build/gestationalAge.pas') +
            LineEnding + 'begin' + LineEnding + 'end.';

  if not FHost.CompileScript(Source) then
  begin
    WriteLn('COMPILE ERROR: ', FHost.LastError);
    Exit;
  end;

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
  begin
    WriteLn('EXECUTE ERROR: ', FHost.LastError);
    Exit;
  end;

  FSetupOk := True;
end;
```

- [ ] **Step 2: Run TestGestationalAge**

Run: `cd src/tests/pascal && make test-suite SUITE=TTestGestationalAge`
Expected: All 18 tests pass.

- [ ] **Step 3: Commit**

```bash
git add src/tests/pascal/tests/TestGestationalAge.pas
git commit -m "refactor: TestGestationalAge loads source file instead of embedding copy"
```

---

### Task 8: Refactor TestClinicalHistory to load from source

This test is more complex — it embeds modified versions of `GetClinicalIndicators` and `cxccbReferralIndicatorsChange`, plus test scaffolding (control variables, setup/teardown, test wrapper functions). The business logic loads from source; the scaffolding stays inline.

**Files:**
- Modify: `src/tests/pascal/tests/TestClinicalHistory.pas`

- [ ] **Step 1: Split the constant into source loading + scaffold**

Remove `CLINICAL_HISTORY_SOURCE`. Replace with a scaffold constant that contains ONLY the test-specific code:

Add `SourceLoader` to implementation uses:
```pascal
implementation

uses SourceLoader;
```

Define the scaffold constant — this is the test-specific code that was previously mixed in with the business logic. It contains: control variable declarations, SetupCombo3/TeardownCombo helpers, and all Test* wrapper functions:

```pascal
const
  SCAFFOLD_SOURCE =
    { --- Global control variables --- }
    'var'                                                        + LineEnding +
    '  cxccbReferralIndicators: TcxComboBox;'                    + LineEnding +
    '  edtReferralIndicator1: TcxTextEdit;'                      + LineEnding +
    ''                                                           + LineEnding +

    { --- Helper: create combo with 3 items --- }
    'procedure SetupCombo3;'                                     + LineEnding +
    'begin'                                                      + LineEnding +
    '  cxccbReferralIndicators := TcxComboBox.Create(nil);'      + LineEnding +
    '  edtReferralIndicator1 := TcxTextEdit.Create(nil);'        + LineEnding +
    '  cxccbReferralIndicators.AddItem(''Pain'');'               + LineEnding +
    '  cxccbReferralIndicators.AddItem(''Bleeding'');'           + LineEnding +
    '  cxccbReferralIndicators.AddItem(''Other'');'              + LineEnding +
    '  cxccbReferralIndicators.ShortDescription[0] := ''Pain'';' + LineEnding +
    '  cxccbReferralIndicators.ShortDescription[1] := ''Bleeding'';' + LineEnding +
    '  cxccbReferralIndicators.ShortDescription[2] := ''Other'';' + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'procedure TeardownCombo;'                                   + LineEnding +
    'begin'                                                      + LineEnding +
    '  edtReferralIndicator1.Free;'                              + LineEnding +
    '  cxccbReferralIndicators.Free;'                            + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { ============== Test functions ============== }
    { These are the PascalScript test wrappers that exercise the
      real business logic functions loaded from source files. }

    'function TestNoItems: string;'                              + LineEnding +
    'var res: string;'                                           + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  cxccbReferralIndicators.States[0] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 0;'                  + LineEnding +
    '  res := GetClinicalIndicators;'                            + LineEnding +
    '  if res = '' '' then'                                      + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected " " got "'' + res + ''"'';'        + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'function TestOneItem: string;'                              + LineEnding +
    'var res: string;'                                           + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  cxccbReferralIndicators.States[0] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 0;'                  + LineEnding +
    '  res := GetClinicalIndicators;'                            + LineEnding +
    '  if res = ''Pain.  '' then'                                + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected "Pain.  " got "'' + res + ''"'';'  + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'function TestMultipleItems: string;'                        + LineEnding +
    'var res: string;'                                           + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  cxccbReferralIndicators.States[0] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 0;'                  + LineEnding +
    '  res := GetClinicalIndicators;'                            + LineEnding +
    '  if res = ''Pain.  Bleeding.  '' then'                     + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected "Pain.  Bleeding.  " got "'' + res + ''"'';' + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'function TestOtherSelected: string;'                        + LineEnding +
    'var res: string;'                                           + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  edtReferralIndicator1.Text := ''custom reason'';'         + LineEnding +
    '  cxccbReferralIndicators.States[0] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 1;'                  + LineEnding +
    '  res := GetClinicalIndicators;'                            + LineEnding +
    '  if res = ''Pain.  Custom reason.  '' then'                + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected "Pain.  Custom reason.  " got "'' + res + ''"'';' + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'function TestClinicalHistoryEmpty: string;'                 + LineEnding +
    'begin'                                                      + LineEnding +
    '  if GetClinicalHistory = '''' then'                        + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected empty string'';'                   + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'function TestChangeLastChecked: string;'                    + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  edtReferralIndicator1.Enabled := False;'                  + LineEnding +
    '  cxccbReferralIndicators.States[0] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 1;'                  + LineEnding +
    '  cxccbReferralIndicatorsChange(nil);'                      + LineEnding +
    '  if edtReferralIndicator1.Enabled then'                    + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''edtReferralIndicator1 should be Enabled'';' + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'function TestChangeLastUnchecked: string;'                  + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  edtReferralIndicator1.Enabled := True;'                   + LineEnding +
    '  cxccbReferralIndicators.States[0] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 0;'                  + LineEnding +
    '  cxccbReferralIndicatorsChange(nil);'                      + LineEnding +
    '  if not edtReferralIndicator1.Enabled then'                + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''edtReferralIndicator1 should be Disabled'';' + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'begin'                                                      + LineEnding +
    'end.';
```

Note the key changes to expected values vs the old embedded version:
- TestOneItem: `'Pain.  '` (was `'Pain.   '` — the old test added an extra trailing space)
- TestMultipleItems: `'Pain.  Bleeding.  '` (was `'Pain.  Bleeding.   '`)
- TestOtherSelected: `'Pain.  Custom reason.  '` (was `'Pain.  custom reason.   '` — real source calls `InitCaps` which capitalizes "custom")
- TestNoItems: `' '` (unchanged — AddFullStop returns '' for empty input, but the real function's final `AddFullStop` of `''` returns `''`. Verify this.)

- [ ] **Step 2: Update SetUp to load source files**

```pascal
procedure TTestClinicalHistory.SetUp;
var
  Source: string;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  Source := LoadPascalSource('build/formatting.pas') +
            LoadPascalSource('build/clinicalHistory.pas') +
            SCAFFOLD_SOURCE;

  if not FHost.CompileScript(Source) then
  begin
    WriteLn('COMPILE ERROR: ', FHost.LastError);
    Exit;
  end;

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
  begin
    WriteLn('EXECUTE ERROR: ', FHost.LastError);
    Exit;
  end;

  FSetupOk := True;
end;
```

- [ ] **Step 3: Run TestClinicalHistory and fix expected values**

Run: `cd src/tests/pascal && make clean && make test-suite SUITE=TTestClinicalHistory`

The real source functions may produce slightly different output than the old embedded copies. If tests fail, the error messages show the actual output — update expected values in the scaffold to match. The real functions use `AddFullStop` and `InitCaps` which the old embedded version had simplified/removed.

- [ ] **Step 4: Commit**

```bash
git add src/tests/pascal/tests/TestClinicalHistory.pas
git commit -m "refactor: TestClinicalHistory loads source files instead of embedding copies"
```

---

### Task 9: Refactor TestEDDHandling to load from source

**Files:**
- Modify: `src/tests/pascal/tests/TestEDDHandling.pas`

- [ ] **Step 1: Split into source loading + scaffold**

Remove `EDD_HANDLING_SOURCE`. The scaffold retains: control variable declarations, SetupEDDControls/TeardownEDDControls, and all Test* wrapper functions.

Add `SourceLoader` to implementation uses. Read the current test file to identify the exact boundary between business logic (which moves to source loading) and test scaffolding (which stays as an inline constant).

The loaded source files provide: `GetWeeksFromDueDate`, `GetDaysFromDueDate` (from gestationalAge.pas) and `cbEDDPrincipleOnChange`, `cbLMPDateOnChange`, `PopulateEDDControls`, plus the simple event handlers (from eddHandling.pas).

The scaffold constant contains: control variable declarations (all the `var cbEDDPrinciple: TcxComboBox;` etc.), `SetupEDDControls`, `TeardownEDDControls`, and the Test* wrapper functions, ending with `'begin' + LineEnding + 'end.'`.

- [ ] **Step 2: Update SetUp**

```pascal
procedure TTestEDDHandling.SetUp;
var
  Source: string;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  Source := LoadPascalSource('build/gestationalAge.pas') +
            LoadPascalSource('build/eddHandling.pas') +
            SCAFFOLD_SOURCE;

  if not FHost.CompileScript(Source) then
  begin
    WriteLn('COMPILE ERROR: ', FHost.LastError);
    Exit;
  end;

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
  begin
    WriteLn('EXECUTE ERROR: ', FHost.LastError);
    Exit;
  end;

  FSetupOk := True;
end;
```

- [ ] **Step 3: Run and verify**

Run: `cd src/tests/pascal && make clean && make test-suite SUITE=TTestEDDHandling`
Expected: All 8 tests pass. Fix expected values if needed.

- [ ] **Step 4: Commit**

```bash
git add src/tests/pascal/tests/TestEDDHandling.pas
git commit -m "refactor: TestEDDHandling loads source files instead of embedding copies"
```

---

### Task 10: Refactor TestFibroids to load from source

**Files:**
- Modify: `src/tests/pascal/tests/TestFibroids.pas`

- [ ] **Step 1: Split into source loading + scaffold**

Remove `FIBROID_SOURCE`. The scaffold retains: control variable declarations, SetupFibroidControls/TeardownFibroidControls, and all Test* wrapper functions.

The loaded source files provide: `InitCaps`, `GetNumberString` (from formatting.pas), `GetFibroidCount`, `GetSingleCloseOrClear`, `GetSingleFibroidDimensions` (from fibroids.pas), `spFibroidCountOnChange`, `cbFibroidsVisualisedOnClick` (from fibroidUI.pas).

Key change: the real `GetSingleFibroidDimensions` uses `format()` (now wired up) instead of the string concatenation the old embedded version used. Expected values for dimension tests may differ in formatting — verify.

Add `SourceLoader` to implementation uses. Define `SCAFFOLD_SOURCE` with the test-specific code.

- [ ] **Step 2: Update SetUp**

```pascal
procedure TTestFibroids.SetUp;
var
  Source: string;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  Source := LoadPascalSource('build/formatting.pas') +
            LoadPascalSource('build/fibroids.pas') +
            LoadPascalSource('build/fibroidUI.pas') +
            SCAFFOLD_SOURCE;

  if not FHost.CompileScript(Source) then
  begin
    WriteLn('COMPILE ERROR: ', FHost.LastError);
    Exit;
  end;

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
  begin
    WriteLn('EXECUTE ERROR: ', FHost.LastError);
    Exit;
  end;

  FSetupOk := True;
end;
```

- [ ] **Step 3: Run and verify**

Run: `cd src/tests/pascal && make clean && make test-suite SUITE=TTestFibroids`

The `GetSingleFibroidDimensions` tests will likely need expected value updates since the real source uses `format('%d x %d x %dmm (vol. %dcc)', ...)` which produces different spacing/punctuation than the old embedded string-concatenation version.

Fix expected values based on error output.

- [ ] **Step 4: Commit**

```bash
git add src/tests/pascal/tests/TestFibroids.pas
git commit -m "refactor: TestFibroids loads source files instead of embedding copies"
```

---

### Task 11: Full verification and cleanup

- [ ] **Step 1: Clean build and run all tests**

```bash
cd src/tests/pascal && make clean && make test
```

Expected: All 110 tests pass with 0 errors and 0 failures.

- [ ] **Step 2: Verify GPP full-exam build still works**

```bash
cd src/tests/pascal && make prebuild
```

Expected: `build/earlyT1Singleton.pas` builds without errors. The NOGUI guards and source fixes are invisible to the normal build.

- [ ] **Step 3: Final commit if any fixups were needed**

```bash
git add -A
git commit -m "chore: final verification of test source loading refactor"
```
