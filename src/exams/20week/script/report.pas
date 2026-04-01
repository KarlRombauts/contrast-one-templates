function CheckFormComplete: Boolean;
begin
  result := true;

  if GetClinicalIndicators = '' then
    begin
      ShowMessage('Please enter indication');
      result := False;
    end;
  if GetAneuploidyRisk = '' then
    begin
      ShowMessage('Please enter Aneuploidy Risk');
      result := False;
    end;
  if deUSSEDD1.date <= 0 then
    begin
      ShowMessage('Please enter USS EDD');
      result := False;
    end;
  if not getAnatomyChecked then
    begin
      ShowMessage('Please tick Normal/Abnormal for anatomy');
      result := False;
    end;
  if not getAnatomyNormalViews then
    begin
      ShowMessage('Please tick view options for Anatomy');
      result := False;
    end;
  if cbPlacentaSite1.text = '' then
    begin
      ShowMessage('Please enter placental site');
      result := False;
    end;
  if not((cbLowLyingPlacentaYes1.checked) or (cbLowLyingPlacentaNo1.Checked)) then
    begin
      ShowMessage('Please enter yes/no for lowlying placenta');
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
  else
    if meCervicalLength.text = '' then
      begin
        ShowMessage('Please enter cervix');
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
  if GetEnteredEDD <> '' then
    lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');
  else
    lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

  //-----------------  Entered EDD ----------//
  lbMergeDataMergeFields.Items.Add('GA_from_Entered_EDD='''+  getGAFromEnteredEDD   +'''');

  //----------------- Composite US  EDD ----------//
  lbMergeDataMergeFields.Items.Add('Composite_Ultrasound_Age='''+  intToStr(seUSSEDDGAWeeks1.value)
  +' weeks''');
  if seSSEDDGADays1.value >= 0 then
    begin
      if seSSEDDGADays1.value = 1 then
        lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value
        )   +' day''');
      else
        lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value
        )   +' days''');
    end
  else
    lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD=''');


  lbMergeDataMergeFields.Items.Add('BPD1='''+  PadDecimalPlaces(edtBPD1.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD1=''' +  PadDecimalPlaces(edtOFD1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC1='''   + PadDecimalPlaces(edtHC1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC1='''  +  PadDecimalPlaces(edtAC1.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL1='''  +  PadDecimalPlaces(edtFL1.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL1='''  +  PadDecimalPlaces(edtHL1.Text)     +'cm''');

  lbMergeDataMergeFields.Items.Add('BPDPer1='''+   GetPerGraph(edtBPDPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer1=''' +  GetPerGraph(edtOFDPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer1='''   +  GetPerGraph(edtHCPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer1='''  +   GetPerGraph(edtACPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer1='''  +  GetPerGraph(edtFLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer1='''  +  GetPerGraph(edtHLPer1, True)     +'''');


  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetObstetricHistory +'''');
  lbMergeDataMergeFields.Items.Add('AneuploidyRisk=''' +   GetAneuploidyRisk    +'''');

  if (cbLowLyingPlacentaNo1.checked) and (not (getPlacentalChecks)) then
    lbMergeDataMergeFields.Items.Add('Placenta=''' +   getPlacentaString    +'''');
  else
    lbMergeDataMergeFields.Items.Add('Placenta=''''');

  if (cbLowLyingPlacentaYes1.checked) or (getPlacentalChecks) then
    lbMergeDataMergeFields.Items.Add('LowLyingPlacenta=''' +   getLowLyingPlacentaString    +'''');
  else
    lbMergeDataMergeFields.Items.Add('LowLyingPlacenta=''''');

  if (sePlacentaExtendsBy1.text <> '') then
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentaBeyond(1) +'''');
  else
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentalPosition(1) +'''');

  lbMergeDataMergeFields.Items.Add('PlacentalSite='''+ GetPlacentalSite +'''');

  lbMergeDataMergeFields.Items.Add('Ovary='''+ getOvary +'''');
  lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervixDetailed + '''');





{if not(cbPatientInformedYes.checked) and (not((cbConsistentNIPTYes1.checked) or (cbConsistentNIPTNo1.checked))) then
    lbMergeDataMergeFields.Items.Add('Gender=''')
  else }
  if getGender <> '' then
    begin
      lbMergeDataMergeFields.Items.Add('Gender='''+ getGender + '''');
    end
  else
    lbMergeDataMergeFields.Items.Add('Gender=''');
  lbMergeDataMergeFields.Items.Add('Anatomy='''+ getAnatomy + '''');
  lbMergeDataMergeFields.Items.Add('ReportHeading='''+ getReportHeading + '''');


  lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
  lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

  lbMergeDataMergeFields.Items.Add('AnatomyConclusion='''+ getAnatomyConclusion + '''');

  lbMergeDataMergeFields.Items.Add('AbnormalConclusion='''+ getAbnormalConclusion + '''');
end;

procedure ProduceMergeOrder;

var 
  vHeading : Boolean;
begin
  vHeading := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;





{if (getNIPSWarning = TRUE) or (getAnatomyWarning = TRUE) or (getCervixWarning = TRUE) or (getPlacentalWarning = TRUE) or (getOvaryWarning = TRUE) or (getCordInsertionWarning = TRUE) or (GFibroidWarning = TRUE) then//(GPlacentaWarning = TRUE) or (GPresentationWarning = TRUE) or (GCervixWarning = TRUE) or (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) or (GAnatomyWarning = TRUE) or (getFunnelingMembranes = TRUE) then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end; }
  if cxccbReferralIndication.States[2] then
    lbMergeDataMergeOrder.Items.Add('AMNIOCENTESIS')
  else if cxccbReferralIndication.States[3] then
         lbMergeDataMergeOrder.Items.Add('ACCESS_CERVICAL_LENGTH')
  else if cxccbReferralIndication.States[0] then
         lbMergeDataMergeOrder.Items.Add('ROUTINE_MORPHOLOGY_SCAN')
  else if cxccbReferralIndication.States[1] then
         lbMergeDataMergeOrder.Items.Add('EARLY_ANATOMY_REVIEW')
  else
    lbMergeDataMergeOrder.Items.Add('ROUTINE_MORPHOLOGY_SCAN');
end;
