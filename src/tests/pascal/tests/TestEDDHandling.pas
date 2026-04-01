unit TestEDDHandling;
{
  Tests for UI-coupled EDD (Estimated Due Date) handling functions from
  Scripts/shared/obstetric/eddHandling.pas.

  These functions manage EDD-related UI state: page visibility, group
  box heights, date calculations, and gestational age population.

  Test strategy:
  - Business logic loaded from build/gestationalAge.pas and
    build/eddHandling.pas via SourceLoader (auto-fixes
    Properties.ActivePage -> ActivePage)
  - Control variable declarations (SCAFFOLD_VARS) precede loaded source
  - Test wrapper functions (SCAFFOLD_SOURCE) follow loaded source
  - Self-checking pattern: each test returns 'OK' or error description
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration, StubControls;

type
  TTestEDDHandling = class(TTestCase)
  private
    FHost: TScriptHost;
    FSetupOk: Boolean;
    function CallCheck(const Name: string): string;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    { cbEDDPrincipleOnChange }
    procedure TestEDDPrinciple_Stated;
    procedure TestEDDPrinciple_NoEDD;
    procedure TestEDDPrinciple_Menstrual;
    procedure TestEDDPrinciple_IVF;
    { cbLMPDateOnChange }
    procedure TestLMPDateChange_ItemIndex1;
    procedure TestLMPDateChange_ItemIndexNot1;
    { PopulateEDDControls }
    procedure TestPopulateEDD_ValidDates;
    procedure TestPopulateEDD_ZeroDates;
  end;

implementation

uses
  SourceLoader;

const
  { Variable declarations must precede loaded source (which references them) }
  SCAFFOLD_VARS =
    'var'                                                        + LineEnding +
    '  cbEDDPrinciple: TcxComboBox;'                             + LineEnding +
    '  gbEDDDating: TcxGroupBox;'                                + LineEnding +
    '  lblMedication: TcxLabel;'                                 + LineEnding +
    '  pcEDDPrinciple: TcxPageControl;'                          + LineEnding +
    '  tsMenstrualEDD: TcxTabSheet;'                             + LineEnding +
    '  tsStatedEDD: TcxTabSheet;'                                + LineEnding +
    '  tsEstEDD: TcxTabSheet;'                                   + LineEnding +
    '  tsTimedEDD: TcxTabSheet;'                                 + LineEnding +
    '  tsIVFEDD: TcxTabSheet;'                                   + LineEnding +
    '  deLMPDate: TcxDateEdit;'                                  + LineEnding +
    '  deMenstrualEDD: TcxDateEdit;'                             + LineEnding +
    '  deExamDate: TcxDateEdit;'                                 + LineEnding +
    { Controls referenced by de*OnChange handlers in eddHandling.pas }
    '  deStatedEDD: TcxDateEdit;'                                + LineEnding +
    '  seEDDCalGAWeeks: TcxSpinEdit;'                            + LineEnding +
    '  seEDDCalGADays: TcxSpinEdit;'                             + LineEnding +
    '  deMUFWEdd: TcxDateEdit;'                                  + LineEnding +
    '  seMUFWGestAgeWeeks: TcxSpinEdit;'                         + LineEnding +
    '  seMUFWGestAgeDays: TcxSpinEdit;'                          + LineEnding +
    '  deOvulationEDD: TcxDateEdit;'                             + LineEnding +
    '  spOvualtionGestAgeWeeks: TcxSpinEdit;'                    + LineEnding +
    '  spOvualtionGestAgeDays: TcxSpinEdit;'                     + LineEnding +
    '  deIVFEDD: TcxDateEdit;'                                   + LineEnding +
    '  seIVFGAWeeks: TcxSpinEdit;'                               + LineEnding +
    '  seIVFGADays: TcxSpinEdit;'                                + LineEnding +
    ''                                                           + LineEnding;

  { Setup/teardown helpers and test wrapper functions follow loaded source }
  SCAFFOLD_SOURCE =
    { --- Helper: create all EDD controls --- }
    'procedure SetupEDDControls;'                                + LineEnding +
    'begin'                                                      + LineEnding +
    '  cbEDDPrinciple := TcxComboBox.Create(nil);'               + LineEnding +
    '  gbEDDDating := TcxGroupBox.Create(nil);'                  + LineEnding +
    '  lblMedication := TcxLabel.Create(nil);'                   + LineEnding +
    '  pcEDDPrinciple := TcxPageControl.Create(nil);'            + LineEnding +
    '  tsMenstrualEDD := TcxTabSheet.Create(nil);'               + LineEnding +
    '  tsStatedEDD := TcxTabSheet.Create(nil);'                  + LineEnding +
    '  tsEstEDD := TcxTabSheet.Create(nil);'                     + LineEnding +
    '  tsTimedEDD := TcxTabSheet.Create(nil);'                   + LineEnding +
    '  tsIVFEDD := TcxTabSheet.Create(nil);'                     + LineEnding +
    '  deLMPDate := TcxDateEdit.Create(nil);'                    + LineEnding +
    '  deMenstrualEDD := TcxDateEdit.Create(nil);'               + LineEnding +
    '  deExamDate := TcxDateEdit.Create(nil);'                   + LineEnding +
    '  deStatedEDD := TcxDateEdit.Create(nil);'                  + LineEnding +
    '  seEDDCalGAWeeks := TcxSpinEdit.Create(nil);'              + LineEnding +
    '  seEDDCalGADays := TcxSpinEdit.Create(nil);'               + LineEnding +
    '  deMUFWEdd := TcxDateEdit.Create(nil);'                    + LineEnding +
    '  seMUFWGestAgeWeeks := TcxSpinEdit.Create(nil);'           + LineEnding +
    '  seMUFWGestAgeDays := TcxSpinEdit.Create(nil);'            + LineEnding +
    '  deOvulationEDD := TcxDateEdit.Create(nil);'               + LineEnding +
    '  spOvualtionGestAgeWeeks := TcxSpinEdit.Create(nil);'      + LineEnding +
    '  spOvualtionGestAgeDays := TcxSpinEdit.Create(nil);'       + LineEnding +
    '  deIVFEDD := TcxDateEdit.Create(nil);'                     + LineEnding +
    '  seIVFGAWeeks := TcxSpinEdit.Create(nil);'                 + LineEnding +
    '  seIVFGADays := TcxSpinEdit.Create(nil);'                  + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'procedure TeardownEDDControls;'                             + LineEnding +
    'begin'                                                      + LineEnding +
    '  seIVFGADays.Free;'                                        + LineEnding +
    '  seIVFGAWeeks.Free;'                                       + LineEnding +
    '  deIVFEDD.Free;'                                           + LineEnding +
    '  spOvualtionGestAgeDays.Free;'                             + LineEnding +
    '  spOvualtionGestAgeWeeks.Free;'                            + LineEnding +
    '  deOvulationEDD.Free;'                                     + LineEnding +
    '  seMUFWGestAgeDays.Free;'                                  + LineEnding +
    '  seMUFWGestAgeWeeks.Free;'                                 + LineEnding +
    '  deMUFWEdd.Free;'                                          + LineEnding +
    '  seEDDCalGADays.Free;'                                     + LineEnding +
    '  seEDDCalGAWeeks.Free;'                                    + LineEnding +
    '  deStatedEDD.Free;'                                        + LineEnding +
    '  deExamDate.Free;'                                         + LineEnding +
    '  deMenstrualEDD.Free;'                                     + LineEnding +
    '  deLMPDate.Free;'                                          + LineEnding +
    '  tsIVFEDD.Free;'                                           + LineEnding +
    '  tsTimedEDD.Free;'                                         + LineEnding +
    '  tsEstEDD.Free;'                                           + LineEnding +
    '  tsStatedEDD.Free;'                                        + LineEnding +
    '  tsMenstrualEDD.Free;'                                     + LineEnding +
    '  pcEDDPrinciple.Free;'                                     + LineEnding +
    '  lblMedication.Free;'                                      + LineEnding +
    '  gbEDDDating.Free;'                                        + LineEnding +
    '  cbEDDPrinciple.Free;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { ============== Test functions ============== }

    { Test: ItemIndex=0 (Stated) -> height=80, lblMedication visible,
      ActivePage=tsStatedEDD }
    'function TestEDDStated: string;'                            + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  cbEDDPrinciple.ItemIndex := 0;'                           + LineEnding +
    '  cbEDDPrincipleOnChange(nil);'                             + LineEnding +
    '  if (gbEDDDating.Height = 80) and (lblMedication.Visible) and' + LineEnding +
    '     (pcEDDPrinciple.ActivePage = tsStatedEDD) then'        + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Height='' + IntToStr(gbEDDDating.Height) +' + LineEnding +
    '      '' Vis='' + IntToStr(Ord(lblMedication.Visible));'    + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: ItemIndex=1 (No EDD) -> height=47, lblMedication hidden }
    'function TestEDDNoEDD: string;'                             + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  lblMedication.Visible := True;'                           + LineEnding +
    '  cbEDDPrinciple.ItemIndex := 1;'                           + LineEnding +
    '  cbEDDPrincipleOnChange(nil);'                             + LineEnding +
    '  if (gbEDDDating.Height = 47) and (not lblMedication.Visible) then' + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Height='' + IntToStr(gbEDDDating.Height) +' + LineEnding +
    '      '' Vis='' + IntToStr(Ord(lblMedication.Visible));'    + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: ItemIndex=2 (Menstrual) -> height=80, visible,
      ActivePage=tsMenstrualEDD }
    'function TestEDDMenstrual: string;'                         + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  cbEDDPrinciple.ItemIndex := 2;'                           + LineEnding +
    '  cbEDDPrincipleOnChange(nil);'                             + LineEnding +
    '  if (gbEDDDating.Height = 80) and (lblMedication.Visible) and' + LineEnding +
    '     (pcEDDPrinciple.ActivePage = tsMenstrualEDD) then'     + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Height='' + IntToStr(gbEDDDating.Height) +' + LineEnding +
    '      '' Vis='' + IntToStr(Ord(lblMedication.Visible));'    + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: ItemIndex=5 (IVF) -> height=120, visible,
      ActivePage=tsIVFEDD }
    'function TestEDDIVF: string;'                               + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  cbEDDPrinciple.ItemIndex := 5;'                           + LineEnding +
    '  cbEDDPrincipleOnChange(nil);'                             + LineEnding +
    '  if (gbEDDDating.Height = 120) and (lblMedication.Visible) and' + LineEnding +
    '     (pcEDDPrinciple.ActivePage = tsIVFEDD) then'           + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Height='' + IntToStr(gbEDDDating.Height) +' + LineEnding +
    '      '' Vis='' + IntToStr(Ord(lblMedication.Visible));'    + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: cbLMPDateOnChange when ItemIndex=1 -> EDD = LMP + 280 }
    'function TestLMPChange_Index1: string;'                     + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  cbEDDPrinciple.ItemIndex := 1;'                           + LineEnding +
    '  deLMPDate.Date := 1000.0;'                                + LineEnding +
    '  deMenstrualEDD.Date := 0;'                                + LineEnding +
    '  cbLMPDateOnChange(nil);'                                  + LineEnding +
    '  if (deMenstrualEDD.Date > 1279.0) and (deMenstrualEDD.Date < 1281.0) then' + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''EDD='' + FloatToStr(deMenstrualEDD.Date);'  + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: cbLMPDateOnChange when ItemIndex<>1 -> no change }
    'function TestLMPChange_IndexNot1: string;'                  + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  cbEDDPrinciple.ItemIndex := 0;'                           + LineEnding +
    '  deLMPDate.Date := 1000.0;'                                + LineEnding +
    '  deMenstrualEDD.Date := 0;'                                + LineEnding +
    '  cbLMPDateOnChange(nil);'                                  + LineEnding +
    '  if (deMenstrualEDD.Date > -0.1) and (deMenstrualEDD.Date < 0.1) then' + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''EDD should be 0, got '' + FloatToStr(deMenstrualEDD.Date);' + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: PopulateEDDControls with valid dates
      ExamDate=1140, EDD=1280 -> 20w+0d }
    'function TestPopulateValid: string;'                        + LineEnding +
    'var'                                                        + LineEnding +
    '  deEDD: TcxDateEdit;'                                      + LineEnding +
    '  seWeeks, seDays: TcxSpinEdit;'                            + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  deExamDate.Date := 1140.0;'                               + LineEnding +
    '  deEDD := TcxDateEdit.Create(nil);'                        + LineEnding +
    '  seWeeks := TcxSpinEdit.Create(nil);'                      + LineEnding +
    '  seDays := TcxSpinEdit.Create(nil);'                       + LineEnding +
    '  deEDD.Date := 1280.0;'                                    + LineEnding +
    '  PopulateEDDControls(deEDD, seWeeks, seDays);'             + LineEnding +
    '  if (Trunc(seWeeks.Value) = 20) and (Trunc(seDays.Value) = 0) then' + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Weeks='' + IntToStr(Trunc(seWeeks.Value)) +' + LineEnding +
    '      '' Days='' + IntToStr(Trunc(seDays.Value));'          + LineEnding +
    '  seDays.Free;'                                             + LineEnding +
    '  seWeeks.Free;'                                            + LineEnding +
    '  deEDD.Free;'                                              + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: PopulateEDDControls with zero dates -> 0w+0d }
    'function TestPopulateZero: string;'                         + LineEnding +
    'var'                                                        + LineEnding +
    '  deEDD: TcxDateEdit;'                                      + LineEnding +
    '  seWeeks, seDays: TcxSpinEdit;'                            + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupEDDControls;'                                        + LineEnding +
    '  deExamDate.Date := 0;'                                    + LineEnding +
    '  deEDD := TcxDateEdit.Create(nil);'                        + LineEnding +
    '  seWeeks := TcxSpinEdit.Create(nil);'                      + LineEnding +
    '  seDays := TcxSpinEdit.Create(nil);'                       + LineEnding +
    '  seWeeks.Value := 99;'                                     + LineEnding +
    '  seDays.Value := 99;'                                      + LineEnding +
    '  deEDD.Date := 0;'                                         + LineEnding +
    '  PopulateEDDControls(deEDD, seWeeks, seDays);'             + LineEnding +
    '  if (Trunc(seWeeks.Value) = 0) and (Trunc(seDays.Value) = 0) then' + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Weeks='' + IntToStr(Trunc(seWeeks.Value)) +' + LineEnding +
    '      '' Days='' + IntToStr(Trunc(seDays.Value));'          + LineEnding +
    '  seDays.Free;'                                             + LineEnding +
    '  seWeeks.Free;'                                            + LineEnding +
    '  deEDD.Free;'                                              + LineEnding +
    '  TeardownEDDControls;'                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +
    'begin'                                                      + LineEnding +
    'end.';

{ ====== Setup / TearDown ====== }

procedure TTestEDDHandling.SetUp;
var
  Source: string;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  Source := SCAFFOLD_VARS +
            LoadPascalSource('build/gestationalAge.pas') +
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

procedure TTestEDDHandling.TearDown;
begin
  FHost.Free;
  FHost := nil;
end;

function TTestEDDHandling.CallCheck(const Name: string): string;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := string(FHost.CallFunctionByName(Name, []));
end;

{ ====== Test methods ====== }

procedure TTestEDDHandling.TestEDDPrinciple_Stated;
begin
  AssertEquals('Stated EDD', 'OK', CallCheck('TestEDDStated'));
end;

procedure TTestEDDHandling.TestEDDPrinciple_NoEDD;
begin
  AssertEquals('No EDD', 'OK', CallCheck('TestEDDNoEDD'));
end;

procedure TTestEDDHandling.TestEDDPrinciple_Menstrual;
begin
  AssertEquals('Menstrual EDD', 'OK', CallCheck('TestEDDMenstrual'));
end;

procedure TTestEDDHandling.TestEDDPrinciple_IVF;
begin
  AssertEquals('IVF EDD', 'OK', CallCheck('TestEDDIVF'));
end;

procedure TTestEDDHandling.TestLMPDateChange_ItemIndex1;
begin
  AssertEquals('LMP change index 1', 'OK', CallCheck('TestLMPChange_Index1'));
end;

procedure TTestEDDHandling.TestLMPDateChange_ItemIndexNot1;
begin
  AssertEquals('LMP change index not 1', 'OK', CallCheck('TestLMPChange_IndexNot1'));
end;

procedure TTestEDDHandling.TestPopulateEDD_ValidDates;
begin
  AssertEquals('Populate valid dates', 'OK', CallCheck('TestPopulateValid'));
end;

procedure TTestEDDHandling.TestPopulateEDD_ZeroDates;
begin
  AssertEquals('Populate zero dates', 'OK', CallCheck('TestPopulateZero'));
end;

initialization
  RegisterTest(TTestEDDHandling);

end.
