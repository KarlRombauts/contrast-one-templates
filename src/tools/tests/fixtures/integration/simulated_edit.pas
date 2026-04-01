function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  try
    result := StrToFloat(inString);
  except
    result := inDefault;
  end;
end;

function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.'
    else
      result := inStr;
  end
  else
    result := '';
end;

function GetFindings: String;
begin
  result := 'Normal anatomy with normal growth';
end;

procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Add('Findings=''' + GetFindings + '''');
end;

procedure cbOptionOnClick(Sender);
begin
  if Sender.Checked then
    lblStatus.Caption := 'Selected';
end;

Var
  GFlag: Boolean;

procedure InitializeScreen;
begin
  GFlag := False;
end;

procedure StartScript;
begin
  InitializeScreen;
end;

StartScript;
