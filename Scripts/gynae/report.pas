function CheckFormComplete: Boolean;
begin
  if (seCycleMaxDays.Enabled) and (seCycleMaxDays.Value <> 1) and (seCycleMinDays.Value > seCycleMaxDays.Value) then
  begin
    ShowMessage('Please correct the number of days in the cycle before proceeding.');
    result := False;
  end
  else if (cbUterineShape.Enabled) and (cbUterineShape.ItemIndex < 1) then
  begin
    ShowMessage('Please Select a Uterine Shape before proceeding.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (seEdometriumThickness.value <= 0) and (not(cbHysterectomy.checked)) then
  begin
    ShowMessage('Please endometrium thickness before proceeding.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHysterectomy.checked) and (not(cbCervixPresentYes.checked or cbCervixPresentNo.checked)) then
  begin
    ShowMessage('Please check ''Yes/No'' for cervix present.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHysterectomy.checked) and (not(cbVaultNormalYes.checked or cbVaultNormalNo.checked)) then
  begin
    ShowMessage('Please check ''Yes/No'' for Vault Normal.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHRTYes.enabled) and (cbHRTYes.checked) and (trim(tcbMedication.Text) = '') then
   begin
    showmessage('Specify HRT type in Medication');
    result := False;
  end
  else if (Trim(reDiagnosisComments.Lines.Text) = '') then
  begin
    ShowMessage('Please Complete the Diagnosis Comments before proceeding.');
    pcReportBody.Properties.ActivePage := tsCommentsAndDiagnosis;
    result := False;
  end
  else
    result := true;
end;

procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Clear;
  // ---------------Header Merge Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('ExaminationDate="' + FormatDateTime('dd mmm yyyy', deExamDate.Date) + '"');
  lbMergeDataMergeFields.Items.Add('ReferalIndications="' + GetReferalIndications + '"');
  lbMergeDataMergeFields.Items.Add('Menses="' + GetMenses + '"');
  lbMergeDataMergeFields.Items.Add('GynaecologicalHistory="' + GetGynaecologicalHistory + '"');
  lbMergeDataMergeFields.Items.Add('GynaecologicalSurgery="' + GetGynaecologicalSurgery + '"');
  lbMergeDataMergeFields.Items.Add('FamilyHistory="' + GetFamilyHistory + '"');
  lbMergeDataMergeFields.Items.Add('LMPString="' + GetLMPString + '"');
  lbMergeDataMergeFields.Items.Add('Cycledays="' + GetCycledaysString + '"');
  lbMergeDataMergeFields.Items.Add('StartCycleDay="' + IntToStr(spStartDay.value) + '"');
  lbMergeDataMergeFields.Items.Add('EndCycleDay="' + GetEndCycleDays + '"');
  lbMergeDataMergeFields.Items.Add('Medication="' + GetMedication + '"');

  // ---------------Report Main Merge Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('UterusType="' + GetUterusType + '"');
  lbMergeDataMergeFields.Items.Add('UterusMeasurement="' + GetUterusMeasurement + '"');
  lbMergeDataMergeFields.Items.Add('EndometriumSize="' + GetEndometriumSize + '"'); //
  lbMergeDataMergeFields.Items.Add('EndometriumType="' + getEndometriumType + '"');
  if sePolypCount.value = 1 then
     lbMergeDataMergeFields.Items.Add('EndometrialPolyp="' + GetEndometrialPolyp + '"');
  else if sePolypCount > 1 then
     lbMergeDataMergeFields.Items.Add('EndometrialPolyp="' + GetMultipleEndometrialPolypString + '"');
  lbMergeDataMergeFields.Items.Add('EndometrialLesion="' + getEndometrialLesion + '"');
  lbMergeDataMergeFields.Items.Add('IUCDPlacement="' + GetIUCDPlacement(false) + '"');
  lbMergeDataMergeFields.Items.Add('UterusAppearance="' + GetUterusAppearance + '"');
 { lbMergeDataMergeFields.Items.Add('CervicalLength="' + intToStr(seCervicalLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('UterineCavityLength="' + intToStr(seUterineCavityLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('RightUterineCavityLength="' + intToStr(seRightUterineCavityLength.Value) + '"'); }
  lbMergeDataMergeFields.Items.Add('SeptumLength="' + GetSeptumLengthString + '"');
  lbMergeDataMergeFields.Items.Add('CervixAppearance="' + GetCervixAppearance + '"');
  //lbMergeDataMergeFields.Items.Add('RightCervixMeasurement="' + intToStr(spRightCerivalLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('AdenomysisType="' + GetIncVasAndVenBlind + '"');
  lbMergeDataMergeFields.Items.Add('AnteriorAPMeasure="' + intToStr(spAPAnterior.Value) + '"');
  lbMergeDataMergeFields.Items.Add('PosteriorAPMeasure="' + intToStr(spAPPosterior.Value) + '"');
  lbMergeDataMergeFields.Items.Add('HysterectomyString="' + GetHysterectomyString + '"');
  lbMergeDataMergeFields.Items.Add('GetBulkyUterus="' + GetGetBulkyUterus + '"');
  lbMergeDataMergeFields.Items.Add('LargerMyometrium="' + GetLargerMyometrium + '"');

  // ---------------Fibroids Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('SingleFibroidDimensions="' + GetSingleFibroidDimensions + '"');
  lbMergeDataMergeFields.Items.Add('SingleFibroid="' + GetSingleFibroid + '"');

  lbMergeDataMergeFields.Items.Add('FibroidCount="' + GetFibroidCount + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid1="' + GetFibroidDesc(1) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid2="' + GetFibroidDesc(2) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid3="' + GetFibroidDesc(3) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid4="' + GetFibroidDesc(4) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid5="' + GetFibroidDesc(5) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid6="' + GetFibroidDesc(6) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid7="' + GetFibroidDesc(7) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid8="' + GetFibroidDesc(8) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid9="' + GetFibroidDesc(9) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid10="' + GetFibroidDesc(10) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid11="' + GetFibroidDesc(11) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid12="' + GetFibroidDesc(12) + '"');
  lbMergeDataMergeFields.Items.Add('SingleFibroidCavity="' + GetSingleFibroidCavity + '"');
  lbMergeDataMergeFields.Items.Add('CavityProjection="' + GetCavProjectionString + '"');

  // ---------------Ovary Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('OvaryOverview="' + GetOvaryOverview + '"');

  lbMergeDataMergeFields.Items.Add('NeitherOvaryIdentified="' + GetNeitherOvaryIdentifiedString + '"');
  lbMergeDataMergeFields.Items.Add('RightOvary="' + GetRightOvary + '"');
  lbMergeDataMergeFields.Items.Add('RightOvaryAppearance="' + GetRightOvaryAppearance + '"');
  lbMergeDataMergeFields.Items.Add('RightOvaryCystDesc="' + GetRightOvaryCyst + '"');

  lbMergeDataMergeFields.Items.Add('LeftOvary="' + GetLeftOvary + '"');
  lbMergeDataMergeFields.Items.Add('LeftOvaryAppearance="' + GetLeftOvaryAppearance + '"');
  lbMergeDataMergeFields.Items.Add('LeftOvaryCystDesc="' + GetLeftOvaryCyst + '"');

  if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1) then
  begin
    lbMergeDataMergeFields.Items.Add('NumberOfCysts="' + Format('%s cysts were visualised in this ovary:',[InitCaps(getNumberString(seRightOvarianCystsCount.Value), False)]) + '"');
  end;
  if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1) then
  begin
    lbMergeDataMergeFields.Items.Add('NumberOfCystsL="' + Format('%s cysts were visualised in this ovary:',[InitCaps(getNumberString(seLeftOvarianCystsCount.Value), False)]) + '"');
  end;

   //----------------------IOTA RIGHT OVARY-------------------------------//
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAClassification="' + GetOvaryIOTAClassification('right') + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTACystWall="' + GetRightOvaryIOTACystWall + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAInternalContents="' + GetRightOvaryIOTAInternalContents + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTASolidElements="' + GetRightOvaryIOTASolidElements + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAVascularity="' + GetRightOvaryIOTAVascularity + '"');
   {lbMergeDataMergeFields.Items.Add('RightOvaryIOTAFreeFluid="' + GetRightOvaryIOTAFreeFluid + '"');}
   lbMergeDataMergeFields.Items.Add('RightOvaryAscites="' + GetRightOvaryIOTAAscites + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAAppearance="' + GetRightOvaryIOTAAppearance + '"');
   {lbMergeDataMergeFields.Items.Add('RightOvaryIOTASeptum="' + GetRightOvaryIOTASeptum + '"');}

   //----------------------IOTA Left OVARY-------------------------------//
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAClassification="' + GetOvaryIOTAClassification('left') + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTACystWall="' + GetLeftOvaryIOTACystWall + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAInternalContents="' + GetLeftOvaryIOTAInternalContents + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTASolidElements="' + GetLeftOvaryIOTASolidElements + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAVascularity="' + GetLeftOvaryIOTAVascularity + '"');
   {lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAFreeFluid="' + GetLeftOvaryIOTAFreeFluid + '"');}
   lbMergeDataMergeFields.Items.Add('LeftOvaryAscites="' + GetLeftOvaryIOTAAscites + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAAppearance="' + GetLeftOvaryIOTAAppearance + '"');
   {lbMergeDataMergeFields.Items.Add('LeftOvaryIOTASeptum="' + GetLeftOvaryIOTASeptum + '"');}

  // ---------------Pelvis Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('Adnexal="' + GetAdnexalDesc + '"');
  lbMergeDataMergeFields.Items.Add('PODMeasurement="' + IntToStr(Trunc(sePODDepth.Value)) + '"');
  if (cbBladderNormal.Checked) then
    lbMergeDataMergeFields.Items.Add('BladderAppearance="normal"')
  else
    lbMergeDataMergeFields.Items.Add('BladderAppearance="abnormal"');
  lbMergeDataMergeFields.Items.Add('KidneyAppearance="' + GetKidneyAppearance + '"');

  lbMergeDataMergeFields.Items.Add('AsceticDrainageAmout="' + FloatToStr(seAscitesDrainage.Value) + '"');
  lbMergeDataMergeFields.Items.Add('LeftDrainageAmount="' + FloatToStr(seLeftOvarianCystAspiration.Value) + '"');
  lbMergeDataMergeFields.Items.Add('RightDrainageAmount="' + FloatToStr(seRightOvarianCystAspiration.Value) + '"');

  // ---------------Conclusion Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('UterusConclusion="' + GetUterusConclusion + '"');
  lbMergeDataMergeFields.Items.Add('EndometriumConc="' + GetEndometriumConc + '"');
  lbMergeDataMergeFields.Items.Add('PolpConc="' + GetPolpConc + '"');
    lbMergeDataMergeFields.Items.Add('CervicalPolypConc="' + GetCervicalPolypConc + '"');
  lbMergeDataMergeFields.Items.Add('OvaryConc="' + GetOvaryConc + '"');
  lbMergeDataMergeFields.Items.Add('AdnexalConc="' + GetAdnexalConc + '"');
  lbMergeDataMergeFields.Items.Add('ProcedureConc="' + GetProcedureConc + '"');
   if ((cbRightOvarianCyst.checked) and ((cbRightOvaryCystType1.enabled and cbRightOvaryCystType1.selection = 12) or
     (cbRightOvaryCystType2.enabled and cbRightOvaryCystType2.selection = 12) or
     (cbRightOvaryCystType3.enabled and cbRightOvaryCystType3.selection = 12))) or
     ((cbLeftOvaryCystType1.enabled and cbLeftOvaryCystType1.selection = 12) or
     (cbLeftOvaryCystType2.enabled and cbLeftOvaryCystType2.selection = 12) or
     (cbLeftOvaryCystType3.enabled and cbLeftOvaryCystType3.selection = 12))then
      lbMergeDataMergeFields.Items.Add('IOTAConc="' + GetIOTAConc + '"');
   else
     lbMergeDataMergeFields.Items.Add('IOTAConc=''');
end;

procedure ProduceMergeOrder;
var
  i: Integer;
  vValidDist: Boolean;
begin
  lbMergeDataMergeOrder.Items.Clear; 
  
   //insert Patient Demographics
  lbMergeDataMergeOrder.Items.Add('PatientDemographics');
  //lbMergeDataMergeOrder.Items.Add('<BR>');
  //lbMergeDataMergeOrder.Items.Add('<BR>');
  
  lbMergeDataMergeOrder.Items.Add('ReportHeading');
if (deLMPDate.Date > 10) or (cbPostMenopausal.checked) or (cbAmenorrhoea.checked) or(cbLMPUnknown.checked) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LMP');
    lbMergeDataMergeOrder.Items.Add('CycleDays');
  end
  else
  begin
    if spStartDay.Value > 0 then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('CycleDays');
    end;
  end;
  lbMergeDataMergeOrder.Items.Add('<BR>');
  if cbPerformedTransAbdom.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('TransAbdom');
  end;

  if cbHysterectomy.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Hysterectomy');
  end;
else
  begin
    if Trim(cbUterus.Text <> '') then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('ReportMain');
    end;
  end;
  if cbLUSCSscar.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LUSCSscar');
  end;

  if cbUterineShape.ItemIndex > 0 then
  begin
    if cbUterineShape.ItemIndex < 3 then
    begin
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('NormalUterusShape');
    end
    else if (cbUterineShape.ItemIndex < 5) then
    begin
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('SeptateUterus');
    end
    else if (cbUterineShape.ItemIndex = 6) then
    begin
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('DidelphysisUterus');
    end;
    else if  (cbUterineShape.ItemIndex = 7)  then
    begin
       lbMergeDataMergeOrder.Items.Add('leftUniCornuate');
    end
    else if (cbUterineShape.ItemIndex = 8)  then
    begin
      lbMergeDataMergeOrder.Items.Add('RightUniCornuate');
    end;
  end;

  if cbAdenomyosisPresent.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Adenomysis');
    if (spAPAnterior.Value > 0) or (spAPPosterior.Value > 0) then
      lbMergeDataMergeOrder.Items.Add('AdenomysisAPMeasure');
    if cbLossEMInterface.Checked then
      lbMergeDataMergeOrder.Items.Add('EMInterfaceLoss');
  end;

  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    if spFibroidCount.Value > 1 then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('FibroidsExists');
      for i := 1 to spFibroidCount.Value do
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('Fibroid' + IntToStr(i));
      end;

      if GetCavDistortionCount(vValidDist) = 0 then
      begin
        if (vValidDist) and (not (GetCavProjectionCount(vValidDist) > 0)) then
        begin
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('NoFibroidCavityDistortion');
        end;
      end
      else if GetCavDistortionCount(vValidDist) = 1 then
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('FibroidCavityDistortion');
      end
      else
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('MultipleCavityDistortion');
      end;
      if GetCavProjectionCount(vValidDist) > 0 then
      begin
        if GetCavDistortionCount(vValidDist) = 0 then
        begin
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('<BR>');
        end;
        lbMergeDataMergeOrder.Items.Add('CavityProjection');
      end;
    end
    else
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('SingleFibroid');
    end;
  end;

  // if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');

    //  if (cbRightOvaryIdentified.Checked) then
    begin
      lbMergeDataMergeOrder.Items.Add('RightOvary');
       if not((cbRightOvarianCyst.Checked)) then
           lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');  
       if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1) then
           lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');
      if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0) then
      begin
        if (seRightOvarianCystsCount.Value = 2) and (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
        end
        else
        if (seRightOvarianCystsCount.Value = 3) and ((cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType2.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3');
        end
        else
        if (seRightOvarianCystsCount.Value = 4) and ((cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType4.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3');
          lbMergeDataMergeOrder.Items.Add('MultiCysts4');
        end
        else
          lbMergeDataMergeOrder.Items.Add('RightOvaryCyst');
      end;
      if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value = 1) then
      lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');
    end;
      if not((cbRightOoporectomy.Checked) and (cbLeftOoporectomy.checked)) then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('LeftOvary');
      if not(cbLeftOvarianCyst.Checked) then
           lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
       if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1) then
           lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
      if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0) then
      begin
        if (seLeftOvarianCystsCount.Value = 2) and (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
        end
        else
        if (seLeftOvarianCystsCount.Value = 3) and ((cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType2.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3L');
        end
        else
        if (seLeftOvarianCystsCount.Value = 4) and ((cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType4.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3L');
          lbMergeDataMergeOrder.Items.Add('MultiCysts4L');
        end
        else
          lbMergeDataMergeOrder.Items.Add('LeftOvaryCyst');
      end;
      if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value = 1) then
        lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
    end;
  end;

  if (cbRightOvarianCyst.checked) and ((cbRightOvaryCystType1.enabled and cbRightOvaryCystType1.selection = 12) or
     (cbRightOvaryCystType2.enabled and cbRightOvaryCystType2.selection = 12) or
     (cbRightOvaryCystType3.enabled and cbRightOvaryCystType3.selection = 12)) then
  begin
     lbMergeDataMergeOrder.Items.Add('<BR>');
     lbMergeDataMergeOrder.Items.Add('IOTARightOvary');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;

  if (cbLeftOvaryCystType1.enabled and cbLeftOvaryCystType1.selection = 12) or
     (cbLeftOvaryCystType2.enabled and cbLeftOvaryCystType2.selection = 12) or
     (cbLeftOvaryCystType3.enabled and cbLeftOvaryCystType3.selection = 12) then
  begin
     lbMergeDataMergeOrder.Items.Add('<BR>');
     lbMergeDataMergeOrder.Items.Add('IOTALeftOvary');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;


  if ((cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0)) or ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)) then
  begin
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('YesAdnexal');
  end
  else
  begin
     if not((cbRightOvaryIdentified.Checked) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) and 
        not((cbLeftOvaryIdentified.Checked) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
     begin
      //  lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('NoAdnexalMasses');
     end
  end;

  if cbPerformedTransAbdom.Checked then
  begin
    //   lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('NoTendernessTrans');
  end;

  if cbEFFNormal.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('FreeFluidPresent');
  end
  else
  begin
    if ((cbRightOvaryIdentified.Checked) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) or
       ((cbLeftOvaryIdentified.Checked) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
    end;
    lbMergeDataMergeOrder.Items.Add('NoExcessFreeFluid');
  end;
  if (cbBladderNormal.Checked) or (cbBladderAbnormal.Checked) then
  begin
  //  lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Bladder');
  end;
 { if cbRightKidneyYes.Checked or cbLeftKidneyYes.Checked then
  begin
    //lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('KidneyAppearance');
  end;}
  if cbSalinePerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    if cbSalinehysterograph.ItemIndex = 1 then
      lbMergeDataMergeOrder.Items.Add('SalineProc1')
    else if cbSalinehysterograph.ItemIndex = 2 then
      lbMergeDataMergeOrder.Items.Add('SalineProc2')
    else if cbSalinehysterograph.ItemIndex = 3 then
      lbMergeDataMergeOrder.Items.Add('SalineProc4')
    else if cbSalinehysterograph.ItemIndex = 4 then
      lbMergeDataMergeOrder.Items.Add('SalineProc3')
  end;
  if cbTubalPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Agitated' + IntToStr(cbTubalPatencyTestSaline.ItemIndex));
  end;
  if cbTubalLevovistPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Levovist' + IntToStr(cbTubalPatencyTestLevovist.ItemIndex));
  end;
  if cbRightCystAspirationPerf.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('RightDrainage');
  end;
  if cbLeftCystAspirationPerf.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LeftDrainage');
  end;
  if cbAscitesPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Ascites');
  end;
  lbMergeDataMergeOrder.Items.Add('<BR>');
  lbMergeDataMergeOrder.Items.Add('<BR>');
  lbMergeDataMergeOrder.Items.Add('Conclusion');
end;
