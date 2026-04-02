function CheckFormComplete: Boolean;
begin
  result := True;
end;

procedure ProduceMergeFieldData;
begin
end;

procedure ProduceMergeOrder;
begin
end;

procedure InitializeScreen;
begin
  if (deExamDate.Date < 100) then
    deExamDate.Date := now;
end;

// ======================== Event Handlers ==================================//

// --- Scan Type ---

procedure chkTransvaginalClick(Sender)
begin
  chkPainWithProbe.Enabled := chkTransvaginal.Checked;
  if not chkTransvaginal.Checked then
    chkPainWithProbe.Checked := False;
end;

// --- Medication ---

procedure ccbMedicationChange(Sender)
begin
  edtOtherMedication.Enabled := (ccbMedication.States[ccbMedication.Properties.Items.Count-1] = 1);
  if not edtOtherMedication.Enabled then
    edtOtherMedication.Text := '';
end;

// --- Surgical History ---

procedure ccbPastSurgeryChange(Sender)
begin
  lgLaparoscopy.Visible := (ccbPastSurgery.States[6] = 1);
end;

// --- Uterus ---

procedure chkHysterectomyClick(Sender)
begin
  liCervixPresent.Visible := chkHysterectomy.Checked;
  if not chkHysterectomy.Checked then
    chkCervixPresent.Checked := False;
end;

procedure chkCongenitalAbnormalityClick(Sender)
begin
  lgCongenitalDetails.Visible := chkCongenitalAbnormality.Checked;
end;

procedure chkAdenomyosisClick(Sender)
begin
  lgAdenomyosisDetails.Visible := chkAdenomyosis.Checked;
end;

procedure chkFibroidsPresentClick(Sender)
begin
  lgFibroidsDetails.Visible := chkFibroidsPresent.Checked;
  if chkFibroidsPresent.Checked and (seFibroidCount.Value < 1) then
    seFibroidCount.Value := 1;
end;

procedure seFibroidCountChange(Sender)
begin
  gbFibRow1.Visible := (seFibroidCount.Value >= 1);
  gbFibRow2.Visible := (seFibroidCount.Value >= 2);
  gbFibRow3.Visible := (seFibroidCount.Value >= 3);
  gbFibRow4.Visible := (seFibroidCount.Value >= 4);
  gbFibRow5.Visible := (seFibroidCount.Value >= 5);
  gbFibRow6.Visible := (seFibroidCount.Value >= 6);
  gbFibRow7.Visible := (seFibroidCount.Value >= 7);
  gbFibRow8.Visible := (seFibroidCount.Value >= 8);
  gbFibRow9.Visible := (seFibroidCount.Value >= 9);
  gbFibRow10.Visible := (seFibroidCount.Value >= 10);
  gbFibroidTable.Height := 20 + seFibroidCount.Value * 24 + 4;
end;

// --- Endometrium ---

procedure chkFocalLesionClick(Sender)
begin
  lgPolypDetails.Visible := chkFocalLesion.Checked;
end;

procedure chkRPOCClick(Sender)
begin
  lgRPOCDetails.Visible := chkRPOC.Checked;
end;

procedure sePolypCountChange(Sender)
begin
  lgPolyp1.Visible := (sePolypCount.Value >= 1);
  lgPolyp2.Visible := (sePolypCount.Value >= 2);
  lgPolyp3.Visible := (sePolypCount.Value >= 3);
  lgPolyp4.Visible := (sePolypCount.Value >= 4);
end;

// --- Ovary Status (radio checkboxes) ---

procedure RightOvaryStatusClick(Sender)
begin
  chkRightOvaryIdentified.Checked := (Sender = chkRightOvaryIdentified);
  chkRightOvaryNotIdentified.Checked := (Sender = chkRightOvaryNotIdentified);
  chkRightOvaryAbsent.Checked := (Sender = chkRightOvaryAbsent);
  lgRightOvaryDetails.Visible := chkRightOvaryIdentified.Checked;
end;

procedure LeftOvaryStatusClick(Sender)
begin
  chkLeftOvaryIdentified.Checked := (Sender = chkLeftOvaryIdentified);
  chkLeftOvaryNotIdentified.Checked := (Sender = chkLeftOvaryNotIdentified);
  chkLeftOvaryAbsent.Checked := (Sender = chkLeftOvaryAbsent);
  lgLeftOvaryDetails.Visible := chkLeftOvaryIdentified.Checked;
end;

procedure chkRightParaOvarianCystClick(Sender)
begin
  gbDimsRightParaCyst.Visible := chkRightParaOvarianCyst.Checked;
end;

procedure chkLeftParaOvarianCystClick(Sender)
begin
  gbDimsLeftParaCyst.Visible := chkLeftParaOvarianCyst.Checked;
end;

// --- Common Pathologies (layout groups) ---

procedure chkRightSimpleCystClick(Sender)
begin
  lgRightSimpleCystDims.Visible := chkRightSimpleCyst.Checked;
end;

procedure chkLeftSimpleCystClick(Sender)
begin
  lgLeftSimpleCystDims.Visible := chkLeftSimpleCyst.Checked;
end;

procedure chkRightDermoidClick(Sender)
begin
  lgRightDermoidDims.Visible := chkRightDermoid.Checked;
end;

procedure chkLeftDermoidClick(Sender)
begin
  lgLeftDermoidDims.Visible := chkLeftDermoid.Checked;
end;

procedure chkRightFibromaClick(Sender)
begin
  lgRightFibromaDims.Visible := chkRightFibroma.Checked;
end;

procedure chkLeftFibromaClick(Sender)
begin
  lgLeftFibromaDims.Visible := chkLeftFibroma.Checked;
end;

// --- Common Pathologies: Endometrioma (multiple) ---

procedure chkRightEndometriomaClick(Sender)
begin
  lgRightEndoDetails.Visible := chkRightEndometrioma.Checked;
  if chkRightEndometrioma.Checked then
  begin
    lgRightEndo1.Visible := (seRightEndometriomaCount.Value >= 1);
    lgRightEndo2.Visible := (seRightEndometriomaCount.Value >= 2);
    lgRightEndo3.Visible := (seRightEndometriomaCount.Value >= 3);
  end;
end;

procedure chkLeftEndometriomaClick(Sender)
begin
  lgLeftEndoDetails.Visible := chkLeftEndometrioma.Checked;
  if chkLeftEndometrioma.Checked then
  begin
    lgLeftEndo1.Visible := (seLeftEndometriomaCount.Value >= 1);
    lgLeftEndo2.Visible := (seLeftEndometriomaCount.Value >= 2);
    lgLeftEndo3.Visible := (seLeftEndometriomaCount.Value >= 3);
  end;
end;

procedure seRightEndometriomaCountChange(Sender)
begin
  lgRightEndo1.Visible := chkRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 1);
  lgRightEndo2.Visible := chkRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 2);
  lgRightEndo3.Visible := chkRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 3);
end;

procedure seLeftEndometriomaCountChange(Sender)
begin
  lgLeftEndo1.Visible := chkLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 1);
  lgLeftEndo2.Visible := chkLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 2);
  lgLeftEndo3.Visible := chkLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 3);
end;

// --- Endometriosis: Layout group visibility ---

procedure chkBladderNoduleClick(Sender)
begin
  lgBladderDetails.Visible := chkBladderNodule.Checked;
  lgBladderLocation.Visible := chkBladderNodule.Checked;
end;

procedure chkVaginalNoduleClick(Sender)
begin
  lgVaultDetails.Visible := chkVaginalNodule.Checked;
end;

procedure chkRetroCervicalNoduleClick(Sender)
begin
  lgRCDetails.Visible := chkRetroCervicalNodule.Checked;
end;

procedure chkBowelNodulePresentClick(Sender)
begin
  lgBowelDetails.Visible := chkBowelNodulePresent.Checked;
  if chkBowelNodulePresent.Checked and (seBowelNoduleCount.Value < 1) then
    seBowelNoduleCount.Value := 1;
end;

procedure seBowelNoduleCountChange(Sender)
begin
  gbBowelRow1.Visible := (seBowelNoduleCount.Value >= 1);
  gbBowelRow2.Visible := (seBowelNoduleCount.Value >= 2);
  gbBowelRow3.Visible := (seBowelNoduleCount.Value >= 3);
  gbBowelNoduleTable.Height := 20 + seBowelNoduleCount.Value * 24 + 4;
end;

// --- POD Obliteration (radio toggle) ---

procedure PODObliterationClick(Sender)
begin
  rbPODNoObliteration.Checked := (Sender = rbPODNoObliteration);
  rbPODPartialObliteration.Checked := (Sender = rbPODPartialObliteration);
  rbPODCompleteObliteration.Checked := (Sender = rbPODCompleteObliteration);
  rbPODPostSurgical.Checked := (Sender = rbPODPostSurgical);
  cmbPODPartialSide.Enabled := rbPODPartialObliteration.Checked;
end;

// --- USL Nodule measurements ---

procedure chkRightUSLNoduleClick(Sender)
begin
  seRightUSLNoduleLength.Enabled := chkRightUSLNodule.Checked;
  seRightUSLNoduleWidth.Enabled := chkRightUSLNodule.Checked;
  seRightUSLNoduleDepth.Enabled := chkRightUSLNodule.Checked;
end;

procedure chkLeftUSLNoduleClick(Sender)
begin
  seLeftUSLNoduleLength.Enabled := chkLeftUSLNodule.Checked;
  seLeftUSLNoduleWidth.Enabled := chkLeftUSLNodule.Checked;
  seLeftUSLNoduleDepth.Enabled := chkLeftUSLNodule.Checked;
end;

// --- Kidneys ---

procedure chkRightKidneyVisualisedClick(Sender)
begin
  chkRightKidneyObstructed.Enabled := chkRightKidneyVisualised.Checked;
  if not chkRightKidneyVisualised.Checked then
    chkRightKidneyObstructed.Checked := False;
end;

procedure chkLeftKidneyVisualisedClick(Sender)
begin
  chkLeftKidneyObstructed.Enabled := chkLeftKidneyVisualised.Checked;
  if not chkLeftKidneyVisualised.Checked then
    chkLeftKidneyObstructed.Checked := False;
end;

// --- Procedures ---

procedure chkSHGPerformedClick(Sender)
begin
  lgSHGDetails.Visible := chkSHGPerformed.Checked;
end;

procedure chkTubalPatencyPerformedClick(Sender)
begin
  lgTubalDetails.Visible := chkTubalPatencyPerformed.Checked;
end;

// --- Vaginal Vault: visualised hides detail ---

procedure chkVaultVisualisedClick(Sender)
begin
  chkVaultThinRegular.Enabled := chkVaultVisualised.Checked;
  chkVaginalNodule.Enabled := chkVaultVisualised.Checked;
  if not chkVaultVisualised.Checked then
  begin
    chkVaultThinRegular.Checked := False;
    chkVaginalNodule.Checked := False;
    lgVaultDetails.Visible := False;
  end;
end;

// --- Ovaries: haemorrhagic CL size conditional ---

procedure chkRightHaemCLClick(Sender)
begin
  seRightHaemCLSize.Enabled := chkRightHaemorrhagicCL.Checked;
end;

procedure chkLeftHaemCLClick(Sender)
begin
  seLeftHaemCLSize.Enabled := chkLeftHaemorrhagicCL.Checked;
end;

// --- Ovaries: Total AFC calculation ---

procedure UpdateTotalAFC(Sender)
begin
  lblTotalAFC.Caption := IntToStr(seRightAFC.Value + seLeftAFC.Value);
end;

// --- POD: free fluid enables depth ---

procedure chkFreeFluidClick(Sender)
begin
  sePODDepth.Enabled := chkFreeFluid.Checked;
end;

// --- IOTA Simple Rules result ---

procedure UpdateSimpleRulesResult(Sender)
var
  bCount, mCount: Integer;
begin
  bCount := 0;
  mCount := 0;
  if chkB1Unilocular.Checked then bCount := bCount + 1;
  if chkB2SolidLessThan7.Checked then bCount := bCount + 1;
  if chkB3AcousticShadows.Checked then bCount := bCount + 1;
  if chkB4SmoothMultilocular.Checked then bCount := bCount + 1;
  if chkB5NoBloodFlow.Checked then bCount := bCount + 1;
  if chkM1IrregularSolid.Checked then mCount := mCount + 1;
  if chkM2Ascites.Checked then mCount := mCount + 1;
  if chkM3PapillaryProjections.Checked then mCount := mCount + 1;
  if chkM4IrregularMultilocular.Checked then mCount := mCount + 1;
  if chkM5HighBloodFlow.Checked then mCount := mCount + 1;

  if (bCount > 0) and (mCount = 0) then
    lblSimpleRulesResult.Caption := 'Benign'
  else if (mCount > 0) and (bCount = 0) then
    lblSimpleRulesResult.Caption := 'Malignant'
  else if (bCount > 0) and (mCount > 0) then
    lblSimpleRulesResult.Caption := 'Inconclusive'
  else
    lblSimpleRulesResult.Caption := '';
end;

// --- LMP/Cycle: hide when postmenopausal/amenorrhoea/unknown ---

procedure LMPStatusClick(Sender)
begin
  deLMPDate.Enabled := not (chkLMPUnknown.Checked or chkAmenorrhoea.Checked or chkPostMenopausal.Checked);
  seStartDay.Enabled := not (chkAmenorrhoea.Checked or chkPostMenopausal.Checked);
  seCycleMinDays.Enabled := not (chkAmenorrhoea.Checked or chkPostMenopausal.Checked);
end;

// --- Uterus Mobility (radio toggle) ---

procedure UterusMobilityClick(Sender)
begin
  chkUterusMobile.Checked := (Sender = chkUterusMobile);
  chkUterusLimitedMobility.Checked := (Sender = chkUterusLimitedMobility);
  chkUterusFixed.Checked := (Sender = chkUterusFixed);
end;

procedure UterusTendernessClick(Sender)
begin
  chkUterusTender.Checked := (Sender = chkUterusTender);
  chkUterusNonTender.Checked := (Sender = chkUterusNonTender);
end;

// --- Ovary Mobility (radio toggle) ---

procedure chkRightMobileClick(Sender)
begin
  chkRightMobile.Checked := (Sender = chkRightMobile);
  chkRightReducedMobility.Checked := (Sender = chkRightReducedMobility);
  chkRightStuck.Checked := (Sender = chkRightStuck);
  chkRightRigid.Checked := (Sender = chkRightRigid);
end;

procedure chkLeftMobileClick(Sender)
begin
  chkLeftMobile.Checked := (Sender = chkLeftMobile);
  chkLeftReducedMobility.Checked := (Sender = chkLeftReducedMobility);
  chkLeftStuck.Checked := (Sender = chkLeftStuck);
  chkLeftRigid.Checked := (Sender = chkLeftRigid);
end;

procedure chkRightTenderClick(Sender)
begin
  chkRightTender.Checked := (Sender = chkRightTender);
  chkRightNonTender.Checked := (Sender = chkRightNonTender);
end;

procedure chkLeftTenderClick(Sender)
begin
  chkLeftTender.Checked := (Sender = chkLeftTender);
  chkLeftNonTender.Checked := (Sender = chkLeftNonTender);
end;

// ======================== StartScript =====================================//

procedure StartScript;
begin
  // --- Scan Type ---
  chkTransvaginal.OnClick := 'chkTransvaginalClick';

  // --- Medication ---
  ccbMedication.Properties.OnChange := 'ccbMedicationChange';

  // --- Surgical History ---
  ccbPastSurgery.Properties.OnChange := 'ccbPastSurgeryChange';

  // --- Uterus ---
  chkHysterectomy.OnClick := 'chkHysterectomyClick';
  chkCongenitalAbnormality.OnClick := 'chkCongenitalAbnormalityClick';
  chkAdenomyosis.OnClick := 'chkAdenomyosisClick';
  chkFibroidsPresent.OnClick := 'chkFibroidsPresentClick';
  seFibroidCount.Properties.OnChange := 'seFibroidCountChange';

  // --- Endometrium ---
  chkFocalLesion.OnClick := 'chkFocalLesionClick';
  sePolypCount.Properties.OnChange := 'sePolypCountChange';
  chkRPOC.OnClick := 'chkRPOCClick';

  // --- Ovary Status (radio checkboxes) ---
  chkRightOvaryIdentified.OnClick := 'RightOvaryStatusClick';
  chkRightOvaryNotIdentified.OnClick := 'RightOvaryStatusClick';
  chkRightOvaryAbsent.OnClick := 'RightOvaryStatusClick';
  chkLeftOvaryIdentified.OnClick := 'LeftOvaryStatusClick';
  chkLeftOvaryNotIdentified.OnClick := 'LeftOvaryStatusClick';
  chkLeftOvaryAbsent.OnClick := 'LeftOvaryStatusClick';
  chkRightParaOvarianCyst.OnClick := 'chkRightParaOvarianCystClick';
  chkLeftParaOvarianCyst.OnClick := 'chkLeftParaOvarianCystClick';

  // --- Common Pathologies ---
  chkRightSimpleCyst.OnClick := 'chkRightSimpleCystClick';
  chkLeftSimpleCyst.OnClick := 'chkLeftSimpleCystClick';
  chkRightEndometrioma.OnClick := 'chkRightEndometriomaClick';
  chkLeftEndometrioma.OnClick := 'chkLeftEndometriomaClick';
  seRightEndometriomaCount.Properties.OnChange := 'seRightEndometriomaCountChange';
  seLeftEndometriomaCount.Properties.OnChange := 'seLeftEndometriomaCountChange';
  chkRightDermoid.OnClick := 'chkRightDermoidClick';
  chkLeftDermoid.OnClick := 'chkLeftDermoidClick';
  chkRightFibroma.OnClick := 'chkRightFibromaClick';
  chkLeftFibroma.OnClick := 'chkLeftFibromaClick';

  // --- Endometriosis ---
  chkBladderNodule.OnClick := 'chkBladderNoduleClick';
  chkVaginalNodule.OnClick := 'chkVaginalNoduleClick';
  chkRetroCervicalNodule.OnClick := 'chkRetroCervicalNoduleClick';
  chkBowelNodulePresent.OnClick := 'chkBowelNodulePresentClick';
  seBowelNoduleCount.Properties.OnChange := 'seBowelNoduleCountChange';

  // POD obliteration
  rbPODNoObliteration.OnClick := 'PODObliterationClick';
  rbPODPartialObliteration.OnClick := 'PODObliterationClick';
  rbPODCompleteObliteration.OnClick := 'PODObliterationClick';
  rbPODPostSurgical.OnClick := 'PODObliterationClick';

  // Uterus mobility/tenderness
  chkUterusMobile.OnClick := 'UterusMobilityClick';
  chkUterusLimitedMobility.OnClick := 'UterusMobilityClick';
  chkUterusFixed.OnClick := 'UterusMobilityClick';
  chkUterusTender.OnClick := 'UterusTendernessClick';
  chkUterusNonTender.OnClick := 'UterusTendernessClick';

  // USL nodule measurements
  chkRightUSLNodule.OnClick := 'chkRightUSLNoduleClick';
  chkLeftUSLNodule.OnClick := 'chkLeftUSLNoduleClick';

  // --- Kidneys ---
  chkRightKidneyVisualised.OnClick := 'chkRightKidneyVisualisedClick';
  chkLeftKidneyVisualised.OnClick := 'chkLeftKidneyVisualisedClick';

  // --- Vaginal Vault ---
  chkVaultVisualised.OnClick := 'chkVaultVisualisedClick';

  // --- Ovary haemorrhagic CL ---
  chkRightHaemorrhagicCL.OnClick := 'chkRightHaemCLClick';
  chkLeftHaemorrhagicCL.OnClick := 'chkLeftHaemCLClick';

  // --- Total AFC ---
  seRightAFC.Properties.OnChange := 'UpdateTotalAFC';
  seLeftAFC.Properties.OnChange := 'UpdateTotalAFC';

  // --- POD free fluid ---
  chkFreeFluid.OnClick := 'chkFreeFluidClick';

  // --- IOTA Simple Rules ---
  chkB1Unilocular.OnClick := 'UpdateSimpleRulesResult';
  chkB2SolidLessThan7.OnClick := 'UpdateSimpleRulesResult';
  chkB3AcousticShadows.OnClick := 'UpdateSimpleRulesResult';
  chkB4SmoothMultilocular.OnClick := 'UpdateSimpleRulesResult';
  chkB5NoBloodFlow.OnClick := 'UpdateSimpleRulesResult';
  chkM1IrregularSolid.OnClick := 'UpdateSimpleRulesResult';
  chkM2Ascites.OnClick := 'UpdateSimpleRulesResult';
  chkM3PapillaryProjections.OnClick := 'UpdateSimpleRulesResult';
  chkM4IrregularMultilocular.OnClick := 'UpdateSimpleRulesResult';
  chkM5HighBloodFlow.OnClick := 'UpdateSimpleRulesResult';

  // --- LMP status ---
  chkLMPUnknown.OnClick := 'LMPStatusClick';
  chkAmenorrhoea.OnClick := 'LMPStatusClick';
  chkPostMenopausal.OnClick := 'LMPStatusClick';

  // --- Procedures ---
  chkSHGPerformed.OnClick := 'chkSHGPerformedClick';
  chkTubalPatencyPerformed.OnClick := 'chkTubalPatencyPerformedClick';

  // --- Ovary mobility/tenderness ---
  chkRightMobile.OnClick := 'chkRightMobileClick';
  chkRightReducedMobility.OnClick := 'chkRightMobileClick';
  chkRightStuck.OnClick := 'chkRightMobileClick';
  chkRightRigid.OnClick := 'chkRightMobileClick';
  chkLeftMobile.OnClick := 'chkLeftMobileClick';
  chkLeftReducedMobility.OnClick := 'chkLeftMobileClick';
  chkLeftStuck.OnClick := 'chkLeftMobileClick';
  chkLeftRigid.OnClick := 'chkLeftMobileClick';

  chkRightTender.OnClick := 'chkRightTenderClick';
  chkRightNonTender.OnClick := 'chkRightTenderClick';
  chkLeftTender.OnClick := 'chkLeftTenderClick';
  chkLeftNonTender.OnClick := 'chkLeftTenderClick';

  InitializeScreen;

end;

StartScript;