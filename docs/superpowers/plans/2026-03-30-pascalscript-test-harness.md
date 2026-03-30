# PascalScript Test Harness Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a command-line test harness that runs the actual PascalScript functions through an embedded PascalScript interpreter with stubbed DevExpress controls, enabling safe refactoring.

**Architecture:** FPC console app embeds PascalScript engine, registers stub DevExpress control classes, loads GPP-built exam scripts, and calls individual functions. FPCUnit provides test assertions and a console runner.

**Tech Stack:** Free Pascal Compiler (fpc), RemObjects PascalScript, FPCUnit, GPP preprocessor, Make

**Spec:** `docs/superpowers/specs/2026-03-30-pascalscript-test-harness-design.md`

---

## File Structure

```
Scripts/tests/pascal/
  vendor/
    pascalscript/              -- PascalScript source (git clone)
  src/
    ScriptHost.pas             -- Wraps PascalScript compiler+runtime
    StubControls.pas           -- Stub DevExpress control classes
    PSRegistration.pas         -- Registers stubs + built-ins with PascalScript
  tests/
    TestPureUtils.pas          -- Tests for strUtils, formatting, articles, dateUtils
    TestGestationalAge.pas     -- Tests for gestational age calculations
    TestFormUtils.pas          -- Tests for formUtils (both pure and UI-coupled)
    TestClinicalHistory.pas    -- Tests for clinical history functions
    TestEDDHandling.pas        -- Tests for EDD event handlers
    TestFibroids.pas           -- Tests for fibroid functions
    TestFibroidUI.pas          -- Tests for fibroid UI handlers
  TestRunner.pas               -- FPCUnit console entry point
  build/                       -- GPP-built scripts (gitignored)
  Makefile
```

---

### Task 1: Environment Setup & PascalScript Proof of Concept

**Files:**
- Create: `Scripts/tests/pascal/Makefile`
- Create: `Scripts/tests/pascal/.gitignore`
- Create: `Scripts/tests/pascal/poc.pas` (temporary, deleted after verification)

This task verifies FPC and PascalScript work together on this machine before building the real harness.

- [ ] **Step 1: Install FPC**

```bash
brew install fpc
```

Verify:
```bash
fpc -v
```
Expected: version info including `3.2.2` or later.

- [ ] **Step 2: Clone PascalScript source**

```bash
cd Scripts/tests/pascal
mkdir -p vendor
git clone https://github.com/remobjects/pascalscript.git vendor/pascalscript
```

- [ ] **Step 3: Create .gitignore**

Create `Scripts/tests/pascal/.gitignore`:
```
build/
vendor/
*.o
*.ppu
*.exe
TestRunner
poc
```

- [ ] **Step 4: Write proof-of-concept program**

Create `Scripts/tests/pascal/poc.pas`:
```pascal
program poc;

{$mode objfpc}{$H+}

uses
  SysUtils, uPSCompiler, uPSRuntime, uPSUtils;

function ScriptOnUses(Sender: TPSPascalCompiler;
  const Name: tbtstring): Boolean;
begin
  if Name = 'SYSTEM' then
  begin
    Result := True;
  end
  else
    Result := False;
end;

var
  Compiler: TPSPascalCompiler;
  Exec: TPSExec;
  Data: tbtstring;

begin
  WriteLn('PascalScript PoC');

  // Compile a trivial script
  Compiler := TPSPascalCompiler.Create;
  try
    Compiler.OnUses := @ScriptOnUses;
    if not Compiler.Compile(
      'function Add(a, b: Integer): Integer; begin Result := a + b; end; begin end.'
    ) then
    begin
      WriteLn('COMPILE FAILED: ', Compiler.MsgCount, ' errors');
      if Compiler.MsgCount > 0 then
        WriteLn('  ', Compiler.Msg[0].MessageToString);
      Halt(1);
    end;
    Compiler.GetOutput(Data);
  finally
    Compiler.Free;
  end;

  // Execute
  Exec := TPSExec.Create;
  try
    if not Exec.LoadData(Data) then
    begin
      WriteLn('LOAD FAILED');
      Halt(1);
    end;
    Exec.RunScript;
    WriteLn('Script executed successfully');
  finally
    Exec.Free;
  end;

  WriteLn('PoC PASSED');
end.
```

- [ ] **Step 5: Compile and run the PoC**

```bash
cd Scripts/tests/pascal
fpc -Fu./vendor/pascalscript/Source -opoc poc.pas
./poc
```

Expected output:
```
PascalScript PoC
Script executed successfully
PoC PASSED
```

If compilation fails due to PascalScript source issues, try the Lazarus-bundled version instead:
```bash
# Find Lazarus PascalScript path
find /usr/local /opt -name "uPSCompiler.pas" -path "*/PascalScript/*" 2>/dev/null
```

- [ ] **Step 6: Clean up PoC and commit**

```bash
rm Scripts/tests/pascal/poc.pas Scripts/tests/pascal/poc
```

```bash
git add Scripts/tests/pascal/.gitignore
git commit -m "chore: scaffold PascalScript test harness directory with gitignore"
```

---

### Task 2: ScriptHost Wrapper

**Files:**
- Create: `Scripts/tests/pascal/src/ScriptHost.pas`

The ScriptHost wraps PascalScript's compiler and runtime into a single class that can load a script, register types, and call individual functions.

- [ ] **Step 1: Write ScriptHost.pas**

Create `Scripts/tests/pascal/src/ScriptHost.pas`:
```pascal
unit ScriptHost;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Contnrs,
  uPSCompiler, uPSRuntime, uPSUtils, uPSC_std, uPSR_std;

type
  TCompileEvent = procedure(Compiler: TPSPascalCompiler) of object;
  TExecEvent = procedure(Exec: TPSExec; ClassImporter: TPSRuntimeClassImporter) of object;

  TScriptHost = class
  private
    FCompiler: TPSPascalCompiler;
    FExec: TPSExec;
    FBytecode: tbtstring;
    FCompiled: Boolean;
    FLastError: string;
    FOnCompile: TCompileEvent;
    FOnExec: TExecEvent;
    FClassImporter: TPSRuntimeClassImporter;
  public
    constructor Create;
    destructor Destroy; override;

    function CompileScript(const Source: string): Boolean;
    function LoadAndCompileFile(const FileName: string): Boolean;
    function Execute: Boolean;

    function CallFunctionByName(const Name: string;
      const Params: array of Variant): Variant;
    procedure CallProcedureByName(const Name: string;
      const Params: array of Variant);

    procedure SetVariable(const Name: string; Value: Pointer;
      const TypeName: string);

    property Compiled: Boolean read FCompiled;
    property LastError: string read FLastError;
    property Compiler: TPSPascalCompiler read FCompiler;
    property Exec: TPSExec read FExec;
    property ClassImporter: TPSRuntimeClassImporter read FClassImporter;
    property OnCompile: TCompileEvent read FOnCompile write FOnCompile;
    property OnExec: TExecEvent read FOnExec write FOnExec;
  end;

implementation

constructor TScriptHost.Create;
begin
  inherited Create;
  FCompiler := TPSPascalCompiler.Create;
  FExec := TPSExec.Create;
  FClassImporter := TPSRuntimeClassImporter.Create;
  FCompiled := False;
  FLastError := '';
end;

destructor TScriptHost.Destroy;
begin
  FClassImporter.Free;
  FExec.Free;
  FCompiler.Free;
  inherited Destroy;
end;

function TScriptHost.CompileScript(const Source: string): Boolean;
var
  i: Integer;
begin
  FCompiled := False;
  FLastError := '';

  if not FCompiler.Compile(Source) then
  begin
    FLastError := '';
    for i := 0 to FCompiler.MsgCount - 1 do
    begin
      if FLastError <> '' then
        FLastError := FLastError + LineEnding;
      FLastError := FLastError + FCompiler.Msg[i].MessageToString;
    end;
    Result := False;
    Exit;
  end;

  FCompiler.GetOutput(FBytecode);
  FCompiled := True;
  Result := True;
end;

function TScriptHost.LoadAndCompileFile(const FileName: string): Boolean;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);
    Result := CompileScript(SL.Text);
  finally
    SL.Free;
  end;
end;

function TScriptHost.Execute: Boolean;
begin
  Result := False;
  if not FCompiled then
  begin
    FLastError := 'Script not compiled';
    Exit;
  end;

  if not FExec.LoadData(FBytecode) then
  begin
    FLastError := 'Failed to load bytecode';
    Exit;
  end;

  FExec.RunScript;
  Result := True;
end;

function TScriptHost.CallFunctionByName(const Name: string;
  const Params: array of Variant): Variant;
var
  ProcNo: Cardinal;
  ProcRec: PIFProcRec;
  ParamList: TPSList;
  Param, RetVal: PIFVariant;
  i: Integer;
begin
  Result := Null;
  ProcNo := FExec.GetProc(Name);
  if ProcNo = InvalidVal then
  begin
    FLastError := 'Function not found: ' + Name;
    raise Exception.Create(FLastError);
  end;

  ParamList := TPSList.Create;
  try
    // Add parameters in reverse order (PascalScript convention)
    for i := High(Params) downto Low(Params) do
    begin
      Param := CreateHeapVariant(FExec.FindType2(btVariant));
      if Param = nil then
      begin
        // Try specific types based on Variant type
        Param := CreateHeapVariant(FExec.FindType2(btVariant));
      end;
      PPSVariantVariant(Param)^.Data := Params[i];
      ParamList.Add(Param);
    end;

    // Return value
    RetVal := CreateHeapVariant(FExec.FindType2(btVariant));
    ParamList.Add(RetVal);

    FExec.RunProc(ParamList, ProcNo);

    Result := PPSVariantVariant(RetVal)^.Data;
  finally
    FreePIFVariantList(ParamList);
  end;
end;

procedure TScriptHost.CallProcedureByName(const Name: string;
  const Params: array of Variant);
var
  ProcNo: Cardinal;
  ParamList: TPSList;
  Param: PIFVariant;
  i: Integer;
begin
  ProcNo := FExec.GetProc(Name);
  if ProcNo = InvalidVal then
  begin
    FLastError := 'Procedure not found: ' + Name;
    raise Exception.Create(FLastError);
  end;

  ParamList := TPSList.Create;
  try
    for i := High(Params) downto Low(Params) do
    begin
      Param := CreateHeapVariant(FExec.FindType2(btVariant));
      PPSVariantVariant(Param)^.Data := Params[i];
      ParamList.Add(Param);
    end;

    FExec.RunProc(ParamList, ProcNo);
  finally
    FreePIFVariantList(ParamList);
  end;
end;

procedure TScriptHost.SetVariable(const Name: string; Value: Pointer;
  const TypeName: string);
begin
  // Will be implemented when stubs are needed
end;

end.
```

- [ ] **Step 2: Verify it compiles**

```bash
cd Scripts/tests/pascal
fpc -Fu./vendor/pascalscript/Source -Fu./src -Cn src/ScriptHost.pas
```

Expected: compiles without errors (flag `-Cn` = syntax check only, no linking).

Note: The `CallFunctionByName` implementation uses PascalScript's low-level `RunProc` API. If the Variant-based parameter passing doesn't work correctly, an alternative approach is to use `TPSScript` component (from `uPSComponent`) which provides `ExecuteFunction`. Adjust the implementation as needed during Task 3 testing.

- [ ] **Step 3: Commit**

```bash
git add Scripts/tests/pascal/src/ScriptHost.pas
git commit -m "feat: add ScriptHost wrapper for PascalScript engine"
```

---

### Task 3: Test Runner, Built-in Registration & First Tests

**Files:**
- Create: `Scripts/tests/pascal/src/PSRegistration.pas`
- Create: `Scripts/tests/pascal/tests/TestPureUtils.pas`
- Create: `Scripts/tests/pascal/TestRunner.pas`
- Create: `Scripts/tests/pascal/Makefile`

This task registers the built-in functions that the scripts depend on, creates the test runner, and gets the first pure function tests passing against the GPP-built script.

- [ ] **Step 1: Create PSRegistration.pas with built-in function registration**

Create `Scripts/tests/pascal/src/PSRegistration.pas`:
```pascal
unit PSRegistration;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, uPSCompiler, uPSRuntime, uPSUtils, uPSC_std, uPSR_std;

{ Call these in the OnUses callback to register standard types and functions }
procedure RegisterCompileTimeStd(Compiler: TPSPascalCompiler);

{ Call this after LoadData to register runtime implementations }
procedure RegisterRuntimeStd(Exec: TPSExec; ClassImporter: TPSRuntimeClassImporter);

{ Standard OnUses callback that registers everything needed }
function StandardOnUses(Sender: TPSPascalCompiler;
  const Name: tbtstring): Boolean;

implementation

{ ----- Wrapper functions that PascalScript will call ----- }

procedure Ext_ShowMessage(const Msg: string);
begin
  // No-op in test harness. Could capture to a list for assertion.
end;

function Ext_Format(const Fmt: string; const Args: array of const): string;
begin
  Result := SysUtils.Format(Fmt, Args);
end;

function Ext_FormatDateTime(const Fmt: string; DT: TDateTime): string;
begin
  Result := SysUtils.FormatDateTime(Fmt, DT);
end;

function Ext_StrToFloat(const S: string): Extended;
begin
  Result := SysUtils.StrToFloat(S);
end;

function Ext_StrToInt(const S: string): Integer;
begin
  Result := SysUtils.StrToInt(S);
end;

function Ext_IntToStr(I: Integer): string;
begin
  Result := SysUtils.IntToStr(I);
end;

function Ext_Trim(const S: string): string;
begin
  Result := SysUtils.Trim(S);
end;

function Ext_Now: TDateTime;
begin
  Result := SysUtils.Now;
end;

function Ext_Trunc(X: Extended): Int64;
begin
  Result := System.Trunc(X);
end;

function Ext_Assigned(P: Pointer): Boolean;
begin
  Result := P <> nil;
end;

procedure RegisterCompileTimeStd(Compiler: TPSPascalCompiler);
begin
  SIRegister_Std(Compiler);

  { Register TDateTime as a type alias }
  Compiler.AddTypeS('TDateTime', 'Double');

  { Register standard functions the scripts use }
  Compiler.AddDelphiFunction('procedure ShowMessage(const Msg: string)');
  Compiler.AddDelphiFunction('function Format(const Fmt: string; const Args: array of const): string');
  Compiler.AddDelphiFunction('function FormatDateTime(const Fmt: string; DT: TDateTime): string');
  Compiler.AddDelphiFunction('function StrToFloat(const S: string): Extended');
  Compiler.AddDelphiFunction('function StrToInt(const S: string): Integer');
  Compiler.AddDelphiFunction('function IntToStr(I: Integer): string');
  Compiler.AddDelphiFunction('function Trim(const S: string): string');
  Compiler.AddDelphiFunction('function Now: TDateTime');
  Compiler.AddDelphiFunction('function Trunc(X: Extended): Int64');
  Compiler.AddDelphiFunction('function Assigned(P: Pointer): Boolean');
end;

procedure RegisterRuntimeStd(Exec: TPSExec;
  ClassImporter: TPSRuntimeClassImporter);
begin
  RIRegister_Std(ClassImporter);

  Exec.RegisterDelphiFunction(@Ext_ShowMessage, 'SHOWMESSAGE', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_Format, 'FORMAT', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_FormatDateTime, 'FORMATDATETIME', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_StrToFloat, 'STRTOFLOAT', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_StrToInt, 'STRTOINT', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_IntToStr, 'INTTOSTR', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_Trim, 'TRIM', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_Now, 'NOW', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_Trunc, 'TRUNC', cdRegister);
  Exec.RegisterDelphiFunction(@Ext_Assigned, 'ASSIGNED', cdRegister);
end;

function StandardOnUses(Sender: TPSPascalCompiler;
  const Name: tbtstring): Boolean;
begin
  if Name = 'SYSTEM' then
  begin
    RegisterCompileTimeStd(Sender);
    Result := True;
  end
  else
    Result := False;
end;

end.
```

**Note:** PascalScript may already provide some of these as built-ins (`Pos`, `Copy`, `Length`, `Ord`, `Chr`, `IntToStr`, `StrToInt`). If compilation fails with "duplicate identifier" errors, remove the duplicate registrations. The `Format` function with `array of const` may need special handling — PascalScript might not support open array parameters in the same way FPC does. If so, register it as a function that takes individual parameters, or use PascalScript's `uPSC_std`/`uPSR_std` which may already include it.

- [ ] **Step 2: Create the Makefile**

Create `Scripts/tests/pascal/Makefile`:
```makefile
FPC = fpc
GPP = gpp
PS_SRC = ./vendor/pascalscript/Source
SRC = ./src
TESTS = ./tests
BUILD = ./build
SCRIPTS = ../..

FPCFLAGS = -Fu$(PS_SRC) -Fu$(SRC) -Fu$(TESTS) -FE. -dNOGUI

.PHONY: all prebuild build test clean

all: test

# Pre-build exam scripts with GPP
prebuild:
	@mkdir -p $(BUILD)
	cd $(SCRIPTS) && $(GPP) -I. -o tests/pascal/$(BUILD)/earlyT1Singleton.pas earlyT1Singleton/script.pas

# Compile test runner
build: prebuild
	$(FPC) $(FPCFLAGS) -oTestRunner TestRunner.pas

# Run all tests
test: build
	./TestRunner --all --format=plain

# Run a specific suite
test-suite: build
	./TestRunner --suite=$(SUITE)

clean:
	rm -f TestRunner *.o *.ppu src/*.o src/*.ppu tests/*.o tests/*.ppu
	rm -rf $(BUILD)
```

- [ ] **Step 3: Create TestRunner.pas**

Create `Scripts/tests/pascal/TestRunner.pas`:
```pascal
program TestRunner;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils, consoletestrunner,
  { Test suites - add each new test unit here }
  TestPureUtils;

type
  TMyTestRunner = class(TTestRunner)
  protected
    procedure GetTestRegistryRoots; override;
  end;

procedure TMyTestRunner.GetTestRegistryRoots;
begin
  // Default implementation registers all tests
  inherited;
end;

var
  App: TMyTestRunner;
begin
  App := TMyTestRunner.Create(nil);
  try
    App.Initialize;
    App.Run;
  finally
    App.Free;
  end;
end.
```

- [ ] **Step 4: Create TestPureUtils.pas with first tests**

Create `Scripts/tests/pascal/tests/TestPureUtils.pas`:
```pascal
unit TestPureUtils;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration,
  uPSCompiler, uPSRuntime, uPSUtils;

type
  TTestPureUtils = class(TTestCase)
  private
    FHost: TScriptHost;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    { StrToFloatDef }
    procedure TestStrToFloatDef_ValidFloat;
    procedure TestStrToFloatDef_InvalidReturnsDefault;
    procedure TestStrToFloatDef_EmptyReturnsDefault;

    { StrToIntDef }
    procedure TestStrToIntDef_ValidInt;
    procedure TestStrToIntDef_InvalidReturnsDefault;

    { StringReplace }
    procedure TestStringReplace_BasicReplace;

    { StringReplaceAll }
    procedure TestStringReplaceAll_MultipleOccurrences;
    procedure TestStringReplaceAll_NoMatch;

    { InitCaps }
    procedure TestInitCaps_Capitalize;
    procedure TestInitCaps_Reduce;
    procedure TestInitCaps_EmptyString;

    { IncludeComma }
    procedure TestIncludeComma_NonEmpty;
    procedure TestIncludeComma_Empty;

    { AddFullStop }
    procedure TestAddFullStop_NoExistingStop;
    procedure TestAddFullStop_AlreadyHasStop;
    procedure TestAddFullStop_EmptyString;

    { GetNumberString }
    procedure TestGetNumberString_One;
    procedure TestGetNumberString_Five;
    procedure TestGetNumberString_Ten;

    { RemoveDecimalPointAtEnd }
    procedure TestRemoveDecimalPointAtEnd_HasTrailingDot;
    procedure TestRemoveDecimalPointAtEnd_NoDot;

    { GetIndefinateArticle }
    procedure TestGetIndefinateArticle_Eight;
    procedure TestGetIndefinateArticle_Eleven;
    procedure TestGetIndefinateArticle_Five;
    procedure TestGetIndefinateArticle_Caps;

    { Max, Min }
    procedure TestMax_FirstLarger;
    procedure TestMax_SecondLarger;
    procedure TestMin_FirstSmaller;
    procedure TestMin_SecondSmaller;

    { AddToResult }
    procedure TestAddToResult_BothNonEmpty;
    procedure TestAddToResult_FirstEmpty;
    procedure TestAddToResult_SecondEmpty;
  end;

implementation

procedure TTestPureUtils.SetUp;
var
  ScriptSource: string;
begin
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  { Load the pure utility functions as a self-contained test script.
    We inline just the functions we need rather than loading the full
    exam script, so these tests don't require stub controls. }
  ScriptSource :=
    'function StrToFloatDef(inString: string; inDefault: Real): Real;' + LineEnding +
    'begin' + LineEnding +
    '  try' + LineEnding +
    '    result := StrToFloat(inString);' + LineEnding +
    '  except' + LineEnding +
    '    result := inDefault;' + LineEnding +
    '  end;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function StrToIntDef(inString: string; inDefault: Integer): Integer;' + LineEnding +
    'begin' + LineEnding +
    '  try' + LineEnding +
    '    result := StrToInt(inString);' + LineEnding +
    '  except' + LineEnding +
    '    result := inDefault;' + LineEnding +
    '  end;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function StringReplace(inSource, inMatch, inReplace: String): String;' + LineEnding +
    'var' + LineEnding +
    '  i: Integer;' + LineEnding +
    'begin' + LineEnding +
    '  result := inSource;' + LineEnding +
    '  i := Pos(inMatch, result);' + LineEnding +
    '  while i > 0 do' + LineEnding +
    '  begin' + LineEnding +
    '    result := copy(inSource, 1, i-1) + inReplace + copy(inSource, i+length(inMatch), length(inSource));' + LineEnding +
    '    i := Pos(result, inMatch);' + LineEnding +
    '  end;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function StringReplaceAll(inSource, inMatch, inReplace: String): String;' + LineEnding +
    'var' + LineEnding +
    '  i: Integer;' + LineEnding +
    'begin' + LineEnding +
    '  result := inSource;' + LineEnding +
    '  i := Pos(inMatch, result);' + LineEnding +
    '  while (i > 0) do' + LineEnding +
    '  begin' + LineEnding +
    '    result := copy(result, 1, i-1) + inReplace + copy(result, i+length(inMatch), length(result));' + LineEnding +
    '    i := Pos(inMatch, result);' + LineEnding +
    '  end;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function InitCaps(inv: string; inReduce: Boolean): string;' + LineEnding +
    'var' + LineEnding +
    '  vDiff: Integer;' + LineEnding +
    'begin' + LineEnding +
    '  if inv <> '''' then' + LineEnding +
    '  begin' + LineEnding +
    '    vDiff := Ord(''A'') - Ord(''a'');' + LineEnding +
    '    result := inv;' + LineEnding +
    '    if inReduce then' + LineEnding +
    '    begin' + LineEnding +
    '      if (Ord(result[1]) >= Ord(''A'')) and (Ord(result[1]) <= Ord(''Z'')) then' + LineEnding +
    '        result[1] := chr(Ord(inv[1]) - vDiff);' + LineEnding +
    '    end' + LineEnding +
    '    else' + LineEnding +
    '    begin' + LineEnding +
    '      if (Ord(result[1]) >= Ord(''a'')) and (Ord(result[1]) <= Ord(''z'')) then' + LineEnding +
    '        result[1] := chr(Ord(inv[1]) + vDiff);' + LineEnding +
    '    end;' + LineEnding +
    '  end' + LineEnding +
    '  else' + LineEnding +
    '    result := '''';' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function IncludeComma(inString: string): string;' + LineEnding +
    'var' + LineEnding +
    '  v1: string;' + LineEnding +
    'begin' + LineEnding +
    '  v1 := '''';' + LineEnding +
    '  if Length(inString) > 0 then' + LineEnding +
    '    v1 := inString + '', '';' + LineEnding +
    '  result := v1;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function AddFullStop(inStr: String): String;' + LineEnding +
    'var' + LineEnding +
    '  vt: String;' + LineEnding +
    'begin' + LineEnding +
    '  vt := Trim(inStr);' + LineEnding +
    '  if vt <> '''' then' + LineEnding +
    '  begin' + LineEnding +
    '    if vt[length(vt)] <> ''.'' then' + LineEnding +
    '      result := vt + ''.  ''' + LineEnding +
    '    else' + LineEnding +
    '      result := inStr;' + LineEnding +
    '  end' + LineEnding +
    '  else' + LineEnding +
    '    result := '''' ' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function GetNumberString(inNumber: Integer): string;' + LineEnding +
    'begin' + LineEnding +
    '  result := '''';' + LineEnding +
    '  if inNumber = 1 then' + LineEnding +
    '    result := ''a single''' + LineEnding +
    '  else begin' + LineEnding +
    '    if inNumber = 2 then result := ''two''' + LineEnding +
    '    else if inNumber = 3 then result := ''three''' + LineEnding +
    '    else if inNumber = 4 then result := ''four''' + LineEnding +
    '    else if inNumber = 5 then result := ''five''' + LineEnding +
    '    else if inNumber = 6 then result := ''six''' + LineEnding +
    '    else if inNumber = 7 then result := ''seven''' + LineEnding +
    '    else if inNumber = 8 then result := ''eight''' + LineEnding +
    '    else if inNumber = 9 then result := ''nine''' + LineEnding +
    '    else result := IntToStr(inNumber);' + LineEnding +
    '  end;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function RemoveDecimalPointAtEnd(inStr: String): String;' + LineEnding +
    'begin' + LineEnding +
    '  result := Trim(inStr);' + LineEnding +
    '  if result[length(result)] = ''.'' then' + LineEnding +
    '    result := copy(result, 1, (length(result)-1));' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function GetIndefinateArticle(inValue: Integer; inDoCaps: Boolean): string;' + LineEnding +
    'var' + LineEnding +
    '  vTemp: string;' + LineEnding +
    'begin' + LineEnding +
    '  result := '''';' + LineEnding +
    '  vTemp := IntToStr(inValue);' + LineEnding +
    '  if ((length(vTemp) > 0) and (vTemp[1] = ''8'')) or (inValue = 11) or (inValue = 18) then' + LineEnding +
    '  begin' + LineEnding +
    '    if inDoCaps then' + LineEnding +
    '      result := ''An''' + LineEnding +
    '    else' + LineEnding +
    '      result := ''an''' + LineEnding +
    '  end' + LineEnding +
    '  else' + LineEnding +
    '  begin' + LineEnding +
    '    if inDoCaps then' + LineEnding +
    '      result := ''A''' + LineEnding +
    '    else' + LineEnding +
    '      result := ''a'';' + LineEnding +
    '  end;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function Max(A, B: Integer): Integer;' + LineEnding +
    'begin' + LineEnding +
    '  if A > B then result := A else result := B;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function Min(in1, in2: Integer): Integer;' + LineEnding +
    'begin' + LineEnding +
    '  if in1 > in2 then result := in2 else result := in1;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function AddToResult(inResult, inNew: string): string;' + LineEnding +
    'begin' + LineEnding +
    '  result := '''';' + LineEnding +
    '  if trim(inResult) <> '''' then' + LineEnding +
    '  begin' + LineEnding +
    '    if trim(inNew) <> '''' then' + LineEnding +
    '      result := inResult + '', '' + trim(inNew);' + LineEnding +
    '  end' + LineEnding +
    '  else begin' + LineEnding +
    '    if trim(inNew) <> '''' then' + LineEnding +
    '      result := trim(inNew);' + LineEnding +
    '  end;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'begin end.';

  if not FHost.CompileScript(ScriptSource) then
    Fail('Script compilation failed: ' + FHost.LastError);

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
    Fail('Script execution failed: ' + FHost.LastError);
end;

procedure TTestPureUtils.TearDown;
begin
  FHost.Free;
end;

{ --- StrToFloatDef --- }

procedure TTestPureUtils.TestStrToFloatDef_ValidFloat;
begin
  AssertEquals(3.14,
    Double(FHost.CallFunctionByName('StrToFloatDef', ['3.14', 0.0])),
    0.001);
end;

procedure TTestPureUtils.TestStrToFloatDef_InvalidReturnsDefault;
begin
  AssertEquals(42.0,
    Double(FHost.CallFunctionByName('StrToFloatDef', ['not_a_number', 42.0])),
    0.001);
end;

procedure TTestPureUtils.TestStrToFloatDef_EmptyReturnsDefault;
begin
  AssertEquals(0.0,
    Double(FHost.CallFunctionByName('StrToFloatDef', ['', 0.0])),
    0.001);
end;

{ --- StrToIntDef --- }

procedure TTestPureUtils.TestStrToIntDef_ValidInt;
begin
  AssertEquals(42,
    Integer(FHost.CallFunctionByName('StrToIntDef', ['42', 0])));
end;

procedure TTestPureUtils.TestStrToIntDef_InvalidReturnsDefault;
begin
  AssertEquals(-1,
    Integer(FHost.CallFunctionByName('StrToIntDef', ['abc', -1])));
end;

{ --- StringReplace --- }

procedure TTestPureUtils.TestStringReplace_BasicReplace;
begin
  AssertEquals('hello world',
    String(FHost.CallFunctionByName('StringReplace', ['hello there', 'there', 'world'])));
end;

{ --- StringReplaceAll --- }

procedure TTestPureUtils.TestStringReplaceAll_MultipleOccurrences;
begin
  AssertEquals('b-b-b',
    String(FHost.CallFunctionByName('StringReplaceAll', ['a-a-a', 'a', 'b'])));
end;

procedure TTestPureUtils.TestStringReplaceAll_NoMatch;
begin
  AssertEquals('hello',
    String(FHost.CallFunctionByName('StringReplaceAll', ['hello', 'xyz', 'abc'])));
end;

{ --- InitCaps --- }

procedure TTestPureUtils.TestInitCaps_Capitalize;
begin
  AssertEquals('Hello',
    String(FHost.CallFunctionByName('InitCaps', ['hello', False])));
end;

procedure TTestPureUtils.TestInitCaps_Reduce;
begin
  AssertEquals('hello',
    String(FHost.CallFunctionByName('InitCaps', ['Hello', True])));
end;

procedure TTestPureUtils.TestInitCaps_EmptyString;
begin
  AssertEquals('',
    String(FHost.CallFunctionByName('InitCaps', ['', False])));
end;

{ --- IncludeComma --- }

procedure TTestPureUtils.TestIncludeComma_NonEmpty;
begin
  AssertEquals('hello, ',
    String(FHost.CallFunctionByName('IncludeComma', ['hello'])));
end;

procedure TTestPureUtils.TestIncludeComma_Empty;
begin
  AssertEquals('',
    String(FHost.CallFunctionByName('IncludeComma', [''])));
end;

{ --- AddFullStop --- }

procedure TTestPureUtils.TestAddFullStop_NoExistingStop;
begin
  AssertEquals('hello.  ',
    String(FHost.CallFunctionByName('AddFullStop', ['hello'])));
end;

procedure TTestPureUtils.TestAddFullStop_AlreadyHasStop;
begin
  AssertEquals('hello.',
    String(FHost.CallFunctionByName('AddFullStop', ['hello.'])));
end;

procedure TTestPureUtils.TestAddFullStop_EmptyString;
begin
  AssertEquals('',
    String(FHost.CallFunctionByName('AddFullStop', [''])));
end;

{ --- GetNumberString --- }

procedure TTestPureUtils.TestGetNumberString_One;
begin
  AssertEquals('a single',
    String(FHost.CallFunctionByName('GetNumberString', [1])));
end;

procedure TTestPureUtils.TestGetNumberString_Five;
begin
  AssertEquals('five',
    String(FHost.CallFunctionByName('GetNumberString', [5])));
end;

procedure TTestPureUtils.TestGetNumberString_Ten;
begin
  AssertEquals('10',
    String(FHost.CallFunctionByName('GetNumberString', [10])));
end;

{ --- RemoveDecimalPointAtEnd --- }

procedure TTestPureUtils.TestRemoveDecimalPointAtEnd_HasTrailingDot;
begin
  AssertEquals('42',
    String(FHost.CallFunctionByName('RemoveDecimalPointAtEnd', ['42.'])));
end;

procedure TTestPureUtils.TestRemoveDecimalPointAtEnd_NoDot;
begin
  AssertEquals('42',
    String(FHost.CallFunctionByName('RemoveDecimalPointAtEnd', ['42'])));
end;

{ --- GetIndefinateArticle --- }

procedure TTestPureUtils.TestGetIndefinateArticle_Eight;
begin
  AssertEquals('an',
    String(FHost.CallFunctionByName('GetIndefinateArticle', [8, False])));
end;

procedure TTestPureUtils.TestGetIndefinateArticle_Eleven;
begin
  AssertEquals('an',
    String(FHost.CallFunctionByName('GetIndefinateArticle', [11, False])));
end;

procedure TTestPureUtils.TestGetIndefinateArticle_Five;
begin
  AssertEquals('a',
    String(FHost.CallFunctionByName('GetIndefinateArticle', [5, False])));
end;

procedure TTestPureUtils.TestGetIndefinateArticle_Caps;
begin
  AssertEquals('An',
    String(FHost.CallFunctionByName('GetIndefinateArticle', [8, True])));
end;

{ --- Max / Min --- }

procedure TTestPureUtils.TestMax_FirstLarger;
begin
  AssertEquals(10, Integer(FHost.CallFunctionByName('Max', [10, 5])));
end;

procedure TTestPureUtils.TestMax_SecondLarger;
begin
  AssertEquals(10, Integer(FHost.CallFunctionByName('Max', [5, 10])));
end;

procedure TTestPureUtils.TestMin_FirstSmaller;
begin
  AssertEquals(3, Integer(FHost.CallFunctionByName('Min', [3, 7])));
end;

procedure TTestPureUtils.TestMin_SecondSmaller;
begin
  AssertEquals(3, Integer(FHost.CallFunctionByName('Min', [7, 3])));
end;

{ --- AddToResult --- }

procedure TTestPureUtils.TestAddToResult_BothNonEmpty;
begin
  AssertEquals('hello, world',
    String(FHost.CallFunctionByName('AddToResult', ['hello', 'world'])));
end;

procedure TTestPureUtils.TestAddToResult_FirstEmpty;
begin
  AssertEquals('world',
    String(FHost.CallFunctionByName('AddToResult', ['', 'world'])));
end;

procedure TTestPureUtils.TestAddToResult_SecondEmpty;
begin
  AssertEquals('',
    String(FHost.CallFunctionByName('AddToResult', ['hello', ''])));
end;

initialization
  RegisterTest('PureUtils', TTestPureUtils);

end.
```

- [ ] **Step 5: Build and run the tests**

```bash
cd Scripts/tests/pascal
make build
./TestRunner --all --format=plain
```

Expected: All tests pass. If there are PascalScript compilation issues (built-in function conflicts, syntax differences), fix them iteratively:
- If `Pos`, `Copy`, `Length`, `Ord`, `Chr` cause "duplicate" errors in PSRegistration, remove those registrations — they're PascalScript built-ins.
- If `Format` with `array of const` doesn't work, register per-arity overloads or use a string-building workaround.
- If `CallFunctionByName` Variant passing fails, switch to `TPSScript.ExecuteFunction` from `uPSComponent`.

- [ ] **Step 6: Commit**

```bash
git add Scripts/tests/pascal/Makefile Scripts/tests/pascal/TestRunner.pas \
  Scripts/tests/pascal/src/PSRegistration.pas Scripts/tests/pascal/tests/TestPureUtils.pas
git commit -m "feat: add test runner with pure utility function tests"
```

---

### Task 4: Gestational Age Tests

**Files:**
- Create: `Scripts/tests/pascal/tests/TestGestationalAge.pas`
- Modify: `Scripts/tests/pascal/TestRunner.pas` (add unit to uses)

- [ ] **Step 1: Create TestGestationalAge.pas**

Create `Scripts/tests/pascal/tests/TestGestationalAge.pas`:
```pascal
unit TestGestationalAge;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration,
  uPSCompiler, uPSRuntime, uPSUtils;

type
  TTestGestationalAge = class(TTestCase)
  private
    FHost: TScriptHost;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    { GetWeeksFromDueDate }
    procedure TestGetWeeksFromDueDate_20Weeks;
    procedure TestGetWeeksFromDueDate_40Weeks;
    procedure TestGetWeeksFromDueDate_12Weeks;

    { GetDaysFromDueDate }
    procedure TestGetDaysFromDueDate_ExactWeek;
    procedure TestGetDaysFromDueDate_MidWeek;

    { GetWeeksFromLMPDate }
    procedure TestGetWeeksFromLMPDate_10Weeks;

    { GetDaysFromLMPDate }
    procedure TestGetDaysFromLMPDate_3Days;
  end;

implementation

procedure TTestGestationalAge.SetUp;
var
  ScriptSource: string;
begin
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  ScriptSource :=
    'function GetWeeksFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'var v1: Integer;' + LineEnding +
    'begin' + LineEnding +
    '  v1 := (trunc(inEDDDate) - 280);' + LineEnding +
    '  result := (trunc(inExamDate) - v1) div 7;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function GetDaysFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'var v1: Integer;' + LineEnding +
    'begin' + LineEnding +
    '  v1 := (trunc(inEDDDate) - 280);' + LineEnding +
    '  result := (trunc(inExamDate) - v1) mod 7;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function GetWeeksFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'begin' + LineEnding +
    '  result := (trunc(inExamDate) - Trunc(inLMPDate)) div 7;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'function GetDaysFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'begin' + LineEnding +
    '  result := (trunc(inExamDate) - Trunc(inLMPDate)) mod 7;' + LineEnding +
    'end;' + LineEnding +
    '' + LineEnding +
    'begin end.';

  if not FHost.CompileScript(ScriptSource) then
    Fail('Script compilation failed: ' + FHost.LastError);

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
    Fail('Script execution failed: ' + FHost.LastError);
end;

procedure TTestGestationalAge.TearDown;
begin
  FHost.Free;
end;

{ EDD = LMP + 280 days.
  So if LMP was 140 days before exam, that's 20 weeks exactly.
  EDD would be LMP + 280 = exam + 140.
  Use concrete dates: LMP = day 1000, exam = day 1140, EDD = day 1280. }

procedure TTestGestationalAge.TestGetWeeksFromDueDate_20Weeks;
var
  EDD, Exam: Double;
begin
  { LMP = 1000, Exam = 1140 (140 days later = 20 weeks) }
  { EDD = LMP + 280 = 1280 }
  EDD := 1280.0;
  Exam := 1140.0;
  AssertEquals(20, Integer(FHost.CallFunctionByName('GetWeeksFromDueDate', [EDD, Exam])));
end;

procedure TTestGestationalAge.TestGetWeeksFromDueDate_40Weeks;
var
  EDD, Exam: Double;
begin
  { Full term: exam on due date. LMP = EDD - 280. weeks = 280 div 7 = 40 }
  EDD := 1280.0;
  Exam := 1280.0;
  AssertEquals(40, Integer(FHost.CallFunctionByName('GetWeeksFromDueDate', [EDD, Exam])));
end;

procedure TTestGestationalAge.TestGetWeeksFromDueDate_12Weeks;
var
  EDD, Exam: Double;
begin
  { 12 weeks = 84 days from LMP. LMP = 1000, Exam = 1084, EDD = 1280 }
  EDD := 1280.0;
  Exam := 1084.0;
  AssertEquals(12, Integer(FHost.CallFunctionByName('GetWeeksFromDueDate', [EDD, Exam])));
end;

procedure TTestGestationalAge.TestGetDaysFromDueDate_ExactWeek;
var
  EDD, Exam: Double;
begin
  { Exactly 20 weeks = 140 days. 140 mod 7 = 0 }
  EDD := 1280.0;
  Exam := 1140.0;
  AssertEquals(0, Integer(FHost.CallFunctionByName('GetDaysFromDueDate', [EDD, Exam])));
end;

procedure TTestGestationalAge.TestGetDaysFromDueDate_MidWeek;
var
  EDD, Exam: Double;
begin
  { 20 weeks + 3 days = 143 days. 143 mod 7 = 3 }
  EDD := 1280.0;
  Exam := 1143.0;
  AssertEquals(3, Integer(FHost.CallFunctionByName('GetDaysFromDueDate', [EDD, Exam])));
end;

procedure TTestGestationalAge.TestGetWeeksFromLMPDate_10Weeks;
var
  LMP, Exam: Double;
begin
  { 70 days from LMP = 10 weeks }
  LMP := 1000.0;
  Exam := 1070.0;
  AssertEquals(10, Integer(FHost.CallFunctionByName('GetWeeksFromLMPDate', [LMP, Exam])));
end;

procedure TTestGestationalAge.TestGetDaysFromLMPDate_3Days;
var
  LMP, Exam: Double;
begin
  { 73 days = 10 weeks + 3 days. 73 mod 7 = 3 }
  LMP := 1000.0;
  Exam := 1073.0;
  AssertEquals(3, Integer(FHost.CallFunctionByName('GetDaysFromLMPDate', [LMP, Exam])));
end;

initialization
  RegisterTest('GestationalAge', TTestGestationalAge);

end.
```

- [ ] **Step 2: Add TestGestationalAge to TestRunner.pas uses clause**

In `Scripts/tests/pascal/TestRunner.pas`, change:
```pascal
  TestPureUtils;
```
to:
```pascal
  TestPureUtils,
  TestGestationalAge;
```

- [ ] **Step 3: Build and run**

```bash
cd Scripts/tests/pascal && make test
```

Expected: All gestational age tests pass.

- [ ] **Step 4: Commit**

```bash
git add Scripts/tests/pascal/tests/TestGestationalAge.pas Scripts/tests/pascal/TestRunner.pas
git commit -m "test: add gestational age calculation tests"
```

---

### Task 5: Stub Controls & PascalScript Registration

**Files:**
- Create: `Scripts/tests/pascal/src/StubControls.pas`
- Modify: `Scripts/tests/pascal/src/PSRegistration.pas` (add stub registration)

This is the largest infrastructure task — it creates all the stub DevExpress control classes and registers them with PascalScript so the full exam scripts can compile.

- [ ] **Step 1: Create StubControls.pas**

Create `Scripts/tests/pascal/src/StubControls.pas`:
```pascal
unit StubControls;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Contnrs;

type
  { Forward declarations }
  TStubComponent = class;

  { ----- Base Component ----- }

  TStubComponent = class(TComponent)
  private
    FEnabled: Boolean;
    FVisible: Boolean;
    FTag: Integer;
    FChildren: TList;
    FParent: TStubComponent;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddChild(AChild: TStubComponent);
    function GetControlCount: Integer;
    function GetControl(Index: Integer): TStubComponent;
    property Enabled: Boolean read FEnabled write FEnabled;
    property Visible: Boolean read FVisible write FVisible;
    property Tag: Integer read FTag write FTag;
    property Parent: TStubComponent read FParent write FParent;
    property ControlCount: Integer read GetControlCount;
    property Controls[Index: Integer]: TStubComponent read GetControl;
  end;

  { ----- Properties sub-objects ----- }

  TStubItems = class
  private
    FItems: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function GetCount: Integer;
    function GetItem(Index: Integer): string;
    procedure Add(const S: string);
    procedure Clear;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: string read GetItem; default;
  end;

  TStubProperties = class
  private
    FItems: TStubItems;
    FActivePage: TStubComponent;
    FOnChange: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Items: TStubItems read FItems;
    property ActivePage: TStubComponent read FActivePage write FActivePage;
    property OnChange: string read FOnChange write FOnChange;
  end;

  { ----- Specific Control Stubs ----- }

  TStubTextEdit = class(TStubComponent)
  private
    FText: string;
  public
    property Text: string read FText write FText;
  end;

  TStubCheckBox = class(TStubComponent)
  private
    FChecked: Boolean;
  public
    property Checked: Boolean read FChecked write FChecked;
  end;

  TStubComboBox = class(TStubComponent)
  private
    FItemIndex: Integer;
    FText: string;
    FProperties: TStubProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property Text: string read FText write FText;
    property Properties: TStubProperties read FProperties;
  end;

  TStubCheckComboBox = class(TStubComponent)
  private
    FStates: array of Integer;
    FShortDescriptions: array of string;
    FProperties: TStubProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetState(Index: Integer): Integer;
    procedure SetState(Index: Integer; Value: Integer);
    function GetShortDescription(Index: Integer): string;
    procedure SetItems(const Descriptions: array of string;
      const States: array of Integer);
    property Properties: TStubProperties read FProperties;
  end;

  TStubSpinEdit = class(TStubComponent)
  private
    FValue: Double;
  public
    property Value: Double read FValue write FValue;
  end;

  TStubDateEdit = class(TStubComponent)
  private
    FDate: TDateTime;
  public
    property Date: TDateTime read FDate write FDate;
  end;

  TStubGroupBox = class(TStubComponent)
  private
    FHeight: Integer;
    FCaption: string;
  public
    property Height: Integer read FHeight write FHeight;
    property Caption: string read FCaption write FCaption;
  end;

  TStubPageControl = class(TStubComponent)
  private
    FProperties: TStubProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Properties: TStubProperties read FProperties;
  end;

  TStubTabSheet = class(TStubComponent)
  private
    FTabVisible: Boolean;
  public
    property TabVisible: Boolean read FTabVisible write FTabVisible;
  end;

  TStubLabel = class(TStubComponent)
  private
    FCaption: string;
  public
    property Caption: string read FCaption write FCaption;
  end;

  { ----- Component Registry ----- }

  TComponentRegistry = class
  private
    FComponents: TFPHashObjectList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterControl(const AName: string; AComponent: TStubComponent);
    function FindComponent(const AName: string): TStubComponent;
    procedure Clear;

    { Typed convenience accessors }
    function TextEdit(const AName: string): TStubTextEdit;
    function CheckBox(const AName: string): TStubCheckBox;
    function ComboBox(const AName: string): TStubComboBox;
    function CheckComboBox(const AName: string): TStubCheckComboBox;
    function SpinEdit(const AName: string): TStubSpinEdit;
    function DateEdit(const AName: string): TStubDateEdit;
    function GroupBox(const AName: string): TStubGroupBox;
    function PageControl(const AName: string): TStubPageControl;
    function TabSheet(const AName: string): TStubTabSheet;
    function Lbl(const AName: string): TStubLabel;

    { Create and register in one call }
    function AddTextEdit(const AName: string): TStubTextEdit;
    function AddCheckBox(const AName: string): TStubCheckBox;
    function AddComboBox(const AName: string): TStubComboBox;
    function AddCheckComboBox(const AName: string): TStubCheckComboBox;
    function AddSpinEdit(const AName: string): TStubSpinEdit;
    function AddDateEdit(const AName: string): TStubDateEdit;
    function AddGroupBox(const AName: string): TStubGroupBox;
    function AddPageControl(const AName: string): TStubPageControl;
    function AddTabSheet(const AName: string): TStubTabSheet;
    function AddLabel(const AName: string): TStubLabel;
  end;

implementation

{ ----- TStubComponent ----- }

constructor TStubComponent.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := True;
  FVisible := True;
  FTag := 0;
  FChildren := TList.Create;
  FParent := nil;
end;

destructor TStubComponent.Destroy;
begin
  FChildren.Free;
  inherited Destroy;
end;

procedure TStubComponent.AddChild(AChild: TStubComponent);
begin
  FChildren.Add(AChild);
  AChild.FParent := Self;
end;

function TStubComponent.GetControlCount: Integer;
begin
  Result := FChildren.Count;
end;

function TStubComponent.GetControl(Index: Integer): TStubComponent;
begin
  Result := TStubComponent(FChildren[Index]);
end;

{ ----- TStubItems ----- }

constructor TStubItems.Create;
begin
  inherited Create;
  FItems := TStringList.Create;
end;

destructor TStubItems.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

function TStubItems.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TStubItems.GetItem(Index: Integer): string;
begin
  Result := FItems[Index];
end;

procedure TStubItems.Add(const S: string);
begin
  FItems.Add(S);
end;

procedure TStubItems.Clear;
begin
  FItems.Clear;
end;

{ ----- TStubProperties ----- }

constructor TStubProperties.Create;
begin
  inherited Create;
  FItems := TStubItems.Create;
  FActivePage := nil;
  FOnChange := '';
end;

destructor TStubProperties.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

{ ----- TStubComboBox ----- }

constructor TStubComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProperties := TStubProperties.Create;
  FItemIndex := -1;
end;

destructor TStubComboBox.Destroy;
begin
  FProperties.Free;
  inherited Destroy;
end;

{ ----- TStubCheckComboBox ----- }

constructor TStubCheckComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProperties := TStubProperties.Create;
end;

destructor TStubCheckComboBox.Destroy;
begin
  FProperties.Free;
  inherited Destroy;
end;

function TStubCheckComboBox.GetState(Index: Integer): Integer;
begin
  if (Index >= 0) and (Index < Length(FStates)) then
    Result := FStates[Index]
  else
    Result := 0;
end;

procedure TStubCheckComboBox.SetState(Index: Integer; Value: Integer);
begin
  if (Index >= 0) and (Index < Length(FStates)) then
    FStates[Index] := Value;
end;

function TStubCheckComboBox.GetShortDescription(Index: Integer): string;
begin
  if (Index >= 0) and (Index < Length(FShortDescriptions)) then
    Result := FShortDescriptions[Index]
  else
    Result := '';
end;

procedure TStubCheckComboBox.SetItems(const Descriptions: array of string;
  const States: array of Integer);
var
  i: Integer;
begin
  SetLength(FStates, Length(States));
  SetLength(FShortDescriptions, Length(Descriptions));
  FProperties.Items.Clear;
  for i := 0 to High(Descriptions) do
  begin
    FShortDescriptions[i] := Descriptions[i];
    FProperties.Items.Add(Descriptions[i]);
  end;
  for i := 0 to High(States) do
    FStates[i] := States[i];
end;

{ ----- TStubPageControl ----- }

constructor TStubPageControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProperties := TStubProperties.Create;
end;

destructor TStubPageControl.Destroy;
begin
  FProperties.Free;
  inherited Destroy;
end;

{ ----- TComponentRegistry ----- }

constructor TComponentRegistry.Create;
begin
  inherited Create;
  FComponents := TFPHashObjectList.Create(True); // Owns objects
end;

destructor TComponentRegistry.Destroy;
begin
  FComponents.Free;
  inherited Destroy;
end;

procedure TComponentRegistry.RegisterControl(const AName: string;
  AComponent: TStubComponent);
begin
  AComponent.Name := AName;
  FComponents.Add(UpperCase(AName), AComponent);
end;

function TComponentRegistry.FindComponent(const AName: string): TStubComponent;
var
  Idx: Integer;
begin
  Idx := FComponents.FindIndexOf(UpperCase(AName));
  if Idx >= 0 then
    Result := TStubComponent(FComponents.Items[Idx])
  else
    Result := nil;
end;

procedure TComponentRegistry.Clear;
begin
  FComponents.Clear;
end;

{ Typed accessors }

function TComponentRegistry.TextEdit(const AName: string): TStubTextEdit;
begin
  Result := FindComponent(AName) as TStubTextEdit;
end;

function TComponentRegistry.CheckBox(const AName: string): TStubCheckBox;
begin
  Result := FindComponent(AName) as TStubCheckBox;
end;

function TComponentRegistry.ComboBox(const AName: string): TStubComboBox;
begin
  Result := FindComponent(AName) as TStubComboBox;
end;

function TComponentRegistry.CheckComboBox(const AName: string): TStubCheckComboBox;
begin
  Result := FindComponent(AName) as TStubCheckComboBox;
end;

function TComponentRegistry.SpinEdit(const AName: string): TStubSpinEdit;
begin
  Result := FindComponent(AName) as TStubSpinEdit;
end;

function TComponentRegistry.DateEdit(const AName: string): TStubDateEdit;
begin
  Result := FindComponent(AName) as TStubDateEdit;
end;

function TComponentRegistry.GroupBox(const AName: string): TStubGroupBox;
begin
  Result := FindComponent(AName) as TStubGroupBox;
end;

function TComponentRegistry.PageControl(const AName: string): TStubPageControl;
begin
  Result := FindComponent(AName) as TStubPageControl;
end;

function TComponentRegistry.TabSheet(const AName: string): TStubTabSheet;
begin
  Result := FindComponent(AName) as TStubTabSheet;
end;

function TComponentRegistry.Lbl(const AName: string): TStubLabel;
begin
  Result := FindComponent(AName) as TStubLabel;
end;

{ Create-and-register helpers }

function TComponentRegistry.AddTextEdit(const AName: string): TStubTextEdit;
begin
  Result := TStubTextEdit.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddCheckBox(const AName: string): TStubCheckBox;
begin
  Result := TStubCheckBox.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddComboBox(const AName: string): TStubComboBox;
begin
  Result := TStubComboBox.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddCheckComboBox(const AName: string): TStubCheckComboBox;
begin
  Result := TStubCheckComboBox.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddSpinEdit(const AName: string): TStubSpinEdit;
begin
  Result := TStubSpinEdit.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddDateEdit(const AName: string): TStubDateEdit;
begin
  Result := TStubDateEdit.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddGroupBox(const AName: string): TStubGroupBox;
begin
  Result := TStubGroupBox.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddPageControl(const AName: string): TStubPageControl;
begin
  Result := TStubPageControl.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddTabSheet(const AName: string): TStubTabSheet;
begin
  Result := TStubTabSheet.Create(nil);
  RegisterControl(AName, Result);
end;

function TComponentRegistry.AddLabel(const AName: string): TStubLabel;
begin
  Result := TStubLabel.Create(nil);
  RegisterControl(AName, Result);
end;

end.
```

- [ ] **Step 2: Add stub class registration to PSRegistration.pas**

Add to the `RegisterCompileTimeStd` procedure in `PSRegistration.pas` — append after the existing function registrations:

```pascal
  { Register TWinControl for FindComponent and type casts }
  with Compiler.AddClassN(Compiler.FindClass('TComponent'), 'TWinControl') do
  begin
    RegisterMethod('function FindComponent(AName: string): TComponent');
    RegisterProperty('ControlCount', 'Integer', iptR);
    RegisterProperty('Controls', 'TComponent Integer', iptR);
  end;

  { Register DevExpress control types }
  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxTextEdit') do
  begin
    RegisterProperty('Text', 'string', iptRW);
    RegisterProperty('Enabled', 'Boolean', iptRW);
    RegisterProperty('Visible', 'Boolean', iptRW);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxMaskEdit') do
  begin
    RegisterProperty('Text', 'string', iptRW);
    RegisterProperty('Enabled', 'Boolean', iptRW);
    RegisterProperty('Visible', 'Boolean', iptRW);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxCheckBox') do
  begin
    RegisterProperty('Checked', 'Boolean', iptRW);
    RegisterProperty('Enabled', 'Boolean', iptRW);
    RegisterProperty('Visible', 'Boolean', iptRW);
    RegisterProperty('Parent', 'TWinControl', iptR);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxComboBox') do
  begin
    RegisterProperty('ItemIndex', 'Integer', iptRW);
    RegisterProperty('Text', 'string', iptRW);
    RegisterProperty('Enabled', 'Boolean', iptRW);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxSpinEdit') do
  begin
    RegisterProperty('Value', 'Double', iptRW);
    RegisterProperty('Enabled', 'Boolean', iptRW);
    RegisterProperty('Visible', 'Boolean', iptRW);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxDateEdit') do
  begin
    RegisterProperty('Date', 'TDateTime', iptRW);
    RegisterProperty('Enabled', 'Boolean', iptRW);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxGroupBox') do
  begin
    RegisterProperty('Height', 'Integer', iptRW);
    RegisterProperty('Visible', 'Boolean', iptRW);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxLabel') do
  begin
    RegisterProperty('Caption', 'string', iptRW);
    RegisterProperty('Visible', 'Boolean', iptRW);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxTabSheet') do
  begin
    RegisterProperty('TabVisible', 'Boolean', iptRW);
    RegisterProperty('Owner', 'TComponent', iptR);
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TcxPageControl') do
  begin
  end;

  with Compiler.AddClassN(Compiler.FindClass('TWinControl'), 'TAdvTreeComboBox') do
  begin
    RegisterProperty('Text', 'string', iptRW);
    RegisterProperty('Selection', 'Integer', iptRW);
    RegisterProperty('Enabled', 'Boolean', iptRW);
  end;
```

**Important:** The `Properties` nested object pattern (`cbEDDPrinciple.Properties.ActivePage`) requires either registering `Properties` as a property that returns a sub-object, or restructuring. PascalScript may need the property chain registered. If `Properties.X` doesn't work as a nested access, flatten it: register `ActivePage`, `OnChange`, etc. directly on the control class and adjust the scripts through GPP macro substitution. This is the most likely area to need experimentation.

- [ ] **Step 3: Add runtime property helpers to PSRegistration.pas**

Add runtime registration for each stub property. This is boilerplate but necessary — add to the `RegisterRuntimeStd` procedure:

```pascal
  { Import runtime class implementations }
  with ClassImporter.Add(TStubTextEdit) do
  begin
    RegisterPropertyHelper(@TStubTextEdit_TextR, @TStubTextEdit_TextW, 'TEXT');
    RegisterPropertyHelper(@TStubTextEdit_EnabledR, @TStubTextEdit_EnabledW, 'ENABLED');
    RegisterPropertyHelper(@TStubTextEdit_VisibleR, @TStubTextEdit_VisibleW, 'VISIBLE');
  end;

  // ... repeat for each stub class
```

Each property needs a reader and writer procedure:
```pascal
procedure TStubTextEdit_TextR(Self: TStubTextEdit; var T: string);
begin T := Self.Text; end;

procedure TStubTextEdit_TextW(Self: TStubTextEdit; const T: string);
begin Self.Text := T; end;

procedure TStubTextEdit_EnabledR(Self: TStubTextEdit; var T: Boolean);
begin T := Self.Enabled; end;

procedure TStubTextEdit_EnabledW(Self: TStubTextEdit; T: Boolean);
begin Self.Enabled := T; end;

procedure TStubTextEdit_VisibleR(Self: TStubTextEdit; var T: Boolean);
begin T := Self.Visible; end;

procedure TStubTextEdit_VisibleW(Self: TStubTextEdit; T: Boolean);
begin Self.Visible := T; end;
```

Follow this pattern for every property on every stub class. This is repetitive but each is 2-3 lines.

**Note:** `FindComponent` runtime registration needs to resolve against the `TComponentRegistry`. This requires the registry instance to be accessible from the property helper. The simplest approach is a global `var GRegistry: TComponentRegistry` in the PSRegistration unit, set before script execution.

- [ ] **Step 4: Verify stubs compile**

```bash
cd Scripts/tests/pascal
fpc -Fu./vendor/pascalscript/Source -Fu./src -Cn src/StubControls.pas
fpc -Fu./vendor/pascalscript/Source -Fu./src -Cn src/PSRegistration.pas
```

Expected: both compile cleanly.

- [ ] **Step 5: Commit**

```bash
git add Scripts/tests/pascal/src/StubControls.pas Scripts/tests/pascal/src/PSRegistration.pas
git commit -m "feat: add stub DevExpress controls and PascalScript registration"
```

---

### Task 6: UI-Coupled Function Tests — Clinical History & EDD

**Files:**
- Create: `Scripts/tests/pascal/tests/TestClinicalHistory.pas`
- Create: `Scripts/tests/pascal/tests/TestEDDHandling.pas`
- Modify: `Scripts/tests/pascal/TestRunner.pas` (add units to uses)

These tests validate the first UI-coupled functions using the stub controls.

- [ ] **Step 1: Create TestClinicalHistory.pas**

Create `Scripts/tests/pascal/tests/TestClinicalHistory.pas`:
```pascal
unit TestClinicalHistory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration, StubControls,
  uPSCompiler, uPSRuntime, uPSUtils;

type
  TTestClinicalHistory = class(TTestCase)
  private
    FHost: TScriptHost;
    FRegistry: TComponentRegistry;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGetClinicalIndicators_SingleSelected;
    procedure TestGetClinicalIndicators_MultipleSelected;
    procedure TestGetClinicalIndicators_NoneSelected;
    procedure TestGetClinicalIndicators_OtherSelected;
    procedure TestGetClinicalHistory_SingleSelected;
    procedure TestGetClinicalHistory_NoneReturnsEmpty;
    procedure TestReferralIndicatorsChange_EnablesOther;
    procedure TestReferralIndicatorsChange_DisablesOther;
  end;

implementation

procedure TTestClinicalHistory.SetUp;
begin
  FRegistry := TComponentRegistry.Create;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  { Register controls that clinicalHistory.pas accesses }
  FRegistry.AddCheckComboBox('cxccbReferralIndicators');
  FRegistry.AddCheckComboBox('cbClinicalHistory');
  FRegistry.AddTextEdit('edtPresentComplaintOther');
  FRegistry.AddTextEdit('edtClicnicalHistory');

  { Set the global registry so PSRegistration can resolve FindComponent }
  SetGlobalRegistry(FRegistry);

  { Load the GPP-built script containing all functions.
    The full script must compile with all stubs registered.
    For initial testing, load just the relevant functions inline. }

  { For this task, compile a script with just the functions under test
    plus their dependencies (AddFullstopToEnd). Once the full script
    loading works (Task 7), switch to loading the GPP-built file. }
  if not FHost.CompileScript(GetClinicalHistoryScript) then
    Fail('Compile failed: ' + FHost.LastError);

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  { Bind stub controls as script variables }
  BindRegistryToExec(FHost.Exec, FRegistry);

  if not FHost.Execute then
    Fail('Execute failed: ' + FHost.LastError);
end;

procedure TTestClinicalHistory.TearDown;
begin
  FHost.Free;
  FRegistry.Free;
end;

procedure TTestClinicalHistory.TestGetClinicalIndicators_SingleSelected;
var
  Combo: TStubCheckComboBox;
begin
  Combo := FRegistry.CheckComboBox('cxccbReferralIndicators');
  Combo.SetItems(
    ['Previous CS', 'Twins', 'Other'],
    [1, 0, 0]
  );

  AssertEquals('Previous CS.',
    String(FHost.CallFunctionByName('GetClinicalIndicators', [])));
end;

procedure TTestClinicalHistory.TestGetClinicalIndicators_MultipleSelected;
var
  Combo: TStubCheckComboBox;
begin
  Combo := FRegistry.CheckComboBox('cxccbReferralIndicators');
  Combo.SetItems(
    ['Previous CS', 'Bleeding', 'Other'],
    [1, 1, 0]
  );

  AssertEquals('Previous CS.  Bleeding.',
    String(FHost.CallFunctionByName('GetClinicalIndicators', [])));
end;

procedure TTestClinicalHistory.TestGetClinicalIndicators_NoneSelected;
var
  Combo: TStubCheckComboBox;
begin
  Combo := FRegistry.CheckComboBox('cxccbReferralIndicators');
  Combo.SetItems(
    ['Previous CS', 'Other'],
    [0, 0]
  );

  AssertEquals('',
    String(FHost.CallFunctionByName('GetClinicalIndicators', [])));
end;

procedure TTestClinicalHistory.TestGetClinicalIndicators_OtherSelected;
var
  Combo: TStubCheckComboBox;
begin
  Combo := FRegistry.CheckComboBox('cxccbReferralIndicators');
  Combo.SetItems(
    ['Previous CS', 'Other'],
    [0, 1]
  );
  FRegistry.TextEdit('edtPresentComplaintOther').Text := 'Custom reason';

  AssertEquals('Custom reason.',
    String(FHost.CallFunctionByName('GetClinicalIndicators', [])));
end;

procedure TTestClinicalHistory.TestGetClinicalHistory_SingleSelected;
var
  Combo: TStubCheckComboBox;
begin
  Combo := FRegistry.CheckComboBox('cbClinicalHistory');
  Combo.SetItems(
    ['Diabetes', 'Hypertension', 'Other'],
    [1, 0, 0]
  );

  AssertEquals('Diabetes.',
    String(FHost.CallFunctionByName('GetClinicalHistory', [])));
end;

procedure TTestClinicalHistory.TestGetClinicalHistory_NoneReturnsEmpty;
var
  Combo: TStubCheckComboBox;
begin
  Combo := FRegistry.CheckComboBox('cbClinicalHistory');
  Combo.SetItems(
    ['Diabetes', 'Other'],
    [0, 0]
  );

  AssertEquals('',
    String(FHost.CallFunctionByName('GetClinicalHistory', [])));
end;

procedure TTestClinicalHistory.TestReferralIndicatorsChange_EnablesOther;
var
  Combo: TStubCheckComboBox;
  Edit: TStubTextEdit;
begin
  Combo := FRegistry.CheckComboBox('cxccbReferralIndicators');
  Combo.SetItems(['Previous CS', 'Other'], [0, 1]);

  Edit := FRegistry.TextEdit('edtPresentComplaintOther');
  Edit.Enabled := False;

  FHost.CallProcedureByName('cxccbReferralIndicatorsChange', [Null]);

  AssertTrue('Other field should be enabled', Edit.Enabled);
end;

procedure TTestClinicalHistory.TestReferralIndicatorsChange_DisablesOther;
var
  Combo: TStubCheckComboBox;
  Edit: TStubTextEdit;
begin
  Combo := FRegistry.CheckComboBox('cxccbReferralIndicators');
  Combo.SetItems(['Previous CS', 'Other'], [0, 0]);

  Edit := FRegistry.TextEdit('edtPresentComplaintOther');
  Edit.Enabled := True;

  FHost.CallProcedureByName('cxccbReferralIndicatorsChange', [Null]);

  AssertFalse('Other field should be disabled', Edit.Enabled);
end;

initialization
  RegisterTest('ClinicalHistory', TTestClinicalHistory);

end.
```

**Note:** The `GetClinicalHistoryScript` function and `BindRegistryToExec` procedure referenced in `SetUp` need to be implemented. `GetClinicalHistoryScript` returns a string containing the functions under test (inline from the source files, with GPP directives stripped). `BindRegistryToExec` calls `SetPointerToData` for each registered control. These should be added to `PSRegistration.pas` as helper functions. Once the full GPP-built script loads successfully, replace the inline script with `FHost.LoadAndCompileFile('build/earlyT1Singleton.pas')`.

- [ ] **Step 2: Create TestEDDHandling.pas**

Create `Scripts/tests/pascal/tests/TestEDDHandling.pas`:
```pascal
unit TestEDDHandling;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration, StubControls,
  uPSCompiler, uPSRuntime, uPSUtils;

type
  TTestEDDHandling = class(TTestCase)
  private
    FHost: TScriptHost;
    FRegistry: TComponentRegistry;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCbEDDPrinciple_StatedEDD;
    procedure TestCbEDDPrinciple_LMP;
    procedure TestCbEDDPrinciple_NoEDD;
    procedure TestCbEDDPrinciple_IVF;
    procedure TestCbLMPDateOnChange_SetsEDD;
    procedure TestCbLMPDateOnChange_IgnoresIfNotLMP;
  end;

implementation

procedure TTestEDDHandling.SetUp;
begin
  FRegistry := TComponentRegistry.Create;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  { Register controls that eddHandling.pas accesses }
  FRegistry.AddComboBox('cbEDDPrinciple');
  FRegistry.AddGroupBox('gbEDDDating');
  FRegistry.AddLabel('lblMedication');
  FRegistry.AddPageControl('pcEDDPrinciple');
  FRegistry.AddTabSheet('tsMenstrualEDD');
  FRegistry.AddTabSheet('tsStatedEDD');
  FRegistry.AddTabSheet('tsEstEDD');
  FRegistry.AddTabSheet('tsTimedEDD');
  FRegistry.AddTabSheet('tsIVFEDD');
  FRegistry.AddDateEdit('deLMPDate');
  FRegistry.AddDateEdit('deMenstrualEDD');
  FRegistry.AddDateEdit('deExamDate');
  FRegistry.AddDateEdit('deStatedEDD');
  FRegistry.AddSpinEdit('seStatedEDDGestAgeWeeks');
  FRegistry.AddSpinEdit('seStatedEDDGestAgeDays');

  SetGlobalRegistry(FRegistry);

  { Load script with eddHandling functions + dependencies }
  if not FHost.CompileScript(GetEDDHandlingScript) then
    Fail('Compile failed: ' + FHost.LastError);

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);
  BindRegistryToExec(FHost.Exec, FRegistry);

  if not FHost.Execute then
    Fail('Execute failed: ' + FHost.LastError);
end;

procedure TTestEDDHandling.TearDown;
begin
  FHost.Free;
  FRegistry.Free;
end;

procedure TTestEDDHandling.TestCbEDDPrinciple_StatedEDD;
begin
  FRegistry.ComboBox('cbEDDPrinciple').ItemIndex := 0;
  FHost.CallProcedureByName('cbEDDPrincipleOnChange', [Null]);

  AssertEquals('gbEDDDating height', 80, FRegistry.GroupBox('gbEDDDating').Height);
  AssertTrue('lblMedication visible', FRegistry.Lbl('lblMedication').Visible);
end;

procedure TTestEDDHandling.TestCbEDDPrinciple_LMP;
begin
  FRegistry.ComboBox('cbEDDPrinciple').ItemIndex := 2;
  FHost.CallProcedureByName('cbEDDPrincipleOnChange', [Null]);

  AssertEquals('gbEDDDating height', 80, FRegistry.GroupBox('gbEDDDating').Height);
  AssertTrue('lblMedication visible', FRegistry.Lbl('lblMedication').Visible);
end;

procedure TTestEDDHandling.TestCbEDDPrinciple_NoEDD;
begin
  FRegistry.ComboBox('cbEDDPrinciple').ItemIndex := 1;
  FHost.CallProcedureByName('cbEDDPrincipleOnChange', [Null]);

  AssertEquals('gbEDDDating height', 47, FRegistry.GroupBox('gbEDDDating').Height);
  AssertFalse('lblMedication hidden', FRegistry.Lbl('lblMedication').Visible);
end;

procedure TTestEDDHandling.TestCbEDDPrinciple_IVF;
begin
  FRegistry.ComboBox('cbEDDPrinciple').ItemIndex := 5;
  FHost.CallProcedureByName('cbEDDPrincipleOnChange', [Null]);

  AssertEquals('gbEDDDating height', 120, FRegistry.GroupBox('gbEDDDating').Height);
end;

procedure TTestEDDHandling.TestCbLMPDateOnChange_SetsEDD;
begin
  FRegistry.ComboBox('cbEDDPrinciple').ItemIndex := 1;
  FRegistry.DateEdit('deLMPDate').Date := 45000.0; { arbitrary date value }

  FHost.CallProcedureByName('cbLMPDateOnChange', [Null]);

  AssertEquals('EDD = LMP + 280',
    45280.0, FRegistry.DateEdit('deMenstrualEDD').Date, 0.001);
end;

procedure TTestEDDHandling.TestCbLMPDateOnChange_IgnoresIfNotLMP;
begin
  FRegistry.ComboBox('cbEDDPrinciple').ItemIndex := 0; { Not LMP }
  FRegistry.DateEdit('deLMPDate').Date := 45000.0;
  FRegistry.DateEdit('deMenstrualEDD').Date := 0;

  FHost.CallProcedureByName('cbLMPDateOnChange', [Null]);

  { EDD should remain unchanged since ItemIndex != 1 }
  AssertEquals('EDD unchanged', 0.0,
    FRegistry.DateEdit('deMenstrualEDD').Date, 0.001);
end;

initialization
  RegisterTest('EDDHandling', TTestEDDHandling);

end.
```

- [ ] **Step 3: Update TestRunner.pas**

Add to the uses clause:
```pascal
  TestPureUtils,
  TestGestationalAge,
  TestClinicalHistory,
  TestEDDHandling;
```

- [ ] **Step 4: Build and run**

```bash
cd Scripts/tests/pascal && make test
```

Expected: All tests pass. The `GetClinicalHistoryScript` and `GetEDDHandlingScript` helper functions will need to be implemented in PSRegistration.pas, returning the script source with dependencies inlined.

- [ ] **Step 5: Commit**

```bash
git add Scripts/tests/pascal/tests/TestClinicalHistory.pas \
  Scripts/tests/pascal/tests/TestEDDHandling.pas \
  Scripts/tests/pascal/TestRunner.pas \
  Scripts/tests/pascal/src/PSRegistration.pas
git commit -m "test: add clinical history and EDD handling tests with stub controls"
```

---

### Task 7: Full Script Loading & Fibroid Tests

**Files:**
- Create: `Scripts/tests/pascal/tests/TestFibroids.pas`
- Modify: `Scripts/tests/pascal/Makefile` (GPP prebuild step)
- Modify: `Scripts/tests/pascal/TestRunner.pas`

This task switches from inline script strings to loading the real GPP-built exam script, and adds fibroid function tests.

- [ ] **Step 1: Test loading the full GPP-built script**

Run the GPP build:
```bash
cd Scripts && gpp -I. -o tests/pascal/build/earlyT1Singleton.pas earlyT1Singleton/script.pas
```

Try to compile it through PascalScript. If it fails, the errors will reveal which additional types/functions/globals need to be registered. Common issues:

1. **Global variables** (`GFibroidWarning`, `GLiquorWarning`, etc.) — add `var` declarations to PSRegistration
2. **Additional control names** not yet in the registry — add them
3. **`Properties` nested access** — may need to flatten or register intermediate objects
4. **Untyped `Sender` parameters** — may need to be typed as `TObject` or handled via PascalScript's variant system

Fix each issue until the full script compiles. This is the most likely step to require iteration.

- [ ] **Step 2: Create TestFibroids.pas**

Create `Scripts/tests/pascal/tests/TestFibroids.pas`:
```pascal
unit TestFibroids;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration, StubControls,
  uPSCompiler, uPSRuntime, uPSUtils;

type
  TTestFibroids = class(TTestCase)
  private
    FHost: TScriptHost;
    FRegistry: TComponentRegistry;
    procedure SetupFibroidControls;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGetFibroidCount_NoFibroids;
    procedure TestGetFibroidCount_Single;
    procedure TestGetFibroidCount_Multiple;
    procedure TestGetSingleCloseOrClear_Close;
    procedure TestGetSingleCloseOrClear_Clear;
    procedure TestGetSingleCloseOrClear_WithDistance;
    procedure TestGetSingleFibroidDimensions_ThreeDimensions;
    procedure TestGetSingleFibroidDimensions_WithVolume;
    procedure TestGetHasDistortion_True;
    procedure TestGetHasDistortion_False;
    procedure TestSpFibroidCountOnChange_ShowsCorrectBoxes;
  end;

implementation

procedure TTestFibroids.SetupFibroidControls;
var
  i: Integer;
begin
  FRegistry.AddSpinEdit('spFibroidCount');
  FRegistry.AddCheckBox('cbFibroidsVisualised');
  FRegistry.AddTabSheet('tsFibroids');

  { Create 10 fibroid group boxes with their controls }
  for i := 1 to 10 do
  begin
    FRegistry.AddGroupBox('gbFibroid' + IntToStr(i));
    FRegistry.AddSpinEdit('edtFibroidLength' + IntToStr(i));
    FRegistry.AddSpinEdit('edtFibroidWidth' + IntToStr(i));
    FRegistry.AddSpinEdit('edtFibroiddepth' + IntToStr(i));
    FRegistry.AddSpinEdit('edtFibroidVolume' + IntToStr(i));
    FRegistry.AddComboBox('cbFibriodPosition' + IntToStr(i));
    FRegistry.AddComboBox('cbFibroidsType' + IntToStr(i));
    FRegistry.AddComboBox('cbFibroidsLeftRight' + IntToStr(i));
    FRegistry.AddCheckBox('cbCavityDistortion' + IntToStr(i));
    FRegistry.AddSpinEdit('seCloseToCrevix' + IntToStr(i));
  end;
end;

procedure TTestFibroids.SetUp;
begin
  FRegistry := TComponentRegistry.Create;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  SetupFibroidControls;
  SetGlobalRegistry(FRegistry);

  { Load script - either full GPP build or inline fibroid functions }
  if not FHost.CompileScript(GetFibroidScript) then
    Fail('Compile failed: ' + FHost.LastError);

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);
  BindRegistryToExec(FHost.Exec, FRegistry);

  if not FHost.Execute then
    Fail('Execute failed: ' + FHost.LastError);
end;

procedure TTestFibroids.TearDown;
begin
  FHost.Free;
  FRegistry.Free;
end;

procedure TTestFibroids.TestGetFibroidCount_NoFibroids;
begin
  FRegistry.SpinEdit('spFibroidCount').Value := 0;
  AssertEquals('No fibroids were',
    String(FHost.CallFunctionByName('GetFibroidCount', [])));
end;

procedure TTestFibroids.TestGetFibroidCount_Single;
begin
  FRegistry.SpinEdit('spFibroidCount').Value := 1;
  { GetFibroidCount calls GetNumberString(1) = 'a single', then 'a single fibroid is' }
  AssertEquals('A single fibroid is',
    String(FHost.CallFunctionByName('GetFibroidCount', [])));
end;

procedure TTestFibroids.TestGetFibroidCount_Multiple;
begin
  FRegistry.SpinEdit('spFibroidCount').Value := 3;
  { GetNumberString(3) = 'three', then 'three fibroids are', then InitCaps }
  AssertEquals('Three fibroids are',
    String(FHost.CallFunctionByName('GetFibroidCount', [])));
end;

procedure TTestFibroids.TestGetSingleCloseOrClear_Close;
begin
  FRegistry.CheckBox('cbCavityDistortion1').Checked := True;
  FRegistry.SpinEdit('seCloseToCrevix1').Value := 0;

  AssertEquals('close to the cervix',
    String(FHost.CallFunctionByName('GetSingleCloseOrClear', [])));
end;

procedure TTestFibroids.TestGetSingleCloseOrClear_Clear;
begin
  FRegistry.CheckBox('cbCavityDistortion1').Checked := False;
  FRegistry.SpinEdit('seCloseToCrevix1').Value := 0;

  AssertEquals('clear of the cervix',
    String(FHost.CallFunctionByName('GetSingleCloseOrClear', [])));
end;

procedure TTestFibroids.TestGetSingleCloseOrClear_WithDistance;
begin
  FRegistry.CheckBox('cbCavityDistortion1').Checked := False;
  FRegistry.SpinEdit('seCloseToCrevix1').Value := 15;

  AssertEquals('clear of the cervix (within 15 mm)',
    String(FHost.CallFunctionByName('GetSingleCloseOrClear', [])));
end;

procedure TTestFibroids.TestGetSingleFibroidDimensions_ThreeDimensions;
begin
  FRegistry.SpinEdit('edtFibroidLength1').Value := 25;
  FRegistry.SpinEdit('edtFibroidWidth1').Value := 20;
  FRegistry.SpinEdit('edtFibroiddepth1').Value := 15;
  FRegistry.SpinEdit('edtFibroidVolume1').Value := 0;

  AssertEquals(' 25 x 20 x 15mm',
    String(FHost.CallFunctionByName('GetSingleFibroidDimensions', [])));
end;

procedure TTestFibroids.TestGetSingleFibroidDimensions_WithVolume;
begin
  FRegistry.SpinEdit('edtFibroidLength1').Value := 25;
  FRegistry.SpinEdit('edtFibroidWidth1').Value := 20;
  FRegistry.SpinEdit('edtFibroiddepth1').Value := 15;
  FRegistry.SpinEdit('edtFibroidVolume1').Value := 3.9;

  AssertEquals(' 25 x 20 x 15mm (vol. 3.9 cc)',
    String(FHost.CallFunctionByName('GetSingleFibroidDimensions', [])));
end;

procedure TTestFibroids.TestGetHasDistortion_True;
begin
  FRegistry.SpinEdit('spFibroidCount').Value := 2;

  { Set up tsFibroids.Owner to enable FindComponent }
  FRegistry.CheckBox('cbCavityDistortion1').Checked := False;
  FRegistry.CheckBox('cbCavityDistortion1').Enabled := True;
  FRegistry.CheckBox('cbCavityDistortion2').Checked := True;
  FRegistry.CheckBox('cbCavityDistortion2').Enabled := True;

  AssertTrue(Boolean(FHost.CallFunctionByName('GetHasDistortion', [])));
end;

procedure TTestFibroids.TestGetHasDistortion_False;
begin
  FRegistry.SpinEdit('spFibroidCount').Value := 2;

  FRegistry.CheckBox('cbCavityDistortion1').Checked := False;
  FRegistry.CheckBox('cbCavityDistortion1').Enabled := True;
  FRegistry.CheckBox('cbCavityDistortion2').Checked := False;
  FRegistry.CheckBox('cbCavityDistortion2').Enabled := True;

  AssertFalse(Boolean(FHost.CallFunctionByName('GetHasDistortion', [])));
end;

procedure TTestFibroids.TestSpFibroidCountOnChange_ShowsCorrectBoxes;
begin
  FRegistry.CheckBox('cbFibroidsVisualised').Checked := True;
  FRegistry.SpinEdit('spFibroidCount').Value := 3;

  FHost.CallProcedureByName('spFibroidCountOnChange', [Null]);

  AssertTrue('gbFibroid1 visible', FRegistry.GroupBox('gbFibroid1').Visible);
  AssertTrue('gbFibroid2 visible', FRegistry.GroupBox('gbFibroid2').Visible);
  AssertTrue('gbFibroid3 visible', FRegistry.GroupBox('gbFibroid3').Visible);
  AssertFalse('gbFibroid4 hidden', FRegistry.GroupBox('gbFibroid4').Visible);
  AssertFalse('gbFibroid5 hidden', FRegistry.GroupBox('gbFibroid5').Visible);
end;

initialization
  RegisterTest('Fibroids', TTestFibroids);

end.
```

- [ ] **Step 3: Update TestRunner.pas and Makefile**

Add `TestFibroids` to the TestRunner.pas uses clause:
```pascal
  TestPureUtils,
  TestGestationalAge,
  TestClinicalHistory,
  TestEDDHandling,
  TestFibroids;
```

- [ ] **Step 4: Build and run**

```bash
cd Scripts/tests/pascal && make test
```

- [ ] **Step 5: Commit**

```bash
git add Scripts/tests/pascal/tests/TestFibroids.pas Scripts/tests/pascal/TestRunner.pas
git commit -m "test: add fibroid function tests with dynamic component lookup"
```

---

### Task 8: Pytest Integration & Documentation

**Files:**
- Create: `Scripts/tools/tests/test_pascal_harness.py`
- Modify: `Scripts/tests/pascal/Makefile` (add help target)

- [ ] **Step 1: Create pytest bridge**

Create `Scripts/tools/tests/test_pascal_harness.py`:
```python
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
    if result.returncode != 0:
        raise AssertionError(
            f"Pascal tests failed:\n{result.stdout}\n{result.stderr}"
        )
```

- [ ] **Step 2: Add help target to Makefile**

Append to `Scripts/tests/pascal/Makefile`:
```makefile

help:
	@echo "PascalScript Test Harness"
	@echo "========================"
	@echo ""
	@echo "  make test         - Build and run all tests"
	@echo "  make build        - Compile test runner"
	@echo "  make prebuild     - GPP-build exam scripts"
	@echo "  make clean        - Remove build artifacts"
	@echo "  make test-suite SUITE=TestStrUtils  - Run specific suite"
```

- [ ] **Step 3: Verify end-to-end**

```bash
# Pascal tests directly
cd Scripts/tests/pascal && make test

# Via pytest
cd Scripts/tools && .venv/bin/python3 -m pytest tests/test_pascal_harness.py -v
```

- [ ] **Step 4: Commit**

```bash
git add Scripts/tools/tests/test_pascal_harness.py Scripts/tests/pascal/Makefile
git commit -m "feat: add pytest bridge and build system for Pascal test harness"
```

---

## Gaps to Address During Implementation

These items are referenced in the tasks but need to be created:

1. **`SetGlobalRegistry()`** and **`BindRegistryToExec()`** — Add to `PSRegistration.pas`. `SetGlobalRegistry` stores a `TComponentRegistry` reference in a unit-level `var` so `FindComponent` property helpers can resolve names. `BindRegistryToExec` iterates the registry and calls `Exec.SetPointerToData` for each control.

2. **Script source helpers** (`GetClinicalHistoryScript`, `GetEDDHandlingScript`, `GetFibroidScript`) — These are stop-gap functions that return the script source with dependencies inlined, used before full GPP-built script loading works. Once full script loading works (Task 7), delete them and use `LoadAndCompileFile('build/earlyT1Singleton.pas')`.

3. **Complete runtime property helpers** (Task 5 Step 3) — Every property on every stub class needs a `_Read`/`_Write` procedure pair registered with PascalScript. Task 5 shows the pattern for `TStubTextEdit`; replicate for all other stub classes.

4. **TestFormUtils.pas** — Listed in file structure but no task creates it. Tests for `CheckFormComplete`, `cbToggleCheckOnClick`, `Max`, `Min`, `AddToResult` are split between TestPureUtils (Max, Min, AddToResult) and should be added as a separate test file for the UI-coupled ones (CheckFormComplete, cbToggleCheckOnClick). Create following the same pattern as TestClinicalHistory.

5. **TestFibroidUI.pas** — Listed in file structure but merged into TestFibroids.pas (the `TestSpFibroidCountOnChange` test). Can remain merged or be split out — implementer's choice.

## Implementation Notes

### Expected Issues & Workarounds

1. **`Format` with `array of const`** — PascalScript may not support open arrays. Workaround: register per-arity wrapper functions (`Format1`, `Format2`, `Format3`, `Format4`) or use PascalScript's built-in string concatenation.

2. **`Properties.Items.Count` nested access** — PascalScript may not chain property access through intermediate objects. Workaround: register `Properties` as a property returning a registered sub-object class, or pre-process the scripts to flatten the access (e.g., `GetItemCount(control)` function).

3. **Untyped `Sender` parameter** — PascalScript may reject `procedure Foo(Sender)` without a type. If so, the scripts need `procedure Foo(Sender: TObject)`. Since GPP builds the scripts, add a `#define` to substitute the pattern.

4. **Global variables** — The scripts use undeclared globals like `GFibroidWarning`, `i`, `vLargest`, `vSmallest`, `vTemp`. These need to be declared in a `var` section at the top of the script. If the GPP-built script doesn't include them, add a preamble.

5. **`result[1] := chr(...)` character mutation** — PascalScript may not support direct character assignment to string indices. If so, use `Copy` + `Chr` + `Copy` to rebuild the string.

### Adding Tests for New Functions

To add a test for a new function:

1. Create a new `TestXxx.pas` file in `tests/` following the existing pattern
2. Add it to the `uses` clause in `TestRunner.pas`
3. If the function accesses controls, register them in `SetUp` using `FRegistry.AddXxx()`
4. Run `make test`
