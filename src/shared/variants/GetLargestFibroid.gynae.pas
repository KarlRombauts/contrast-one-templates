#ifndef __SHARED_VARIANTS_GETLARGESTFIBROID_GYNAE
#define __SHARED_VARIANTS_GETLARGESTFIBROID_GYNAE

function GetLargestFibroid(var isDistored: Boolean): Real;
var
  vControl: TcxSpinEdit;
  vControl2: TcxCheckBox;
  i: Integer;
begin
  result := 0.0;
  isDistored := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(i + 1));
    if (assigned(vControl)) and (TcxSpinEdit(vControl).Value > result) then
    begin
      result := TcxSpinEdit(vControl).Value;
      vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      if assigned(vControl2) then
      begin
        if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
          isDistored := True
        else
          isDistored := False;
      end
      else
        result := False;
    end;
  end;
end;

#endif
