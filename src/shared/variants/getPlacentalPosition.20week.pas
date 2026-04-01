#ifndef __SHARED_VARIANTS_GETPLACENTALPOSITION_20WEEK
#define __SHARED_VARIANTS_GETPLACENTALPOSITION_20WEEK

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

#endif
