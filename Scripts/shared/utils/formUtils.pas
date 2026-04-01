#ifndef __SHARED_UTILS_FORMUTILS
#define __SHARED_UTILS_FORMUTILS

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

#ifndef NOGUI
procedure cbToggleCheckOnClick(Sender: TObject);
var
  i: Integer;
begin
  if TcxCheckBox(Sender).Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (TcxCheckBox(Sender.Parent.Controls[i]).Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          TcxCheckBox(Sender.Parent.Controls[i]).Checked := false;
        end;
      end;
    end;
  end;
end;
#endif

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
    result := in2;
  else
    result := in1;
end;

#endif
