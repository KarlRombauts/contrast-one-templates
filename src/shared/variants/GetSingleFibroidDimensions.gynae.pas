#ifndef __SHARED_VARIANTS_GETSINGLEFIBROIDDIMENSIONS_GYNAE
#define __SHARED_VARIANTS_GETSINGLEFIBROIDDIMENSIONS_GYNAE

function GetSingleFibroidDimensions: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value * 10) / 10;
   if (not(cbCavityDistortion1.Caption = 'Cavity projection')) or
      ((cbCavityDistortion1.Caption = 'Cavity projection') and not(cbCavityDistortion1.checked))then
     result := result + 'was visualised';
  if (GetIntegerMeasuredString(v1, v2, v3, v4, 'mm') <> '') and not((cbFibroidsType1.ItemIndex = 2))then
  begin
   result := result + ' and measured ';
   result :=  result + GetIntegerMeasuredString(v1, v2, v3, v4, 'mm');
  end;
  else if (GetIntegerMeasuredString(v1, v2, v3, v4, 'mm') <> '') and ((cbFibroidsType1.ItemIndex = 2))then
  begin
   result := result + 'measuring ';
   result :=  result + GetIntegerMeasuredString(v1, v2, v3, v4, 'mm');
  end;
  if (cbCavityDistortion1.Enabled) and  (cbCavityDistortion1.Caption = 'Cavity distortion') and (cbFibroidsType1.ItemIndex = 0)then
  begin
    if (cbCavityDistortion1.Checked) then
      result := result + ' with associated cavity distortion'
    else
      result := result + '. There was no associated distortion of the endometrial cavity contour';
  end
  else if (cbCavityDistortion1.Enabled) and  (cbCavityDistortion1.Caption = 'Cavity projection') and (cbFibroidsType1.ItemIndex = 2)then
  begin
      if (cbCavityDistortion1.Checked) then
      begin
         result :=  result + ' was visualised';
         result := result + ' appeared to project '
         if cbProjection1.text <> '' then
         begin
          result := result + cbProjection1.text + ' ';
         end
         result := result + 'into the cavity';
      end
  end;
  else
    result := result + '';
end;

#endif
