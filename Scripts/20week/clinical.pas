function GetAneuploidyRisk: String;
begin
  result := '';
  case cbAneuploidy.ItemIndex of
    0: result := 'Normal NIPS.  ';
    1: result := 'Low risk combined screen.  ';
    2: result := 'Normal microarray.  ';
    3: result := 'Normal karyotype.  ';
    4: result := 'Increased risk NIPS.  ';
    5: result := 'Increased risk combined screen.  ';
    6: result := 'No aneuploidy screening.  ';
  end;
end;

Function getGAFromEnteredEDD :String;                                      
Begin                                             
result := '';
  result := Trim(IntToStr(seEDDCalGAWeeks.Value)) + ' weeks ';
  if seEDDCalGADays.Value >= 0 then
  begin
     if seEDDCalGADays.Value = 1 then
      result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' day';
     else
       result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' days';
  end;          
                                                               
end;

function GetSuccenturiateType: String;
begin
  result := '';
  if trim(cbSuccentPos1.Text) <> '' then
    result := trim(initCaps(cbSuccentPos1.Text, true)) + ' ';
end;                                                                                                                                                                                                      

function GetPlacenta1Measure: String;
begin
  if sePlacentaExtendsBy1.text <> '' then
  begin
    result := sePlacentaExtendsBy1.text
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
       result := result + 'Low lying placenta. Review of placental site at 32 weeks is indicated.';
      {result := result + GetPlacenta + ' placenta';
        if (StrToFloatDef(meInternalOS1.text,0) > 0 ) then
            result := result+', ' + GetPlacenta1Measure + ' from the internal cervical os.  '}
    end;
    if result <> '' then
      result := AddFullStop(result);
   if cbVasaPraeviaYes1.checked then
     result := result + 'Vasa praevia identified.  ';
   else if cbVasaPraeviaNo1.checked then
     result := result + 'No evidence of vasa praevia.  ';
   if cbSuccenturiateLobeYes1.checked then
   begin
     if (cbLowLyingYes11.enabled) and (cbLowLyingYes11.checked) then
     begin
        if (cbSuccentPos1.Enabled) and (cbSuccentPos1.text <> '') then
          result := result + 'Low lying ' + lowercase(cbSuccentPos1.text) + ' succenturiate lobe identified.  '
        else
          result := result + 'Low lying succenturiate lobe identified.  ';
     end
     else
        result := result + 'Succenturiate lobe identified.  ';
   end;
 end;

 Function getLowLyingPlacentaString : String;
 var
  vPlacentaString : String;
   vCordString : String;
   vlowLying :Stirng;
 begin
 result := '';
 vPlacentaString := '';
 vCordString := '';
 vlowLying := '';
   if cbPlacentaSite1.text <> '' then
     vPlacentaString := vPlacentaString + cbPlacentaSite1.text;
   else
     vPlacentaString := '##'
   if cbVCI1.checked then
     vCordString :=  'velamentous cord insertion'
   else if cbMCI1.checked then
     vCordString :=  'marginal cord insertion';
   else if cbCCI1.checked then
     vCordString :=  'central cord insertion';
   if cbLowLyingPlacentaYes1.checked then
     vlowLying := 'and presently low lying.';
   result := result + vPlacentaString + ' with a '+ vCordString;
   if vlowLying <> '' then
     result := result + ' '+ vlowLying;
   if meInternalOS1.text <> '' then
   begin
     if StrToFloatDef(meInternalOS1.text,true) > 0 then
       result := result + '  The lower edge is '+ meInternalOS1.text  + 'mm from the internal os.  '
   end
   else if sePlacentaExtendsBy1.text <> '' then
   begin
       if StrToFloatDef(sePlacentaExtendsBy1.text,true) > 0 then
          result := result + '  It extends beyond the internal os by '+ sePlacentaExtendsBy1.text  + 'mm.  '
       else if StrToFloatDef(sePlacentaExtendsBy1.text,true) = 0 then
          result := result + '  The inferior edge reaching the internal cervical os.  '
   end;
   if cbVasaPraeviaYes1.checked then
     result := AddFullStopToEnd(result) +  'Vasa praevia identified.  ';
   else if cbVasaPraeviaNo1.checked then
     result := AddFullStopToEnd(result) +  'No evidence of vasa praevia.  ';
   if cbSuccenturiateLobeYes1.checked then
   begin
     if (cbLowLyingYes11.enabled) and (cbLowLyingYes11.checked) then
     begin
        if (cbSuccentPos1.Enabled) and (cbSuccentPos1.text <> '') then
          result := AddFullStopToEnd(result) + 'Low lying ' + lowercase(cbSuccentPos1.text) + ' succenturiate lobe identified.  '
        else
          result := AddFullStopToEnd(result) + 'Low lying succenturiate lobe identified.  ';
     end
     else
        result := AddFullStopToEnd(result) + 'Succenturiate lobe identified.  ';  
   end;
   if result <> '' then
   begin
     result := #13#10 + #13#10 + '#|#+UNDE#|#+BOLDPlacenta#/#' + #13#10  + result;
   end;
 end;

 Function getAnatomyNormalViews :  Boolean
 begin
     result := TRUE;
     if cbFetalAnatomyNormal1.checked then
     begin                              
        if (cbPoorView.checked)or  (cbAverageViews.checked)or (cbGoodViews.checked)or (cbVeryGoodViews.checked) then
           result := TRUE; 
        else 
          result := False;  
     end;
       
 end;                      

 function getPlacentaString : String;
 var
   vPlacentaString : String;
   vCordString : String;                                                   
   vlowLying :Stirng;
 begin
 result := '';
 vPlacentaString := '';
 vCordString := '';
 vlowLying := '';
   if cbPlacentaSite1.text <> '' then
     vPlacentaString := vPlacentaString + lowercase(cbPlacentaSite1.text);
   else
     vPlacentaString := '## '
   if cbVCI1.checked then
     vCordString :=  'velamentous cord insertion'
   else if cbMCI1.checked then 
     vCordString :=  'marginal cord insertion';
   else if cbCCI1.checked then
     vCordString :=  'central cord insertion';
   if cbLowLyingPlacentaNo1.checked then
     vlowLying := 'not low lying';
   result := result + vPlacentaString + ' with a '+ vCordString;
   if vlowLying <> '' then
     result := result + ', '+ vlowLying;

   if result <> '' then
   begin
     result := #13#10 + 'Placenta:'+ #09#09  + lowercase(result);
   end;
 end;

 function GetPlacentalSite : String;
 begin
 result := '';
   if trim(cbPlacentaSite1.text) <> '' then
     result := lowercase(cbPlacentaSite1.text) + 'ly ';
   else
     result := '## ';
   if cbVCI1.checked then
       result :=  result + 'with a velamentous cord insertion'      
   else if cbMCI1.checked then
       result := result +  'with a marginal cord insertion';   
   else if cbCCI1.checked then
       result := result + 'with a central cord insertion';   
 end;                

function getFirstName : string;  
begin                                                          
  result := 'The Patient';
end;                                      

function getGenderStr : string;  
begin   
  if cbGendermale1.checked then                          
    result := 'male'
  else if cbGenderFemale1.checked then
    result := 'female'
  else
    result := '##'
end;                                            

function getNipsGenderResult : string;    
begin       
  if cbConsistentNIPTYes1.checked then
    result := 'This is consistent with the NIPS result.'
                                                               
  else if cbConsistentNIPTNo1.checked then
    result := 'This is not consistent with the NIPS result.'

  else if cbConsistentNIPTUnknown1.checked then
    result := 'The patient did not find out the gender from the NIPS result.' 
  else
    result := ''
end;

function getGender : string                                                                         
begin
    result := '';                                                                               
                                
    if (cbPatientInformedNo.checked) then 
    begin
      result := 'The fetal gender has been visualised and recorded but has not been revealed at the request of the patient.' 
      result := #13#10 + #13#10 + result;  
    end;                                           
                      
    if (cbPatientInformedYes.checked) then 
    begin                                       
        result := 'The fetal gender appear ' + getGenderStr();       
        result := result + ' and the patient is aware. '      
        result := result + getNipsGenderResult();     
        result := #13#10 + #13#10 + result;  
    end;         
 end;                                  

 Function GetOvary : string;
var
  tempString;
begin
  result := '';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := '';
     else
       result := result + 'The right ovary is normal.  ';
  end
  else  if cbLeftOvaryNormal.checked then
     result := result + 'The left ovary is normal.  ';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal.  ';
     else
       result := result + 'The right ovary is abnormal.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'The left ovary is abnormal.  ';

 { if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries.  ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary.  ';
  end
  else  if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum s visualised in the left ovary.  ' ; }

     if result <> '' then
     result := #13#10+#13#10 + result ;

end;

function getAnatomyConclusion : String
begin
result := '';
if cbFetalAnatomyAbNormal1.checked then
  result := result + 'Abnormal anatomy';
else
  result := result + 'Normal fetal appearances';
end;

function getNIPSWarning : Boolean
begin
result := FALSE;
if cbConsistentNIPTNo1.checked then
   result := TRUE;
end;

function getCordInsertionWarning : Boolean
begin
result := FALSE;
if cbMCI1.checked then
   result := TRUE;
end;

function getPlacentalWarning : Boolean
begin
result := FALSE;
if cbLowLyingPlacentaYes1.checked then
begin
   result := TRUE;
 end;
end;

Function getPlacentalChecks : Boolean
begin
  result := False;
  if (cbVasaPraeviaYes1.checked) or (cbVasaPraeviaNo1.Checked) then
    result := True;
  if (cbSuccenturiateLobeYes1.checked) or (cbSuccenturiateLobeNo1.Checked) then
    result := True;
  if (cbLowLyingYes11.checked) or (cbLowLyingYes11.Checked) then
    result := True;
end;

Function getConclusionWarnings : String
begin
result := '';
  if (getAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) then
     result := result + 'Dictate WELL-BEING.  '   
  if (getNIPSWarning = TRUE) then
     result := result + 'Dictate NIPS.  '                                             
  if (getCordInsertionWarning = TRUE) then
     result := result + 'Dictate MCI.  ' 
  if (getOvaryWarning = TRUE)  then
     result := result + 'Dictate Ovaries.  '  
   if (getCervixWarning = TRUE)  then
     result := result + 'Dictate Cervix.  ' 
end;              

function getOvaryConclusion :String
begin
  result := '';
  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal.  ';
     else
       result := result + 'Abnormal right ovary.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'Abnormal left ovary.  ';
end;

function getFibroidConclusion : String
begin
 result := '';
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

function getAbnormalConclusion : string
begin
   Result := '';
   result := result + GetCervixConclusion;
   result := result + getPlacentaConclusion;
   result := result + getOvaryConclusion;
   result := result + getFibroidConclusion;
end;
