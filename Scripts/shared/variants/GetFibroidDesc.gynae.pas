#ifndef __SHARED_VARIANTS_GETFIBROIDDESC_GYNAE
#define __SHARED_VARIANTS_GETFIBROIDDESC_GYNAE

function GetFibroidDesc(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
  vParentGroup: TcxGroupBox;
  vFibPosition, vFibType: string;
begin
  result := '';
  if inFibroid <= spFibroidCount.Value then
  begin
    vParentGroup := nil;
    for i := 0 to tsFibroids.ControlCount - 1 do
    begin
      if (tsFibroids.Controls[i].Name = ('gbFibroid' + intToStr(inFibroid))) then
      begin
        vParentGroup := tsFibroids.Controls[i];
        break;
      end;
    end;
    if assigned(vParentGroup) then
    begin
      vFibPosition := '';
      vFibType := '';
      v1 := 0;
      v2 := 0;
      v3 := 0;
      v4 := 0;
      for i := 0 to vParentGroup.ControlCount - 1 do
      begin
        if vParentGroup.Controls[i].Name = ('cbFibroidsLeftRight' + intToStr(inFibroid)) then
        begin
          result := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidLength' + intToStr(inFibroid)) then
        begin
          v1 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidWidth' + intToStr(inFibroid)) then
        begin
          v2 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroiddepth' + intToStr(inFibroid)) then
        begin
          v3 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidVolume' + intToStr(inFibroid)) then
        begin
          v4 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value * 10) / 10;
        end
        else if vParentGroup.Controls[i].Name = ('cbFibriodPosition' + intToStr(inFibroid)) then
        begin
          vFibPosition := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
        else if vParentGroup.Controls[i].Name = ('cbFibroidsType' + intToStr(inFibroid)) then
        begin
          vFibType := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
      end;
      if result <> '' then
        result := result + ' ';
      result := InitCaps(result + Format('%s %s %s', [vFibPosition, vFibType, GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]), False);
    end;
  end;
end;

#endif
