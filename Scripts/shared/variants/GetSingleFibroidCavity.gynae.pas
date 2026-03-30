#ifndef __SHARED_VARIANTS_GETSINGLEFIBROIDCAVITY_GYNAE
#define __SHARED_VARIANTS_GETSINGLEFIBROIDCAVITY_GYNAE

function GetSingleFibroidCavity: string;
var
  vControl2: TWinControl;
  vCombo: TcxComboBox;
  v1, v2, v3: TcxComboBox;
  i: Integer;
begin
  result := '';
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if ((TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled)) and (vCombo.ItemIndex <> 2) then
      begin
        v1 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
        v2 := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
        v3 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if (assigned(v1)) and (TcxComboBox(v1).text <> '') then
          result := result + InitCaps(Trim(TcxComboBox(v1).text), true) + ' ';
        if (assigned(v2)) and (TcxComboBox(v2).text <> '') then
          result := result + Trim(TcxComboBox(v2).text) + ' ';
        if (assigned(v3)) and (TcxComboBox(v3).text <> '') then
          result := result + Trim(TcxComboBox(v3).text) + ' ';
        break;
      end;
    end;
  end;
end;

#endif
