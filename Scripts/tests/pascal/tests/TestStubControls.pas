unit TestStubControls;
{
  Tests for stub DevExpress control classes and their PascalScript registration.

  Verifies that:
  - Stub controls can be created and their properties set/read (native)
  - TComponentRegistry provides case-insensitive lookup
  - PascalScript can compile scripts referencing all control types
  - PascalScript can read/write control properties at runtime

  NOTE: Runtime tests encode expected values inside the script and return
  'OK' or an error description.  This avoids PascalScript variant-return
  limitations in the test harness's CallFunctionByName.
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration, StubControls;

type
  { Tests that do NOT need PascalScript runtime - just native FPC tests }
  TTestStubControlsNative = class(TTestCase)
  private
    FRegistry: TComponentRegistry;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestRegistry_AddAndFind;
    procedure TestRegistry_CaseInsensitive;
    procedure TestRegistry_TypedAccessors;
    procedure TestComboBox_PropertiesItems;
    procedure TestWinControl_AddControl;
    procedure TestPageControl_ActivePage;
  end;

  { Tests for PascalScript compilation of control types }
  TTestStubControlsCompile = class(TTestCase)
  private
    FHost: TScriptHost;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestPS_TextEditCompiles;
    procedure TestPS_CheckBoxCompiles;
    procedure TestPS_ComboBoxCompiles;
    procedure TestPS_AllControlTypesCompile;
    procedure TestPS_EnabledVisibleCompiles;
    procedure TestPS_FindComponentCompiles;
    procedure TestPS_CastCompiles;
  end;

  { Tests for PascalScript runtime property access.
    All test functions return 'OK' on success or an error description. }
  TTestStubControlsRuntime = class(TTestCase)
  private
    FHost: TScriptHost;
    FSetupOk: Boolean;
    function CallCheck(const Name: string): string;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestPS_TextEditReadWrite;
    procedure TestPS_CheckBoxReadWrite;
    procedure TestPS_SpinEditReadWrite;
    procedure TestPS_LabelCaptionReadWrite;
    procedure TestPS_EnabledVisible;
    procedure TestPS_ComboBoxGetItemCount;
    procedure TestPS_DateEditReadWrite;
    procedure TestPS_GroupBoxReadWrite;
    procedure TestPS_TabSheetTabVisible;
    procedure TestPS_MaskEditReadWrite;
    procedure TestPS_TreeComboBoxReadWrite;
    procedure TestPS_PageControlActivePage;
  end;

implementation

const
  { PascalScript source with self-checking test functions.
    Each returns 'OK' on success or an error description. }
  STUB_CONTROLS_SOURCE =
    'function TestTextEdit: string;'                          + LineEnding +
    'var edt: TcxTextEdit;'                                   + LineEnding +
    'begin'                                                   + LineEnding +
    '  edt := TcxTextEdit.Create(nil);'                       + LineEnding +
    '  edt.Text := ''hello world'';'                          + LineEnding +
    '  if edt.Text = ''hello world'' then'                    + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Text was: '' + edt.Text;'                + LineEnding +
    '  edt.Free;'                                             + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestCheckBox: string;'                          + LineEnding +
    'var cb: TcxCheckBox;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  cb := TcxCheckBox.Create(nil);'                        + LineEnding +
    '  cb.Checked := True;'                                   + LineEnding +
    '  if cb.Checked then'                                    + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Checked was False'';'                    + LineEnding +
    '  cb.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestSpinEdit: string;'                          + LineEnding +
    'var se: TcxSpinEdit;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  se := TcxSpinEdit.Create(nil);'                        + LineEnding +
    '  se.Value := 142.5;'                                    + LineEnding +
    '  if (se.Value > 142.0) and (se.Value < 143.0) then'     + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Value was: '' + FloatToStr(se.Value);'   + LineEnding +
    '  se.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestLabelCaption: string;'                      + LineEnding +
    'var lb: TcxLabel;'                                       + LineEnding +
    'begin'                                                   + LineEnding +
    '  lb := TcxLabel.Create(nil);'                           + LineEnding +
    '  lb.Caption := ''Warning text'';'                       + LineEnding +
    '  if lb.Caption = ''Warning text'' then'                 + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Caption was: '' + lb.Caption;'           + LineEnding +
    '  lb.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestEnabledVisible: string;'                    + LineEnding +
    'var edt: TcxTextEdit;'                                   + LineEnding +
    'begin'                                                   + LineEnding +
    '  edt := TcxTextEdit.Create(nil);'                       + LineEnding +
    '  edt.Enabled := False;'                                 + LineEnding +
    '  edt.Visible := False;'                                 + LineEnding +
    '  if (not edt.Enabled) and (not edt.Visible) then'       + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''FAIL'';'                                 + LineEnding +
    '  edt.Free;'                                             + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestComboBoxGetItemCount: string;'              + LineEnding +
    'var cb: TcxComboBox;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  cb := TcxComboBox.Create(nil);'                        + LineEnding +
    '  if cb.GetItemCount = 0 then'                           + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Count was: '' + IntToStr(cb.GetItemCount);' + LineEnding +
    '  cb.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestDateEdit: string;'                          + LineEnding +
    'var de: TcxDateEdit;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  de := TcxDateEdit.Create(nil);'                        + LineEnding +
    '  de.Date := 44000.0;'                                   + LineEnding +
    '  if (de.Date > 43999.0) and (de.Date < 44001.0) then'   + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Date was: '' + FloatToStr(de.Date);'     + LineEnding +
    '  de.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestGroupBox: string;'                          + LineEnding +
    'var gb: TcxGroupBox;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  gb := TcxGroupBox.Create(nil);'                        + LineEnding +
    '  gb.Height := 250;'                                     + LineEnding +
    '  gb.Caption := ''Test Group'';'                         + LineEnding +
    '  if (gb.Height = 250) and (gb.Caption = ''Test Group'') then' + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Height='' + IntToStr(gb.Height) + '' Caption='' + gb.Caption;' + LineEnding +
    '  gb.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestTabSheet: string;'                          + LineEnding +
    'var ts: TcxTabSheet;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  ts := TcxTabSheet.Create(nil);'                        + LineEnding +
    '  ts.TabVisible := True;'                                + LineEnding +
    '  if ts.TabVisible then'                                 + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''TabVisible was False'';'                 + LineEnding +
    '  ts.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestMaskEdit: string;'                          + LineEnding +
    'var me: TcxMaskEdit;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  me := TcxMaskEdit.Create(nil);'                        + LineEnding +
    '  me.Text := ''mask text'';'                             + LineEnding +
    '  if me.Text = ''mask text'' then'                       + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Text was: '' + me.Text;'                 + LineEnding +
    '  me.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestTreeComboBox: string;'                      + LineEnding +
    'var tc: TAdvTreeComboBox;'                               + LineEnding +
    'begin'                                                   + LineEnding +
    '  tc := TAdvTreeComboBox.Create(nil);'                   + LineEnding +
    '  tc.Text := ''tree text'';'                             + LineEnding +
    '  tc.Selection := ''selected'';'                         + LineEnding +
    '  if (tc.Text = ''tree text'') and (tc.Selection = ''selected'') then' + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''Text='' + tc.Text + '' Selection='' + tc.Selection;' + LineEnding +
    '  tc.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'function TestPageControl: string;'                       + LineEnding +
    'var pc: TcxPageControl;'                                 + LineEnding +
    '    ts: TcxTabSheet;'                                    + LineEnding +
    'begin'                                                   + LineEnding +
    '  pc := TcxPageControl.Create(nil);'                     + LineEnding +
    '  ts := TcxTabSheet.Create(nil);'                        + LineEnding +
    '  pc.ActivePage := ts;'                                  + LineEnding +
    '  if pc.ActivePage = ts then'                            + LineEnding +
    '    Result := ''OK'''                                    + LineEnding +
    '  else'                                                  + LineEnding +
    '    Result := ''ActivePage mismatch'';'                  + LineEnding +
    '  ts.Free;'                                              + LineEnding +
    '  pc.Free;'                                              + LineEnding +
    'end;'                                                    + LineEnding +
    ''                                                        + LineEnding +
    'begin'                                                   + LineEnding +
    'end.';

{ ====== TTestStubControlsNative ====== }

procedure TTestStubControlsNative.SetUp;
begin
  FRegistry := TComponentRegistry.Create(nil);
end;

procedure TTestStubControlsNative.TearDown;
begin
  FRegistry.Free;
end;

procedure TTestStubControlsNative.TestRegistry_AddAndFind;
var
  Edit: TStubTextEdit;
begin
  Edit := FRegistry.AddTextEdit('edtBPD');
  Edit.Text := '42.5';

  AssertNotNull('Should find edtBPD', FRegistry.FindByName('edtBPD'));
  AssertEquals('Text should match', '42.5',
    TStubTextEdit(FRegistry.FindByName('edtBPD')).Text);
end;

procedure TTestStubControlsNative.TestRegistry_CaseInsensitive;
begin
  FRegistry.AddTextEdit('edtBPD');

  AssertNotNull('Uppercase lookup', FRegistry.FindByName('EDTBPD'));
  AssertNotNull('Lowercase lookup', FRegistry.FindByName('edtbpd'));
  AssertNotNull('MixedCase lookup', FRegistry.FindByName('EdtBPD'));
end;

procedure TTestStubControlsNative.TestRegistry_TypedAccessors;
var
  CB: TStubCheckBox;
begin
  FRegistry.AddTextEdit('edtName');
  CB := FRegistry.AddCheckBox('cbOption');
  CB.Checked := True;

  AssertNull('TextEdit should not be a CheckBox', FRegistry.CheckBox('edtName'));
  AssertNotNull('cbOption should be a CheckBox', FRegistry.CheckBox('cbOption'));
  AssertTrue('Checked should be True', FRegistry.CheckBox('cbOption').Checked);
end;

procedure TTestStubControlsNative.TestComboBox_PropertiesItems;
var
  Combo: TStubComboBox;
begin
  Combo := FRegistry.AddComboBox('cbPresentation');
  Combo.Properties.Items.Add('Cephalic');
  Combo.Properties.Items.Add('Breech');
  Combo.Properties.Items.Add('Transverse');
  Combo.ItemIndex := 1;

  AssertEquals('Item count', 3, Combo.Properties.Items.Count);
  AssertEquals('Item[0]', 'Cephalic', Combo.Properties.Items[0]);
  AssertEquals('Item[1]', 'Breech', Combo.Properties.Items[1]);
  AssertEquals('ItemIndex', 1, Combo.ItemIndex);
end;

procedure TTestStubControlsNative.TestWinControl_AddControl;
var
  Parent: TStubGroupBox;
  Child1, Child2: TStubTextEdit;
begin
  Parent := FRegistry.AddGroupBox('gbFetus');
  Child1 := FRegistry.AddTextEdit('edtLength1');
  Child2 := FRegistry.AddTextEdit('edtLength2');
  Parent.AddControl(Child1);
  Parent.AddControl(Child2);

  AssertEquals('ControlCount', 2, Parent.ControlCount);
  AssertSame('Controls[0]', Child1, Parent.Controls[0]);
  AssertSame('Controls[1]', Child2, Parent.Controls[1]);
end;

procedure TTestStubControlsNative.TestPageControl_ActivePage;
var
  PC: TStubPageControl;
  Tab: TStubTabSheet;
begin
  PC := FRegistry.AddPageControl('pcMain');
  Tab := FRegistry.AddTabSheet('tsPage1');
  PC.Properties.ActivePage := Tab;

  AssertSame('ActivePage', Tab, PC.Properties.ActivePage);
end;

{ ====== TTestStubControlsCompile ====== }

procedure TTestStubControlsCompile.SetUp;
begin
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;
end;

procedure TTestStubControlsCompile.TearDown;
begin
  FHost.Free;
end;

procedure TTestStubControlsCompile.TestPS_TextEditCompiles;
const
  Script =
    'var edt: TcxTextEdit;'#13#10 +
    'begin'#13#10 +
    '  edt := TcxTextEdit.Create(nil);'#13#10 +
    '  edt.Text := ''hello'';'#13#10 +
    '  edt.Free;'#13#10 +
    'end.';
begin
  AssertTrue('Script should compile: ' + FHost.LastError,
    FHost.CompileScript(Script));
end;

procedure TTestStubControlsCompile.TestPS_CheckBoxCompiles;
const
  Script =
    'var cb: TcxCheckBox;'#13#10 +
    'begin'#13#10 +
    '  cb := TcxCheckBox.Create(nil);'#13#10 +
    '  cb.Checked := True;'#13#10 +
    '  cb.Free;'#13#10 +
    'end.';
begin
  AssertTrue('Script should compile: ' + FHost.LastError,
    FHost.CompileScript(Script));
end;

procedure TTestStubControlsCompile.TestPS_ComboBoxCompiles;
const
  Script =
    'var cb: TcxComboBox;'#13#10 +
    'begin'#13#10 +
    '  cb := TcxComboBox.Create(nil);'#13#10 +
    '  cb.ItemIndex := 0;'#13#10 +
    '  cb.Text := ''test'';'#13#10 +
    '  cb.Free;'#13#10 +
    'end.';
begin
  AssertTrue('Script should compile: ' + FHost.LastError,
    FHost.CompileScript(Script));
end;

procedure TTestStubControlsCompile.TestPS_AllControlTypesCompile;
const
  Script =
    'var'#13#10 +
    '  te: TcxTextEdit;'#13#10 +
    '  me: TcxMaskEdit;'#13#10 +
    '  cb: TcxCheckBox;'#13#10 +
    '  co: TcxComboBox;'#13#10 +
    '  se: TcxSpinEdit;'#13#10 +
    '  de: TcxDateEdit;'#13#10 +
    '  gb: TcxGroupBox;'#13#10 +
    '  lb: TcxLabel;'#13#10 +
    '  pc: TcxPageControl;'#13#10 +
    '  ts: TcxTabSheet;'#13#10 +
    '  tc: TAdvTreeComboBox;'#13#10 +
    '  wc: TWinControl;'#13#10 +
    'begin'#13#10 +
    'end.';
begin
  AssertTrue('All control types should compile: ' + FHost.LastError,
    FHost.CompileScript(Script));
end;

procedure TTestStubControlsCompile.TestPS_EnabledVisibleCompiles;
const
  Script =
    'var edt: TcxTextEdit;'#13#10 +
    'begin'#13#10 +
    '  edt := TcxTextEdit.Create(nil);'#13#10 +
    '  edt.Enabled := False;'#13#10 +
    '  edt.Visible := False;'#13#10 +
    '  edt.Free;'#13#10 +
    'end.';
begin
  AssertTrue('Should compile: ' + FHost.LastError,
    FHost.CompileScript(Script));
end;

procedure TTestStubControlsCompile.TestPS_FindComponentCompiles;
const
  Script =
    'var wc: TWinControl;'#13#10 +
    '    comp: TComponent;'#13#10 +
    'begin'#13#10 +
    '  wc := TWinControl.Create(nil);'#13#10 +
    '  comp := wc.FindComponent(''test'');'#13#10 +
    '  wc.Free;'#13#10 +
    'end.';
begin
  AssertTrue('FindComponent should compile: ' + FHost.LastError,
    FHost.CompileScript(Script));
end;

procedure TTestStubControlsCompile.TestPS_CastCompiles;
const
  Script =
    'var wc: TWinControl;'#13#10 +
    '    edt: TcxTextEdit;'#13#10 +
    'begin'#13#10 +
    '  edt := TcxTextEdit.Create(nil);'#13#10 +
    '  wc := TWinControl(edt);'#13#10 +
    '  edt.Free;'#13#10 +
    'end.';
begin
  AssertTrue('Cast should compile: ' + FHost.LastError,
    FHost.CompileScript(Script));
end;

{ ====== TTestStubControlsRuntime ====== }

procedure TTestStubControlsRuntime.SetUp;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  if not FHost.CompileScript(STUB_CONTROLS_SOURCE) then
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

procedure TTestStubControlsRuntime.TearDown;
begin
  FHost.Free;
  FHost := nil;
end;

function TTestStubControlsRuntime.CallCheck(const Name: string): string;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := string(FHost.CallFunctionByName(Name, []));
end;

procedure TTestStubControlsRuntime.TestPS_TextEditReadWrite;
begin
  AssertEquals('TextEdit', 'OK', CallCheck('TestTextEdit'));
end;

procedure TTestStubControlsRuntime.TestPS_CheckBoxReadWrite;
begin
  AssertEquals('CheckBox', 'OK', CallCheck('TestCheckBox'));
end;

procedure TTestStubControlsRuntime.TestPS_SpinEditReadWrite;
begin
  AssertEquals('SpinEdit', 'OK', CallCheck('TestSpinEdit'));
end;

procedure TTestStubControlsRuntime.TestPS_LabelCaptionReadWrite;
begin
  AssertEquals('LabelCaption', 'OK', CallCheck('TestLabelCaption'));
end;

procedure TTestStubControlsRuntime.TestPS_EnabledVisible;
begin
  AssertEquals('EnabledVisible', 'OK', CallCheck('TestEnabledVisible'));
end;

procedure TTestStubControlsRuntime.TestPS_ComboBoxGetItemCount;
begin
  AssertEquals('ComboBoxGetItemCount', 'OK', CallCheck('TestComboBoxGetItemCount'));
end;

procedure TTestStubControlsRuntime.TestPS_DateEditReadWrite;
begin
  AssertEquals('DateEdit', 'OK', CallCheck('TestDateEdit'));
end;

procedure TTestStubControlsRuntime.TestPS_GroupBoxReadWrite;
begin
  AssertEquals('GroupBox', 'OK', CallCheck('TestGroupBox'));
end;

procedure TTestStubControlsRuntime.TestPS_TabSheetTabVisible;
begin
  AssertEquals('TabSheet', 'OK', CallCheck('TestTabSheet'));
end;

procedure TTestStubControlsRuntime.TestPS_MaskEditReadWrite;
begin
  AssertEquals('MaskEdit', 'OK', CallCheck('TestMaskEdit'));
end;

procedure TTestStubControlsRuntime.TestPS_TreeComboBoxReadWrite;
begin
  AssertEquals('TreeComboBox', 'OK', CallCheck('TestTreeComboBox'));
end;

procedure TTestStubControlsRuntime.TestPS_PageControlActivePage;
begin
  AssertEquals('PageControl', 'OK', CallCheck('TestPageControl'));
end;

initialization
  RegisterTest(TTestStubControlsNative);
  RegisterTest(TTestStubControlsCompile);
  RegisterTest(TTestStubControlsRuntime);

end.
