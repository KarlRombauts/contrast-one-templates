procedure edtAFI1Onchange(sender)
var
  vWeeks : Integer;
begin
   vWeeks := GetGestWeeks;
   if (cbGestationType.ItemIndex= 1) or (cbGestationType.ItemIndex= 4) then
   begin
     if  (StrToFloatDef(edtAFI1.Text, 0) > 0) and (edtAFI1.enabled) then
     begin
        if (StrToFloatDef(edtAFI1.Text, 0) >= GetLiquor5Centile(VWeeks))  and (StrToFloatDef(edtAFI1.Text, 0)<= GetLiquor95Centile(vWeeks)) then
        begin
          cbFetalWellLiqor1.ItemIndex := 0;
        end;
        else if (StrToFloatDef(edtAFI1.Text, 0) > GetLiquor95Centile(vWeeks)) then
        begin
          cbFetalWellLiqor1.ItemIndex := 1;
        end;
        else if (StrToFloatDef(edtAFI1.Text, 0) > 0)  and (StrToFloatDef(edtAFI1.Text, 0)< GetLiquor5Centile(vWeeks)) then
        begin
          cbFetalWellLiqor1.ItemIndex := 2;
        end;
     end
     else if (StrToFloatDef(edtAFI1.Text, 0) = 0)  then
     begin
      cbFetalWellLiqor1.ItemIndex := 3;
     end;
   end;
end;

procedure edtAFI2Onchange(sender)
begin
   if (cbGestationType.ItemIndex= 1) or (cbGestationType.ItemIndex= 4) then
   begin
     if  (StrToFloatDef(edtAFI2.Text, 0) > 0) and (edtAFI2.enabled) then
     begin
        if (StrToFloatDef(edtAFI2.Text, 0) >= 7)  and (StrToFloatDef(edtAFI2.Text, 0)<= 25) then
          cbFetalWellLiqor2.ItemIndex := 0;
        else if (StrToFloatDef(edtAFI2.Text, 0) > 25) then
        begin
          cbFetalWellLiqor2.ItemIndex := 1;
        end;
        else if (StrToFloatDef(edtAFI2.Text, 0) > 0)  and (StrToFloatDef(edtAFI2.Text, 0)< 7) then
        begin
          cbFetalWellLiqor2.ItemIndex := 2;
        end;
     end;
    else if (StrToFloatDef(edtAFI2.Text, 0) = 0)  then
      begin
        cbFetalWellLiqor2.ItemIndex := 3;
      end
   end;
end;

procedure cbFeatlMovementsClick(Sender);
begin
  cbToggleCheckOnClick(Sender);
  cbFetalTone1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbFetalTone1.checked := cbFeatlMovementsYes1.Checked;
  cbFetalMovement1.Enabled :=((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbFetalMovement1.Checked := cbFeatlMovementsYes1.Checked;
  cbFetalBreathing1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbFetalBreathing1.Checked := cbFeatlMovementsYes1.Checked;
  cbLiqur1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbLiqur1.checked := cbFeatlMovementsYes1.Checked;
  lblBioPhysicalScore1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  seBiophysicalScore1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  lbldivBy81.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
end;

procedure edtMidCerArtPI1Exit(Sender: TObject);
begin
  edtMidCerArtPI1.text := PadDecimalPlaces(edtMidCerArtPI1.text);                          
end;  

procedure edtAFI1Exit(Sender: TObject);
begin            
   edtAFI1.text := PadDecimalPlaces(edtAFI1.text); 
end;

function PrefixZeroDecimal(inStr: String): String;   
var
  tempStr : String;
begin                
  result := Trim(inStr);                        
  if (pos('.', result) > 0) then        
  begin 
    tempStr  := copy(result, 1, (pos('.', result) -1));
    if tempStr = '' then
      result := '0' + inStr;                
  end;                              
end;                                     

function GetPlacenta1Measure: String;
begin
  if sePlacentaExtendsBy1.text <> '' then
  begin
    result := (sePlacentaExtendsBy1.text)
  end
  else
  begin
    if strToFloatDef(meInternalOS1.Text, 0) > 0 then
      result := meInternalOS1.Text + 'mm from'
    else
      result := 'at'
  end;
end;  

 Function getPlacentaConclusion : String
 begin
 result := '';
    if cbLowLyingPlacentaYes1.checked then
    begin
       result := result + 'Low lying ';
       result := result + GetPlacenta + ' placenta';
       if meInternalOS1.text <> '' then
       begin
        if (StrToFloatDef(meInternalOS1.text,0) > 0 ) then
            result := result+', ' + GetPlacenta1Measure + ' from the internal cervical os.  '
        else if (StrToFloatDef(meInternalOS1.text,0) = 0 ) then
            result := result + ' with the inferior edge reaching the internal cervical os.  '
       end;     
    end;
    if result <> '' then
      result := AddFullStop(result);
 end;

 function getPresentationDetail : String
 begin
   result := '';
   GPresentationWarning := FALSE;
   if  cbPresentation1.itemIndex > 1 then
   begin
     result := result +  Trim(cbPresentation1.Text) ;
     GPresentationWarning := TRUE;
   end;
   else
   begin
     result := result +  Trim(cbPresentation1.Text);
     GPresentationWarning := False;
   end;
   if (result <> '') and  (cbPresentation1.itemIndex < 5) then
     result := result + ' presentation';
   if result <> '' then
     result := AddFullStop(result);
 end;

  function getPresentation : String
 begin
   result := '';
   GPresentationWarning := FALSE;
   if  cbPresentation1.itemIndex > 1 then
   begin
     result := result +  Trim(cbPresentation1.Text) ;
     GPresentationWarning := TRUE;
   end;
   else
   begin
     result := result +  Trim(cbPresentation1.Text);
     GPresentationWarning := False;
   end;
   if (result <> '') and  (cbPresentation1.itemIndex < 5) then
     result := result + ' presentation';
 end;

 function getAssessPlacentalSite: String;
begin
result := '';                                               
    if cxccbReferralIndicators.States[6] = 1 then 
    begin
        if cbLowLyingPlacentaNo1.checked then 
           result := 'Placenta is no longer low lying.';
     end;   
end;         

Function getConclusionWarnings : String
begin
result := '';
  if (GAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GPlacentaWarning = TRUE) then
     result := result + getPlacentaConclusion;  
  if getAssessPlacentalSite <> '' then
     result := result + getAssessPlacentalSite ;
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE)or (GetDuctusVenosusWarning = TRUE) or (cbFeatlMovementsNo1.checked) then
     result := result + 'Dictate WELL-BEING.  '
  if cbFibroidsVisualised.checked then                                                                                   
  begin
   if (spFibroidCount.value > 0) then
   begin                                                  
     if spFibroidCount.value = 1 then
      result := result + 'Fibroid as described.  ';
     else
      result := result + 'Fibroids as described.  ';
   end
   else
      result := result + 'Fibroid/s as described.  ';
  end;
end;

Function getDuctusVenosus : String
begin
  result := '';
  if cbDVWNormal1.checked then
    result := result + 'normal wave form'
  else if cbDVWAbNormal1.checked then
    result := result + 'abnormal wave form'
  if result <> '' then
    result := #13#10 + 'Ductus venosus' + #9#9 + result;  
end;
