function GetFindings: String;
begin
  case cbPregnancyOutcome.ItemIndex of
    0: result := '##';
    1: result := GetLiveFindings;
    2: result := 'It is too early to visualise a fetal pole.  ';
    3: result := 'It is too early to confirm embryonic viability.  ';
    4: result :=  getMissedMiscarriageFinding;
    5: result := 'A pregnancy of unknown location is identified.  ';
    6: result := 'An ectopic pregnancy is identified.  ';
  else
    result := '##';
  end;
end;

function GetConclusion: String;
begin
  case cbPregnancyOutcome.ItemIndex of
    0: result := '##';
    1: result := GetLiveConclusion
    2: result := 'It is too early to visualise a fetal pole.  ';
    3: result := 'It is too early to confirm embryonic viability.  ';
    4: result :=  getMissedMiscarriageConClusion;
    5: result := 'The findings today are consistent with a pregnancy of unknown location (PUL).  ';
    6: result := 'Ectopic pregnancy identified.  ';
  else
    result := '##';
  end;
  if cbPreigHeamYes.checked then
     result := result + 'Perigestational haemorrhage as described above.  '; 
end;

function GetLiveFindings: String;
begin
  result := '';
  if cbPregnancyRedatedYes.checked then
    result := 'There is a single live intrauterine gestation with biometry consistent with ' + getCompositeDate
  else
    result := 'There is a single live intrauterine gestation.  ';
end;

function GetLiveConclusion: String;
begin
  result := '';
  if cbPregnancyRedatedYes.checked then
  begin
    result := 'There is a single live intrauterine gestation with biometry consistent with ' + getCompositeDate
    result := result +  'The pregnancy has been redated. The ultrasound EDD is ' + FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date) +'.  '
  end;
  else
    result := 'There is a single live intrauterine gestation consistent with the expected gestation.  ';
end;

function getMissedMiscarriageFinding : String ;
begin
  result := '';
  result := 'Unfortunately, this examination confirms a missed miscarriage with embryo dimensions equivalent to '
  if getCompositeDate <> '' then
    result := result + getCompositeDate;
  result := result + 'No embryonic heart motion is detected.  ';
end;

function getMissedMiscarriageConclusion : String;
begin
result := '';
   result := result + 'Unfortunately this examination confirms a missed miscarriage at ' + getGAFromEnteredEDD;
   result := AddFullStopToEnd(Result);    
   result := result + 'The embryo dimensions are equivalent to '+ getCompositeDate + 'No embryonic heart motion detected.  '
end;

function GetEnteredEDD :String
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'No Dates. ';
  end
  else  }
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
      result := FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deStatedEDD.Date);
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := FormatDateTime('dd/mm/yyyy', deMUFWEdd.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := FormatDateTime('dd/mm/yyyy', deOvulationEDD.Date);
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deIVFEDD.Date);
    end;
  end;
  if not(cbPregnancyRedatedYes.checked) then
  begin
     result := '#|#+BOLD' + result + '#/#'
  end
end;

function getCompositeDate : String;
begin
  result := '';
  result := intToStr(seUSSEDDGAWeeks1.value)   +' weeks '               
  if seSSEDDGADays1.value > 0 then
  begin
    if seSSEDDGADays1.value > 1 then
     result := result + intToStr(seSSEDDGADays1.value)   +' days';
    else
     result := result + intToStr(seSSEDDGADays1.value)   +' day';
  end
  else if seSSEDDGADays1.value = 0 then
      result := result + intToStr(seSSEDDGADays1.value)   +' days';
      
  result := AddFullstopToEnd(Result);
end

function getPregnancyRedated : Boolean
begin
  result := FALSE;
  if cbPregnancyRedatedYes.Checked then
    result := TRUE
end;

procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Clear;
  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetClinicalHistory +'''');

  //--------------------No Dates--------------------------
   if cbEDDPrinciple.ItemIndex = 1 then // No Dates
   begin
       lbMergeDataMergeFields.Items.Add('Nodates=''');
       lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''');
       lbMergeDataMergeFields.Items.Add('Expected_Gestation=''');
   end;    
   else
   begin
      lbMergeDataMergeFields.Items.Add('Nodates=''');
      if not(cbPregnancyRedatedYes.checked) then
      begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''#|#+BOLDExpected EDD:#/#''');
      end
      else
      begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''Expected EDD:''');
      end
      lbMergeDataMergeFields.Items.Add('Expected_Gestation='''#13#10 + 'Expected Gestation:''');
   end;
 // ------------------Other EDD-----------------------------
  if GetEnteredEDD <> '' then
     lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');
  else
     lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

   if (deMenstrualEDD.Date > 0) then
     lbMergeDataMergeFields.Items.Add('EDD_from_LMP='''+  FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date)   +'''');
  else
     lbMergeDataMergeFields.Items.Add('EDD_from_LMP=''');

  //-----------------  Entered EDD ----------//
  lbMergeDataMergeFields.Items.Add('GA_from_Entered_EDD='''+  getGAFromEnteredEDD   +'''');
   
   //----------------- Composite US  EDD ----------//
  lbMergeDataMergeFields.Items.Add('Composite_Ultrasound_Age='''+  intToStr(seUSSEDDGAWeeks1.value)   +' weeks''');
  if seSSEDDGADays1.value >= 0 then
  begin
    if seSSEDDGADays1.value = 1 then
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' day''');
    else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' days''');
  end
  else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD=''');    
  //------------------Average US EDD ---------------------//
  if cbPregnancyRedatedYes.checked then
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''#|#+BOLDUltrasound EDD:#/#''');
  end
  else
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''Ultrasound EDD:''');
  end
  if (deUSSEDD1.Date > 0) then
  begin
     if cbPregnancyRedatedYes.checked then
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age=''#|#+BOLD'+  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'#/#''');
     else
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age='''#9 +  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'''');
  end
  else
    ShowMessage('Please Enter USS EDD');

  //----------------------Findings ----------------------//

    lbMergeDataMergeFields.Items.Add('Findings='''+ GetFindings +'''');

  //----------------------Biometry------------------------//
    lbMergeDataMergeFields.Items.Add('Crown_Rump_Length='''+ edtEmbroSize1.text +'mm''');
    lbMergeDataMergeFields.Items.Add('Gestational_Sac_Diameter='''+ edtSacAvg1.text +'mm''');
    if cbYolkSacYes1.checked then
    begin
      if strToFloatdef(edtYolkSacSize1.text,0) > 0 then
         lbMergeDataMergeFields.Items.Add('Yolk_Sac=''seen''');
    end
    else if cbYolkSacNo1.checked then
    begin
       lbMergeDataMergeFields.Items.Add('Yolk_Sac=''not seen''');
    end;
    else
       lbMergeDataMergeFields.Items.Add('Yolk_Sac=''##''');
       
    lbMergeDataMergeFields.Items.Add('Fetal_Heart_Rate='''+ getFetalHeartRate +'''');
    lbMergeDataMergeFields.Items.Add('HeartRateLabel='''+ getHeartRateLabel+'''');
    lbMergeDataMergeFields.Items.Add('Ovaries='''+ getOvary +'''');

    lbMergeDataMergeFields.Items.Add('PregnancyComplication='''+ getPregnancyComplication +'''');
    lbMergeDataMergeFields.Items.Add('PerigestationalHaemorrhage='''+ getPerigestationalHaemorrhage +'''');
    lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');
    lbMergeDataMergeFields.Items.Add('Conclusion='''+ getConclusion +'''');
    lbMergeDataMergeFields.Items.Add('NIPSConclusion='''+ getNIPSConclusion +'''');
     lbMergeDataMergeFields.Items.Add('NIPS='''+ getNIPSString +'''');


end;

procedure ProduceMergeOrder;
begin
  lbMergeDataMergeOrder.Items.Clear;
  if ((getFindingsWarning) or (getOvaryWarning)) or (getPregnancyRedated) then
    lbMergeDataMergeOrder.Items.Add('WARNING');
  if cxccbReferralIndicators.States[2] = 1 then
    lbMergeDataMergeOrder.Items.Add('EARLY_NIPS');
  else
    lbMergeDataMergeOrder.Items.Add('EARLY_ALL');

end;

Function GetOvary : string;
var
  tempString;
begin
  result := '';
  if cbRightOvaryIdentified.checked then
  begin
     if cbLeftOvaryIdentified.checked then
       result := result + 'Both ovaries are not identified.  ';
     else
       result := result + 'The right ovary is not identified.  ';
  end
  else  if cbLeftOvaryIdentified.checked then
     result := result + 'The left ovary is not identified.  ';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := result + 'Both ovaries are normal.  ';
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

  if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries.  ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary.  ';
  end
  else  if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum is visualised in the left ovary.  ' ;

     if result <> '' then
     result := #13#10 + #13#10 + result ;

end;

Function getPerigestationalHaemorrhage : String
begin
   result := '';
   if (cbPreigHeamYes.Checked) and (cbPregnancyOutcome.ItemIndex < 5) then
   begin
    TempStr := '';
    v1 := trunc(sePGHLen.Value);
    v2 := trunc(sePGHWid.Value);
    v3 := trunc(sePGHDep.Value);
    v4 := trunc(sePGHVol.Value * 10) / 10;
    if (v1 > 0) then
      result := Format('A perigestational haemorrhage%s was visualised.',[GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
    else
      result := 'A perigestational haemorrhage was visualised.';
  end;
  else
    result := '';

  if result <> '' then
  begin
    result := #13#10 + #13#10 + result ;
  end;
end;

Function getPregnancyComplication : String;
begin
result := '';
  if cbPregnancyOutcome.ItemIndex = 1 then
  begin
    if (trim(getPerigestationalHaemorrhage) = '') then
      result := #13#10 + #13#10 +'At this early stage there is no evidence of pregnancy complication.  ';
  end;
  else
    result := '';
  if cxccbReferralIndicators.States[2] = 1 then
  begin
    if result <> '' then
      result :=  result + #13#10 +#13#10;
  end;
end;

Function getOvaryWarning : Boolean;
begin
  result := FALSE;
  if ((cbRightOvaryAbnormal.checked) or (cbLeftOvaryAbnormal.checked)) then
    result := TRUE;
end;

Function getFindingsWarning : Boolean;
begin
  result := FALSE;
  case cbPregnancyOutcome.ItemIndex of
   0,2,3,4,5,6 : result := TRUE;
   1: result := FALSE;
  end; 
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
      Result := Trim(IntToStr(seIVFGAWeeks.Value)) + ' weeks ' ;
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
