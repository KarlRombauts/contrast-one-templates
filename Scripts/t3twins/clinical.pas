procedure cbFeatlMovements1Click(Sender);
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

procedure cbFeatlMovements2Click(Sender);
begin
  cbToggleCheckOnClick(Sender);
  cbFetalTone2.Enabled := ((cbFeatlMovementsYes2.Checked) or (cbFeatlMovementsNo2.Checked));
  cbFetalTone2.checked := cbFeatlMovementsYes2.Checked;
  cbFetalMovement2.Enabled :=((cbFeatlMovementsYes2.Checked) or (cbFeatlMovementsNo2.Checked));
  cbFetalMovement2.Checked := cbFeatlMovementsYes2.Checked;
  cbFetalBreathing2.Enabled := ((cbFeatlMovementsYes2.Checked) or (cbFeatlMovementsNo2.Checked));
  cbFetalBreathing2.Checked := cbFeatlMovementsYes2.Checked;
  cbLiqur2.Enabled := ((cbFeatlMovementsYes2.Checked) or (cbFeatlMovementsNo2.Checked));
  cbLiqur2.checked := cbFeatlMovementsYes2.Checked;
  lblBioPhysicalScore2.Enabled := ((cbFeatlMovementsYes2.Checked) or (cbFeatlMovementsNo2.Checked));
  seBiophysicalScore2.Enabled := ((cbFeatlMovementsYes2.Checked) or (cbFeatlMovementsNo2.Checked));
  lbldivBy82.Enabled := ((cbFeatlMovementsYes2.Checked) or (cbFeatlMovementsNo2.Checked));
end;

function RemoveFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] = '.' then
      result := vt + ''
    else                       
      result := inStr;
  end
  else
    result := ''
end;  

function AddComma(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
     result := vt + ', '      
  else
    result := ''
end;

function GetGestationDetails: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to ccbGestationType.Properties.Items.Count - 1 do
  begin
    if ccbGestationType.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + ccbGestationType.ShortDescription[i];
    end;
  end;
  if result <> '' then
    result := AddFullStop(result);
  result := result + ' ';
end;

Function GetFeatures(inTwin : integer) : String
Var
  vMaternalLeft,vMaternalRight,vMale,vFemale : TcxCheckbox
  vPresentation :TcxCombobox
begin
  result := '';
  vMaternalLeft := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbMaternalLeft' + IntToStr(inTwin));
  vMaternalRight := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbMaternalRight' + IntToStr(inTwin));
  vMale := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbMale' + IntToStr(inTwin));
  vFemale := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFemale' + IntToStr(inTwin));
  vPresentation := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbPresentation' + IntToStr(inTwin));
  if vPresentation.text <> '' then
  begin
    result := result + lowercase(vPresentation.text) ; 
    result := AddComma(result);
  end;      
  if vMaternalLeft.checked then
    result:= result + 'maternal left'
  else if vMaternalRight.checked then
     result:= result + 'maternal right' 
                                                     
  if vMale.Checked then
     result := result + ', male';
  else if vFeMale.Checked then
     result := result + ', female'; 
                                          
    
  
                     
                
end;                                       

function GetPlacenta1: String;
begin
  result := lowercase(trim(cbPlacentaSite1.text));
end;                                   

function GetPlacenta2: String;                                         
begin             
  result := lowercase(trim(cbPlacentaSite2.text));
end;                                          

function GetPlacenta1Measure: String;
begin
  if sePlacentaExtendsBy1.Value > 0 then
  begin
    result := IntToStr(sePlacentaExtendsBy1.Value)
  end
  else                                 
  begin
    if strToFloatDef(meInternalOS1.Text, 0) > 0 then
      result := meInternalOS1.Text + 'mm from'
    else
      result := 'at'
  end;
end;  

function GetPlacenta2Measure: String;
begin
  if sePlacentaExtendsBy2.Value > 0 then
  begin
    result := IntToStr(sePlacentaExtendsBy2.Value)
  end
  else
  begin
    if strToFloatDef(meInternalOS2.Text, 0) > 0 then
      result := meInternalOS2.Text + 'mm from'
    else
      result := 'at'
  end;
end;                                             

 function getPlacenta1Beyond : string
 begin         
   result := GetPlacenta1 +', extending ' {+ GetPlacenta1InvertPosition + ' '} + GetPlacenta1Measure +' mm beyond the internal cervical os.';
 end; 

 function getPlacenta2Beyond : string
 begin
   result := GetPlacenta2 +', extending ' {+ GetPlacenta2InvertPosition + ' ' }+ GetPlacenta2Measure +' mm beyond the internal cervical os.';
 end;

 Function getPlacenta1Position : String   
  begin    
      if cbLowLyingPlacentaYes1.checked then
        begin                                              
           result := GetPlacenta1 + ' and low lying.';  
           GPlacentaWarning := TRUE;                   
           if meInternalOS1.text <> '' then                  
            begin       
              result := result + ' with the lower edge ' + GetPlacenta1Measure + ' the internal cervical os.  '
            end;                                      
        end
        else if cbLowLyingPlacentaNo1.checked then
        begin
            result := GetPlacenta1 + ' and not low lying.  ';
            GPlacentaWarning := False;                           
        end;                                 
    end;

 Function getPlacenta2Position : String
  if cbLowLyingPlacentaYes2.checked then
    begin
       result := GetPlacenta2 + ' and low lying.  ';                                      
       GPlacentaWarning := TRUE;
       if meInternalOS2.text <> '' then
        begin
          result := GetPlacenta2 + ' with the lower edge ' + GetPlacenta2Measure + ' the internal cervical os.  '
        end;
    end

 Function getPlacentaConclusion : String
 begin
 result := '';                                                 
    if (cbLowLyingPlacentaYes1.checked)or (cbLowLyingPlacentaYes2.checked) then
    begin
       result := result + 'Low lying placenta. Review of placental site at 32 weeks is indicated';
    end;
 end;

 function getPresentationDetail1 : String
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

 function getPresentationDetail2 : String
 begin
   result := '';
   GPresentationWarning := FALSE;
   if  cbPresentation2.itemIndex > 1 then
   begin
     result := result +  Trim(cbPresentation2.Text) ;
     GPresentationWarning := TRUE;
   end;
   else
   begin
     result := result +  Trim(cbPresentation2.Text);
     GPresentationWarning := False;
   end;
   if (result <> '') and  (cbPresentation2.itemIndex < 5) then
     result := result + ' presentation';         
 end;

Function getConclusionWarnings : String
begin
result := '';
  if (GAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GPlacentaWarning = TRUE) then
     result := result + getPlacentaConclusion;
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) then
     result := result + 'Dictate WELL-BEING.  '
end;

Function getDuctusVenosus1 : String
begin
  result := '';
  if cbDVWNormal1.checked then
    result := result + 'normal wave form'
  else if cbDVWAbNormal1.checked then
    result := result + 'abnormal wave form'
  if result <> '' then
    result := ', ductus venosus: ' + result;  
end;

Function getDuctusVenosus2 : String
begin
  result := '';
  if cbDVWNormal2.checked then
    result := result + 'normal wave form'
  else if cbDVWAbNormal2.checked then
    result := result + 'abnormal wave form'
  if result <> '' then
    result := ', ductus venosus: ' + result;  
end;                                                                        

Function getMCAPSV1 : String               
begin                                                                                                     
    if (cbRiskFetalAnemiaYes1.checked) or (ccbGestationType.States[1]=1) or (ccbGestationType.States[2]=1) then
    result := edtMidCerArtPSF1.text  
  else
  begin
    result := ''            
  end  
  if result <> '' then
    result := ', MCA PSV: ' + result + 'cm/s'; 
  else
  begin
  result :=''
  end                                       
end;  

Function getMCAPSV2 : String               
begin
    if (cbRiskFetalAnemiaYes1.checked) or (ccbGestationType.States[1]=1) or (ccbGestationType.States[2]=1) then
    result := edtMidCerArtPSF2.text  
  else
  begin
    result := ''            
  end  
  if result <> '' then
    result := ', MCA PSV: ' + result + 'cm/s'; 
  else
  begin
  result :=''
  end                                       
end;  
