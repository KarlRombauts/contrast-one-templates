procedure cbIrregularCycleClick(Sender)
begin
  cbToggleCheckOnClick(Sender);
  seCycleMinDays.Enabled := not cbIrregularCycle.Checked;
  seCycleMaxDays.Enabled := not cbIrregularCycle.Checked;
  if cbIrregularCycle.Checked then
  begin
    lblCycleDays.Caption := 'irregular cycle';
  end
  else
  begin
    lblCycleDays.Caption := 'day cycle';
  end;
end;

procedure cbRightLeadFollicleClick(Sender)
begin
  seRightLeadFollicleSize.Enabled := cbRightLeadFollicle.Checked;
  seRightLeadFollicleSize2.Enabled := cbRightLeadFollicle.Checked;
  seRightLeadFollicleSize3.Enabled := cbRightLeadFollicle.Checked;
  lblLeadFollicleRight.Enabled := cbRightLeadFollicle.Checked;
  if cbRightLeadFollicle.Checked then
  begin

  end;
end;

procedure cbLeftLeadFollicleClick(Sender)
begin
  seLeftLeadFollicleSize.Enabled := cbLeftLeadFollicle.Checked;
  seLeftLeadFollicleSize2.Enabled := cbLeftLeadFollicle.Checked;
  seLeftLeadFollicleSize3.Enabled := cbLeftLeadFollicle.Checked;
  lblLeadFollicleLeft.Enabled := cbLeftLeadFollicle.Checked;
  if cbLeftLeadFollicle.Checked then
  begin

  end;
end;

procedure cbRightCorpusLuteumClick(Sender)
begin
  cbRightCorpusLuteumSize.Enabled := cbRightCorpusLuteum.Checked;
  cbRightCorpusLuteumSize2.Enabled := cbRightCorpusLuteum.Checked;
  cbRightCorpusLuteumSize3.Enabled := cbRightCorpusLuteum.Checked;
  lblCLRight.Enabled := cbRightCorpusLuteum.Checked;
end;

procedure cbLeftCorpusLuteumClick(Sender)
begin
  cbLeftCorpusLuteumSize.Enabled := cbLeftCorpusLuteum.Checked;
  cbLeftCorpusLuteumSize2.Enabled := cbLeftCorpusLuteum.Checked;
  cbLeftCorpusLuteumSize3.Enabled := cbLeftCorpusLuteum.Checked;
  lblCLLeft.Enabled := cbLeftCorpusLuteum.Checked;
end;

procedure cbEndometrialPolypClick(Sender)
begin
  sePolypCount.Enabled :=  cbEndometrialPolyp.checked;
 { edtpolypLength1.Enabled := cbEndometrialPolyp.Checked;
  edtpolypWidth1.Enabled := cbEndometrialPolyp.Checked;
  edtpolypDepth1.Enabled := cbEndometrialPolyp.Checked;}
end;

procedure cbRightOvaryIdentifiedClick(Sender)
begin
  if not (cbRightOvaryIdentified.Checked) then
  begin
    seRightOvaryLength.Enabled := False;
    seRightOvaryWidth.Enabled := False;
    seRightOvaryHeight.Enabled := False;
    cbRightOoporectomy.Enabled := True;
    cbRightOvaryVisualisedTA.Enabled := False;
    cbRightOvaryVisualisedTV.Enabled := False;
    cbRightOvaryNormal.Enabled := False;
    seRightOvaryCC.Enabled := False;
    seRightFolCount.Enabled := False;
    seRightResidualFolCount.Enabled := False;
    cbRightLeadFollicle.Enabled := False;
    seRightLeadFollicle.Enabled := False;
    cbRightCorpusLuteum.Enabled := False;
    seRightCorpusLuteum.Enabled := False;
    seRightLeadFollicleSize.Enabled := False;
    seRightLeadFollicleSize3.Enabled := False;
    seRightLeadFollicleSize2.Enabled := False;
    cbRightCorpusLuteumSize.Enabled := False;
    cbRightMobile.Enabled := False;
    cbRightLimitedMobility.Enabled := False;
     if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
    cbRightPCO.Enabled := False;
    cbRightTender.Enabled := False;
    cbRightNonTender.Enabled := False;
    lblRightFollicleRange.Enabled := False;
    cbRightOvarianCyst.Enabled := False;
    seRightOvarianCystsCount.Enabled := False;
  end
  else
  begin
    seRightOvaryLength.Enabled := true;
    cbRightOvaryVisualisedTA.Enabled := True;
    cbRightOvaryVisualisedTV.Enabled := True;
    cbRightOoporectomy.Enabled := False;
     if cbRightOoporectomy.checked then
       cbRightOoporectomy.checked := not(cbRightOvaryIdentified.Checked)
    cbRightOvaryNormal.Enabled := True;
    seRightOvaryWidth.Enabled := true;
    seRightOvaryHeight.Enabled := true;
    seRightOvaryCC.Enabled := true;
    seRightFolCount.Enabled := true;
    seRightResidualFolCount.Enabled := true;
    cbRightLeadFollicle.Enabled := true;
    seRightLeadFollicle.Enabled := true;
    cbRightCorpusLuteum.Enabled := true;
    seRightCorpusLuteum.Enabled := true;
    seRightLeadFollicleSize.Enabled := cbRightLeadFollicle.Checked;
    seRightLeadFollicleSize2.Enabled := cbRightLeadFollicle.Checked;
    seRightLeadFollicleSize3.Enabled := cbRightLeadFollicle.Checked;
    cbRightCorpusLuteumSize.Enabled := cbRightCorpusLuteum.Checked;
    cbRightMobile.Enabled := True;
    cbRightLimitedMobility.Enabled := True;
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := True;
      cbRightVaginalAccessNo.Enabled := True;
      cbRightVaginalNA.Enabled := True;
      gbRightVaginalAccess.Enabled := True;
    end;
    //  cbRightPCO.Enabled := True;
    cbRightTender.Enabled := True;
    cbRightNonTender.Enabled := True;
    lblRightFollicleRange.Enabled := True;
    cbRightOvarianCyst.Enabled := True;
    seRightOvarianCystsCount.Enabled := cbRightOvarianCyst.Checked;
  end;
  seRightFolCountOnChange(nil);
  seRightOvarianCystsCountOnChange(nil);
end;

procedure cbLeftOvaryIdentifiedClick(Sender)
begin
  if (not cbLeftOvaryIdentified.Checked) then
  begin
    seLeftOvaryLength.Enabled := False;
    cbLeftOvaryVisualisedTA.Enabled := False;
    cbLeftOvaryVisualisedTV.Enabled := False;
    cbLeftOoporectomy.Enabled := True;
    cbLeftOvaryNormal.Enabled := False;
    seLeftOvaryWidth.Enabled := False;
    seLeftOvaryHeight.Enabled := False;
    seLeftOvaryCC.Enabled := False;
    seLeftResidualFolCount.Enabled := False;
    seLeftFolCount.Enabled := False;
    cbLeftLeadFollicle.Enabled := False;
    seLeftLeadFollicle.Enabled := False;
    cbLeftCorpusLuteum.Enabled := False;
    seLeftCorpusLuteum.Enabled := False;
    seLeftLeadFollicleSize.Enabled := False;
    seLeftLeadFollicleSize2.Enabled := False;
    seLeftLeadFollicleSize3.Enabled := False;
    cbLeftCorpusLuteumSize.Enabled := False;
    cbLeftCorpusLuteumSize2.Enabled := False;
    cbLeftMobile.Enabled := False;
    cbLeftLimitedMobility.Enabled := False;
     if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end
    cbLeftPCO.Enabled := False;
    cbLeftTender.Enabled := False;
    cbLeftNonTender.Enabled := False;
    lblLeftFollicleRange.Enabled := False;
    cbLeftOvarianCyst.Enabled := False;
    seRightOvarianCystsCount.Enabled := cbRightOvarianCyst.Checked;
  end
  else
  begin
    seLeftOvaryLength.Enabled := true;
    seLeftOvaryWidth.Enabled := true;
    seLeftOvaryHeight.Enabled := true;
    cbLeftOvaryVisualisedTA.Enabled := True;
    cbLeftOoporectomy.Enabled := False;
     if cbLeftOoporectomy.checked then
       cbLeftOoporectomy.checked := not(cbLeftOvaryIdentified.Checked)
    cbLeftOvaryNormal.Enabled := True;
    cbLeftOvaryVisualisedTV.Enabled := True;
    seLeftOvaryCC.Enabled := true;
    seLeftResidualFolCount.Enabled := True;
    seLeftFolCount.Enabled := true;
    cbLeftLeadFollicle.Enabled := true;
    seLeftLeadFollicle.Enabled := true;
    cbLeftCorpusLuteum.Enabled := true;
    seLeftCorpusLuteum.Enabled := true;
    seLeftLeadFollicleSize.Enabled := cbLeftLeadFollicle.Checked;
    seLeftLeadFollicleSize2.Enabled := cbLeftLeadFollicle.Checked;
    seLeftLeadFollicleSize3.Enabled := cbLeftLeadFollicle.Checked;
    cbLeftCorpusLuteumSize.Enabled := cbLeftCorpusLuteum.Checked;
    cbLeftCorpusLuteumSize2.Enabled := cbLeftCorpusLuteum.Checked;
    cbLeftMobile.Enabled := True;
    cbLeftLimitedMobility.Enabled := True;
     if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := True;
      cbLeftVaginalNA.Enabled := True;
      cbLeftVaginalAccessNo.Enabled := True;
      gbLeftVaginalAccess.Enabled := True;
    end;  
    //  cbLeftPCO.Enabled := True;
    cbLeftTender.Enabled := True;
    cbLeftNonTender.Enabled := True;
    lblLeftFollicleRange.Enabled := True;
    cbLeftOvarianCyst.Enabled := True;
    seLeftOvarianCystsCount.Enabled := cbLeftOvarianCyst.Checked;
  end;
  seLeftFolCountOnChange(nil);
  seLeftOvarianCystsCountOnChange(nil);
end;

procedure cbRetroFlexedClick(Sender)
begin
  if cbAntiFlexed.Checked and cbRetroFlexed.Checked then
  begin
    cbAntiFlexed.Checked := False;
  end;
end;

procedure cbAntiFlexedClick(Sender)
begin
  if cbAntiFlexed.Checked and cbRetroFlexed.Checked then
  begin
    cbRetroFlexed.Checked := False;
  end;
end;

procedure cbRightLimitedMobilityClick(Sender)
begin
  if cbRightMobile.Checked and cbRightLimitedMobility.Checked then
  begin
    cbRightMobile.Checked := False;
  end;
end;

procedure cbLeftLimitedMobilityClick(Sender)
begin
  if cbLeftMobile.Checked and cbLeftLimitedMobility.Checked then
  begin
    cbLeftMobile.Checked := False;
  end;
end;

procedure cbRightMobileClick(Sender)
begin
  if cbRightMobile.Checked and cbRightLimitedMobility.Checked then
  begin
    cbRightLimitedMobility.Checked := False;
  end;
end;

procedure cbLeftMobileClick(Sender)
begin
  if cbLeftMobile.Checked and cbLeftLimitedMobility.Checked then
  begin
    cbLeftLimitedMobility.Checked := False;
  end;
end;

procedure cbRightTenderClick(Sender)
begin
  if cbRightTender.Checked and cbRightNonTender.Checked then
  begin
    cbRightNonTender.Checked := False;
  end;
end;

procedure cbRightNonTenderClick(Sender)
begin
  if cbRightTender.Checked and cbRightNonTender.Checked then
  begin
    cbRightTender.Checked := False;
  end;
end;

procedure cbLeftTenderClick(Sender)
begin
  if cbLeftTender.Checked and cbLeftNonTender.Checked then
  begin
    cbLeftNonTender.Checked := False;
  end;
end;

procedure cbLeftNonTenderClick(Sender)
begin
  if cbLeftTender.Checked and cbLeftNonTender.Checked then
  begin
    cbLeftTender.Checked := False;
  end;
end;

procedure cbUterusMobileClick(Sender)
begin
  if (cbUterusMobile.Checked) and (cbUterusLimitedMobile.Checked) then
  begin
    cbUterusLimitedMobile.Checked := False;
  end;
end;

procedure cbUterusLimitedMobileClick(Sender)
begin
  if (cbUterusMobile.Checked) and (cbUterusLimitedMobile.Checked) then
  begin
    cbUterusMobile.Checked := False;
  end;
end;

procedure cbUterusTenderClick(Sender)
begin
  if (cbUterusTender.Checked) and (cbUterusNonTender.Checked) then
  begin
    cbUterusNonTender.Checked := False;
  end;
end;

procedure cbUterusNonTenderClick(Sender)
begin
  if (cbUterusTender.Checked) and (cbUterusNonTender.Checked) then
  begin
    cbUterusTender.Checked := False;
  end;
end;

procedure cbRightOvarianCystClick(Sender)
begin
  seRightOvarianCystsCountOnChange(nil);
  seRightOvarianCystsCount.Enabled := cbRightOvarianCyst.Checked;

end;

procedure cbLeftOvarianCystClick(Sender)
begin
  seLeftOvarianCystsCountOnChange(nil);
  seLeftOvarianCystsCount.Enabled := cbLeftOvarianCyst.Checked;
end;

procedure cbBladderNormalClick(Sender)
begin
  if cbBladderNormal.Checked and cbBladderAbnormal.Checked then
  begin
    cbBladderAbnormal.Checked := False;
  end;
end;

procedure cbBladderAbnormalClick(Sender)
begin
  if cbBladderNormal.Checked and cbBladderAbnormal.Checked then
  begin
    cbBladderNormal.Checked := False;
  end;
end;

procedure cbEFFAbnormalClick(Sender)
begin
  if cbEFFAbnormal.Checked and cbEFFNormal.Checked then
  begin
    cbEFFNormal.Checked := False;
  end;
end;

procedure cbEFFNormalClick(Sender)
begin
  if cbEFFAbnormal.Checked and cbEFFNormal.Checked then
  begin
    cbEFFAbnormal.Checked := False;
  end;
  lblPODDEpth.Enabled := (cbEFFNormal.Checked);
  sePODDepth.Enabled := (cbEFFNormal.Checked);
end;

procedure cbRightKidneyNoClick(Sender)
begin
  if cbRightKidneyNo.Checked then
    cbRightKidneyYes.Checked := False;
  teRightKidney.enabled := False;
  cbRightReanalAbnormalYes.enabled := False;
  cbRightReanalAbnormalNo.enabled := False;
end;

procedure cbLeftKidneyNoClick(Sender)
begin
  if cbLeftKidneyNo.Checked then
    cbLeftKidneyYes.Checked := False;
  teLeftKidney.enabled := False;
  cbLeftReanalAbnormalYes.enabled := False;
  cbLeftReanalAbnormalNo.enabled := False;
end;

procedure cbRightKidneyYesClick(Sender)
begin
  if cbRightKidneyYes.Checked then
    cbRightKidneyNo.Checked := False;
  teRightKidney.enabled := cbRightKidneyYes.Checked;
  cbRightReanalAbnormalYes.enabled := cbRightKidneyYes.Checked;
  cbRightReanalAbnormalNo.enabled := cbRightKidneyYes.Checked;
end;

procedure cbLeftKidneyYesClick(Sender)
begin
  if cbLeftKidneyYes.Checked then
    cbLeftKidneyNo.Checked := False;
  teLeftKidney.enabled := cbLeftKidneyYes.Checked;
  cbLeftReanalAbnormalYes.enabled := cbLeftKidneyYes.Checked;
  cbLeftReanalAbnormalNo.enabled := cbLeftKidneyYes.Checked;
end;

procedure cbRightAdnexalMassClick(Sender)
begin
  seRightAdnexalMasses.Enabled := cbRightAdnexalMass.Checked;
  seRightAdnexalMassesOnChange(nil);
end;

procedure cbLeftAdnexalMassClick(Sender)
begin
  seLeftAdnexalMasses.Enabled := cbLeftAdnexalMass.Checked;
  seLeftAdnexalMassesOnChange(nil);
end;

procedure cbCorrectPlacementIUCDonClick(Sender)
begin
  if cbCorrectPlacementIUCD.Checked and cbInCorrectPlacementIUCD.Checked then //cbCorrectPlacementIUS.Checked then
    cbInCorrectPlacementIUCD.Checked := False;
end;

procedure cbInCorrectPlacementIUCDonClick(Sender)
begin
  if cbCorrectPlacementIUCD.Checked and cbInCorrectPlacementIUCD.Checked then //cbCorrectPlacementIUS.Checked then
    cbCorrectPlacementIUCD.Checked := False;
end;

procedure cbCorrectPlacementIUSonClick(Sender)
begin
  if cbCorrectPlacementIUS.Checked and cbInCorrectPlacementIUS.Checked then
    cbInCorrectPlacementIUS.Checked := False;
end;

procedure cbInCorrectPlacementIUSonClick(Sender)
begin
  if cbCorrectPlacementIUS.Checked and cbInCorrectPlacementIUS.Checked then
    cbCorrectPlacementIUS.Checked := False;
end;

procedure cbHRTYesOnclick(sender)
begin
   cbToggleCheckOnClick(sender);
   if cbHRTYes.checked then
   begin
     if trim(tcbMedication.Text) = '' then
     begin
        showmessage('Specify HRT type in Medication');
     end;
   end;
end;

Procedure ccbROClassificationOnChnage(sender)
begin

  cbROSeptumYes.Enabled := (ccbROClassification.ItemIndex > 0);
  lblROSeptum.Enabled := (ccbROClassification.ItemIndex > 0);
  cbROSeptumNo.Enabled := (ccbROClassification.ItemIndex > 0);

  lblROVascularPP.Enabled  := (ccbROClassification.ItemIndex > 0) and (not(cbROSmoothYes.checked));
  cbROVSYes.Enabled := (ccbROClassification.ItemIndex > 0) and (not(cbROSmoothYes.checked)) ;
  cbROVSNo.Enabled  := (ccbROClassification.ItemIndex > 0) and (not(cbROSmoothYes.checked));

  cbROSolidYes.Enabled := (ccbROClassification.ItemIndex > 0);
  cbROSolidNo.Enabled := (ccbROClassification.ItemIndex > 0);
  lblROSolid.Enabled := (ccbROClassification.ItemIndex > 0);

  case ccbROClassification.ItemIndex of
  0: begin
        seROThickestSeptum.Enabled := False;
        cbROSolidElementsYes.Enabled := False;
        cbROSolidElementsNo.Enabled := False;
        lblROThickestSeptum.Enabled := False;
        lblROThickestSeptumMeasure.Enabled := False;
     end;
   1: begin
         seROThickestSeptum.Enabled := False;
        cbROSolidElementsYes.Enabled := True;
        cbROSolidElementsNo.Enabled := True;
        lblROThickestSeptum.Enabled := False;
        lblROThickestSeptumMeasure.Enabled := False;
      end;
   2: begin
         seROThickestSeptum.Enabled := True;
        cbROSolidElementsYes.Enabled := False;
        cbROSolidElementsNo.Enabled := False;
        lblROThickestSeptum.Enabled := True;
        lblROThickestSeptumMeasure.Enabled := True;
      end;
   else
       begin
        seROThickestSeptum.Enabled := True;
        cbROSolidElementsYes.Enabled := True;
        cbROSolidElementsNo.Enabled := True;
        lblROThickestSeptum.Enabled := True;
        lblROThickestSeptumMeasure.Enabled := True;
       end;
 end;
 case ccbROClassification.ItemIndex of
   2: begin
         lblROSolid.Enabled  := False;
         cbROSolidYes.Enabled := False ;
         cbROSolidNo.Enabled  := False;
         if cbROSolidYes.checked then
            cbROSolidYes.Checked := False ;
      end;
   5: begin
        lblROVascularPP.Enabled  := True;
        cbROVSYes.Enabled := True ;
        cbROVSNo.Enabled  := True;
      end
 end;
end;

Procedure ccbLOClassificationOnChnage(sender)
begin

  cbLOSeptumYes.Enabled := (ccbLOClassification.ItemIndex > 0);
  lblLOSeptum.Enabled := (ccbLOClassification.ItemIndex > 0);
  cbLOSeptumNo.Enabled := (ccbLOClassification.ItemIndex > 0);

  lblLOVascularPP.Enabled  := (ccbLOClassification.ItemIndex > 0) and (not(cbLOSmoothYes.checked));
  cbLOVSYes.Enabled := (ccbLOClassification.ItemIndex > 0) and (not(cbLOSmoothYes.checked)) ;
  cbLOVSNo.Enabled  := (ccbLOClassification.ItemIndex > 0) and (not(cbLOSmoothYes.checked));

  cbLOSolidYes.Enabled := (ccbLOClassification.ItemIndex > 0);
  cbLOSolidNo.Enabled := (ccbLOClassification.ItemIndex > 0);
  lblLOSolid.Enabled := (ccbLOClassification.ItemIndex > 0);

    case ccbLOClassification.ItemIndex of
      0: begin
            seLOThickestSeptum.Enabled := False;
            cbLOSolidElementsYes.Enabled := False;
            cbLOSolidElementsNo.Enabled := False;
            lblLOThickestSeptum.Enabled := False;
            lblLOThickestSeptumMeasure.Enabled := False;
         end;
       1: begin
             seLOThickestSeptum.Enabled := False;
            cbLOSolidElementsYes.Enabled := True;
            cbLOSolidElementsNo.Enabled := True;
            lblLOThickestSeptum.Enabled := False;
            lblLOThickestSeptumMeasure.Enabled := False;
          end;
       2: begin
             seLOThickestSeptum.Enabled := True;
            cbLOSolidElementsYes.Enabled := False;
            cbLOSolidElementsNo.Enabled := False;
            lblLOThickestSeptum.Enabled := True;
            lblLOThickestSeptumMeasure.Enabled := True;
          end;
       else
           begin
            seLOThickestSeptum.Enabled := True;
            cbLOSolidElementsYes.Enabled := True;
            cbLOSolidElementsNo.Enabled := True;
            lblLOThickestSeptum.Enabled := True;
            lblLOThickestSeptumMeasure.Enabled := True;
           end;
     end;
     case ccbLOClassification.ItemIndex of
       5: begin
                 lblLOVascularPP.Enabled  := True;
                 cbLOVSYes.Enabled := True ;
                 cbLOVSNo.Enabled  := True;
              end
     end;
end;

procedure cbRightReanalAbnormalYesClick(sender)
begin
   cbToggleCheckOnClick(sender);
   ShowMessage('Please describe the abnormality in ''Comments and Diagnosis'' section');
end;

procedure cbLeftReanalAbnormalYesClick(sender)
begin
   cbToggleCheckOnClick(sender);
   ShowMessage('Please describe the abnormality in ''Comments and Diagnosis'' section');
end ;

function GetAntralNumberString(inNumber: Integer): string;
begin
  result := '';
  if inNumber = 1 then
    result := 'one'
  else
  begin
    if inNumber = 2 then
      result := 'two'
    else if inNumber = 3 then
      result := 'three'
    else if inNumber = 4 then
      result := 'four'
    else if inNumber = 5 then
      result := 'five'
    else if inNumber = 6 then
      result := 'six'
    else if inNumber = 7 then
      result := 'seven'
    else if inNumber = 8 then
      result := 'eight'
    else if inNumber = 9 then
      result := 'nine'
    else
      result := IntToStr(inNumber);
  end;
end;

function GetReferalIndications: string;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbReferralIndication.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndication.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxccbReferralIndication.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtPresentComplaintOther.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
  begin
   ShowMessage('Please select a Referral Indication before proceeding.');
  end;
end;

function GetMenses: string;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbMensturalBleeding.Properties.Items.Count - 2 do
  begin
    if cxccbMensturalBleeding.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxccbMensturalBleeding.ShortDescription[i];
    end;
  end;
  if result <> '' then
    result := '#|#+BOLDMenses:#/# '+AddFullStopToEnd(result);
end;

function GetGynaecologicalHistory: String;
begin
  result := '';
  for i := 0 to cxccbClinicalHistory.Properties.Items.Count - 2 do
  begin
    if cxccbClinicalHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxccbClinicalHistory.ShortDescription[i];
    end;
  end;
  if (cxccbClinicalHistory.States[cxccbClinicalHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtOtherPastHistory.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if trim(result) <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
    result := 'Nil.';  
end;

function GetGynaecologicalSurgery: String;
begin
  result := '';
  for i := 0 to cxccbClinicalHistory.Properties.Items.Count - 2 do
  begin
    if cxcbGynaeSurgery.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxcbGynaeSurgery.ShortDescription[i];
    end;
  end;
  if (cxcbGynaeSurgery.States[cxcbGynaeSurgery.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtOtherPastSurgery.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if trim(result) <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
    result := 'Nil.';
end;

function GetFamilyHistory: String;
begin
  result := '';
  for i := 0 to cxcbFamilyHistory.Properties.Items.Count - 2 do
  begin
    if cxcbFamilyHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxcbFamilyHistory.ShortDescription[i];
    end;
  end;
  if (cxcbFamilyHistory.States[cxcbFamilyHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtOtherFamilyHistory.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if trim(result) <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
    result := 'Nil.';
end;

function GetEndCycleDays: string;
begin
  if cbIrregularCycle.Checked then
    result := 'irregular'
  else
  begin
    if (seCycleMaxDays.Value = 1) or (seCycleMinDays.Value = seCycleMaxDays.Value) then
    begin
      result := IntToStr(seCycleMinDays.Value) + ' day';
    end
    else
      result := IntToStr(seCycleMinDays.Value) + '-' + IntToStr(seCycleMaxDays.Value) + ' day';
  end;
end;

function getLMPString : String
begin
   Result := '';
   if cbLMPUnknown.checked then
     result := result + 'LMP unknown.'
   else if cbAmenorrhoea.checked then
     result := result + 'Amenorrhoea'
   else if cbPostMenopausal.checked then
     result := result + 'Postmenopausal';
   else
     begin
     if deLMPDate.Date > 10 then
       result := result +'LMP ' + FormatDateTime('dd mmm yyyy', deLMPDate.Date)+'. ';
     end;
end;

Function GetCycleDaysString : String
begin
   result := '';
   if not ((cbAmenorrhoea.checked) or (cbPostMenopausal.checked)) then
   begin
     if cbIrregularCycle.checked then
       result := result + 'Irregular menses'
     else if cbOligomenorrhoea.checked then
       result := result + 'Oligomenorrhoea'
     else
     begin
      //if ((deLMPDate.Date > 10)  and not(cbLMPUnknown.checked)) then
       result := result +'Day ' + IntToStr(spStartDay.value) + ' of '+ GetEndCycleDays + ' cycle. ';
     end;
   end;
end;

function GetMedication: string;
begin
result := '';
  if (tcbMedication.Text <> '') then
  begin
    if edtOtherMedication.Enabled then
    begin
      if trim(edtOtherMedication.Text) <> '' then
      begin
        result := edtOtherMedication.text;
      end;
    end
    else
    begin
      result := tcbMedication.Text;
      if (Pos('Continuous', tcbMedication.text) > 0) or (Pos('Cyclical', tcbMedication.text)) then
         result := result  + ' HRT';
    end;
  end
  else
    result := '';
  if result <> '' then
    result := result + '. '
  else
    result := 'Nil. ';
end;

function GetCavProjectionCount(var isValidDist: Booelan): Integer;
var
  vControl: TcxCheckBox;
  vCombo: TcxComboBox;
  i: Integer;
begin
  result := 0;
  isValidDist := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
    begin
      isValidDist := True;
      if (TcxCheckBox(vControl).Checked) and (TcxComboBox(vCombo).ItemIndex = 2)then
      begin
        result := Result + 1;
      end;
    end;
  end;
end;

function GetCavProjectionString: String;
var
  vControl: TcxCheckBox;
  vCombo, vComboLeftRight, vcbFibroidPosition,vcbProjection: TcxComboBox;
  vTempStr : String;
  i, vsubnucosalCount: Integer;
  vValidDist : Boolean;

begin
  result := '';
  vTempStr := '';
  vsubnucosalCount := 0;
  vsubmucosalCount := GetCavProjectionCount(vValidDist);
  if vsubmucosalCount =  1 then
  begin
     result := 'The submucosal fibroid appeared to project ';
      for i := 0 to spFibroidCount.Value - 1 do
      begin
        vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
        vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
        begin
          if (TcxCheckBox(vControl).Checked) and (TcxComboBox(vCombo).ItemIndex = 2)then
          begin
            vcbProjection := TWinControl(tsFibroids.Owner).FindComponent('cbProjection' + intToStr(i + 1));
            if vcbProjection.text <> '' then
            begin
              result := result + vcbProjection.text + ' ';
            end
          end;
        end;
      end;
      result := result + 'into the cavity.  '
  end
  else
  begin
    for i := 0 to spFibroidCount.Value - 1 do
    begin
      vTempStr := '';
      vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
      if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
      begin
        if (TcxCheckBox(vControl).Checked) and (TcxComboBox(vCombo).ItemIndex = 2)then
        begin
           vComboLeftRight := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
           vcbFibroidPosition := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
           vcbProjection := TWinControl(tsFibroids.Owner).FindComponent('cbProjection' + intToStr(i + 1));
           if vComboLeftRight.Text <> '' then
              vTempStr := InitCaps(vComboLeftRight.Text, true) + ' ';
           vTempStr := vTempStr + vcbFibroidPosition.Text + ' ' + vCombo.Text;
           if vTempStr <> '' then
             Result := Result + 'The ' + vTempStr + ' fibroid '
           if (vControl.Checked) then
           begin
               result := result + 'appeared to project '
               if vcbProjection.text <> '' then
               begin
                result := result + vcbProjection.text + ' ';
               end
               result := result + 'into the cavity. ';
          end
        end;
      end;
    end;
  end;
end;

function GetUterusType: string;
begin
result := '';
  if Trim(cbUterus.Text) <> '' then
  begin
    result := Trim(cbUterus.Text);
    if cbAntiFlexed.Checked then
      result := result + ' anteflexed'
    else if cbRetroFlexed.Checked then
      result := result + ' retroflexed';
    if lowercase(trim(cbUterineShape.text)) = 'bicornuate' then
      result := result + ' bicornuate';
    if pos('arcuate',lowercase(trim(cbUterineShape.text)))> 0 then
      result := result + ' arcuate';
  end
  else
    result := '';
  if result <> '' then
  begin
    if lowercase(trim(cbUterineShape.text)) = 'normal' then
      result := result + ' uterus was of normal shape and';
    else
      result :=  result + ' uterus';  
  end;
end;

function GetUterusMeasurement: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  v1 := seUterusLength.Value;
  v2 := seUterusWidth.Value;
  v3 := seUterusHeight.Value;
  v4 := trunc(seUterusCC.Value * 10) / 10;
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := Format('%dx%dx%dmm (vol %2.1f cc)', [trunc(v1), trunc(v2), trunc(v3), v4]);
        end
        else
          result := Format('%dx%dx%dmm', [trunc(v1), trunc(v2), trunc(v3)]);
      end
      else
        result := Format('%dx%dmm', [trunc(v1), trunc(v2)]);
    end
    else
      result := Format('%dmm', [trunc(v1)]);
  end;
end;

function GetEndometrialPolyp: string;
var
  v1, v2, v3: Integer;
begin
  v1 := Trunc(edtpolypLength1.Value);
  v2 := Trunc(edtpolypWidth1.Value);
  v3 := Trunc(edtpolypDepth1.Value);
  if (sePolypCount.Value > 0) then
  begin
    if v1 > 0 then
    begin
      if v2 > 0 then
      begin
        if v3 > 0 then
        begin
          result := format(' An echogenic area measuring %dx%dx%dmm was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. ', [trunc(v1),
            trunc(v2), trunc(v3)]);
        end
        else
          result := format(' An echogenic area measuring %dx%dmm was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. ', [trunc(v1),
            trunc(v2)]);
      end
      else
        result := format(' An echogenic area measuring %dmm was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. ', [trunc(v1)]);
    end
    else
      result := ' An echogenic area was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. '
  end
  else
    result := '';
end;

function GetMultipleEndometrialPolyp(inPolyp): string;
var
  v1, v2, v3: Integer;
  vedtpolypLength,vedtpolypwidth,vedtpolypDepth : TcxSpinEdit;
begin

 vedtpolypLength := TWinControl(cxtsGeneral.Owner).FindComponent('edtpolypLength' + intToStr(inPolyp));
 vedtpolypwidth := TWinControl(cxtsGeneral.Owner).FindComponent('edtpolypwidth' + intToStr(inPolyp));
 vedtpolypDepth := TWinControl(cxtsGeneral.Owner).FindComponent('edtpolypDepth' + intToStr(inPolyp));
  v1 := Trunc(vedtpolypLength.Value);
  v2 := Trunc(vedtpolypwidth.Value);
  v3 := Trunc(vedtpolypDepth.Value);
  if (sePolypCount.Value > 0) then
  begin
    if v1 > 0 then
    begin
      if v2 > 0 then
      begin
        if v3 > 0 then
        begin
          result := format('%dx%dx%dmm ', [trunc(v1),trunc(v2), trunc(v3)]);
        end
        else
          result := format('%dx%dmm', [trunc(v1),trunc(v2)]);
      end
      else
        result := format('%dmm', [trunc(v1)]);
    end
    else
      result := ''
  end
  else
    result := '';
end;

function GetMultipleEndometrialPolypString: string;
var
  count : integer;
  vTempStr : string;
begin
  result := '';
  vtempStr:= '';
  count := 0;

  if sePolypCount.value > 0 then
  begin
     for  count := 1 to  sePolypCount.value do
     begin
        if (vtempStr <> '') and (GetMultipleEndometrialPolyp(count) <> '') then
          vtempStr := vtempStr + 'and ';
        vtempStr := vtempStr + GetMultipleEndometrialPolyp(count) ;
     end;
  end;
  if sePolypCount.value = 2 then
  begin
     result := ' Two echogenic areas were seen in the cavity ';
     if vtempStr <> '' then
       result := result + 'and measured ' + vtempStr +' each with an associated feeder vessel, consistent with an endometrial polyp. '
  end
  else
    result := '';
end;

function GetIUCDPlacement(inConc: Boolean): string;
begin
  result := '';
  if cbCorrectPlacementIUCD.Checked then
  begin
    if inConc then
      result := 'Correctly placed IUCD within the endometrial cavity. ';
    else
      result := 'The straight-stemmed IUCD was correctly positioned within the endometrial cavity. ';
  end
  else if cbInCorrectPlacementIUCD.Checked then
  begin
    if inConc then
      result := 'Incorrectly placed IUCD within the endometrial cavity. ';
    else
      result := '#|#+CREDThe intrauterine contraceptive device (IUCD) was noted to be incorrectly positioned within the uterine cavity.#/# ';
  end;
  if cbCorrectPlacementIUS.Checked then
  begin
    if inConc then
      result := result + 'Correctly positioned IUS within the endometrial cavity. ';
    else
      result := result + 'The barrel of the intrauterine system (IUS) was correctly positioned within the endometrial cavity. ';
  end
  else if cbInCorrectPlacementIUS.Checked then
  begin
    if inConc then
      result := result + 'Incorrectly positioned IUS within the endometrial cavity. ';
    else
      result := result + '#|#+CREDThe barrel of the IUS (Mirena) was noted to be incorrectly positioned within the uterine cavity.#/# ';
  end
end;

function GetUterusAppearance: string;
var
  vFound: Integer;
begin
  vFound := 0;
  result := ''
  if cbUterusMobile.Checked then
  begin
    result := result + ' was freely mobile';
    vFound := 1;
  end
  else if cbUterusLimitedMobile.checked then
  begin
    result := result + ' had limited mobility';
    vFound := 2;
  end;
  if cbUterusNonTender.Checked then
  begin
    if vFound > 0 then
    begin
      result := result + ' and';
      if vFound > 1 then
        result := result + ' was';
    end
    else
      result := result + ' was';
    result := result + ' non tender'
  end
  else if cbUterusTender.Checked then
  begin
    if vFound > 0 then
    begin
      result := result + ' and';
      if vFound > 1 then
        result := result + ' was';
    end                                                                                                                          
    else
      result := result + ' was';
    result := result + ' tender'
  end;
  if result <> '' then
    result := 'The uterus' + result + '. ';
end;

function GetCervicalPolyp: string;
var
  v1, v2, v3: Integer;
begin
result := '';
  v1 := Trunc(edtCervicalpolypLength1.Value);
  v2 := Trunc(edtCervicalpolypWidth1.Value);
  v3 := Trunc(edtCervicalpolypDepth1.Value);
    if v1 > 0 then
    begin
      if v2 > 0 then
      begin
        if v3 > 0 then
        begin
          result := format(' A cervical polyp of %dx%dx%dmm was identified. ', [trunc(v1),
            trunc(v2), trunc(v3)]);
        end
        else
          result := format(' A cervical polyp of %dx%dmm was identified. ', [trunc(v1),
            trunc(v2)]);
      end
      else
        result := format(' A cervical polyp of %dmm was identified. ', [trunc(v1)]);
    end
end;

function GetCervixAppearance : String
begin
   result := '';
   if cbCervicalPolyp.checked then
   begin
     if GetCervicalPolyp <> '' then
        result := result + GetCervicalPolyp ;
     else
        result := ' A cervical polyp was identified.  '
   end;
   else
   begin
      result := result + 'The cervix appeared normal. '
   end;
end;

function GetSeptumLengthString: string;
begin
  result := '';
  if  (cbUterineShape.ItemIndex = 3) then
  begin
    result := Format('A partial cavity septation was noted, extending %dmm from the fundal endometrium. ', [Trunc(spSeptumlength.Value)]);
  end;
   if  (cbUterineShape.ItemIndex = 4) then
  begin
    result := Format('A complete cavity septation was noted, extending %dmm from the fundal endometrium. ', [Trunc(spSeptumlength.Value)]);
  end;
end;

function GetRightOvaryAppearance: string;
var
  vFound: Integer;
  vResult: string;
begin
  vFound := 0;
  vResult := ''
    result := '';
  if cbRightMobile.Checked then
  begin
    vResult := vResult + ' was freely mobile';
    vFound := 1;
  end
  else if cbRightLimitedMobility.checked then
  begin
    vResult := vResult + ' was of limited mobility';
    vFound := 2;
  end;
  if cbRightNonTender.Checked then
  begin
    if vFound > 0 then
    begin
      vResult := vResult + ' and';
      if vFound > 1 then
        vResult := vResult + ' was';
    end
    else
      vResult := vResult + ' was';
    vResult := vResult + ' non tender'
  end
  else if cbRightTender.Checked then
  begin
    if cbRightMobile.Checked then
    begin
      if vFound > 0 then
      begin
        vResult := vResult + ' but';
        if vFound > 1 then
          vResult := vResult + ' was';
      end
      else
        vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end
    else if cbRightLimitedMobility.checked then
    begin
      vResult := vResult + ' and mildly tender, raising the possibility of local adhesions';
    end
    else
    begin
      vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end
  end;

  if (cbRightCorpusLuteum.Checked) and (cbRightCorpusLuteumSize.Value > 0) then
  begin
    if cbRightCorpusLuteumSize3.Value > 0 then
    begin
      result := result + Format('Three corpora lutea were visualised measuring %d, %d and %dmm. ', [Trunc(cbRightCorpusLuteumSize.Value), Trunc(cbRightCorpusLuteumSize2.Value),
        Trunc(cbRightCorpusLuteumSize3.Value)]);
    end
    else if cbRightCorpusLuteumSize2.Value > 0 then
    begin
      result := result + Format('Two corpora lutea were visualised measuring %d and %dmm. ', [Trunc(cbRightCorpusLuteumSize.Value), Trunc(cbRightCorpusLuteumSize2.Value)]);
    end
    else
      result := result + Format('%s %dmm corpus luteum was visualised. ', [GetIndefinateArticle(Trunc(cbRightCorpusLuteumSize.Value), true), Trunc(cbRightCorpusLuteumSize.Value)]);
    if vResult <> '' then
      result := result + 'The ovary' + vResult;
    result := AddFullStopToEnd(result);
  end
  else
  begin
    if vResult <> '' then
      result := 'The ovary' + vResult + '. ';
  end;
  if cbRightVaginalAccessYes.Checked then
  begin
    result := result + 'The position of this ovary is suitable for vaginal egg collection. '
  end
  else if cbRightVaginalAccessNo.Checked then
  begin
    result := result + 'Because of its location, this ovary may not be suitable for vaginal egg collection. '
  end;
end;

function GetOvarianCystMeasurement(v1, v2, v3, v4: double; inType: string): string;
begin
  result := GetIntegerMeasuredString(trunc(v1), trunc(v2), trunc(v3), v4, inType);
end;

function GetOvarianCyst(inNumber: Integer; inSide: string): string;
var
  vCystType: TAdvTreeComboBox;
  vl, vw, vd, vv: TcxSpinEdit;
begin
  result := '';
  if inSide = 'R' then
  begin
    case inNumber of
      1:
        begin
          vCystType := cbRightOvaryCystType1;
          vl := seRightOvaryCystLength1;
          vw := seRightOvaryCystWidth1;
          vd := seRightOvaryCystDepth1;
          vv := seRightOvaryCystVolume1;
        end;
      2:
        begin
          vCystType := cbRightOvaryCystType2;
          vl := seRightOvaryCystLength2;
          vw := seRightOvaryCystWidth2;
          vd := seRightOvaryCystDepth2;
          vv := seRightOvaryCystVolume2;
        end;
      3:
        begin
          vCystType := cbRightOvaryCystType3;
          vl := seRightOvaryCystLength3;
          vw := seRightOvaryCystWidth3;
          vd := seRightOvaryCystDepth3;
          vv := seRightOvaryCystVolume3;
        end;
     4:
        begin
          vCystType := cbRightOvaryCystType4;
          vl := seRightOvaryCystLength4;
          vw := seRightOvaryCystWidth4;
          vd := seRightOvaryCystDepth4;
          vv := seRightOvaryCystVolume4;
        end;
    end;
  end
  else
  begin
    case inNumber of
      1:
        begin
          vCystType := cbleftOvaryCystType1;
          vl := seleftOvaryCystLength1;
          vw := seleftOvaryCystWidth1;
          vd := seleftOvaryCystDepth1;
          vv := seleftOvaryCystVolume1;
        end;
      2:
        begin
          vCystType := cbleftOvaryCystType2;
          vl := seleftOvaryCystLength2;
          vw := seleftOvaryCystWidth2;
          vd := seleftOvaryCystDepth2;
          vv := seleftOvaryCystVolume2;
        end;
      3:
        begin
          vCystType := cbleftOvaryCystType3;
          vl := seleftOvaryCystLength3;
          vw := seleftOvaryCystWidth3;
          vd := seleftOvaryCystDepth3;
          vv := seleftOvaryCystVolume3;
        end;
      4:
        begin
          vCystType := cbleftOvaryCystType4;
          vl := seleftOvaryCystLength4;
          vw := seleftOvaryCystWidth4;
          vd := seleftOvaryCystDepth4;
          vv := seleftOvaryCystVolume4;
        end;
    end;
  end;
  case vCystType.selection of
    1: result := format('A thin-walled avascular anechoic cyst was visualised measuring %s.  The appearance is consistent with a simple cyst. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    2: result := '';
    3: result := format('A thin walled avascular cyst was visualised measuring %s, the internal echoes consistent with a haemorrhagic follicular cyst. ',
       [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    4: result := format('A thin-walled avascular cyst was visualised measuring %s.  The internal echoes demonstrate a fluid level in a haemorrhagic cyst. ',[GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    5: result := format('A thin-walled avascular cyst was visualised measuring %s.  The internal echoes are consistent with retracted clot and serum in a haemorrhagic cyst. ',[GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    6: result := format('A thin-walled avascular cyst was visualised measuring %s.  The internal echoes demonstrate clot and stellate fibrin strands in a haemorrhagic cyst.  ',[GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    7: result := format('An avascular cyst was visualised containing homogeneously dispersed low level echoes, characteristic of an endometrioma. The dimensions were %s. ',
      [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    9: result :=
      format('An avascular cyst was visualised containing echoes of mixed echogenicity.  A highly echogenic region was suggestive of fat and a characteristic dot and dash pattern was indicative of hair and sebum in a dermoid cyst. The dimensions were %s. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
   10: result := format('An avascular cyst was visualised containing highly echogenic echoes suggestive of fat in a dermoid cyst. The dimensions were %s. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    11: result := format('An avascular area of increased echogenicity was visualised, measuring %s.  The appearance is consistent with fat in a dermoid plug. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
  else
    result := format('A cyst measuring %s was visualised. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
  end;
end;

function GetCystsDimensionsForCystList(inList: TStringList; inSide: string; inExtra: Boolean): String;
var                                                                                                   
  vCystType: TcxComboBox;
  vl, vw, vd, vv: TcxSpinEdit;
  i : Integer;
begin
  result := '';
  if inSide = 'R' then
  begin
   if inList.count > 0 then
   begin
    for i := 0 to inList.Count - 1 do
    begin
       if result <> '' then
       begin
         if (i = inList.Count - 1) and (inList.Count > 1) then
           result := result + ' and ';
         else
            result := result + ', ';
       end;
       vl := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystLength' + inList[i]);
       vw := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystWidth' + inList[i]);
       vd := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystDepth' + inList[i]);
       vv := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystVolume' + inList[i]);
       result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
   end;
  end
  else
  begin
   if inList.count > 0 then
   begin
    for i := 0 to inList.Count - 1 do
    begin
       if result <> '' then
       begin
         if (i = inList.Count - 1) and (inList.Count > 1) then
           result := result + ' and ';
         else
            result := result + ', ';
       end;
       vl := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystLength' + inList[i]);
       vw := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystWidth' + inList[i]);
       vd := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystDepth' + inList[i]);
       vv := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystVolume' + inList[i]);
       result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
   end;
  end;
end;

function GetCystsDimensions(inQTY: Integer; inSide: string; inExtra: Boolean): String;
var
  vCystType: TcxComboBox;
  vl, vw, vd, vv: TcxSpinEdit;
begin
  result := '';
  if inSide = 'R' then
  begin
    if inQty > 1 then
    begin
      if inExtra then
      begin
        vl := seRightOvaryCystLength2;
        vw := seRightOvaryCystWidth2;
        vd := seRightOvaryCystDepth2;
        vv := seRightOvaryCystVolume2;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seRightOvaryCystLength3;
        vw := seRightOvaryCystWidth3;
        vd := seRightOvaryCystDepth3;
        vv := seRightOvaryCystVolume3;
      end
      else
      begin
        vl := seRightOvaryCystLength1;
        vw := seRightOvaryCystWidth1;
        vd := seRightOvaryCystDepth1;
        vv := seRightOvaryCystVolume1;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seRightOvaryCystLength2;
        vw := seRightOvaryCystWidth2;
        vd := seRightOvaryCystDepth2;
        vv := seRightOvaryCystVolume2;
      end;
      if inQTY = 2 then
        result := result + ' and '
      else
        result := result + ', ';
      result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
    if inQty > 2 then
    begin
      vl := seRightOvaryCystLength3;
      vw := seRightOvaryCystWidth3;
      vd := seRightOvaryCystDepth3;
      vv := seRightOvaryCystVolume3;
      if inQTY = 3 then
        result := result + ' and '
      else
        result := result + ', ';
      result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
    if inQty > 3 then
    begin
      vl := seRightOvaryCystLength4;
      vw := seRightOvaryCystWidth4;
      vd := seRightOvaryCystDepth4;
      vv := seRightOvaryCystVolume4;
      result := result + Format(' and %s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
   { AddFullstopToEnd(result);
    if trim(result)[length(trim(result)] <> '.'
      result := result + '. ';    }
  end
  else
  begin
    if inQty > 1 then
    begin
      if inExtra then
      begin
        vl := seLeftOvaryCystLength2;
        vw := seLeftOvaryCystWidth2;
        vd := seLeftOvaryCystDepth2;
        vv := seLeftOvaryCystVolume2;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seLeftOvaryCystLength3;
        vw := seLeftOvaryCystWidth3;
        vd := seLeftOvaryCystDepth3;
        vv := seLeftOvaryCystVolume3;
      end
      else
      begin
        vl := seLeftOvaryCystLength1;
        vw := seLeftOvaryCystWidth1;
        vd := seLeftOvaryCystDepth1;
        vv := seLeftOvaryCystVolume1;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seLeftOvaryCystLength2;
        vw := seLeftOvaryCystWidth2;
        vd := seLeftOvaryCystDepth2;
        vv := seLeftOvaryCystVolume2;
      end;
      if inQTY = 2 then
        result := result + ' and '
      else
        result := result + ', ';
      result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
    if inQty > 2 then
    begin
      vl := seLeftOvaryCystLength3;
      vw := seLeftOvaryCystWidth3;
      vd := seLeftOvaryCystDepth3;
      vv := seLeftOvaryCystVolume3;
      result := result + Format(' and %s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
  {  AddFullstopToEnd(result);
    if trim(result)[length(trim(result)] <> '.'
      result := result + '. ';    }
  end;
end;

function GetBothorAll(inQty: Integer): String;
begin
  if inQTY = 2 then
    result := 'Both'
  else
    result := 'All';
end;

function GetMultiCystDescriptions(inType: Integer; inQTY: Integer; inSide: string ; cystList : TstringList): String;
var
  vExtra: Boolean;
begin
  vExtra := False;
  if inQTY = 8 then
  begin
    inQty := 2;
    vExtra := True;
  end;
  case inType of
    1: begin
         if (inQTY = 2) then
           result := format('%s thin-walled avascular anechoic cysts were visualised.  The features of both are consistent with simple cysts. ', [InitCaps(getNumberString(inQTY), False)]);
         else
           result := format('%s thin-walled avascular anechoic cysts were visualised.  The features are consistent with simple cysts. ', [InitCaps(getNumberString(inQTY), False)]);
       end;
    2: result := '';
    3: result := format('%s thin walled avascular cysts were visualised, the internal echoes consistent with haemorrhagic follicular cysts. ', [InitCaps(getNumberString(inQTY), False)]);
    4: result := format('%s thin-walled avascular cysts were visualised,  the internal echoes demonstrate a fluid level in haemorrhagic cysts. ', [InitCaps(getNumberString(inQTY), False)]);
    5: result := format('%s thin-walled avascular cysts were visualised.  The internal echoes are consistent with retracted clot and serum in haemorrhagic cysts. ', [InitCaps(getNumberString(inQTY), False)]);
    6: result := format('%s thin walled avascular cysts was visualised with internal echoes consistent with retracted clot and fibrin strands. %s cysts have the appearance of haemorrhagic cysts. ', [InitCaps(getNumberString(inQTY), False), GetBothorAll(inQTY)]);
    7: result := format('%s avascular cysts were visualised containing homogeneously dispersed low level echoes, characteristic of endometriomas. ',[InitCaps(getNumberString(inQTY), False)]);
    9: result := format('%s avascular cysts were visualised containing echoes of mixed echogenicity.  A highly echogenic region was suggestive of fat and a characteristic dot and dash pattern was indicative of hair and sebum in a dermoid cyst. ', [InitCaps(getNumberString(inQTY), False), GetBothorAll(inQTY)]);
    10: result := format('%s avascular cysts were visualised containing highly echogenic echoes suggestive of fat in a dermoid cyst. ', [InitCaps(getNumberString(inQTY), False), GetBothorAll(inQTY)]);
    11: begin
        if (inQty = 2) then
         result := format('%s avascular areas of increased echogenicity were visualised. Both have an appearance consistent with fat in a dermoid plug. ', [InitCaps(getNumberString(inQTY), False)]);
        else
         result := format('%s avascular areas of increased echogenicity were visualised, appearance consistent with fat in a dermoid plug. ', [InitCaps(getNumberString(inQTY), False)]);
       end;
  else
    result := format('%s cysts were visualised. ', [InitCaps(getNumberString(inQTY), False)]);
  end;
  if assigned(cystList) then
  begin
    if cystList.count > 0 then
      result := result + Format('The dimensions were as follows %s. ',[GetCystsDimensionsForCystList(cystList, inSide, vExtra)]);
    else
      result := result + Format('The dimensions were as follows %s. ',[GetCystsDimensions(inQTY, inSide, vExtra)]);
  end
  else
    result := result + Format('The dimensions were as follows %s. ',[GetCystsDimensions(inQTY, inSide, vExtra)]);
end;

function GetRightOvaryCyst: string;
var
  cystList : TStringlist;
begin
  result := '';
  cystList := TStringlist.Create;
  if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0) then
  begin
    if seRightOvarianCystsCount.Value = 1 then
      result := GetOvarianCyst(1, 'R')
    else if seRightOvarianCystsCount.Value = 2 then
    begin
      if (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) then
      begin
        lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
        lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
      end
      else
      begin
        result := format('%s',[GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R','')]);
      end;
    end
    else if seRightOvarianCystsCount.Value = 3 then
    begin
      if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection)  then
      begin
        result := format('%s',[GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R','')]);
      end
      else
      begin
        if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R','')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
        end
        else if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) then
        begin
          cystList.Add('1'); cystList.Add('3')
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
        end
        else
        begin
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
          if (cbRightOvaryCystType2.Selection = cbRightOvaryCystType3.Selection) then
          begin
            lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 8, 'R','')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          end
          else
          begin
            lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          end;
        end;
      end;
    end;
    else
    begin
      if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)  then
      begin
        cystList.Add('1');  cystList.Add('2');  cystList.Add('3');  cystList.Add('4'); 
        result := format('%s',[GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 4, 'R',cystList)]);
      end
      else if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection)) or
              ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)) or
              ((cbRightOvaryCystType2.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType2.Selection = cbRightOvaryCystType4.Selection)) or
              ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection))then
      begin
        if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection)) then
        begin
           cystList.Add('1');cystList.Add('2');CystList.Add('3');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
        else if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)) then
        begin
          cystList.Add('1');cystList.Add('2');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
        else if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)) then
        begin
           cystList.Add('1');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
        else if ((cbRightOvaryCystType2.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType2.Selection = cbRightOvaryCystType4.Selection)) then
        begin
          cystList.Add('2');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
      end;
      else if (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) and
              (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) and
              (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType4.Selection) and
              (cbRightOvaryCystType2.Selection <> cbRightOvaryCystType3.Selection) and
              (cbRightOvaryCystType2.Selection <> cbRightOvaryCystType4.Selection) and
              (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType4.Selection)then
      begin
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc4="' + format('4:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
      end;
      else
      begin
         if (cbRightOvaryCystType1.Selection =  cbRightOvaryCystType2.Selection) then
         begin
            cystList.Add('1');cystList.Add('2')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType3.Selection =  cbRightOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('3');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType3.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
        else if (cbRightOvaryCystType1.Selection =  cbRightOvaryCystType3.Selection) then
        begin
            cystList.Add('1');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType2.Selection =  cbRightOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
        end
        else if (cbRightOvaryCystType1.Selection =  cbRightOvaryCystType4.Selection) then
        begin
            cystList.Add('1');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType2.Selection =  cbRightOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
        end
         else if (cbRightOvaryCystType2.Selection =  cbRightOvaryCystType3.Selection) then
         begin
            cystList.Add('2');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType1.Selection =  cbRightOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
         else if (cbRightOvaryCystType2.Selection =  cbRightOvaryCystType4.Selection) then
         begin
            cystList.Add('2');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType1.Selection =  cbRightOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
         else if (cbRightOvaryCystType3.Selection =  cbRightOvaryCystType4.Selection) then
         begin
            cystList.Add('3');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType3.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType2.Selection =  cbRightOvaryCystType1.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('2')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
      end;
    end;
  end;
end;

function GetRightFollicleCount: integer
begin
  result := 0;
  result := seRightFolCount.Value + seRightLeadFollicle.Value;
end;

function GetRightOvary: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  if cbRightOvaryIdentified.Checked then
  begin
    v1 := trunc(seRightOvaryLength.Value);
    v2 := trunc(seRightOvaryWidth.Value);
    v3 := trunc(seRightOvaryHeight.Value);
    v4 := trunc(seRightOvaryCC.Value * 10) / 10;
    if ((cbRightOvaryVisualisedTA.Checked) and (not cbRightOvaryVisualisedTV.Checked) and (not cbPerformedTransAbdom.Checked)) then
    begin
      {if cbRightPCO.Checked then
        result := result + format('The multifollicular right ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
      else}
        result := result + format('The right ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
    end
    else
    begin
      {if cbRightPCO.Checked then
        result := result + format('The multifollicular right ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
      else}
        result := result + format('The right ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
    end;
    if (seRightResidualFolCount.visible) and ((seRightResidualFolCount.value) > 0) then
    begin
       if seRightResidualFolCount.value = 1 then
       begin
         result := result + ' and contained single residual follicle ';
          result := result + format(' (%d-%dmm). ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
       end;
       else if (seRightResidualFolCount.visible) and  (seRightResidualFolCount.value) > 1 then
       begin
         result := result +  format(' and contained %s residual follicles', [GetNumberString(trunc(seRightResidualFolCount.value))]);
         result := result + format(' (%d-%dmm). ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
       end;  
    end
    else if GetRightFollicleCount > 0 then
    begin
      if GetRightFollicleCount > 1 then
      begin
        result := result + format(' and contained %s follicles', [GetNumberString(trunc(GetRightFollicleCount))]);
        if GetRightFollicleCount > 2 then
        begin
          if cbRightLeadFollicle.Checked then
          begin
            v1 := trunc(seRightLeadFollicleSize.value);
            v2 := trunc(seRightLeadFollicleSize2.Value);
            v3 := trunc(seRightLeadFollicleSize3.value);
            if v1 > 0 then
            begin
              if v2 > 0 then
              begin
                if v3 > 0 then
                begin
                  if GetRightFollicleCount > 3 then
                  begin
                    if GetRightFollicleCount > 4 then
                      result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d-%dmm). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                    else
                      result := result + format(' (lead follicles %dmm, %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value)]);
                  end
                  else
                    result := result + format(' (lead follicles %dmm, %dmm, %dmm). ', [v1, v2, v3])
         //         if trunc(seRightFolSize.Value) > 0 then
         //           result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d-%dmm). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
        //          else
         //           result := result + format(' (lead follicles %dmm, %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value)]);
                end
                else
                begin
                  if GetRightFollicleCount > 3 then
                    result := result + format(' (lead follicles %dmm, %dmm, rest %d-%dmm). ', [v1, v2, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                  else
                    result := result + format(' (lead follicles %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, trunc(seRightFollicle1Size.Value)]);
                end;
              end
              else
              begin
                if trunc(seRightFolSize.Value) > 0 then
                  result := result + format(' (lead follicle %dmm, rest %d-%dmm). ', [v1, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                else
                  result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
              end;
            end;
          end
          else
            result := result + format(' (%d-%dmm). ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
        end
        else
        begin
          if cbRightLeadFollicle.Checked then
          begin
            v1 := trunc(seRightLeadFollicleSize.value);
            v2 := trunc(seRightLeadFollicleSize2.Value);
            v3 := trunc(seRightLeadFollicleSize3.value);
            if v1 > 0 then
            begin
              if v2 > 0 then
              begin
                if v3 > 0 then
                begin
                    result := result + format(' (lead follicles %dmm, %dmm and %dmm). ', [v1, v2, v3])
       //           if trunc(seRightFolSize.Value) > 0 then
       //             result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d and %dmm). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
       //           else
       //             result := result + format(' (lead follicles %dmm, %dmm, %dmm and %dmm antral follicle). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value)]);
                end
                else
                begin
                //  if trunc(seRightFolSize.Value) > 0 then
                    result := result + format(' (lead follicles %dmm and %dmm). ', [v1, v2])
                //    result := result + format(' (lead follicles %dmm and %dmm, rest %d and %dmm). ', [v1, v2, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                //  else
                //    result := result + format(' (lead follicles %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, trunc(seRightFollicle1Size.Value)]);
                end;
              end
              else
              begin
              //  result := result + format(' (lead follicle %dmm, antral follicle %dmm). ', [v1, trunc(seRightFollicle1Size.Value)])
                result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
        //        if trunc(seRightFolSize.Value) > 0 then
        //          result := result + format(' (lead follicle %dmm, rest %d and %dmm). ', [v1, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
        //        else
        //          result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
              end;
            end;
          end
          else
            result := result + format(' of %dmm and %dmm. ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
        end;
      end
      else
      begin
        if cbRightLeadFollicle.Checked then
          result := result + format(' and contained a single lead follicle of %dmm. ', [trunc(seRightLeadFollicleSize.Value)])
        else
          result := result + format(' and contained a single antral follicle of %dmm. ', [trunc(seRightFollicle1Size.Value)]);
      end;
    end
    else
    begin
      result := result + ' and contained no follicles. ';
    end;
  end
  else
  begin
    if not(cbleftOvaryIdentified.checked) then
    begin
      if (cbRightOoporectomy.checked) and  (cbLeftOoporectomy.checked) then
        result := result + 'Neither ovary identified, consistent with previous surgical removal.';
      else
        result := result + 'Neither ovary was identified on this occasion.';
    end;
    else
    begin
      result := result + 'The right ovary was not identified';
      if cbRightOoporectomy.checked then
         result := result + ', consistent with previous surgical removal';
       result := result + '.  ';
    end;
  end;
end;

function GetLeftOvaryAppearance: string;
var
  vFound: Integer;
  vResult: string;
begin
  vFound := 0;
  result := ''
    vResult := '';
  if cbLeftMobile.Checked then
  begin
    vResult := vResult + ' was freely mobile';
    vFound := 1;
  end
  else if cbLeftLimitedMobility.checked then
  begin
    vResult := vResult + ' was of limited mobility';
    vFound := 2;
  end;
  if cbLeftNonTender.Checked then
  begin
    if vFound > 0 then
    begin
      vResult := vResult + ' and';
      if vFound > 1 then
        vResult := vResult + ' was';
    end
    else
      vResult := vResult + ' was';
    vResult := vResult + ' non tender'
  end
  else if cbLeftTender.Checked then
  begin
    if cbLeftMobile.Checked then
    begin
      if vFound > 0 then
      begin
        vResult := vResult + ' but';
        if vFound > 1 then
          vResult := vResult + ' was';
      end
      else
        vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end
    else if cbLeftLimitedMobility.checked then
    begin
      vResult := vResult + ' and mildly tender, raising the possibility of local adhesions';
    end
    else
    begin
      vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end;
  end;

  if (cbLeftCorpusLuteum.Checked) and (cbLeftCorpusLuteumSize.Value > 0) then
  begin
    if cbleftCorpusLuteumSize3.Value > 0 then
    begin
      result := result + Format('Three corpora lutea were visualised measuring %d, %d and %dmm. ', [Trunc(cbLeftCorpusLuteumSize.Value), Trunc(cbLeftCorpusLuteumSize2.Value),
        Trunc(cbLeftCorpusLuteumSize3.Value)]);
    end
    else if cbleftCorpusLuteumSize2.Value > 0 then
    begin
      result := result + Format('Two corpora lutea were visualised measuring %d and %dmm. ', [Trunc(cbLeftCorpusLuteumSize.Value), Trunc(cbLeftCorpusLuteumSize2.Value)]);
    end
    else
      result := result + Format('%s %dmm corpus luteum was visualised. ', [GetIndefinateArticle(Trunc(cbLeftCorpusLuteumSize.Value), true), Trunc(cbLeftCorpusLuteumSize.Value)]);
    if vResult <> '' then
      result := result + 'The ovary' + vResult;
    result := AddFullStopToEnd(result);
  //  result := result + '. ';
  end
  else
  begin
    if vResult <> '' then
      result := 'The ovary' + vResult + '. ';
    ;
  end;
  if cbLeftVaginalAccessYes.Checked then
  begin
    result := result + 'The position of this ovary is suitable for vaginal egg collection. '
  end
  else if cbLeftVaginalAccessNo.Checked then
  begin
    result := result + 'Because of its location, this ovary may not be suitable for vaginal egg collection. '
  end;
end;

function GetLeftOvaryCyst: string;
var
  cystList : TStringlist;
begin
  result := '';
  cystList := TStringlist.Create;
  if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0) then
  begin
    if seLeftOvarianCystsCount.Value = 1 then
      result := GetOvarianCyst(1, 'L')
    else if seLeftOvarianCystsCount.Value = 2 then
    begin
      if (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) then
      begin
        lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
        lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
      end
      else
      begin
        result := format('%s',[GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L','')]);
      end;
    end
    else if seLeftOvarianCystsCount.Value = 3 then
    begin
      if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection)  then
      begin
        result := format('%s',[GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L','')]);
      end
      else
      begin
        if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L','')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
        end
        else if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) then
        begin
          cystList.Add('1'); cystList.Add('3')
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
        end
        else
        begin
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
          if (cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType3.Selection) then
          begin
            lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 8, 'L','')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          end
          else
          begin
            lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          end;
        end;
      end;
    end;
    else
    begin
      if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)  then
      begin
        cystList.Add('1'); cystList.Add('2');cystList.Add('3');cystList.Add('4');
        result := format('%s',[GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 4, 'L',cystList)]);
      end
      else if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection)) or
              ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)) or
              ((cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType4.Selection)) or
              ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection))then
      begin
        if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection)) then
        begin
           cystList.Add('1');cystList.Add('2');CystList.Add('3');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
        else if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)) then
        begin
          cystList.Add('1');cystList.Add('2');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
        else if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)) then
        begin
           cystList.Add('1');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
        else if ((cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType4.Selection)) then
        begin
          cystList.Add('2');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
      end;
      else if (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) and
              (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) and
              (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType4.Selection) and
              (cbLeftOvaryCystType2.Selection <> cbLeftOvaryCystType3.Selection) and
              (cbLeftOvaryCystType2.Selection <> cbLeftOvaryCystType4.Selection) and
              (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType4.Selection)then
      begin
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc4="' + format('4:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
      end;
      else
      begin
         if (cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType2.Selection) then
         begin
            cystList.Add('1');cystList.Add('2')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType3.Selection =  cbLeftOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('3');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType3.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
        else if (cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType3.Selection) then
        begin
            cystList.Add('1');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
        end
        else if (cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType4.Selection) then
        begin
            cystList.Add('1');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
        end
         else if (cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType3.Selection) then
         begin
            cystList.Add('2');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
         else if (cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType4.Selection) then
         begin
            cystList.Add('2');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
         else if (cbLeftOvaryCystType3.Selection =  cbLeftOvaryCystType4.Selection) then
         begin
            cystList.Add('3');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType3.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType1.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('2')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
      end;
    end;
  end;
end;

function GetLeftFollicleCount: integer
begin
  result := 0;
  result := seLeftFolCount.Value + seLeftLeadFollicle.Value;
end;

function GetLeftOvary: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  if cbLeftOvaryIdentified.Checked then
  begin
    v1 := trunc(seLeftOvaryLength.Value);
    v2 := trunc(seLeftOvaryWidth.Value);
    v3 := trunc(seLeftOvaryHeight.Value);
    v4 := trunc(seLeftOvaryCC.Value * 10) / 10;
    if ((cbLeftOvaryVisualisedTA.Checked) and (not cbLeftOvaryVisualisedTV.Checked) and (not cbPerformedTransAbdom.Checked)) then
    begin
     { if cbLeftPCO.Checked then
        result := result + format('The multifollicular left ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
    else  }
      result := Format('The left ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
  end
  else
  begin
    {if cbLeftPCO.Checked then
      result := result + format('The multifollicular left ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
    else }
      result := Format('The left ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
  end;
  if (seLeftResidualFolCount.visible) and ((seLeftResidualFolCount.value) > 0) then
  begin
     if seLeftResidualFolCount.value = 1 then
     begin
       result := result + ' and contained single residual follicle ';
        result := result + format(' (%d-%dmm). ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
     end;
     else if (seLeftResidualFolCount.visible) and  (seLeftResidualFolCount.value) > 1 then
     begin
       result := result +  format(' and contained %s residual follicles', [GetNumberString(trunc(seLeftResidualFolCount.value))]);
       result := result + format(' (%d-%dmm). ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
     end;
  end
  else if GetLeftFollicleCount > 0 then
  begin
    if GetLeftFollicleCount > 1 then
    begin
      result := result + format(' and contained %s follicles', [GetNumberString(trunc(GetLeftFollicleCount))]);
      if GetLeftFollicleCount > 2 then
      begin
        if cbLeftLeadFollicle.Checked then
        begin
          v1 := trunc(seLeftLeadFollicleSize.value);
          v2 := trunc(seLeftLeadFollicleSize2.Value);
          v3 := trunc(seLeftLeadFollicleSize3.value);
          if v1 > 0 then
          begin
            if v2 > 0 then
            begin
              if v3 > 0 then
              begin
                if GetLeftFollicleCount > 3 then
                begin
                  if GetLeftFollicleCount > 4 then
                    result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d-%dmm). ', [v1, v2, v3, trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)])
                  else
                    result := result + format(' (lead follicles %dmm, %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, v3, trunc(seLeftFollicle1Size.Value)]);
                end
                else
                  result := result + format(' (lead follicles %dmm, %dmm, %dmm). ', [v1, v2, v3])
              end
              else
              begin
                if GetLeftFollicleCount > 3 then
                  result := result + format(' (lead follicles %dmm, %dmm, rest %d-%dmm). ', [v1, v2, trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)])
                else
                  result := result + format(' (lead follicles %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, trunc(seLeftFollicle1Size.Value)]);
              end;
            end
            else
            begin
              if trunc(seLeftFolSize.Value) > 0 then
                result := result + format(' (lead follicle %dmm, rest %d-%dmm). ', [v1, trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)])
              else
                result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seLeftFollicle1Size.Value)]);
            end;
          end;
        end
        else
          result := result + format(' (%d-%dmm). ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
      end
      else
      begin
        if cbLeftLeadFollicle.Checked then
        begin
          v1 := trunc(seLeftLeadFollicleSize.value);
          v2 := trunc(seLeftLeadFollicleSize2.Value);
          v3 := trunc(seLeftLeadFollicleSize3.value);
          if v1 > 0 then
          begin
            if v2 > 0 then
            begin
              if v3 > 0 then
              begin
                result := result + format(' (lead follicles %dmm, %d and %dmm). ', [v1, v2, v3])
              end
              else
              begin
                result := result + format(' (lead follicles %dmm and %dmm). ', [v1, v2])
              end;
            end
            else
            begin
    //          result := result + format(' (lead follicle %dmm, antral follicle %dmm). ', [v1, trunc(seRightFollicle1Size.Value)])
              result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
            end;
          end;
        end
        else
          result := result + format(' of %dmm and %dmm. ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
      end;
    end
    else
    begin
      if cbLeftLeadFollicle.Checked then
        result := result + format(' and contained a single lead follicle of %dmm. ', [trunc(seLeftLeadFollicleSize.Value)])
      else
        result := result + format(' and contained a single antral follicle of %dmm. ', [trunc(seLeftFollicle1Size.Value)]);
    end;
  end
  else
  begin
    result := result + ' and contained no follicles. ';
  end;
end
else
begin
    if not(cbRightOvaryIdentified.checked) then
    begin
      if cbRightOoporectomy.checked and  cbLeftOoporectomy.checked then
        result := result + '';
    end;
    else
    begin
      result := result + 'The left ovary was not identified';
      if cbLeftOoporectomy.checked then
         result := result + ', consistent with previous surgical removal';
       result := result + '.  ';
    end
 end;
end;

function GetIOTACystMeasure(inside) : string;
var
 vl, vw, vd, vv: TcxSpinEdit;
 IOTACystNumber : String;
begin
  result := '';
  IOTACystNumber := '';
  if inside = 'right' then
  begin
    if(cbRightOvaryCystType1.enabled)and (cbRightOvaryCystType1.selection = 12) then
       IOTACystNumber := '1';
    else if(cbRightOvaryCystType2.enabled)and (cbRightOvaryCystType2.selection = 12) then
       IOTACystNumber := '2';
    else if(cbRightOvaryCystType3.enabled)and (cbRightOvaryCystType3.selection = 12) then
       IOTACystNumber := '3';
    else if(cbRightOvaryCystType4.enabled)and (cbRightOvaryCystType4.selection = 12) then
       IOTACystNumber := '4';
    if IOTACystNumber <> '' then
    begin
      vl := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystLength' + IOTACystNumber);
      vw := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystWidth' + IOTACystNumber);
      vd := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystDepth' + IOTACystNumber);
      vv := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystVolume' + IOTACystNumber);
      result := format(' %s ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
  end;
  else if inside = 'left' then
  begin
    if(cbLeftOvaryCystType1.enabled)and (cbLeftOvaryCystType1.selection = 12) then
       IOTACystNumber := '1';
    else if(cbLeftOvaryCystType2.enabled)and (cbLeftOvaryCystType2.selection = 12) then
       IOTACystNumber := '2';
    else if(cbLeftOvaryCystType3.enabled)and (cbLeftOvaryCystType3.selection = 12) then
       IOTACystNumber := '3';
     else if(cbLeftOvaryCystType4.enabled)and (cbLeftOvaryCystType4.selection = 12) then
       IOTACystNumber := '4';
    if IOTACystNumber <> '' then
    begin
      vl := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystLength' + IOTACystNumber);
      vw := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystWidth' + IOTACystNumber);
      vd := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystDepth' + IOTACystNumber);
      vv := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystVolume' + IOTACystNumber);
      result := result + format(' %s ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
  end;
end;

function GetOvaryIOTAClassification(inSide: String) : String;
var
   vccbClassification : TcxComboBox;
begin
   result := '';
   if(inside = 'right') then
     vccbClassification := TWinControl(pgIOTA.Owner).FindComponent('ccbROClassification');
   else if(inside = 'left') then
     vccbClassification := TWinControl(pgIOTA.Owner).FindComponent('ccbLOClassification');
   if (assigned(vccbClassification)) and (vccbClassification.text <> '') then
   begin
     case  vccbClassification.ItemIndex of
       0: result := result + 'A unilocular cyst';
       1: result := result + 'A unilocular-solid cyst';
       2: result := result + 'A multilocular cyst';
       3: result := result + 'A multilocular-solid cyst';
       4: result := result + 'A solid tumour';
       5: result := result + 'An un-classifiable cyst';
     end;
     if  Trim(GetIOTACystMeasure(inside)) <> '' then
       result := result + ' measuring ' + GetIOTACystMeasure(inside)
     result := result + ' was identified in the '+ inside +' ovary. ';
   end;
end;

function GetRightOvaryIOTACystWall : String;
begin
  result := '';
  if cbROSmoothYes.checked then
    result := result + ' was smooth with neither mural irregularity nor papillary projections. ';
  else
    result := result + 'had ';  
  if (cbROPPNo.Checked)then
  begin
       if (cbROMINo.Checked) then
         result := result + 'neither mural irregularity nor papillary projections. '
       else if (cbROMIYes.checked) then
         result := result + 'mural irregularity but no pappilary projections. '
  end;
  else if (cbROPPYes.Checked)then
  begin
     if (cbROMINo.Checked) then
         result := result + 'no mural irregularity but ';
     else if (cbROMIYes.checked) then
         result := result + 'mural irregularity and '
     if ((seROPPNumber.enabled)) then
     begin
       if (seROPPNumber.value) > 1 then
          result := result +  'multiple '
       else if seROPPNumber.value = 1 then
          result := result + 'a single '

       if cbROVascularityYes.checked then
          result := result + 'vascular '
       else if cbROVascularityNo.Checked then
          result := result + 'avascular '

        if seROPPNumber.value > 1 then
          result := result + 'papillary projections '
        else
          result := result + 'papillary projection '

       if (trim(GetIntegerMeasuredString(trunc(seROPPL.value),trunc(seROPPW.value),trunc(seROPPD.Value),-1,'mm')) <> '') then
       begin
          result := result + '('
          if (seROPPNumber.value > 1) then
            result := result + 'largest '
          result := result + GetIntegerMeasuredString(trunc(seROPPL.value),trunc(seROPPW.value),trunc(seROPPD.Value),-1,'mm') +')';
       end;
    end;
  end;
  if result <> '' then
  begin
     result := 'The cyst wall ' + result;
     result := AddFullStopToEnd(result);
  end;
  If (seROThickestSeptum.value) > 0 then
    result := result + 'Maximum septal thickness measured '+ floattoStr(seROThickestSeptum.value) + 'mm. ';
end;

function GetRightOvaryIOTAInternalContents : String;
begin
result := '';
   if ccbROInternalContents.text <> '' then
   begin
       if ccbROInternalContents.ItemIndex = 4 then
       begin
          case ccbROMixed.itemIndex of
            0: result := result + 'were of mixed echogenicity. ';
            1: result := result + 'were of mixed echogenicity with a blood fluid level. ';
            2: result := result + 'were of mixed echogenicity with a fat fluid level. ';
            3: result := result + 'were of mixed echogenicity suggestive of an abscess. '
          end;  
       end;
       else
       begin
          case ccbROInternalContents.ItemIndex of
           0: result := result + 'were anechoic. ';
           1: result := result + 'were of low level echoes. ';
           2: result := result + 'were of ground glass echoes. ';
           3: result := result + 'included echoes of internal haemorrhage. '
          end;
       end;
   end;
   if result <> '' then
      result := 'The cyst contents ' + result;
end;

function GetRightOvaryIOTASolidElements :String
begin
  result := '';
  if cbROSolidElementsNo.checked then
  begin
     result := result + 'No solid elements were present.  ';
  end;
  else if cbROSolidElementsYes.checked then
  begin
       if seRoSolidElementsNumber.value > 1 then
       begin
         result := result + InItCaps(GetNumberString(seRoSolidElementsNumber.value),False) +' solid areas were present';
         if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
         begin
           result := result + ', the largest measuring ' +(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
         end;
       end;
       else
       begin
          result := result + 'A solid area';
          if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
            result :=result + ' measuring '+ trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
          result := result + ' was present. ';
       end;
  end;
  if (result <> '') then
    result := AddFullStopToEnd(result);
end;

function GetRightOvaryIOTAAscites : String;
begin
 result := '';
   if (cbROAscitesYes.checked) then
   begin
     result := result + 'Ascites was present. ';
   end
   else if(cbROAscitesNo.checked) then
   begin
     result := result + 'No ascites was present. '
   end;
end;

function GetRightOvaryIOTAAppearance: String;
begin
result := '';
 if trim(ccbROAppearance.text) <> '' then
 begin
    case ccbROAppearance.ItemIndex of
      0: Result := result + 'suggest benign pathology. ';
      1: Result := result + 'raise the possibility of malignancy. ';
      2: Result := result + 'are not clearly classifable as either benign or malignant. ';
    end;
 end;
 if result <> '' then
  result := 'The features of this cyst '+ result;
end;

function GetRightOvaryIOTAVascularity: String;
var
 vPPRI, vPPPSV ,vNoVascularity: String;
 vSepRI, vSepPSV : String;
 vSolidRI, vSolidPSV : String;
begin
 result := '';
 vPPRI := '';
 vPPPSV := '';
 vSepRI := '';
 vSepPSV := '';
 vSolidRI := '';
 vSolidPSV := '';

 if (cbROVSYes.Checked) or (cbROSeptumYes.Checked) or (cbROSolidYes.Checked) then
 begin
    // result := result + 'Doppler insonation revealed';
   if (cbROVSYes.Checked) then
   begin
     if trim(ccbROPPDoppler.text) <> '' then
     begin
       case ccbROPPDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the papillary projection';
      if (seROPPRI.enabled) and (seROPPRI.value > 0) then
     begin
       vPPRI := vPPRI + 'RI = ' + floatToStr(seROPPRI.value);
     end;
     if (seROPPPSV.enabled) and (seROPPPSV.value > 0) then
     begin
       vPPPSV := vPPPSV + 'PSV ' + floatToStr(seROPPPSV.value) + 'cm/s';
     end;
     if (vPPRI <> '') and (vPPPSV <> '') then
      result := result + ' ('+ vPPRI + ', '+ vPPPSV + ')'
     else if (vPPRI <> '') or (vPPPSV <> '') then
      result := result + ' (' + vPPRI + vPPPSV + ')'
    end;
  if cbROSeptumYes.Checked then
  begin
     if result <> '' then
       result := result +', ';
     if trim(ccbROSepDoppler.text) <> '' then
     begin
       case ccbROSepDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
     if  result <> '' then
        result := result + ' within the septum';
     if (seROSepRI.enabled) and (seROSepRI.value > 0) then
     begin
       vSepRI := vSepRI + 'RI = ' + floatToStr(seROSepRI.value);
     end;
     if (seROSepPSV.enabled) and (seROSepPSV.value > 0) then
     begin
       vSepPSV := vSepPSV + 'PSV ' + floatToStr(seROSepPSV.value) + 'cm/s';
     end;
     if (vSepRI <> '') and (vSepPSV <> '') then
      result := result + ' ('+ vSepRI + ', '+ vSepPSV + ')'
     else if (vSepRI <> '') or (vSepPSV <> '') then
      result := result + ' (' + vSepRI + vSepPSV + ')'
    end;
  if cbROSolidYes.Checked then
  begin
     if result <> '' then
         result := result +', ';
     if trim(ccbROSolidDoppler.text) <> '' then
     begin
       case ccbROSolidDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the solid area';
      if (seROSolidRI.enabled) and (seROSolidRI.value > 0) then
     begin
       vSolidRI := vSolidRI + 'RI = ' + floatToStr(seROSolidRI.value);
     end;
     if (seROSolidPSV.enabled) and (seROSolidPSV.value > 0) then
     begin
       vSolidPSV := vSolidPSV + 'PSV ' + floatToStr(seROSolidPSV.value) + 'cm/s';
     end;
     if (vSolidRI <> '') and (vSolidPSV <> '') then
      result := result + ' ('+ vSolidRI + ', '+ vSolidPSV + ')'
     else if (vSolidRI <> '') or (vSolidPSV <> '') then
      result := result + ' (' + vSolidRI + vSolidPSV + ')'
   end;
   if result <> '' then
      result := 'Doppler insonation revealed ' + AddFullstop(result);
 end;
 if (cbROVSNo.checked) or (cbROSeptumNo.checked) or (cbROSolidNo.checked) then
 begin
 vNoVascularity := '';
      if (cbROVSNo.checked) then
      begin
        if (cbROSeptumNo.checked) then
           if (cbROSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'papillary projection, septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'papillary projection or septum.'
         else
            vNoVascularity :=  vNoVascularity + 'papillary projection.'
      end
      else  if (cbROSeptumNo.checked) then
      begin
           if (cbROSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'septum.'
      end
      else if (cbROSolidNo.checked) then
          vNoVascularity := vNoVascularity + 'solid area.';
     if vNoVascularity <> '' then
     result := result + 'No increase in vascularity was seen in the ' +  vNoVascularity;
   end;
end;

function GetLeftOvaryIOTACystWall: String;
begin
  result := '';
  if cbLOSmoothYes.checked then
     result := result + ' was smooth with neither mural irregularity nor papillary projections. ';
  else
    result := result + 'had ';
  if (cbLOPPNo.Checked)then
  begin
       if (cbLOMINo.Checked) then
         result := result + 'neither mural irregularity nor papillary projections. '
       else if (cbLOMIYes.checked) then
         result := result + 'mural irregularity but no pappilary projections. '
  end;
  else if (cbLOPPYes.Checked)then
  begin
     if (cbLOMINo.Checked) then
         result := result + 'no mural irregularity but ';
     else if (cbLOMIYes.checked) then
         result := result + 'mural irregularity and '
     if ((seLOPPNumber.enabled)) then
     begin
       if (seLOPPNumber.value) > 1 then
          result := result +  'multiple '
       else if seLOPPNumber.value = 1 then
          result := result + 'a single '

       if cbLOVascularityYes.checked then
          result := result + 'vascular '
       else if cbLOVascularityNo.Checked then
          result := result + 'avascular '

        if seLOPPNumber.value > 1 then
          result := result + 'papillary projections '
        else
          result := result + 'papillary projection '

       if (trim(GetIntegerMeasuredString(trunc(seLOPPL.value),trunc(seLOPPW.value),trunc(seLOPPD.Value),-1,'mm')) <> '') then
       begin
           result := result + '(' ;
           if (seLOPPNumber.value > 1) then
              result := result + 'largest ';
           result := result + GetIntegerMeasuredString(trunc(seLOPPL.value),trunc(seLOPPW.value),trunc(seLOPPD.Value),-1,'mm') +')';
       end;
    end;
  end;
  if result <> '' then
     result := 'The cyst wall ' + result;
  result := AddFullStopToEnd(result);   
end;

function GetLeftOvaryIOTAInternalContents : String;
begin
result := '';
   if ccbLOInternalContents.text <> '' then
   begin
       if ccbLOInternalContents.ItemIndex = 4 then
       begin
          case ccbLOMixed.itemIndex of
            0: result := result + 'were of mixed echogenicity. ';
            1: result := result + 'were of mixed echogenicity with a blood fluid level. ';
            2: result := result + 'were of mixed echogenicity with a fat fluid level. ';
            3: result := result + 'were of mixed echogenicity suggestive of an abscess. '
          end;  
       end;
       else
       begin
          case ccbLOInternalContents.ItemIndex of
           0: result := result + 'were anechoic. ';
           1: result := result + 'were of low level echoes. ';
           2: result := result + 'were of ground glass echoes. ';
           3: result := result + 'included echoes of internal haemorrhage. '
          end;
       end;
   end;
   if result <> '' then
      result := 'The cyst contents ' + result;
end;

function GetLeftOvaryIOTASolidElements :String
begin
  result := '';
  if cbLOSolidElementsNo.checked then
  begin
     result := result + 'No solid elements were present.  ';
  end;
  else if cbLOSolidElementsYes.checked then
  begin
       if seRoSolidElementsNumber.value > 1 then
       begin
         result := result + InItCaps(GetNumberString(seRoSolidElementsNumber.value),False) +' solid areas were present';
         if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
         begin
           result := result + ', the largest measuring ' +(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
         end;
       end;
       else
       begin
          result := result + 'A solid area';
          if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
            result :=result + ' measuring '+ trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
          result := result + ' was present. ';
       end;
  end;
  if result <> '' then
     result := AddFullStopToEnd(result);
end;

function GetLeftOvaryIOTAAscites: String;
begin
 result := '';
   if (cbLOAscitesYes.checked) then
   begin
     result := result + 'Ascites was present. ';
   end
   else if(cbLOAscitesNo.checked) then
   begin
     result := result + 'No ascites was present. '
   end;
end;

function GetLeftOvaryIOTAAppearance : String;
begin
result := '';
 if trim(ccbLOAppearance.text) <> '' then
 begin
    case ccbLOAppearance.ItemIndex of
      0: Result := result + 'suggest benign pathology. ';
      1: Result := result + 'raise the possibility of malignancy. ';
      2: Result := result + 'are not clearly classifable as either benign or malignant. ';
    end;
 end;
 if result <> '' then
  result := 'The features of this cyst '+ result;
end;

function GetLeftOvaryIOTAVascularity: String;
var
 vPPRI, vPPPSV ,vNoVascularity: String;
 vSepRI, vSepPSV : String;
 vSolidRI, vSolidPSV : String;
begin
 result := '';
 vPPRI := '';
 vPPPSV := '';
 vSepRI := '';
 vSepPSV := '';
 vSolidRI := '';
 vSolidPSV := '';

 if (cbLOVSYes.Checked) or (cbLOSeptumYes.Checked) or (cbLOSolidYes.Checked) then
 begin
    // result := result + 'Doppler insonation revealed';
   if (cbLOVSYes.Checked) then
   begin
     if trim(ccbLOPPDoppler.text) <> '' then
     begin
       case ccbLOPPDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the papillary projection';
      if (seLOPPRI.enabled) and (seLOPPRI.value > 0) then
     begin
       vPPRI := vPPRI + 'RI = ' + floatToStr(seLOPPRI.value);
     end;
     if (seLOPPPSV.enabled) and (seLOPPPSV.value > 0) then
     begin
       vPPPSV := vPPPSV + 'PSV ' + floatToStr(seLOPPPSV.value) + 'cm/s';
     end;
     if (vPPRI <> '') and (vPPPSV <> '') then
      result := result + ' ('+ vPPRI + ', '+ vPPPSV + ')'
     else if (vPPRI <> '') or (vPPPSV <> '') then
      result := result + ' (' + vPPRI + vPPPSV + ')'
    end;
  if cbLOSeptumYes.Checked then
  begin
     if result <> '' then
       result := result +', ';
     if trim(ccbLOSepDoppler.text) <> '' then
     begin
       case ccbLOSepDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
     if  result <> '' then
        result := result + ' within the septum';
     if (seLOSepRI.enabled) and (seLOSepRI.value > 0) then
     begin
       vSepRI := vSepRI + 'RI = ' + floatToStr(seLOSepRI.value);
     end;
     if (seLOSepPSV.enabled) and (seLOSepPSV.value > 0) then
     begin
       vSepPSV := vSepPSV + 'PSV ' + floatToStr(seLOSepPSV.value) + 'cm/s';
     end;
     if (vSepRI <> '') and (vSepPSV <> '') then
      result := result + ' ('+ vSepRI + ', '+ vSepPSV + ')'
     else if (vSepRI <> '') or (vSepPSV <> '') then
      result := result + ' (' + vSepRI + vSepPSV + ')'
    end;
  if cbLOSolidYes.Checked then
  begin
     if result <> '' then
         result := result +', ';
     if trim(ccbLOSolidDoppler.text) <> '' then
     begin
       case ccbLOSolidDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the solid area';
      if (seLOSolidRI.enabled) and (seLOSolidRI.value > 0) then
     begin
       vSolidRI := vSolidRI + 'RI = ' + floatToStr(seLOSolidRI.value);
     end;
     if (seLOSolidPSV.enabled) and (seLOSolidPSV.value > 0) then
     begin
       vSolidPSV := vSolidPSV + 'PSV ' + floatToStr(seLOSolidPSV.value) + 'cm/s';
     end;
     if (vSolidRI <> '') and (vSolidPSV <> '') then
      result := result + ' ('+ vSolidRI + ', '+ vSolidPSV + ')'
     else if (vSolidRI <> '') or (vSolidPSV <> '') then
      result := result + ' (' + vSolidRI + vSolidPSV + ')'
   end;
   if result <> '' then
      result := 'Doppler insonation revealed ' + AddFullstop(result);
 end;
 if (cbLOVSNo.checked) or (cbLOSeptumNo.checked) or (cbLOSolidNo.checked) then
 begin
 vNoVascularity := '';
      if (cbLOVSNo.checked) then
      begin
        if (cbLOSeptumNo.checked) then
           if (cbLOSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'papillary projection, septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'papillary projection or septum.'
         else
            vNoVascularity :=  vNoVascularity + 'papillary projection.'
      end
      else  if (cbLOSeptumNo.checked) then
      begin
           if (cbLOSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'septum.'
      end
      else if (cbLOSolidNo.checked) then
          vNoVascularity := vNoVascularity + 'solid area.';
     if vNoVascularity <> '' then
     result := result + 'No increase in vascularity was seen in the ' +  vNoVascularity;
   end;
end;

function IsAdnexalNormal: Boolean;
begin
  result := not (((cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0)) or ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)));
end;

function GetPluralCystName(inName: String): String;
begin
  result := inName;
  if Trim(UpperCase(inName)) = 'HYDROSALPINX' then result := 'hydrosalpinges';
  else
  if Trim(UpperCase(inName)) = 'FIMBRIAL CYST' then result := 'fimbrial cysts';
  else
  if Trim(UpperCase(inName)) = 'SOLID MASS' then result := 'solid masses';
  else
  if Trim(UpperCase(inName)) = 'PELVIC MASS' then result := 'pelvic masses';
end;

function GetAdnexalConc: string;
var
  i, vIdx, vRightIdx, vLeftIdx: Integer;
  vRight, vLeft, vBi, vt: string;
  vControl: TcxComboBox;
  vRightList, vLeftList, vBiList: TStringList;
  vPos: integer;
begin
  result := '';
  if (IsAdnexalNormal) and ((seRightOvarianCystsCount.Value + seLeftOvarianCystsCount.Value + seRightAdnexalMasses.Value + seLeftAdnexalMasses.Value) = 0) {and (not cbEFFNormal.Checked)} then
    result := '';//'Normal adnexa. ';
  begin
    vRightIdx := 0;
    vLeftIdx := 0;
    vRight := ''; vBi := '';
    vRightList := TStringList.Create;
    vLeftList := TStringList.Create;
    vBiList := TStringList.Create;
    if cbRightAdnexalMass.Checked then
    begin
      for i := 0 to seRightAdnexalMasses.Value - 1 do
      begin
        vControl := TWinControl(tsPelvis.Owner.FindComponent('cbRightAdnexalAppearance' + IntToStr(i + 1)));
        if (assigned(vControl)) {and (TcxComboBox(vControl).Text <> '')} then
        begin
          if (GLocConclusion = '') or (TcxComboBox(vControl).ItemIndex <> 3) then
          begin
            vIdx := vRightList.IndexOf(Trim(TcxComboBox(vControl).Text));
            if vIdx < 0 then
            begin
              if (Trim(TcxComboBox(vControl).Text) <> '') and (trim(uppercase(TcxComboBox(vControl).Text)) <> 'OTHER') then
              begin
                vRightList.Add(Trim(TcxComboBox(vControl).Text))
              end;
              else
              begin
                if vRightList.IndexOf('pelvic mass') < 0 then
                   vRightList.Add('pelvic mass');
              end;
            end
            else
            begin
              vRightIdx := vRightIdx or (1 shl vIdx);
            end;
          end;
        end;
      end;
    end;
    vLeft := '';
    vLeftList := TStringList.Create;
    if cbLeftAdnexalMass.Checked then
    begin
      for i := 0 to seLeftAdnexalMasses.Value - 1 do
      begin
        vControl := TWinControl(tsPelvis.Owner.FindComponent('cbLeftAdnexalAppearance' + IntToStr(i + 1)));
        if (assigned(vControl)) {and (TcxComboBox(vControl).Text <> '')} then
        begin
          if (GLocConclusion = '') or (TcxComboBox(vControl).ItemIndex <> 3) then
          begin
            vIdx := vLeftList.IndexOf(Trim(TcxComboBox(vControl).Text));
            if vIdx < 0 then
            begin
              if (Trim(TcxComboBox(vControl).Text) <> '') and (trim(uppercase(TcxComboBox(vControl).Text)) <> 'OTHER') then
                vLeftList.Add(Trim(TcxComboBox(vControl).Text))
              else
              begin
               if vLeftList.IndexOf('pelvic mass') < 0 then
                 vLeftList.Add('pelvic mass');
              end;
            end
            else
            begin
              vLeftIdx := vLeftIdx or (1 shl vIdx);
            end
          end;
        end;
      end;
    end;
    if vRightList.Count > 0 then
    begin
      for i := vRightList.Count-1 downto 0 do
      begin
        vIdx := vLeftList.IndexOf(vRightList[i]);
        if vIdx > -1 then
        begin
          if (GLocConclusion = '') or (pos('LOCU', upperCase(vRightList[i])) = 0) then
            vBiList.Add(vRightList[i]);
          vLeftList.Delete(vIdx);
          vRightList.Delete(i);
        end;
      end;
    end;
    if vRightList.Count > 0 then
    begin
      for i := 0 to vRightList.Count-1 do
      begin
        if ((i = 1) and (vRightList.Count = 2)) then
          vRight := vRight + ' and '
        else
        if ((i = 1) and (vRightList.Count = 3)) then
          vRight := vRight + ', '
        else
        if i = 2 then
          vRight := vRight + ' and ';
        if ((vRightIdx and (i+1)) = (i+1)) then
        begin
          vRight := vRight + GetPluralCystName(vRightList[i]);
          if vRightList[i] = 'solid' then
            vRight := vRight + ' masses' ;
        end
        else
        begin
          vRight := vRight + vRightList[i];
          if vRightList[i] = 'solid' then
            vRight := vRight + ' mass' ;
        end;
      end;
    end;
    if vLeftList.Count > 0 then
    begin
      for i := 0 to vLeftList.Count-1 do
      begin
        if ((i = 1) and (vLeftList.Count = 2)) then
          vLeft := vLeft + ' and '
        else
        if ((i = 1) and (vLeftList.Count = 3)) then
          vLeft := vLeft + ', '
        else
        if i = 2 then
          vleft := vLeft + ' and ';
        if ((vRightIdx and (i+1)) = (i+1)) then
        begin
          vLeft := vLeft + GetPluralCystName(vLeftList[i]);
          if vLeftList[i] = 'solid' then
            vLeft := vLeft + ' masses' ;
        end
        else
        begin
          vLeft := vLeft + vLeftList[i];
          if vLeftList[i] = 'solid' then
            vleft := vLeft + ' mass';
        end;
      end;
    end;
    if vBiList.Count > 0 then
    begin
      for i := 0 to vBiList.Count-1 do
      begin
        if ((i = 1) and (vBiList.Count = 2)) then
          vBi := vBi + ' and '
        else
        if ((i = 1) and (vBiList.Count = 3)) then
          vBi := vBi + ', '
        else
        if i = 2 then
          vBi := vBi + ' and ';
        vBi := vBi + GetPluralCystName(vBiList[i]);
        if vBiList[i] = 'solid' then
          vBi := vBi + ' masses';
      end;
    end;
    if vRight <> '' then
    begin
      if vLeft <> '' then
      begin
        if vBi <> '' then
        begin
          result := 'Right ' + vRight + ', left ' + vLeft + ', and bilateral ' + vBi + ' identified. ';
        end
        else
          result := 'Right ' + vRight + ' and left ' + vLeft + ' identified. ';
      end
      else
      if vBi <> '' then
      begin
        result := 'Right ' + vRight + ', and bilateral ' + vBi + ' identified. ';
      end
      else
        result := 'Right ' + vRight +  ' identified. ';
    end
    else
    begin
      if vLeft <> '' then
      begin
        if vBi <> '' then
        begin
          result := 'Left ' + vLeft + ', and bilateral ' + vBi + ' identified. ';
        end
        else
          result := 'Left ' + vLeft + ' identified. ';
      end
      else
      if vBi <> '' then
      begin
        result := 'Bilateral ' + vBi + ' identified. ';
      end
    end;                                                       
 //   showMessage(result);
    vPos := pos('left loculated fluid identified', result);
    if vPos > 0 then
    begin
      if trim(copy(result, vPos + 21, length(result))) = 'identified.' then
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid was identified in the left adnexal region. '; // + copy(result, vPos + 21, length(result));  
      else
        result := copy(result, 1, vPos-1) + 'an area of loculated fluid in the left adnexal region' + copy(result, vPos + 31, length(result));
    end;
    vPos := pos('Right loculated fluid', result);          
    if vPos > 0 then
    begin        
      if trim(copy(result, vPos + 21, length(result))) = 'identified.' then
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid was identified in the right adnexal region. '; // + copy(result, vPos + 21, length(result));
      else 
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid in the right adnexal region' + copy(result, vPos + 21, length(result));
    end;
    vPos := pos('Left loculated fluid', result);
    if vPos > 0 then                                                                                       
    begin
      if trim(copy(result, vPos + 21, length(result))) = 'identified.' then
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid was identified in the left adnexal region. '; // + copy(result, vPos + 21, length(result));   
      else
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid in the left adnexal region' + copy(result, vPos + 20, length(result));
    end;
    vPos := pos('and loculated fluid', result);
    if vPos > 0 then
    begin
      result := copy(result, 1, vPos-1) + 'an area of loculated fluid' + copy(result, vPos + 19, length(result));
    end;
    if result = 'Left loculated fluid identified.' then result := 'Area of loculated fluid in ppppthe left adnexal region.';
    if result = 'Right loculated fluid identified.' then result := 'Area of loculated fluid in ppppthe right adnexal region.';
    if GLocConclusion <> '' then
      result := result + GLocConclusion;
    //result := result + GetIUCDPlacement(true);
    vRightList.Free;
    vLeftList.Free;                               
    vBiList.Free;
  end;
end;

function GetAdnexalCystString(inIndex: Integer): string;
begin
  result := '';
  if inIndex = 1 then
    result := 'A simple cyst measuring %s was %svisualised in the %s adnexal region, the features consistent with a fimbrial cyst. '
  else if inIndex = 2 then
    result := 'A cystic tubular lesion measuring %s was %spresent in the %s adnexal region, the appearance consistent with a hydrosalpinx. '
  else if inIndex = 3 then
    result := 'An area of loculated fluid measuring %s was %sseen in the %s adnexal region. '
  else if inIndex = 4 then
    result := 'A solid lesion measuring %s was %sseen in the %s adnexal region. '
  else
    result := 'A mass of mixed echogenicity measuring %s was %sseen in the %s adnexal region. '
end;

function GetDualAdnexalCystString(inIndex: Integer): string;
begin
  result := '';
  if inIndex = 1 then
    result := '%s simple cysts measuring %s%s and %s were %svisualised in the %s adnexal region, the features consistent with fimbrial cysts. '
  else if inIndex = 2 then
    result := '%s cystic tubular lesions measuring %s%s and %s were %spresent in the %s adnexal region, the appearance consistent with hydrosalpinx. '
  else if inIndex = 3 then
    result := '%s areas of loculated fluid measuring %s%s and %s were %sseen in the %s adnexal region. '
  else if inIndex = 4 then
    result := '%s solid lesions measuring %s%s and %s were %sseen in the %s adnexal region. '
  else
    result := '%s masses of mixed echogenicity measuring %s%s and %s were %sseen in the %s adnexal region. '
end;

function GetSingularAdnexalCystsStr(inApp: TcxComboBox; inLength, inWidth, inDepth: Integer; inVolume: Real; inAlso: String; inSide: String): String;
var
  v1, v2, v3, v4: TcxSpinEdit;
begin
  if (inSide = 'right') or (inApp.ItemIndex <> 3) or (GLocConclusion = '') then
  begin
    result := Format(GetAdnexalCystString(inApp.ItemIndex), [GetIntegerMeasuredString(inLength, inWidth, inDepth, inVolume, 'mm'), inAlso, inSide]);
    if inside = 'right' then
    begin
      if (inApp.ItemIndex = 3) and ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)) then
      begin
        for i := 1 to seLeftAdnexalMasses.Value do
        begin
          vControl := TcxComboBox(tsPelvis.Owner).FindComponent('cbLeftAdnexalAppearance' + intToStr(i));
          if (assigned(vControl)) and (vControl.ItemIndex = 3) then
          begin
            v1 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalLength' + intToStr(i));
            v2 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalWidth' + intToStr(i));
            v3 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalDepth' + intToStr(i));
            v4 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalVolume' + intToStr(i));
            GLeftLoc :=  Format('Loculated fluid measuring %s was also present in the left adnexal region. ', [GetIntegerMeasuredString(trunc(v1.Value), trunc(v2.Value), trunc(v3.Value), v4.Value, 'mm')]);
            GLocConclusion := 'Loculated fluid was present in both adnexal regions. ';
            break;
          end;
        end;
      end;
    end;
  end
  else
  begin
    if (GLocConclusion <> '') and (inApp.ItemIndex = 3) and (inSide = 'left') then
      result := GLeftLoc
    else
      result := '';
  end;
end;

function GetAdnexalDesc: string;
var
  vRightLoc, vLeftLoc: Boolean;
  i: Integer;
  vControl: TcxComboBox;
begin
  result := '';
  GLocConclusion := '';
  GLeftLoc := '';
  vRightLoc := False;
  vLeftLoc := False;
  if ((cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0)) or ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)) then
  begin
    if (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0) then
    begin
      if seRightAdnexalMasses.Value = 1 then
      begin
        result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
      end
      else
      if seRightAdnexalMasses.Value = 2 then
      begin
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'), '', 'right']);
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance2, trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'also ', 'right');
        end;
      end
      else
      if seRightAdnexalMasses.Value = 3 then
      begin
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance2.ItemIndex) and (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Three',
                          GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'),
                   ', ' + GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'),
                          GetIntegerMeasuredString(trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'mm'), '', 'right']);
        end
        else
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'), '', 'right']);
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance3, trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'also ', 'right');
        end
        else
        if (cbRightAdnexalAppearance2.ItemIndex = cbRightAdnexalAppearance3.ItemIndex) then
        begin
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance3.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'mm'), 'also ', 'right']);
        end
        else
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'mm'), 'also ', 'right']);
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance2, trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'also ', 'right');
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance2, trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'also ', 'right');
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance3, trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'also ', 'right');
        end;
      end;
    end;
    if (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0) then
    begin
      if (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0) then
        result := result + #13#10  + #13#10;
      if seLeftAdnexalMasses.Value = 1 then
      begin
        result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
      end
      else
      if seLeftAdnexalMasses.Value = 2 then
      begin
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'), '', 'left']);
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance2, trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'also ', 'left');
        end;
      end
      else
      if seLeftAdnexalMasses.Value = 3 then
      begin
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance2.ItemIndex) and (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Three',
                          GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'),
                   ', ' + GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'),
                          GetIntegerMeasuredString(trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'mm'), '', 'left']);
        end
        else
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'), '', 'left']);
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance3, trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'also ', 'left');
        end
        else
        if (cbLeftAdnexalAppearance2.ItemIndex = cbLeftAdnexalAppearance3.ItemIndex) then
        begin
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance3.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'mm'), 'also ', 'left']);
        end
        else
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'mm'), 'also ', 'left']);
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance2, trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'also ', 'left');
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance2, trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'also ', 'left');
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance3, trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'also ', 'left');
        end;
      end;
    end;
  end;
end;

function GetUterusConclusion: string;
var
  vIsDistorted: Boolean;
  vTemp: integer;
  vLargest: Integer;
  vSmallest: Integer;
  i: integer;
begin
  result := '';
  if cbHysterectomy.Checked then
  begin
    result := 'Absent uterus, consistent with previous hysterectomy. ';
  end
  else
  begin
    if trim(cbUterus.Text) <> '' then
    begin
      if seUterusCC.Value < 30 then
        result := 'Small'
      else if seUterusCC.Value < 101 then
        result := 'Normal size'
      else if seUterusCC.Value <= 200 then
        result := 'Mildly enlarged'
      else
        result := 'Enlarged ';
      if lowercase(trim(cbUterineShape.text)) = 'normal' then
       begin
         if (seUterusCC.Value >=30) and (seUterusCC.Value < 101) then
           result := 'Normal size and shape';
         else
           result := result + ', normal shape';
       end  
      result := result +' '+ trim(cbUterus.Text) + ' ';
      if lowercase(trim(cbUterineShape.text)) = 'bicornuate' then
        result := result + 'bicornuate ';
      if pos('arcuate',lowercase(trim(cbUterineShape.text))) > 0  then
        result := result + 'arcuate ';
      if lowercase(trim(cbUterineShape.text)) = 'left unicornuate' then
        result := result + 'unicornuate ';
      if lowercase(trim(cbUterineShape.text)) = 'right unicornuate' then
        result := result + 'unicornuate ';
      if lowercase(trim(cbUterineShape.text)) = 'septate partial' then
        result := result + 'partial septate ';
      if lowercase(trim(cbUterineShape.text)) = 'septate complete' then
        result := result + 'complete septate ';
    end
    else
    begin
      if seUterusCC.Value < 101 then
        result := result + 'Normal size '
      else if seUterusCC.Value <= 200 then
        result := result + 'Mildly enlarged '
      else
        result := result + 'Enlarged ';
    end;

    result := result + 'uterus';
    if cbAdenomyosisPresent.Checked then
      result := result + ' with features of adenomyosis';
    result := result + GetFibroidConcl;
    result := result + '. ';
  end;
end;

function GetPolpConc: string;
begin
  result := '';
  if not cbHysterectomy.Checked then
  begin
    if sePolypCount.value > 0 then
    begin
     if not((cbSalinehysterograph.ItemIndex = 2) or (cbSalinehysterograph.itemindex = 3)) then
     begin
      if sePolypCount.value = 2 then
         result := ' Two endometrial polyps identified. '
      else
         result := ' Endometrial polyp identified. '
     end;
    end;
  end;
end;

function GetCervicalPolypConc: string;
begin
  result := '';
    if cbCervicalPolyp.checked then
    begin
      result := ' Cervical polyp identified. '
    end;
end;

function GetIncVasAndVenBlind: string;
begin
  result := '';
  if cbMyometrialCystsPresent.checked then
    result := result + ' and myometrial cysts';
  if cbIncVasPresent.Checked then
    result := result + ' with associated increased vascularity';
  if cbVBShadowingPresent.checked then
  begin
    if result <> '' then
      result := result + ' and '
    else
      result := result + ' with ';
    result := result + '''Venetian blind'' posterior acoustic shadowing';
  end;
end;

function GetEndometriumConc: string;
begin
  if not cbHysterectomy.Checked then
  begin
    if trim(cbEndometrium.Text) <> '' then
      if (seEdometriumThickness.Value < 4) and (pos('non specific', LowerCase(Trim((cbEndometrium.Text)))) > 0) then
        result := 'Thin non-specific type endometrium. '
      else if ( cbEndometrium.ItemIndex = 8 ) then
        result := 'Normal postmenopausal endometrium.  ';
      else
        result := Trim(InitCaps(cbEndometrium.Text, False)) + ' endometrium. '
    else
      result := '';
  end
  else
    result := '';
  if GetIUCDPlacement(true) <> '' then
    result := result + GetIUCDPlacement(true);
end;

function getFollicleString : String
begin
  result := '';
      if (cbRightPCO.Checked) and (cbLeftPCO.Checked) then
      begin
        result := result + 'Both ovaries are multifollicular (>24 antral follicles, Martins et al, UOG 2014). This indicates an increased risk of hyperandrogenic anovulation.'
      end;
      if (cbRightAFO.Checked) and (cbLeftAFO.Checked) then
      begin
        result := result + 'Both ovaries have normal antral follicular count (4-24 follicles, Martins et al, UOG 2014).  ';
      end;
      if (cbRightOFO.Checked) and (cbLeftOFO.Checked) then
      begin
        result := result + 'Both ovaries are oligofollicular (1-3 follicles, Martins et al, UOG 2014).  ';
      end;
      if (seLeftFolCount.value = 0) and (seRightFolCount.value = 0) then
      begin
         if (((seRightLeadFollicle.Value) > 0) or (cbRightCorpusLuteum.Checked)) then
         begin
          if (((seLeftLeadFollicle.Value) > 0) or (cbLeftCorpusLuteum.Checked)) then
          begin
            result := result + 'No antral follicles in either ovary.  ';
          end;
         end;
      end;
      if not(pos('Both',result) > 0)then
      begin
         if(cbRightPCO.Checked) then
           result := result + 'The right ovary is multifollicular (>24 antral follicles).  ';//  This may be associated with an increased risk of hyperandrogenic anovulation.  ';
         else if (cbRightOFO.Checked) then
            result := result + 'The right ovary is oligofollicular (1-3 antral follicles).  ';
         else if (cbRightAFO.Checked) then
            result := result +  'The right ovary has normal antral follicular count (4-24 follicles, Martins et al, UOG 2014).  ' ;
         else
         begin
            if not(pos('either',result) > 0)then
            begin
            if (((seRightLeadFollicle.Value) > 0) or (cbRightCorpusLuteum.Checked)) then
              result := result +'No antral follicles in right ovary.  ';
            end;
        end;
      end;
      if not(pos('Both',result) > 0)then
      begin
         if(cbLeftPCO.Checked) then
           result := result + 'The left ovary is multifollicular (>24 antral follicles).  ';//This may be associated with an increased risk of hyperandrogenic anovulation.  ';
         else if (cbLeftOFO.Checked) then
            result := result + 'The left ovary is oligofollicular (1-3 antral follicles).  ';
         else if (cbLeftAFO.Checked) then
            result := result +  'The left ovary has normal antral follicular count (4-24 follicles, Martins et al, UOG 2014).  ' ;
         else
         begin
            if not(pos('either',result) > 0)then
            begin
              if (((seLeftLeadFollicle.Value) > 0) or (cbLeftCorpusLuteum.Checked)) then
                result := result + 'No antral follicles in left ovary.  ';
            end;
         end;
      end;
end;

function GetProcedureConc: string;
begin
  result := '';
  if cbSalinePerformed.Checked then
  begin
    if cbSalinehysterograph.ItemIndex = 1 then
      result := 'Saline hysterography confirmed the presence of a normal endometrial cavity. '
    else if cbSalinehysterograph.ItemIndex = 2 then
      result := 'Saline hysterography confirmed the presence of an endometrial polyp. '
   else if cbSalinehysterograph.ItemIndex = 3 then
      result := 'Saline hysterography confirmed the presence of two endometrial polyps. ';
    else if cbSalinehysterograph.ItemIndex = 4 then
      result := 'Saline hysterography confirmed the presence of a submucosal fibroid. ';

  end;
  if cbTubalPerformed.Checked then
  begin
    if cbTubalPatencyTestSaline.ItemIndex = 1 then
      result := result + 'Bilateral tubal patency was demonstrated. '
    else if cbTubalPatencyTestSaline.ItemIndex = 2 then
      result := result + 'Patency of the right fallopian tube was demonstrated. '
    else if cbTubalPatencyTestSaline.ItemIndex = 3 then
      result := result + 'Patency of the left fallopian tube was demonstrated. '
    else if cbTubalPatencyTestSaline.ItemIndex = 4 then
      result := result + 'Evaluation of tubal patency could not be performed due to unsuccessful cannulation of the cervical canal. '
    else if cbTubalPatencyTestSaline.ItemIndex = 5 then
      result := result + 'Patency of neither fallopian tube was demonstrated, suggestive of bilateral tubal spasm or blockage. ';
  end;
  if cbTubalLevovistPerformed.Checked then
  begin
    if cbTubalPatencyTestLevovist.ItemIndex = 1 then
      result := result + 'Bilateral tubal patency was demonstrated. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 2 then
      result := result + 'Patency of the right fallopian tube was demonstrated. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 3 then
      result := result + 'Patency of the left fallopian tube was demonstrated. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 4 then
      result := result + 'Evaluation of tubal patency could not be performed due to unsuccessful cannulation of the cervical canal. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 5 then
      result := result + 'Patency of neither fallopian tube was demonstrated, suggestive of bilateral tubal spasm or blockage. ';
  end;
  if cbRightCystAspirationPerf.Checked then
    result := result + Format('%1.1f ml drained from right ovarian cyst. ', [seRightOvarianCystAspiration.Value]);
  if cbLeftCystAspirationPerf.Checked then
    result := result + Format('%1.1f ml drained from left ovarian cyst. ', [seLeftOvarianCystAspiration.Value]);
  if cbAscitesPerformed.Checked then
    result := result + Format('%1.1f ml ascitic fluid drained. ', [seAscitesDrainage.Value]);
end;

function  GetIOTAConc : string;
var
vTempstr; vLeftIOTAStr : String;
begin
  result := '';
  vTempStr := '';
  if cbROVSYes.checked then
    result := result + 'Vascular ';
  else if cbROVSNo.Checked then
    result := result + 'Avascular ';
  vTempStr := GetOvaryIOTAClassification('right');
  if (vTempStr <> '') then
  begin
    if result <> '' then
    begin
      vTempStr := stringReplace(vTempStr, 'A ', '');
    end;
      result := result + vTempStr;
  end;
  if result <> '' then
    if GetOvaryIOTAClassification('right') = '' then
      result := result + 'identified in the right ovary. '
  if ccbROAppearance.text <> '' then
  begin
    result := result + ' The features of this cyst '
    case ccbROAppearance.itemIndex of
      0: result := result + 'suggest benign aetiology. '
      1: result := result + 'raise the possibility of malignancy. '
      2: result := result + 'are not clearly classifiable as either benign or malignant. '
    end;
  end;
  //left IOTA conclusion
  vtempStr := '';
  vLeftIOTAStr := '';
  if cbLOVSYes.checked then
    vLeftIOTAStr := vLeftIOTAStr + 'Vascular ';
  else if cbLOVSNo.Checked then
    vLeftIOTAStr := vLeftIOTAStr + 'Avascular ';
  vTempStr := GetOvaryIOTAClassification('left');
  if (vTempStr <> '') then
  begin
    if vLeftIOTAStr <> '' then
    begin
      vTempStr := stringReplace(vTempStr, 'A ', '');
    end;
      vLeftIOTAStr := vLeftIOTAStr + vTempStr;
  end;
  if vLeftIOTAStr <> '' then
    if GetOvaryIOTAClassification('left') = '' then
      vLeftIOTAStr := vLeftIOTAStr + 'identified in the left ovary. '
  if ccbLOAppearance.text <> '' then
  begin
    vLeftIOTAStr := vLeftIOTAStr + ' The features of this cyst '
    case ccbLOAppearance.itemIndex of
      0: vLeftIOTAStr := vLeftIOTAStr + 'suggest benign aetiology. '
      1: vLeftIOTAStr := vLeftIOTAStr + 'raise the possibility of malignancy. '
      2: vLeftIOTAStr := vLeftIOTAStr + 'are not clearly classifiable as either benign or malignant. '
    end;
  end;
  if vLeftIOTAStr <> '' then
  begin
    result := result + vLeftIOTAStr;
  end;

end;

function GetOvaryOverview: string;
begin
  result := '';
  if cbRightOvaryIdentified.Checked then
  begin
    if cbLeftOvaryIdentified.Checked then
    begin
      if cbRightOvaryNormal.Checked then
      begin
        if cbLeftOvaryNormal.Checked then
          result := 'Both ovaries were visualised and appeared normal. '
        else
          result := 'Both ovaries were visualised. The right ovary was normal. ';
      end
      else
      begin
        if cbLeftOvaryNormal.Checked then
          result := 'Both ovaries were visualised. The left ovary was normal. '
        else
          result := 'Both ovaries were visualised. ';
      end;
    end
    else
    begin
      if cbRightOvaryNormal.Checked then
        result := 'The right ovary was visualised and appeared normal. '
      else
        result := 'The right ovary was visualised. ';
    end;
  end
  else
  begin
    result := result + 'The right ovary was not identified. ';
    if cbLeftOvaryIdentified.Checked then
    begin
      if cbLeftOvaryNormal.Checked then
        result := 'The left ovary was visualised and appeared normal. '
      else
        result := 'The left ovary was visualised. ';
    end
    else
      result := result + 'The left ovary was not identified. ';
  end;
end;

function GetNeitherOvaryIdentifiedString: string;
begin
    result := '';
    if ((not(cbRightOvaryIdentified.checked)and not(cbLeftOvaryIdentified.checked))) then
    begin
       if (cbRightOoporectomy.checked) then
       begin
         if (cbLeftOoporectomy.checked) then
            result := result + 'Neither ovary was identified, consistent with previous surgical removal. '
         else
            result := result + 'The right ovary was not identified, consistent with previous surgical removal. '+#13#10#13#10 +'The Left ovary was not identified. '
       end;
       else if (cbLeftOoporectomy.checked) then
       begin
            result := result + 'The right ovary was not identified. '+#13#10#13#10 + 'The left ovary was not identified, consistent with previous surgical removal. '
       end;
       else
          result := result + 'Neither ovary was identified on this occasion. '
    end;
end;

function GetHysterectomyString: string;
begin
  result := '';
  if cbHysterectomy.Checked then
  begin
    if cbCervixPresentNo.Checked then
    begin
      if cbVaultNormalYes.Checked then
      begin
        result := 'The uterine body and cervix were absent, consistent with previous total hysterectomy. The vaginal vault was unremarkable. ';
      end
      else
        result := 'The uterine body and cervix were absent, consistent with previous total hysterectomy. The vaginal vault appeared abnormal. ';
    end
    else if cbCervixPresentYes.Checked then
    begin
      result := Format('The uterine body was absent, consistent with subtotal hysterectomy.  The cervical stump measured %dmm. ', [Trunc(seCervicalLength.Value)]);
    end;
  end;
end;

function GetKidneyAppearance: string;
begin
  result := '';
  if cbRightKidneyYes.Checked then
  begin
    if cbLeftKidneyYes.Checked then
    begin
      result := result + 'Both kidneys were visualised';
      if cbRightReanalAbnormalNo.Checked then
      begin
        if cbLeftReanalAbnormalNo.Checked then
        begin
          result := result + ' and no abnormality was identified';
        end
        else
          result := result + '. The right kidney appeared normal';
      end
      else
      begin
        if cbLeftReanalAbnormalNo.Checked then
        begin
          result := result + '. The left kidney appeared normal';
        end;
      end;
    end
    else
    begin
      result := result + 'The right kidney was visualised';
      if cbRightReanalAbnormalNo.Checked then
        result := result + ' and no abnormality was identified';
    end;
  end
  else
  begin
    if cbLeftKidneyYes.Checked then
    begin
      result := result + 'The left kidney was visualised';
      if cbLeftReanalAbnormalNo.Checked then
        result := result + ' and no abnormality was identified';
    end;
  end;
  if result <> '' then
    result := result + '. ';
end;

function GetEndometriumSize: string;
var
  vTemp: string;
begin
  result := '';
  vTemp := FloatToStr(seEdometriumThickness.Value);
  if ((length(vTemp) > 0) and (vTemp[1] = '8')) or (trunc(seEdometriumThickness.Value) = 11) or (trunc(seEdometriumThickness.Value) = 18) then
    result := 'an '
  else
    result := 'a ';
  result := result + vTemp + 'mm';
end;

function getEndometrialLesion : String
begin
 result := '';
 if  cbEndometrialLensionNo.checked then
 begin
   result := result + 'No focal endometrial lesion was identified.  '; 
 end;
end;

function getEndometriumType : String
begin
  result := '';
  if cbEndometrium.ItemIndex = 8 then
  begin
     result := result + 'postmenopausal endometrium (normal < 4 mm)';
  end;
  else
    result := result +  cbEndometrium.text + ' endometrium';
end;

function GetGetBulkyUterus: string;
begin
  result := '';
  if (seUterusCC.Value >= 100)  and (seUterusCC.Value <= 200) then
    result := 'mildly enlarged ';
  else if  seUterusCC.Value > 200 then
    result := 'enlarged ';
end;

function GetLargerMyometrium: string;
begin
  result := '';
  if spAPAnterior.value > spAPPosterior.Value then
    result := 'anterior'
  else
    result := 'posterior';
end;

procedure ActiveAdenomyosisControls;
begin
  if cbAdenomyosisPresent.Checked then
  begin
    cbLossEMInterface.Enabled := True;
    cbVBShadowingNotPresent.Enabled := True;
    cbVBShadowingPresent.Enabled := True;
    cbIncVasNotPresent.Enabled := True;
    cbIncVasPresent.Enabled := True;
    cbMyometrialCystsPresent.Enabled := True;
    cbMyometrialCystsNotPresent.Enabled := True;
    spAPPosterior.Enabled := True;
    spAPAnterior.Enabled := True;
    lblVenetianBlindShadowing.Enabled := True;
    lblincVascularity.Enabled := True;
    lblApdiameterAnt.Enabled := True;
    lblAPDiameterposterior.Enabled := True;
    lblMyometrium.Enabled :=  True;
    lblMyometrialCysts.Enabled := True;
  end
  else
  begin
    cbLossEMInterface.Enabled := False;
    cbVBShadowingNotPresent.Enabled := False;
    cbVBShadowingPresent.Enabled := False;
    cbIncVasNotPresent.Enabled := False;
    cbIncVasPresent.Enabled := False;
    cbMyometrialCystsPresent.Enabled := False;
    cbMyometrialCystsNotPresent.Enabled := False;
    spAPPosterior.Enabled := False;
    spAPAnterior.Enabled := False;
    lblVenetianBlindShadowing.Enabled := False;
    lblincVascularity.Enabled := False;
    lblApdiameterAnt.Enabled := False;
    lblAPDiameterposterior.Enabled := False;
    lblMyometrium.Enabled :=  False;
    lblMyometrialCysts.Enabled := False;
  end; 
end;
