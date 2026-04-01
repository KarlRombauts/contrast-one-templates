#ifndef __SHARED_OBSTETRIC_PLACENTA
#define __SHARED_OBSTETRIC_PLACENTA

function GetPlacenta: String;
begin
result := '';
  result := result + lowercase(trim(cbPlacentaSite1.text));
end;

function GetPlacenta1InvertPosition: String;
begin
  result := Uppercase(trim(cbPlacentaSite1.text));
  if pos('ANTERIOR', UpperCase(result)) > 0 then
    result := StringReplace(result, 'ANTERIOR', 'POSTERIORLY')
  else
  if pos('POSTERIOR', UpperCase(result)) > 0 then
    result := StringReplace(result, 'POSTERIOR', 'ANTERIORLY')
  result := lowercase(result);                                    
end;

 Function getPlacentalPosition(infetus : integer)  : String
 var
  vControl: TcxComboBox;
  vLowLyingYes, vLowLyingNo : TcxCheckBox;
  vmeInternalOS :TCXMaskEdit;
 begin
  result := '';
  GPlacentaWarning := FALSE;
  vControl := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbPlacentaSite' + intToStr(infetus));
  vLowLyingYes := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbLowLyingPlacentaYes' + intToStr(infetus));
  vLowLyingNo := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbLowLyingPlacentaNo' + intToStr(infetus));
  vmeInternalOS := TwinControl(pgFetusMeasusements.Owner).FindComponent('meInternalOS' + intToStr(infetus));
  if assigned(vControl) then
  begin
    result := trim(vControl.text) ;
    if vLowLyingYes.checked then
    begin
       result := result + ' and low lying.  ';     
       GPlacentaWarning := TRUE;  
       if vmeInternalOS.text <> '' then
        begin
          if (StrToFloatDef(vmeInternalOS.text,0) > 0 ) then
            result := result + 'Leading edge ' + GetPlacenta1Measure + ' the internal cervical os.  '
          else if (StrToFloatDef(vmeInternalOS.text,0) = 0 ) then
            result := result + 'The inferior edge reaching the internal cervical os.  '
        end;                                                                                             
    end
    else if vLowLyingNo.checked then
    begin
        result := result + ' and not low lying.  ';
        GPlacentaWarning := False;
    end;
  end
  result := AddFullStop(Result);
 end;

 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta was ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
 end;

#endif
