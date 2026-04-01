unit TestGestationalAge;
{
  Tests for gestational age calculation functions from
  Scripts/shared/obstetric/gestationalAge.pas.

  Functions are compiled as an inline PascalScript source string, then
  called individually via the ScriptHost.

  TDateTime is a Double representing days since Dec 30, 1899.
  The functions only perform day arithmetic, so abstract day values
  (e.g. 1000.0, 1140.0) are used to keep the tests readable.

  Test matrix:
    LMP=1000, EDD=1280 (LMP + 280)
    - 20w+0d: Exam=1140 (1000+140)
    - 40w+0d: Exam=1280 (LMP+280 = EDD)
    - 12w+0d: Exam=1084 (1000+84)
    - 20w+3d: Exam=1143 (1000+143)
    - 10w+0d: Exam=1070 (1000+70)
    - 10w+3d: Exam=1073 (1000+73)
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration;

type
  TTestGestationalAge = class(TTestCase)
  private
    FHost: TScriptHost;
    FSetupOk: Boolean;

    { Helper: call a script function returning an integer }
    function CallIntFn(const Name: string;
      const Params: array of Variant): Integer;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    { GetWeeksFromDueDate }
    procedure TestGetWeeksFromDueDate_20Weeks;
    procedure TestGetWeeksFromDueDate_40Weeks;
    procedure TestGetWeeksFromDueDate_12Weeks;
    procedure TestGetWeeksFromDueDate_20Weeks3Days;
    procedure TestGetWeeksFromDueDate_10Weeks;
    procedure TestGetWeeksFromDueDate_10Weeks3Days;

    { GetDaysFromDueDate }
    procedure TestGetDaysFromDueDate_ZeroRemainder;
    procedure TestGetDaysFromDueDate_3DayRemainder;
    procedure TestGetDaysFromDueDate_12Weeks;

    { GetWeeksFromLMPDate }
    procedure TestGetWeeksFromLMPDate_20Weeks;
    procedure TestGetWeeksFromLMPDate_40Weeks;
    procedure TestGetWeeksFromLMPDate_12Weeks;
    procedure TestGetWeeksFromLMPDate_20Weeks3Days;
    procedure TestGetWeeksFromLMPDate_10Weeks;
    procedure TestGetWeeksFromLMPDate_10Weeks3Days;

    { GetDaysFromLMPDate }
    procedure TestGetDaysFromLMPDate_ZeroRemainder;
    procedure TestGetDaysFromLMPDate_3DayRemainder;
    procedure TestGetDaysFromLMPDate_12Weeks;
  end;

implementation

const
  { Inline PascalScript source for gestational age functions.
    Copied from Scripts/shared/obstetric/gestationalAge.pas with
    #ifndef/#define/#endif preprocessor guards removed.

    GetGestDays and GetGestWeeks reference UI controls (seEDDCalGAWeeks,
    seEDDCalGADays) and are not included here.

    GetLMPWeeks and GetLMPDays call Now() and are non-deterministic;
    they are omitted from concrete-value testing. }
  GESTATIONAL_AGE_SOURCE =
    'function GetWeeksFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'var'                                                                       + LineEnding +
    '  v1: Integer;'                                                            + LineEnding +
    'begin'                                                                     + LineEnding +
    '  v1 := (trunc(inEDDDate) - 280);'                                        + LineEnding +
    '  result := (trunc(inExamDate) - v1) div 7;'                              + LineEnding +
    'end;'                                                                      + LineEnding +
    ''                                                                          + LineEnding +
    'function GetDaysFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;'  + LineEnding +
    'var'                                                                       + LineEnding +
    '  v1: Integer;'                                                            + LineEnding +
    'begin'                                                                     + LineEnding +
    '  v1 := (trunc(inEDDDate) - 280);'                                        + LineEnding +
    '  result := (trunc(inExamDate) - v1) mod 7;'                              + LineEnding +
    'end;'                                                                      + LineEnding +
    ''                                                                          + LineEnding +
    'function GetWeeksFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'begin'                                                                     + LineEnding +
    '  result := (trunc(inExamDate) - Trunc(inLMPDate)) div 7;'               + LineEnding +
    'end;'                                                                      + LineEnding +
    ''                                                                          + LineEnding +
    'function GetDaysFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;'  + LineEnding +
    'begin'                                                                     + LineEnding +
    '  result := (trunc(inExamDate) - Trunc(inLMPDate)) mod 7;'               + LineEnding +
    'end;'                                                                      + LineEnding +
    ''                                                                          + LineEnding +
    'begin'                                                                     + LineEnding +
    'end.';

procedure TTestGestationalAge.SetUp;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  if not FHost.CompileScript(GESTATIONAL_AGE_SOURCE) then
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

procedure TTestGestationalAge.TearDown;
begin
  FHost.Free;
  FHost := nil;
end;

{ ---------- Helper ---------- }

function TTestGestationalAge.CallIntFn(const Name: string;
  const Params: array of Variant): Integer;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := Integer(FHost.CallFunctionByName(Name, Params));
end;

{ ---------- GetWeeksFromDueDate ---------- }
{ Formula: (Trunc(ExamDate) - (Trunc(EDD) - 280)) div 7
  With LMP=1000, EDD=1280: LMPfromEDD = 1280-280 = 1000 }

procedure TTestGestationalAge.TestGetWeeksFromDueDate_20Weeks;
{ Exam=1140, LMPfromEDD=1000, diff=140, 140 div 7 = 20 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromDueDate', [1280.0, 1140.0]);
  AssertEquals('20 weeks from EDD', 20, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromDueDate_40Weeks;
{ Exam on EDD: Exam=1280, LMPfromEDD=1000, diff=280, 280 div 7 = 40 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromDueDate', [1280.0, 1280.0]);
  AssertEquals('40 weeks (full term, exam on EDD)', 40, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromDueDate_12Weeks;
{ Exam=1084, LMPfromEDD=1000, diff=84, 84 div 7 = 12 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromDueDate', [1280.0, 1084.0]);
  AssertEquals('12 weeks from EDD', 12, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromDueDate_20Weeks3Days;
{ Exam=1143, LMPfromEDD=1000, diff=143, 143 div 7 = 20 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromDueDate', [1280.0, 1143.0]);
  AssertEquals('20 weeks + 3 days from EDD — week part only', 20, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromDueDate_10Weeks;
{ Exam=1070, LMPfromEDD=1000, diff=70, 70 div 7 = 10 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromDueDate', [1280.0, 1070.0]);
  AssertEquals('10 weeks from EDD', 10, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromDueDate_10Weeks3Days;
{ Exam=1073, LMPfromEDD=1000, diff=73, 73 div 7 = 10 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromDueDate', [1280.0, 1073.0]);
  AssertEquals('10 weeks + 3 days from EDD — week part only', 10, R);
end;

{ ---------- GetDaysFromDueDate ---------- }
{ Formula: (Trunc(ExamDate) - (Trunc(EDD) - 280)) mod 7 }

procedure TTestGestationalAge.TestGetDaysFromDueDate_ZeroRemainder;
{ Exam=1140, diff=140, 140 mod 7 = 0 }
var
  R: Integer;
begin
  R := CallIntFn('GetDaysFromDueDate', [1280.0, 1140.0]);
  AssertEquals('20 weeks exactly — 0 remainder days', 0, R);
end;

procedure TTestGestationalAge.TestGetDaysFromDueDate_3DayRemainder;
{ Exam=1143, diff=143, 143 mod 7 = 3 }
var
  R: Integer;
begin
  R := CallIntFn('GetDaysFromDueDate', [1280.0, 1143.0]);
  AssertEquals('20 weeks + 3 days — remainder 3', 3, R);
end;

procedure TTestGestationalAge.TestGetDaysFromDueDate_12Weeks;
{ Exam=1084, diff=84, 84 mod 7 = 0 }
var
  R: Integer;
begin
  R := CallIntFn('GetDaysFromDueDate', [1280.0, 1084.0]);
  AssertEquals('12 weeks exactly — 0 remainder days', 0, R);
end;

{ ---------- GetWeeksFromLMPDate ---------- }
{ Formula: (Trunc(ExamDate) - Trunc(LMP)) div 7 }

procedure TTestGestationalAge.TestGetWeeksFromLMPDate_20Weeks;
{ LMP=1000, Exam=1140, diff=140, 140 div 7 = 20 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromLMPDate', [1000.0, 1140.0]);
  AssertEquals('20 weeks from LMP', 20, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromLMPDate_40Weeks;
{ LMP=1000, Exam=1280, diff=280, 280 div 7 = 40 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromLMPDate', [1000.0, 1280.0]);
  AssertEquals('40 weeks from LMP', 40, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromLMPDate_12Weeks;
{ LMP=1000, Exam=1084, diff=84, 84 div 7 = 12 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromLMPDate', [1000.0, 1084.0]);
  AssertEquals('12 weeks from LMP', 12, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromLMPDate_20Weeks3Days;
{ LMP=1000, Exam=1143, diff=143, 143 div 7 = 20 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromLMPDate', [1000.0, 1143.0]);
  AssertEquals('20 weeks + 3 days from LMP — week part only', 20, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromLMPDate_10Weeks;
{ LMP=1000, Exam=1070, diff=70, 70 div 7 = 10 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromLMPDate', [1000.0, 1070.0]);
  AssertEquals('10 weeks from LMP', 10, R);
end;

procedure TTestGestationalAge.TestGetWeeksFromLMPDate_10Weeks3Days;
{ LMP=1000, Exam=1073, diff=73, 73 div 7 = 10 }
var
  R: Integer;
begin
  R := CallIntFn('GetWeeksFromLMPDate', [1000.0, 1073.0]);
  AssertEquals('10 weeks + 3 days from LMP — week part only', 10, R);
end;

{ ---------- GetDaysFromLMPDate ---------- }
{ Formula: (Trunc(ExamDate) - Trunc(LMP)) mod 7 }

procedure TTestGestationalAge.TestGetDaysFromLMPDate_ZeroRemainder;
{ LMP=1000, Exam=1140, diff=140, 140 mod 7 = 0 }
var
  R: Integer;
begin
  R := CallIntFn('GetDaysFromLMPDate', [1000.0, 1140.0]);
  AssertEquals('20 weeks exactly — 0 remainder days', 0, R);
end;

procedure TTestGestationalAge.TestGetDaysFromLMPDate_3DayRemainder;
{ LMP=1000, Exam=1143, diff=143, 143 mod 7 = 3 }
var
  R: Integer;
begin
  R := CallIntFn('GetDaysFromLMPDate', [1000.0, 1143.0]);
  AssertEquals('20 weeks + 3 days — remainder 3', 3, R);
end;

procedure TTestGestationalAge.TestGetDaysFromLMPDate_12Weeks;
{ LMP=1000, Exam=1084, diff=84, 84 mod 7 = 0 }
var
  R: Integer;
begin
  R := CallIntFn('GetDaysFromLMPDate', [1000.0, 1084.0]);
  AssertEquals('12 weeks exactly — 0 remainder days', 0, R);
end;

initialization
  RegisterTest(TTestGestationalAge);

end.
