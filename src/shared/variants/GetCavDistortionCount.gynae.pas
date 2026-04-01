#ifndef __SHARED_VARIANTS_GETCAVDISTORTIONCOUNT_GYNAE
#define __SHARED_VARIANTS_GETCAVDISTORTIONCOUNT_GYNAE

function GetCavDistortionCount(var isValidDist: Booelan): Integer;
var
  vControl: TcxCheckBox;
  vCombo: TcxComboBox;
  i: Integer;
begin
  result := 0;
  isValidDist := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
    begin
      isValidDist := True;
      if (TcxCheckBox(vControl).Checked) and not(TcxComboBox(vCombo).ItemIndex = 2) then
      begin
        result := Result + 1;
      end;
    end;
  end;
end;

#endif
