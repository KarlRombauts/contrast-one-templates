Procedure cbCervixSutureYesOnClick(Sender)
begin
    cbToggleCheckOnClick(sender);
    edtSutureToOS.enabled := cbCervixSutureYes.checked;
end

procedure cbSuccenturiateLobeYes1OnClick(Sender)
begin
  cbToggleCheckOnClick(sender);
  if cbSuccenturiateLobeYes1.Checked then
  begin
    cbSuccenturiateLobeNo1.Checked := False;
    cbSuccentPos1.Enabled := True;
  end
  else
  begin
    cbSuccentPos1.Enabled := False;
  end;
end;

procedure cbSuccenturiateLobeNo1OnClick(sender)
begin
   cbToggleCheckOnClick(sender);
  if cbCervixSutureNo.Checked then
  begin
    cbSuccenturiateLobeYes1.Checked := False;
    cbSuccentPos1.Enabled:= False;
  end;
end;

procedure edtMeanUAPIOnChange(Sender);
var
  vWeeks: Integer;
begin

      vWeeks := Trunc(seEDDCalGAWeeks.Value);
  case vWeeks of
    11: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.7);
    12: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.53);
    13: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.38);
    14: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.24);
    15: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.11);
    16: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.99);
    17: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.88);
    18: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.79);
    19: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.70);
    20: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.61);
    21: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.54);
    22: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.47);
    23: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.41);
    24: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.35);
    25: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.30);
    26: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.25);
    27: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.21);
    28: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.17);
    29: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.13);
    30: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.10);
    31: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.06);

  end;
  //if cbUAPI95.Checked then cbUAPINormal.Checked := False;
  cbUAPINormal.Checked := not cbUAPI95.Checked;
end;

procedure edtMeanRUAPIOnChange(Sender);
begin
  edtMeanUAPI.text := FloatToStr((StrToFloatDef(edtMeanRUAPI.Text, 0) + StrToFloatDef(edtMeanLUAPI.Text, 0)) / 2);
  edtMeanUAPIOnChange(nil);
end;
