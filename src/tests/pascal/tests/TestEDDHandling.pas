unit TestEDDHandling;
{
  Tests for UI-coupled EDD (Estimated Due Date) handling functions from
  Scripts/shared/obstetric/eddHandling.pas.

  These functions manage EDD-related UI state: page visibility, group
  box heights, date calculations, and gestational age population.

  Test strategy:
  - Controls are created inside PascalScript as global variables
  - Functions under test are adapted for PascalScript compatibility:
      Properties.ActivePage -> ActivePage (flattened)
      Sender (untyped) -> Sender: TObject
      Missing semicolons fixed
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

const
  EDD_HANDLING_SOURCE =
    { --- Dependencies: gestational age functions --- }
    'function GetWeeksFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'var'                                                        + LineEnding +
    '  v1: Integer;'                                             + LineEnding +
    'begin'                                                      + LineEnding +
    '  v1 := (trunc(inEDDDate) - 280);'                         + LineEnding +
    '  result := (trunc(inExamDate) - v1) div 7;'               + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +
    'function GetDaysFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;' + LineEnding +
    'var'                                                        + LineEnding +
    '  v1: Integer;'                                             + LineEnding +
    'begin'                                                      + LineEnding +
    '  v1 := (trunc(inEDDDate) - 280);'                         + LineEnding +
    '  result := (trunc(inExamDate) - v1) mod 7;'               + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { --- Global control variables --- }
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
    ''                                                           + LineEnding +

    { --- cbEDDPrincipleOnChange (adapted) ---
      Changes: added semicolon after (sender), typed sender,
      Properties.ActivePage -> ActivePage }
    'procedure cbEDDPrincipleOnChange(Sender: TObject);'         + LineEnding +
    'begin'                                                      + LineEnding +
    '  case cbEDDPrinciple.ItemIndex of'                         + LineEnding +
    '    1: begin'                                               + LineEnding +
    '         gbEDDDating.Height := 47;'                         + LineEnding +
    '         lblMedication.Visible := False;'                   + LineEnding +
    '       end;'                                                + LineEnding +
    '    2: begin'                                               + LineEnding +
    '         pcEDDPrinciple.ActivePage := tsMenstrualEDD;'      + LineEnding +
    '         gbEDDDating.Height := 80;'                         + LineEnding +
    '         lblMedication.Visible := True;'                    + LineEnding +
    '       end;'                                                + LineEnding +
    '    0: begin'                                               + LineEnding +
    '         pcEDDPrinciple.ActivePage := tsStatedEDD;'         + LineEnding +
    '         gbEDDDating.Height := 80;'                         + LineEnding +
    '         lblMedication.Visible := True;'                    + LineEnding +
    '       end;'                                                + LineEnding +
    '    3: begin'                                               + LineEnding +
    '         pcEDDPrinciple.ActivePage := tsEstEDD;'            + LineEnding +
    '         gbEDDDating.Height := 80;'                         + LineEnding +
    '         lblMedication.Visible := True;'                    + LineEnding +
    '       end;'                                                + LineEnding +
    '    4: begin'                                               + LineEnding +
    '         pcEDDPrinciple.ActivePage := tsTimedEDD;'          + LineEnding +
    '         gbEDDDating.Height := 80;'                         + LineEnding +
    '         lblMedication.Visible := True;'                    + LineEnding +
    '       end;'                                                + LineEnding +
    '    5: begin'                                               + LineEnding +
    '         pcEDDPrinciple.ActivePage := tsIVFEDD;'            + LineEnding +
    '         gbEDDDating.Height := 120;'                        + LineEnding +
    '         lblMedication.Visible := True;'                    + LineEnding +
    '       end;'                                                + LineEnding +
    '    6: begin'                                               + LineEnding +
    '         pcEDDPrinciple.ActivePage := tsIVFEDD;'            + LineEnding +
    '         gbEDDDating.Height := 120;'                        + LineEnding +
    '         lblMedication.Visible := True;'                    + LineEnding +
    '       end;'                                                + LineEnding +
    '  end;'                                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { --- cbLMPDateOnChange (adapted) --- }
    'procedure cbLMPDateOnChange(Sender: TObject);'              + LineEnding +
    'begin'                                                      + LineEnding +
    '  if cbEDDPrinciple.ItemIndex = 1 then'                     + LineEnding +
    '  begin'                                                    + LineEnding +
    '    deMenstrualEDD.Date := deLMPDate.Date + 280;'           + LineEnding +
    '  end;'                                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { --- PopulateEDDControls (adapted) --- }
    'procedure PopulateEDDControls(inDate: TcxDateEdit; inWeeks, inDay: TcxSpinEdit);' + LineEnding +
    'var'                                                        + LineEnding +
    '  vWeeks, vDays: Integer;'                                  + LineEnding +
    'begin'                                                      + LineEnding +
    '  vWeeks := 0;'                                             + LineEnding +
    '  vDays := 0;'                                              + LineEnding +
    '  inDay.Value := 0;'                                        + LineEnding +
    '  inWeeks.Value := 0;'                                      + LineEnding +
    '  if (deExamDate.Date > 0) and (inDate.Date > 0) then'      + LineEnding +
    '  begin'                                                    + LineEnding +
    '    vWeeks := GetWeeksFromDueDate(inDate.Date, deExamDate.Date);' + LineEnding +
    '    vDays := GetDaysFromDueDate(inDate.Date, deExamDate.Date);' + LineEnding +
    '    inWeeks.Value := vWeeks;'                               + LineEnding +
    '    inDay.Value := vDays;'                                  + LineEnding +
    '  end;'                                                     + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

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
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    'procedure TeardownEDDControls;'                             + LineEnding +
    'begin'                                                      + LineEnding +
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
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  if not FHost.CompileScript(EDD_HANDLING_SOURCE) then
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
