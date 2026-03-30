 Procedure cbParousClick(Sender)
 begin
   gbLastPregnancy.visible := cbParous.checked;
 end

function getMedicalHistory : String
var
  i: Integer;
begin
  result := '';
  for i := 0 to ccbPEMedicationHistory.Properties.Items.Count - 1 do
  begin
    if ccbPEMedicationHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ',  ';
      result := result + ccbPEMedicationHistory.ShortDescription[i];
    end;
  end;
  if result = '' then
  begin
    result := result + 'Nil  ';
  end;
end;

function getPEObstetricHistory : String
begin
result := '';
  if cbNalliPorous.checked then
  begin
    result := 'Nulliparous';
  end;
  else if cbParous.checked then
  begin
    result := 'Parous';
    if sePrevGAWk.Value > 0 then
      result := result + ', last delivered at ' + intToStr(sePrevGAWk.value)  +  ' weeks' ;
    if meBirthWeight.text <> '' then
    begin
       if strToFloatDef(meBirthWeight.text,0.0) > 0 then
         result := result + ', ' + meBirthWeight.text + 'g';
    end;
    if cbPrevPEYes.checked then
      result := result + ', pre-eclampsia'
    else if cbPrevPENo.checked then
      result := result + ', no pre-eclampsia'  
  end;
end;

function getBioPhysicalMeasurements : String
begin
result := '';
 if edtMAP.text <> '' then
 begin
    if StrToFloatDef(edtMAP.text,0.0) > 0 then
    begin
       result := result + 'MAP ' + edtMAP.text + ' mmHg ' + #9;
    end;
    else
      result := result + 'MAP ## mmHg '+ #9;
 end;
 else
    result := result + 'MAP ## mmHg ' + #9;

 if edtUTPUI.text <> '' then
 begin
    if StrToFloatDef(edtUTPUI.text,0.0) > 0 then
     result := result + 'Mean UTPI ' + edtUTPUI.text + ' MoM'
    else
      result := result + 'Mean UTPI ## MoM'
 end;
 else
    result := result + 'Mean UTPI ## MoM'
end;

function getBioChemistry : String
begin
result := '';
   if edtPIGF.text <> '' then
   begin
     if strToFloatDef(edtPIGF.text,0.0) > 0 then
     begin
        result := result + 'PIGF ' + edtPIGF.text + ' MoM' + #9;
     end
     else
       result := result + 'PlGF ## MoM'+ #9 ;
   end;
   else
     result := result + 'PlGF ## MoM' + #9;

   if edtPAPP.text <> '' then
   begin
     if strToFloatDef(edtPAPP.text,0.0) > 0 then
     begin
       result := result + 'PAPP-A ' + edtPAPP.text + ' MoM';
     end
     else
         result := result + 'PAPP-A ## MoM'
   end
   else
       result := result + 'PAPP-A ## MoM'
end;

Function getGAFromEnteredEDD :String;
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'LMP Unknown. ';
  end
  else}
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
    begin
      result := Trim(IntToStr(seEDDCalGAWeeks.Value)) + ' weeks ';
      if seEDDCalGADays.Value >= 0 then
      begin
         if seEDDCalGADays.Value = 1 then
          result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' day';
         else
           result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' days';
      end;     
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := Trim(IntToStr(seStatedEDDGestAgeWeeks.Value)) + ' weeks ';
      if seStatedEDDGestAgeDays.Value >= 0 then
      begin
         if seStatedEDDGestAgeDays.Value = 1 then
          result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' day';
         else                                                                    
           result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := Trim(IntToStr(seMUFWGestAgeWeeks.Value)) + ' weeks ';
    if seMUFWGestAgeDays.Value >= 0 then
    begin
       if seMUFWGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' days';
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := Trim(IntToStr(spOvualtionGestAgeWeeks.Value)) + ' weeks ';
      if spOvualtionGestAgeDays.Value >= 0 then
      begin
       if spOvualtionGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := IntToStr(seIVFGAWeeks.Value) + ' weeks ';
      if seIVFGADays.Value >= 0 then
      begin
       if seIVFGADays.Value = 1 then
        result := result + Trim(IntToStr(seIVFGADays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seIVFGADays.Value)) + ' days';
      end;
    end;
  end;
end;

 Function getPlacentaConclusion : String
 begin
 result := '';
 end;

Function GetNasalBone : String
Begin
  result := '';
  if cbNasalVisualised1.checked then
    Result := 'The nasal bone is present. ';
  if cbNasaAbsent1.checked then
    Result := 'The nasal bone is absent.  ';
  {if cbNasalNotClear1.checked then
    Result := 'The nasal was not clearly visualised.  ';}  
end;

 Function GetOvary : string;
var
  tempString;
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

     if result <> '' then
     result := #13#10+#13#10 + '#|#+BOLDOvaries:#/#' + #13#10 + result ;

end;

function getAnatomyConc :String
Begin
result := '';
   if cbFetalAnatomyAbNormal1.checked then
  begin
     result := 'Abnormal anatomy.  ';
   end;
end;

function getFibroidConc : String
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

Function getBPD : string
var
  inValue : Integer;
begin
  inValue := 0;
  result := '';
  result := StrToFloatDef(edtBPD1.text,0);
  result := intToStr(round(result));
end;

Function getCRL : string
var
  inValue : Integer;
begin
  inValue := 0;
  result := '';
  result := StrToFloatDef(edtCRL1.text,0);
  result := intToStr(round(result));
end;

function getConclusion: String;
begin
  result := '';
  if cbPregnancyRedatedYes.checked then
  begin
    result := result + 'Normal fetal appearances. ';
    result := result + 'The biometry is consistent with ' + getCompositeDate;
    result := result +  'The pregnancy has been redated. The ultrasound EDD is ' + FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date) +'.  '
  end;
  else
    result := 'Normal fetal appearances at ' + getGAFromEnteredEDD;
  result := AddFullStop(result) ;
end;
