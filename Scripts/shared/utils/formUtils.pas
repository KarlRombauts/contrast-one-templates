#ifndef __SHARED_UTILS_FORMUTILS
#define __SHARED_UTILS_FORMUTILS

function CheckFormComplete: Boolean;
var
  vTempStr : String;
begin
  if ((cxtsFetus1.TabVisible)and (StrToFloatDef(edtEmbroSize1.text, 0) < 0.1) and (cbEmbryo1Visualised1.Checked)) then
  begin
    ShowMessage('You must enter a CRL measurement if the embryo is visualised');
    result := false;
  end
  else
  if (pcEDDPrinciple.Properties.ActivePage = tsIVFEDD) and ((seTransferDay.Value < 1) or (seNumberTransferred.Value < 1)) and (cbEDDPrinciple.ItemIndex > 4) then
  begin
    ShowMessage('Embryo Transfer Day and Number Transferred should both be > 0');
    result := False;
  end
  else
    result := True;
end;

function AddToResult(inResult, inNew: string): string;
begin
  result := '';
  if trim(inResult) <> '' then
  begin
    if trim(inNew) <> '' then
      result := inResult + ', ' + trim(inNew);
  end
  else
  begin
    if trim(inNew) <> '' then
      result := trim(inNew);
  end;
end;

procedure cbToggleCheckOnClick(Sender)
var
  i: Integer;
begin
  if Sender.Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (Sender.Parent.Controls[i].Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          Sender.Parent.Controls[i].Checked := false;
        end;
      end;
    end;
  end;
end;

function Max(A, B: Integer): Integer;
begin
  if A > B then
    result := A
  else
    result := B;
end;

function Min(in1, in2: Integer): Integer;
begin                                                        
  if in1 > in2 then                                 
    result := in2                                               
  else
    result := in1;
end;

#endif
