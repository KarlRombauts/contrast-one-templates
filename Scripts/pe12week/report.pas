function CheckFormComplete: Boolean;                                                        
begin                                                                             
    result := true;    
    if GetClinicalIndicators = '' then
    begin        
      ShowMessage('Please enter indication');
      result := False;
    end;
    if deUSSEDD1.date <=0 then                                                        
    begin        
      ShowMessage('Please enter USS EDD');
      result := False;
    end;                           
    if not getAnatomyChecked then
    begin             
      ShowMessage('Please tick Normal/Abnormal for anatomy');
      result := False;
    end;
     if cbPlacentaSite1.text = '' then       
    begin        
      ShowMessage('Please enter placental site');
      result := False;     
    end;
    if meCervicalLength.text <> '' then
    begin
        if not(StrToFloatDef(meCervicalLength.text,0)>0) then
        begin
          ShowMessage('Please enter cervix');
          result := False;
        end;
     end
     else if meCervicalLength.text = '' then
     begin
          ShowMessage('Please enter cervix');
          result := False;
     end;
     if edNucTransMeasurement1.text <> '' then
    begin
        if not(StrToFloatDef(edNucTransMeasurement1.text,0)>0) then
        begin
          ShowMessage('Please enter NT');
          result := False;
        end;
     end
     else if edNucTransMeasurement1.text = '' then
     begin
          ShowMessage('Please enter NT');
          result := False;
     end;
end;                                         

procedure ProduceMergeFieldData;
var
  v1: String;
begin
  GAnatomyWarning := False;
  GFibroidWarning := False;
    // ---------------Gestation Details--------------------------------- //
  lbMergeDataMergeFields.Items.Clear;
  if not(cbPregnancyRedatedYes.checked) then
  begin
    lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''#|#+BOLDExpected EDD:#/#''');
  end
  else
  begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''Expected EDD:''');
  end
  if GetEnteredEDD <> '' then
     lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');
  else
     lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

   //-----------------  Entered EDD ----------//
  lbMergeDataMergeFields.Items.Add('GA_from_Entered_EDD='''+  getGAFromEnteredEDD   +'''');
   
   //----------------- Composite US  EDD ----------//
  lbMergeDataMergeFields.Items.Add('Composite_Ultrasound_Age='''+  intToStr(seUSSEDDGAWeeks1.value)   +' weeks ''');
  if seSSEDDGADays1.value > 0 then
  begin
    if seSSEDDGADays1.value > 1 then
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' days''');
    else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' day''');
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
  end;

  lbMergeDataMergeFields.Items.Add('BPD_T1mm='''+  getBPD   +'mm''');
  lbMergeDataMergeFields.Items.Add('Crown_Rump_Length='''+ getCRL +'mm''');
 

  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetObstetricHistory +'''');

  if (edNucTransMeasurement1.text <> '') then
  begin
     if StrToFloatDef(edNucTransMeasurement1.text,0.0) > 0 then
       lbMergeDataMergeFields.Items.Add('NT='''+ edNucTransMeasurement1.text +'''');
     else
       lbMergeDataMergeFields.Items.Add('NT=''##''');
  end;

  lbMergeDataMergeFields.Items.Add('Placenta='''+ GetPlacenta +'''');
  lbMergeDataMergeFields.Items.Add('NasalBone='''+ GetNasalBone +'''');

  lbMergeDataMergeFields.Items.Add('Ovaries='''+ getOvary +'''');
  lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervixDetailed + '''');


  lbMergeDataMergeFields.Items.Add('liquor='''+ inItCaps(cbAmnioticFluid1.text,True) + '''');

  lbMergeDataMergeFields.Items.Add('Anatomy='''+ getAnatomy + '''');
  lbMergeDataMergeFields.Items.Add('ReportHeading='''+ getReportHeading + '''');


     //lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
     //lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

     //------------------------------PE Screen -------------------------------------//
    if edtHeight.text <> '' then
    begin
      if StrToFloatDef(edtHeight.text,0.0) > 0 then
        lbMergeDataMergeFields.Items.Add('height='''+ RemoveDecimalPointAtEnd(edtHeight.text) + '''');
      else
         lbMergeDataMergeFields.Items.Add('height=''##''');
    end;
    else
       lbMergeDataMergeFields.Items.Add('height=''##''');

    if edtWeight.text <> '' then
    begin
      if StrToFloatDef(edtWeight.text,0.0) > 0 then
        lbMergeDataMergeFields.Items.Add('weight='''+ edtWeight.text + '''');
      else
         lbMergeDataMergeFields.Items.Add('weight=''##''');
    end;
    else
       lbMergeDataMergeFields.Items.Add('weight=''##''');
       
   if cbOrigin.text <> '' then
    lbMergeDataMergeFields.Items.Add('racialOrigin='''+ cbOrigin.text + '''');
   else
     lbMergeDataMergeFields.Items.Add('racialOrigin=''##''');

   if cbConceptionMethod.text <> '' then
    lbMergeDataMergeFields.Items.Add('Conception Method='''+ cbConceptionMethod.text + '''');
   else
     lbMergeDataMergeFields.Items.Add('Conception Method=''##''');

   {if getOvaryConc <> '' then }
    lbMergeDataMergeFields.Items.Add('OvaryConc='''+ getOvaryConc + '''');
   {else
    lbMergeDataMergeFields.Items.Add('OvaryConc=''');}
                                                                                            
   if cbSmokingYes.checked then
    lbMergeDataMergeFields.Items.Add('smoker=''Yes''');
   else if cbSmokingNo.checked then
     lbMergeDataMergeFields.Items.Add('smoker=''No''');
   else
     lbMergeDataMergeFields.Items.Add('smoker=''##''');

   if cbPEYes.checked then
    lbMergeDataMergeFields.Items.Add('MotherPE=''Yes''');
   else if cbPENo.checked then
     lbMergeDataMergeFields.Items.Add('MotherPE=''No''');
   else
     lbMergeDataMergeFields.Items.Add('MotherPE=''##''');

   lbMergeDataMergeFields.Items.Add('MedicalHistory='''+ getMedicalHistory + '''');
   lbMergeDataMergeFields.Items.Add('PEObstetricHistory='''+ getPEObstetricHistory + '''');
   lbMergeDataMergeFields.Items.Add('BioPhysicalMeasurements='''+ getBioPhysicalMeasurements + '''');
   lbMergeDataMergeFields.Items.Add('BioChemistry='''+ getBioChemistry + '''');
   lbMergeDataMergeFields.Items.Add('conclusion='''+ getConclusion + '''');
  // lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');

end;

procedure ProduceMergeOrder;
var
  vHeading : Boolean;
  PEPerformedYes : Boolean;
begin
  vHeading := False;
  PEPerformedYes := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
  {if ((getAnatomyWarning = TRUE) or (getCervixWarning = TRUE) or  (getOvaryWarning = TRUE ) or (GFibroidWarning = TRUE))then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;}
  if ((cbPEDoneYes.checked = True) or (cxccbReferralIndication.States[7] = 1)) then
    PEPerformedYes := TRUE;
   if PEPerformedYes then
   begin
     if ((cxccbReferralIndication.States[1] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('VCGSPreEclampsia')
      else if ((cxccbReferralIndication.States[5] = 1) and PEPerformedYes )then
        lbMergeDataMergeOrder.Items.Add('NTOnlyPEScreening')
      else if ((cxccbReferralIndication.States[6] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('AneuploidyDeclinedPEScreening')
      else if ((cxccbReferralIndication.States[2] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('NIPSPEScreening')
      else if ((cxccbReferralIndication.States[3] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('NIPSPendingPEScreening')
      else if ((cxccbReferralIndication.States[0] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('NormalNIPSPEScreening')
      else if ((cxccbReferralIndication.States[4] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('IncreasedNIPSPEScreening')
      else if ((cxccbReferralIndication.States[8] = 1) and PEPerformedYes)  then
        lbMergeDataMergeOrder.Items.Add('DefaultPEScreening')
     else
        lbMergeDataMergeOrder.Items.Add('DefaultPEScreening');
    end;
   else
   begin
      if cxccbReferralIndication.States[1] = 1 then
        lbMergeDataMergeOrder.Items.Add('MSS+VCGS')
      else if cxccbReferralIndication.States[5] = 1 then
        lbMergeDataMergeOrder.Items.Add('NTOnly')
      else if cxccbReferralIndication.States[6] = 1 then
        lbMergeDataMergeOrder.Items.Add('AneuploidyDeclined')
      else if cxccbReferralIndication.States[2] = 1 then
        lbMergeDataMergeOrder.Items.Add('NIPS')
      else if cxccbReferralIndication.States[3] = 1 then
        lbMergeDataMergeOrder.Items.Add('NIPSPending')
      else if cxccbReferralIndication.States[0] = 1 then
        lbMergeDataMergeOrder.Items.Add('NormalNIPS')
      else if cxccbReferralIndication.States[4] = 1 then
        lbMergeDataMergeOrder.Items.Add('IncreasedNIPS')
     else
       lbMergeDataMergeOrder.Items.Add('Default')
    end;
end;
