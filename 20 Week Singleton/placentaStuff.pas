

function getPlacentaCordInsertion: String;
begin
    if cbVCI1.checked then
        result := 'velamentous cord insertion';
    else if cbMCI1.checked then
        result := 'marginal cord insertion';
    else if cbCCI1.checked then
        result := 'central cord insertion';
    else
        result := '##';
end;


function getPlacentaSite: String;
begin
    result := lowercase(trim(cbPlacentaSite1.text));

    if result = '' then
        result := '##'  
end;


function getPlacentaLeadingEdgeDistance: String;
var
    vLeadingEdgeDistance: Float
begin
    vLeadingEdgeDistance = StrToFloatDef(meInternalOS1.text,true)

    if vLeadingEdgeDistance < 0 then
        result := '##'
    else if vLeadingEdgeDistance = 0 then
        result :=  'The lower edge is reaching the internal os'
    else if vLeadingEdgeDistance > 0 then
        result := 'The lower edge is ' + meInternalOS1.text  + 'mm from the internal os.'
end;


function getPlacentaBeyondInternalOsDistance: String;
var
    vBeyondDistance: Float
begin
    vBeyondDistance = StrToFloatDef(sePlacentaExtendsBy1.text, true)

    if vBeyondDistance < 0 then
        result := '##'
    else if vBeyondDistance = 0 then
        result :=  'The lower edge is reaching the internal os'
    else if vBeyondDistance > 0 then
        result := 'The lower edge is extending ' + sePlacentaExtendsBy1.text  + 'mm beyond the internal os.'
end;


function getPlacentaDistanceFromOs: String
begin
    result := ''

    if meInternalOS1.text <> '' then
    begin
        result := getPlacentaLeadingEdgeDistance()
        Exit;
    end;

    if sePlacentaExtendsBy1.text <> '' then
        result := getPlacentaBeyondInternalOsDistance()
        Exit;
    end;
end;


function getPlacentaLowLying: String;
begin
    if cbLowLyingPlacentaYes1.checked then begin
        result := 'currently low lying'
        result := result + '. ' + getPlacentaDistanceFromOs()
    end;
    else if cbLowLyingPlacentaNo1.checked then
        result := 'not low lying'
    else
        result := '##'
end;


function getSuccenturiateLobeLowLying: String;
begin
    result := '##'

    if cbLowLyingNo11.checked
        result := 'not low lying'
    else if cbLowLyingYes11
        result := 'currently low lying'
end;


function getSuccenturiateLobeSite: String;
begin
    result := '##'
    if (cbSuccentPos1.Enabled) and (cbSuccentPos1.text <> '') then
        result := lowercase(cbSuccentPos1.text)
end;


function getSuccenturiateLobeReportString: String;
begin
    result := ''

    if cbSuccenturiateLobeNo1.checked then 
        Exit;

    result := 'There is a succenturiate lobe which is ' + getSuccenturiateLobeSite()
    result := result + ' and ' + getSuccenturiateLobeLowLying()
end;


function shouldReportNoVasaPrevia: Boolean
begin
    result := cbVCI1.checked or cbSuccenturiateLobeYes1.checked
end;


function getVasaPreviaReportString: String;
begin
    if cbVasaPraeviaYes1.checked then
        result := 'There is vasa praevia. '
    else if cbVasaPraeviaNo1.checked and shouldReportNoVasaPrevia()
        result := 'There is no vasa praevia. '
    else 
        result := ''
end;


function getSuccenturiateLobeConclusionString: String;
begin
    result := result + 'There is a succenturiate lobe'

    if cbLowLyingYes11.checked then 
        result := result + 'which is currently low lying'

    result := result + '. '
end;


function shouldReviewPlacenta: Boolean;
begin
    result := cbLowLyingPlacentaYes1.checked or cbVasaPraeviaYes1.checked or cbLowLyingYes11.checked or cbVCI1.checked
end;


function getPlacentaReportString: String;
begin
    if cbLowLyingPlacentaNotAssessed1.checked then begin
        result := 'The placenta is developing ' + getPlacentaSite() + 'ly.'
        Exit;
    end;

    result := 'The placenta is ' + getPlacentaSite()
    result := result + ' with a ' + getPlacentaCordInsertion()
    result := result + ' and ' getPlacentaLowLying() + '. '
    result := result + getSuccenturiateLobeReportString() + '. '
    result := result + getVasaPreviaReportString()
end;


function getPlacentaConclusionString: String;
begin
    result := ''

    if cbLowLyingPlacentaYes1.checked then
        result := result + 'The placenta is currently low lying. '

    if cbSuccenturiateLobeYes1.checked then
        result := result + getSuccenturiateLobeConclusionString()

    if cbVCI1.checked then
        result := result + 'There is a velamentous cord insertion. '

    result := result + getVasaPreviaReportString()

    if shouldReviewPlacenta() then
        result := 'Review around 32 weeks should be considered. '
end;





































function getPlacentaInvertedPosition: String;
begin
  result := Uppercase(trim(cbPlacentaSite1.text));
  if pos('ANTERIOR', UpperCase(result)) > 0 then
    result := StringReplace(result, 'ANTERIOR', 'POSTERIORLY')
  else
  if pos('POSTERIOR', UpperCase(result)) > 0 then
    result := StringReplace(result, 'POSTERIOR', 'ANTERIORLY')

  result := lowercase(result);
end;


function GetPlacentaDistance: String;
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



 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta is ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
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