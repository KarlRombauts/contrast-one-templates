unit TestClinicalHistory;
{
  Tests for UI-coupled clinical history functions from
  Scripts/shared/obstetric/clinicalHistory.pas.

  These functions read from DevExpress check-combo-box controls
  (States[], ShortDescription[], GetItemCount) and text edits.
  Controls are created inside the PascalScript test script as
  global variables, matching the pattern used in exam scripts.

  Test strategy:
  - Each test function creates controls, sets their properties,
    calls the function under test, and returns 'OK' or an error.
  - The functions under test are adapted for PascalScript:
      Properties.Items.Count -> GetItemCount
      Sender (untyped) -> Sender: TObject
  - Controls use AddItem() to populate Properties.Items (which
    backs GetItemCount) and then set States[]/ShortDescription[]
    to control the check-combo-box behavior.
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration, StubControls;

type
  TTestClinicalHistory = class(TTestCase)
  private
    FHost: TScriptHost;
    FSetupOk: Boolean;
    function CallCheck(const Name: string): string;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    { GetClinicalIndicators }
    procedure TestGetClinicalIndicators_NoItems;
    procedure TestGetClinicalIndicators_OneItem;
    procedure TestGetClinicalIndicators_MultipleItems;
    procedure TestGetClinicalIndicators_OtherSelected;
    { GetClinicalHistory }
    procedure TestGetClinicalHistory_Empty;
    { cxccbReferralIndicatorsChange }
    procedure TestReferralIndicatorsChange_LastChecked;
    procedure TestReferralIndicatorsChange_LastUnchecked;
  end;

implementation

const
  CLINICAL_HISTORY_SOURCE =
    { --- Dependency: AddFullStop from formatting.pas --- }
    'function AddFullStop(inStr: String): String;'               + LineEnding +
    'var'                                                        + LineEnding +
    '  vt: String;'                                              + LineEnding +
    'begin'                                                      + LineEnding +
    '  vt := Trim(inStr);'                                       + LineEnding +
    '  if vt <> '''' then'                                       + LineEnding +
    '  begin'                                                    + LineEnding +
    '    if vt[length(vt)] <> ''.'' then'                        + LineEnding +
    '      result := vt + ''.  '''                               + LineEnding +
    '    else'                                                   + LineEnding +
    '      result := inStr;'                                     + LineEnding +
    '  end'                                                      + LineEnding +
    '  else'                                                     + LineEnding +
    '    result := '''';'                                        + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { --- Global control variables (assigned in test functions) --- }
    'var'                                                        + LineEnding +
    '  cxccbReferralIndicators: TcxComboBox;'                    + LineEnding +
    '  edtReferralIndicator1: TcxTextEdit;'                      + LineEnding +
    ''                                                           + LineEnding +

    { --- Helper: create combo with 3 items (Pain, Bleeding, Other) --- }
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

    { --- GetClinicalIndicators (adapted from clinicalHistory.pas) ---
      Changes:
      - Properties.Items.Count -> GetItemCount
      - Sender untyped -> Sender: TObject  }
    'function GetClinicalIndicators: String;'                    + LineEnding +
    'var'                                                        + LineEnding +
    '  i: Integer;'                                              + LineEnding +
    'begin'                                                      + LineEnding +
    '  result := '''';'                                          + LineEnding +
    '  for i := 0 to cxccbReferralIndicators.GetItemCount - 2 do' + LineEnding +
    '  begin'                                                    + LineEnding +
    '    if cxccbReferralIndicators.States[i] = 1 then'          + LineEnding +
    '    begin'                                                  + LineEnding +
    '      if result <> '''' then'                               + LineEnding +
    '        result := result + ''.  '';'                        + LineEnding +
    '      result := result + cxccbReferralIndicators.ShortDescription[i];' + LineEnding +
    '    end;'                                                   + LineEnding +
    '  end;'                                                     + LineEnding +
    '  if (cxccbReferralIndicators.States[cxccbReferralIndicators.GetItemCount-1] = 1) then' + LineEnding +
    '  begin'                                                    + LineEnding +
    '    if result <> '''' then'                                 + LineEnding +
    '      result := result + ''.  '';'                          + LineEnding +
    '    result := result + trim(edtReferralIndicator1.Text);'   + LineEnding +
    '  end;'                                                     + LineEnding +
    '  if result <> '''' then'                                   + LineEnding +
    '    result := AddFullStop(result);'                         + LineEnding +
    '  result := result + '' '';'                                + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { --- GetClinicalHistory (empty body in source) --- }
    'function GetClinicalHistory: String;'                       + LineEnding +
    'var'                                                        + LineEnding +
    '  i: Integer;'                                              + LineEnding +
    'begin'                                                      + LineEnding +
    '  result := '''';'                                          + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { --- cxccbReferralIndicatorsChange --- }
    'procedure cxccbReferralIndicatorsChange(Sender: TObject);'  + LineEnding +
    'begin'                                                      + LineEnding +
    '  edtReferralIndicator1.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.GetItemCount-1] = 1);' + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { ============== Test functions ============== }

    { Test: no items selected -> should return ' ' (space only) }
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

    { Test: 1 item selected (not last) -> "Pain.  " + space }
    'function TestOneItem: string;'                              + LineEnding +
    'var res: string;'                                           + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  cxccbReferralIndicators.States[0] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 0;'                  + LineEnding +
    '  res := GetClinicalIndicators;'                            + LineEnding +
    '  if res = ''Pain.   '' then'                               + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected "Pain.   " got "'' + res + ''"'';' + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: multiple items selected -> "Pain.  Bleeding.  " + space }
    'function TestMultipleItems: string;'                        + LineEnding +
    'var res: string;'                                           + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  cxccbReferralIndicators.States[0] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 0;'                  + LineEnding +
    '  res := GetClinicalIndicators;'                            + LineEnding +
    '  if res = ''Pain.  Bleeding.   '' then'                    + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected "Pain.  Bleeding.   " got "'' + res + ''"'';' + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: "Other" (last item) selected -> includes edtReferralIndicator1.Text }
    'function TestOtherSelected: string;'                        + LineEnding +
    'var res: string;'                                           + LineEnding +
    'begin'                                                      + LineEnding +
    '  SetupCombo3;'                                             + LineEnding +
    '  edtReferralIndicator1.Text := ''custom reason'';'         + LineEnding +
    '  cxccbReferralIndicators.States[0] := 1;'                  + LineEnding +
    '  cxccbReferralIndicators.States[1] := 0;'                  + LineEnding +
    '  cxccbReferralIndicators.States[2] := 1;'                  + LineEnding +
    '  res := GetClinicalIndicators;'                            + LineEnding +
    '  if res = ''Pain.  custom reason.   '' then'               + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected "Pain.  custom reason.   " got "'' + res + ''"'';' + LineEnding +
    '  TeardownCombo;'                                           + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: GetClinicalHistory -> empty string (function body is empty) }
    'function TestClinicalHistoryEmpty: string;'                 + LineEnding +
    'begin'                                                      + LineEnding +
    '  if GetClinicalHistory = '''' then'                        + LineEnding +
    '    Result := ''OK'''                                       + LineEnding +
    '  else'                                                     + LineEnding +
    '    Result := ''Expected empty string'';'                   + LineEnding +
    'end;'                                                       + LineEnding +
    ''                                                           + LineEnding +

    { Test: cxccbReferralIndicatorsChange enables edtReferralIndicator1
      when last item is checked }
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

    { Test: cxccbReferralIndicatorsChange disables edtReferralIndicator1
      when last item is unchecked }
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

{ ====== Setup / TearDown ====== }

procedure TTestClinicalHistory.SetUp;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  if not FHost.CompileScript(CLINICAL_HISTORY_SOURCE) then
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

procedure TTestClinicalHistory.TearDown;
begin
  FHost.Free;
  FHost := nil;
end;

function TTestClinicalHistory.CallCheck(const Name: string): string;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := string(FHost.CallFunctionByName(Name, []));
end;

{ ====== Test methods ====== }

procedure TTestClinicalHistory.TestGetClinicalIndicators_NoItems;
begin
  AssertEquals('No items selected', 'OK', CallCheck('TestNoItems'));
end;

procedure TTestClinicalHistory.TestGetClinicalIndicators_OneItem;
begin
  AssertEquals('One item selected', 'OK', CallCheck('TestOneItem'));
end;

procedure TTestClinicalHistory.TestGetClinicalIndicators_MultipleItems;
begin
  AssertEquals('Multiple items selected', 'OK', CallCheck('TestMultipleItems'));
end;

procedure TTestClinicalHistory.TestGetClinicalIndicators_OtherSelected;
begin
  AssertEquals('Other selected', 'OK', CallCheck('TestOtherSelected'));
end;

procedure TTestClinicalHistory.TestGetClinicalHistory_Empty;
begin
  AssertEquals('Clinical history empty', 'OK', CallCheck('TestClinicalHistoryEmpty'));
end;

procedure TTestClinicalHistory.TestReferralIndicatorsChange_LastChecked;
begin
  AssertEquals('Last checked enables', 'OK', CallCheck('TestChangeLastChecked'));
end;

procedure TTestClinicalHistory.TestReferralIndicatorsChange_LastUnchecked;
begin
  AssertEquals('Last unchecked disables', 'OK', CallCheck('TestChangeLastUnchecked'));
end;

initialization
  RegisterTest(TTestClinicalHistory);

end.
