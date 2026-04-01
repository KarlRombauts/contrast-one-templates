unit PSRegistration;
{
  Registers built-in functions that PascalScript scripts depend on.

  PascalScript already provides these as built-ins (do NOT register):
    IntToStr, StrToInt, StrToIntDef, Copy, Pos, Delete, Insert,
    Length, SetLength, Trim, UpperCase, LowerCase, StrToFloat,
    FloatToStr, Trunc, Round, Abs, Sin, Cos, Sqrt, Ord, Chr,
    Assigned, High, Low, Inc, Dec, SizeOf

  We register:
    - Format (not built into PascalScript)
    - ShowMessage (no-op for test harness)
    - Date/Time functions via the PascalScript dateutils library
    - TObject/TPersistent/TComponent via the PascalScript std library
    - Stub DevExpress controls (TWinControl, TcxTextEdit, etc.)
}

{$mode objfpc}{$H+}

interface

uses
  uPSCompiler, uPSRuntime, uPSUtils;

function StandardOnUses(Sender: TPSPascalCompiler;
  const Name: tbtstring): Boolean;

procedure RegisterRuntimeStd(Exec: TPSExec;
  ClassImporter: TPSRuntimeClassImporter);

implementation

uses
  SysUtils, Classes,
  uPSC_std, uPSR_std,
  uPSC_dateutils, uPSR_dateutils,
  StubControls;

{ ---- Native helper implementations ---- }

procedure ShowMessage_P(const Msg: string);
begin
  // No-op in test harness (no GUI)
end;

function Format_P(const Fmt: string; const Args: array of const): string;
begin
  Result := SysUtils.Format(Fmt, Args);
end;

{ ---- Compile-time: register stub control classes ---- }

procedure SIRegister_StubControls(Cl: TPSPascalCompiler);
begin
  { TWinControl inherits from TComponent }
  with Cl.AddClassN(Cl.FindClass('TComponent'), 'TWinControl') do
  begin
    RegisterMethod('function FindComponent(AName: string): TComponent');
    RegisterProperty('ControlCount', 'Integer', iptR);
    RegisterProperty('Controls', 'TComponent Integer', iptR);
    RegisterProperty('Enabled', 'Boolean', iptRW);
    RegisterProperty('Visible', 'Boolean', iptRW);
  end;

  { TcxTextEdit }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxTextEdit') do
  begin
    RegisterProperty('Text', 'string', iptRW);
  end;

  { TcxMaskEdit }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxMaskEdit') do
  begin
    RegisterProperty('Text', 'string', iptRW);
  end;

  { TcxCheckBox }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxCheckBox') do
  begin
    RegisterProperty('Checked', 'Boolean', iptRW);
  end;

  { TcxComboBox - Properties.Items needs flattened access.
    Also serves as TcxCheckComboBox with States[] and ShortDescription[]. }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxComboBox') do
  begin
    RegisterProperty('ItemIndex', 'Integer', iptRW);
    RegisterProperty('Text', 'string', iptRW);
    { Flattened accessors for Properties.Items.Count and Properties.Items[i] }
    RegisterMethod('function GetItemCount: Integer');
    RegisterMethod('function GetItemText(Index: Integer): string');
    { Check-combo-box features: States[i] and ShortDescription[i] }
    RegisterProperty('States', 'Integer Integer', iptRW);
    RegisterProperty('ShortDescription', 'string Integer', iptRW);
    { Add an item to Properties.Items and size States/ShortDescription arrays }
    RegisterMethod('function AddItem(AText: string): Integer');
  end;

  { TcxSpinEdit }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxSpinEdit') do
  begin
    RegisterProperty('Value', 'Double', iptRW);
  end;

  { TcxDateEdit }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxDateEdit') do
  begin
    RegisterProperty('Date', 'TDateTime', iptRW);
  end;

  { TcxGroupBox }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxGroupBox') do
  begin
    RegisterProperty('Height', 'Integer', iptRW);
    RegisterProperty('Caption', 'string', iptRW);
  end;

  { TcxLabel }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxLabel') do
  begin
    RegisterProperty('Caption', 'string', iptRW);
  end;

  { TcxPageControl }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxPageControl') do
  begin
    { Flattened accessor for Properties.ActivePage }
    RegisterProperty('ActivePage', 'TComponent', iptRW);
  end;

  { TcxTabSheet }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TcxTabSheet') do
  begin
    RegisterProperty('TabVisible', 'Boolean', iptRW);
  end;

  { TAdvTreeComboBox }
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TAdvTreeComboBox') do
  begin
    RegisterProperty('Text', 'string', iptRW);
    RegisterProperty('Selection', 'string', iptRW);
  end;
end;

{ ---- Compile-time registration (OnUses callback) ---- }

function StandardOnUses(Sender: TPSPascalCompiler;
  const Name: tbtstring): Boolean;
begin
  if Name = 'SYSTEM' then
  begin
    { std library: TObject, TPersistent, TComponent }
    SIRegister_Std(Sender);

    { Date/time library: TDateTime, Now, Date, FormatDateTime, etc. }
    RegisterDateTimeLibrary_C(Sender);

    { Type aliases used by Delphi scripts but not built into PascalScript }
    Sender.AddTypeS('Real', 'Double');

    { ShowMessage - no-op stub }
    Sender.AddDelphiFunction(
      'procedure ShowMessage(const Msg: string);');

    { Stub DevExpress controls }
    SIRegister_StubControls(Sender);

    Result := True;
  end
  else
    Result := False;
end;

{ ---- Runtime: property helpers for stub controls ---- }

{ TWinControl (TStubWinControl) property helpers }

procedure TStubWinControl_EnabledR(Self: TStubWinControl; var T: Boolean);
begin T := Self.Enabled; end;

procedure TStubWinControl_EnabledW(Self: TStubWinControl; const T: Boolean);
begin Self.Enabled := T; end;

procedure TStubWinControl_VisibleR(Self: TStubWinControl; var T: Boolean);
begin T := Self.Visible; end;

procedure TStubWinControl_VisibleW(Self: TStubWinControl; const T: Boolean);
begin Self.Visible := T; end;

procedure TStubWinControl_ControlCountR(Self: TStubWinControl; var T: Integer);
begin T := Self.ControlCount; end;

procedure TStubWinControl_ControlsR(Self: TStubWinControl; var T: TComponent; Index: Integer);
begin T := Self.Controls[Index]; end;

function TStubWinControl_FindComponent(Self: TStubWinControl; const AName: string): TComponent;
var
  Reg: TComponentRegistry;
begin
  { First try standard TComponent.FindComponent }
  Result := Self.FindComponent(AName);
  { If not found, fall back to the global registry }
  if Result = nil then
  begin
    Reg := GetGlobalRegistry;
    if Reg <> nil then
      Result := Reg.FindByName(AName);
  end;
end;

{ TcxTextEdit (TStubTextEdit) }
procedure TStubTextEdit_TextR(Self: TStubTextEdit; var T: string);
begin T := Self.Text; end;

procedure TStubTextEdit_TextW(Self: TStubTextEdit; const T: string);
begin Self.Text := T; end;

{ TcxMaskEdit (TStubMaskEdit) }
procedure TStubMaskEdit_TextR(Self: TStubMaskEdit; var T: string);
begin T := Self.Text; end;

procedure TStubMaskEdit_TextW(Self: TStubMaskEdit; const T: string);
begin Self.Text := T; end;

{ TcxCheckBox (TStubCheckBox) }
procedure TStubCheckBox_CheckedR(Self: TStubCheckBox; var T: Boolean);
begin T := Self.Checked; end;

procedure TStubCheckBox_CheckedW(Self: TStubCheckBox; const T: Boolean);
begin Self.Checked := T; end;

{ TcxComboBox (TStubComboBox) }
procedure TStubComboBox_ItemIndexR(Self: TStubComboBox; var T: Integer);
begin T := Self.ItemIndex; end;

procedure TStubComboBox_ItemIndexW(Self: TStubComboBox; const T: Integer);
begin Self.ItemIndex := T; end;

procedure TStubComboBox_TextR(Self: TStubComboBox; var T: string);
begin T := Self.Text; end;

procedure TStubComboBox_TextW(Self: TStubComboBox; const T: string);
begin Self.Text := T; end;

function TStubComboBox_GetItemCount(Self: TStubComboBox): Integer;
begin Result := Self.Properties.Items.Count; end;

function TStubComboBox_GetItemText(Self: TStubComboBox; Index: Integer): string;
begin Result := Self.Properties.Items[Index]; end;

procedure TStubComboBox_StatesR(Self: TStubComboBox; var T: Integer; Index: Integer);
begin T := Self.States[Index]; end;

procedure TStubComboBox_StatesW(Self: TStubComboBox; const T: Integer; Index: Integer);
begin Self.States[Index] := T; end;

procedure TStubComboBox_ShortDescriptionR(Self: TStubComboBox; var T: string; Index: Integer);
begin T := Self.ShortDescription[Index]; end;

procedure TStubComboBox_ShortDescriptionW(Self: TStubComboBox; const T: string; Index: Integer);
begin Self.ShortDescription[Index] := T; end;

function TStubComboBox_AddItem(Self: TStubComboBox; const AText: string): Integer;
begin Result := Self.AddItem(AText); end;

{ TcxSpinEdit (TStubSpinEdit) }
procedure TStubSpinEdit_ValueR(Self: TStubSpinEdit; var T: Double);
begin T := Self.Value; end;

procedure TStubSpinEdit_ValueW(Self: TStubSpinEdit; const T: Double);
begin Self.Value := T; end;

{ TcxDateEdit (TStubDateEdit) }
procedure TStubDateEdit_DateR(Self: TStubDateEdit; var T: TDateTime);
begin T := Self.Date; end;

procedure TStubDateEdit_DateW(Self: TStubDateEdit; const T: TDateTime);
begin Self.Date := T; end;

{ TcxGroupBox (TStubGroupBox) }
procedure TStubGroupBox_HeightR(Self: TStubGroupBox; var T: Integer);
begin T := Self.Height; end;

procedure TStubGroupBox_HeightW(Self: TStubGroupBox; const T: Integer);
begin Self.Height := T; end;

procedure TStubGroupBox_CaptionR(Self: TStubGroupBox; var T: string);
begin T := Self.Caption; end;

procedure TStubGroupBox_CaptionW(Self: TStubGroupBox; const T: string);
begin Self.Caption := T; end;

{ TcxLabel (TStubLabel) }
procedure TStubLabel_CaptionR(Self: TStubLabel; var T: string);
begin T := Self.Caption; end;

procedure TStubLabel_CaptionW(Self: TStubLabel; const T: string);
begin Self.Caption := T; end;

{ TcxPageControl (TStubPageControl) }
procedure TStubPageControl_ActivePageR(Self: TStubPageControl; var T: TComponent);
begin T := Self.Properties.ActivePage; end;

procedure TStubPageControl_ActivePageW(Self: TStubPageControl; const T: TComponent);
begin Self.Properties.ActivePage := T; end;

{ TcxTabSheet (TStubTabSheet) }
procedure TStubTabSheet_TabVisibleR(Self: TStubTabSheet; var T: Boolean);
begin T := Self.TabVisible; end;

procedure TStubTabSheet_TabVisibleW(Self: TStubTabSheet; const T: Boolean);
begin Self.TabVisible := T; end;

{ TAdvTreeComboBox (TStubTreeComboBox) }
procedure TStubTreeComboBox_TextR(Self: TStubTreeComboBox; var T: string);
begin T := Self.Text; end;

procedure TStubTreeComboBox_TextW(Self: TStubTreeComboBox; const T: string);
begin Self.Text := T; end;

procedure TStubTreeComboBox_SelectionR(Self: TStubTreeComboBox; var T: string);
begin T := Self.Selection; end;

procedure TStubTreeComboBox_SelectionW(Self: TStubTreeComboBox; const T: string);
begin Self.Selection := T; end;

{ ---- Runtime: register all stub controls ---- }

procedure RIRegister_StubControls(Cl: TPSRuntimeClassImporter);
begin
  { TWinControl -> TStubWinControl }
  with Cl.Add2(TStubWinControl, 'TWinControl') do
  begin
    RegisterMethod(@TStubWinControl_FindComponent, 'FindComponent');
    RegisterPropertyHelper(@TStubWinControl_ControlCountR, nil, 'ControlCount');
    RegisterPropertyHelper(@TStubWinControl_ControlsR, nil, 'Controls');
    RegisterPropertyHelper(@TStubWinControl_EnabledR, @TStubWinControl_EnabledW, 'Enabled');
    RegisterPropertyHelper(@TStubWinControl_VisibleR, @TStubWinControl_VisibleW, 'Visible');
  end;

  { TcxTextEdit -> TStubTextEdit }
  with Cl.Add2(TStubTextEdit, 'TcxTextEdit') do
  begin
    RegisterPropertyHelper(@TStubTextEdit_TextR, @TStubTextEdit_TextW, 'Text');
  end;

  { TcxMaskEdit -> TStubMaskEdit }
  with Cl.Add2(TStubMaskEdit, 'TcxMaskEdit') do
  begin
    RegisterPropertyHelper(@TStubMaskEdit_TextR, @TStubMaskEdit_TextW, 'Text');
  end;

  { TcxCheckBox -> TStubCheckBox }
  with Cl.Add2(TStubCheckBox, 'TcxCheckBox') do
  begin
    RegisterPropertyHelper(@TStubCheckBox_CheckedR, @TStubCheckBox_CheckedW, 'Checked');
  end;

  { TcxComboBox -> TStubComboBox }
  with Cl.Add2(TStubComboBox, 'TcxComboBox') do
  begin
    RegisterPropertyHelper(@TStubComboBox_ItemIndexR, @TStubComboBox_ItemIndexW, 'ItemIndex');
    RegisterPropertyHelper(@TStubComboBox_TextR, @TStubComboBox_TextW, 'Text');
    RegisterMethod(@TStubComboBox_GetItemCount, 'GetItemCount');
    RegisterMethod(@TStubComboBox_GetItemText, 'GetItemText');
    RegisterPropertyHelper(@TStubComboBox_StatesR, @TStubComboBox_StatesW, 'States');
    RegisterPropertyHelper(@TStubComboBox_ShortDescriptionR, @TStubComboBox_ShortDescriptionW, 'ShortDescription');
    RegisterMethod(@TStubComboBox_AddItem, 'AddItem');
  end;

  { TcxSpinEdit -> TStubSpinEdit }
  with Cl.Add2(TStubSpinEdit, 'TcxSpinEdit') do
  begin
    RegisterPropertyHelper(@TStubSpinEdit_ValueR, @TStubSpinEdit_ValueW, 'Value');
  end;

  { TcxDateEdit -> TStubDateEdit }
  with Cl.Add2(TStubDateEdit, 'TcxDateEdit') do
  begin
    RegisterPropertyHelper(@TStubDateEdit_DateR, @TStubDateEdit_DateW, 'Date');
  end;

  { TcxGroupBox -> TStubGroupBox }
  with Cl.Add2(TStubGroupBox, 'TcxGroupBox') do
  begin
    RegisterPropertyHelper(@TStubGroupBox_HeightR, @TStubGroupBox_HeightW, 'Height');
    RegisterPropertyHelper(@TStubGroupBox_CaptionR, @TStubGroupBox_CaptionW, 'Caption');
  end;

  { TcxLabel -> TStubLabel }
  with Cl.Add2(TStubLabel, 'TcxLabel') do
  begin
    RegisterPropertyHelper(@TStubLabel_CaptionR, @TStubLabel_CaptionW, 'Caption');
  end;

  { TcxPageControl -> TStubPageControl }
  with Cl.Add2(TStubPageControl, 'TcxPageControl') do
  begin
    RegisterPropertyHelper(@TStubPageControl_ActivePageR, @TStubPageControl_ActivePageW, 'ActivePage');
  end;

  { TcxTabSheet -> TStubTabSheet }
  with Cl.Add2(TStubTabSheet, 'TcxTabSheet') do
  begin
    RegisterPropertyHelper(@TStubTabSheet_TabVisibleR, @TStubTabSheet_TabVisibleW, 'TabVisible');
  end;

  { TAdvTreeComboBox -> TStubTreeComboBox }
  with Cl.Add2(TStubTreeComboBox, 'TAdvTreeComboBox') do
  begin
    RegisterPropertyHelper(@TStubTreeComboBox_TextR, @TStubTreeComboBox_TextW, 'Text');
    RegisterPropertyHelper(@TStubTreeComboBox_SelectionR, @TStubTreeComboBox_SelectionW, 'Selection');
  end;
end;

{ ---- Runtime registration ---- }

procedure RegisterRuntimeStd(Exec: TPSExec;
  ClassImporter: TPSRuntimeClassImporter);
begin
  { std library runtime }
  RIRegister_Std(ClassImporter);
  RegisterClassLibraryRuntime(Exec, ClassImporter);

  { Date/time library runtime }
  RegisterDateTimeLibrary_R(Exec);

  { ShowMessage - no-op }
  Exec.RegisterDelphiFunction(@ShowMessage_P, 'ShowMessage', cdRegister);

  { Stub DevExpress controls }
  RIRegister_StubControls(ClassImporter);
end;

end.
