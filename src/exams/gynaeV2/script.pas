procedure cbToggleCheckOnClick(Sender)
var
  i: Integer;
begin
  if TcxCheckBox(Sender).Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (TcxCheckBox(Sender.Parent.Controls[i]).Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          TcxCheckBox(Sender.Parent.Controls[i]).Checked := false;
        end;
      end;
    end;
  end;
end;

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

  // --- Default visibility ---
  lgPainWithProbe.Visible := False;
  lgOtherMedication.Visible := False;
  lgOtherSurgery.Visible := False;
  lgLaparoscopy.Visible := False;
  gbFibRow2.Visible := False;
  gbFibRow3.Visible := False;
  gbFibRow4.Visible := False;
  gbFibRow5.Visible := False;
  gbFibRow6.Visible := False;
  gbFibRow7.Visible := False;
  gbFibRow8.Visible := False;
  gbFibRow9.Visible := False;
  gbFibRow10.Visible := False;
  lgCongenitalDetails.Visible := False;
  lgAdenomyosisDetails.Visible := False;
  lgFibroidsDetails.Visible := False;
  gbPolypRow2.Visible := False;
  gbPolypRow3.Visible := False;
  gbPolypRow4.Visible := False;
  lgPolypDetails.Visible := False;
  lgRPOCDetails.Visible := False;
  lgRightOvaryDetails.Visible := False;
  lgLeftOvaryDetails.Visible := False;
  gbEndoRowRight2.Visible := False;
  gbEndoRowRight3.Visible := False;
  gbEndoRowLeft2.Visible := False;
  gbEndoRowLeft3.Visible := False;
  lgRightSimpleCystDims.Visible := False;
  lgRightDermoidDims.Visible := False;
  lgRightFibromaDims.Visible := False;
  lgLeftSimpleCystDims.Visible := False;
  lgLeftDermoidDims.Visible := False;
  lgLeftFibromaDims.Visible := False;
  lgRightEndoDetails.Visible := False;
  lgLeftEndoDetails.Visible := False;
  gbBowelRow2.Visible := False;
  gbBowelRow3.Visible := False;
  lgBladderDetails.Visible := False;
  lgBladderLocation.Visible := False;
  lgVaultContent.Visible := False;
  lgVaultDetails.Visible := False;
  lgRCDetails.Visible := False;
  lgBowelDetails.Visible := False;
  lgSHGDetails.Visible := False;
  lgTubalDetails.Visible := False;

  lgCervixPresent.Visible := False;
  gbDimsRightParaCyst.Enabled := False;
  gbDimsLeftParaCyst.Enabled := False;
  gbEndoRowRight1.Visible := False;
  gbEndoRowLeft1.Visible := False;

  // --- Default enabled ---
  // Only disable controls that are VISIBLE but need greying out.
  // Controls inside hidden layout groups don't need disabling.
  sePODDepth.Enabled := False;
  cmbPODPartialSide.Enabled := False;
  seRightUSLNoduleLength.Enabled := False;
  seRightUSLNoduleWidth.Enabled := False;
  seRightUSLNoduleDepth.Enabled := False;
  seLeftUSLNoduleLength.Enabled := False;
  seLeftUSLNoduleWidth.Enabled := False;
  seLeftUSLNoduleDepth.Enabled := False;
  chkRightKidneyObstructed.Enabled := False;
  chkLeftKidneyObstructed.Enabled := False;
end;

// ======================== Event Handlers ==================================//

// --- Scan Type ---

procedure ScanTypeClick(Sender)
begin
  cbToggleCheckOnClick(Sender);
  lgPainWithProbe.Visible := chkTransvaginal.Checked;
  if not chkTransvaginal.Checked then
    chkPainWithProbe.Checked := False;
end;

// --- Medication ---

procedure ccbMedicationChange(Sender)
begin
  lgOtherMedication.Visible := (ccbMedication.States[ccbMedication.Properties.Items.Count-1] = 1);
  if not lgOtherMedication.Visible then
    edtOtherMedication.Text := '';
end;

// --- Surgical History ---

procedure ccbPastSurgeryChange(Sender)
begin
  lgLaparoscopy.Visible := (ccbPastSurgery.States[6] = 1);
  lgOtherSurgery.Visible := (ccbPastSurgery.States[ccbPastSurgery.Properties.Items.Count-1] = 1);
  if not lgOtherSurgery.Visible then
    edtOtherSurgery.Text := '';
end;

// --- Uterus ---

procedure chkHysterectomyClick(Sender)
begin
  lgCervixPresent.Visible := chkHysterectomy.Checked;
  if not chkHysterectomy.Checked then
    chkCervixPresent.Checked := False;
end;

procedure chkCongenitalAbnormalityClick(Sender)
begin
  lgCongenitalDetails.Visible := chkCongenitalAbnormality.Checked;
end;

// AdenoTypeClick removed — wired directly to cbToggleCheckOnClick

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
  if chkFocalLesion.Checked and (sePolypCount.Value < 1) then
    sePolypCount.Value := 1;
end;

// IUDToggleClick, RPOCVascToggleClick removed — wired directly to cbToggleCheckOnClick

procedure chkRPOCClick(Sender)
begin
  lgRPOCDetails.Visible := chkRPOC.Checked;
end;

procedure sePolypCountChange(Sender)
begin
  gbPolypRow1.Visible := (sePolypCount.Value >= 1);
  gbPolypRow2.Visible := (sePolypCount.Value >= 2);
  gbPolypRow3.Visible := (sePolypCount.Value >= 3);
  gbPolypRow4.Visible := (sePolypCount.Value >= 4);
  gbPolypTable.Height := 18 + sePolypCount.Value * 24 + 4;
end;

// --- Ovary Status (radio checkboxes) ---

procedure RightOvaryStatusClick(Sender)
begin
  cbToggleCheckOnClick(Sender);
  lgRightOvaryDetails.Visible := chkRightOvaryIdentified.Checked;
end;

procedure LeftOvaryStatusClick(Sender)
begin
  cbToggleCheckOnClick(Sender);
  lgLeftOvaryDetails.Visible := chkLeftOvaryIdentified.Checked;
end;

procedure chkRightParaOvarianCystClick(Sender)
begin
  gbDimsRightParaCyst.Enabled := chkRightParaOvarianCyst.Checked;
end;

procedure chkLeftParaOvarianCystClick(Sender)
begin
  gbDimsLeftParaCyst.Enabled := chkLeftParaOvarianCyst.Checked;
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

procedure seRightEndometriomaCountChange(Sender)
begin
  gbEndoRowRight1.Visible := chkRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 1);
  gbEndoRowRight2.Visible := chkRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 2);
  gbEndoRowRight3.Visible := chkRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 3);
  gbEndoTableRight.Height := 18 + seRightEndometriomaCount.Value * 24 + 4;
end;

procedure seLeftEndometriomaCountChange(Sender)
begin
  gbEndoRowLeft1.Visible := chkLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 1);
  gbEndoRowLeft2.Visible := chkLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 2);
  gbEndoRowLeft3.Visible := chkLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 3);
  gbEndoTableLeft.Height := 18 + seLeftEndometriomaCount.Value * 24 + 4;
end;

procedure chkRightEndometriomaClick(Sender)
begin
  lgRightEndoDetails.Visible := chkRightEndometrioma.Checked;
  if chkRightEndometrioma.Checked and (seRightEndometriomaCount.Value < 1) then
    seRightEndometriomaCount.Value := 1;
  seRightEndometriomaCountChange(nil);
end;

procedure chkLeftEndometriomaClick(Sender)
begin
  lgLeftEndoDetails.Visible := chkLeftEndometrioma.Checked;
  if chkLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value < 1) then
    seLeftEndometriomaCount.Value := 1;
  seLeftEndometriomaCountChange(nil);
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
  cbToggleCheckOnClick(Sender);
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

// rbRightTubeAbsentClick, rbLeftTubeAbsentClick removed — wired directly to cbToggleCheckOnClick

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
  lgVaultContent.Visible := chkVaultVisualised.Checked;
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
  cbToggleCheckOnClick(Sender);
  deLMPDate.Enabled := not (chkLMPUnknown.Checked or chkAmenorrhoea.Checked or chkPostMenopausal.Checked);
  seStartDay.Enabled := not (chkAmenorrhoea.Checked or chkPostMenopausal.Checked);
  seCycleMinDays.Enabled := not (chkAmenorrhoea.Checked or chkPostMenopausal.Checked);
end;


// Uterus mobility/tenderness, ovary mobility/tenderness
// All wired directly to cbToggleCheckOnClick

// ======================== StartScript =====================================//

procedure StartScript;
begin
  // --- Scan Type ---
  chkTransabdominal.OnClick := 'ScanTypeClick';
  chkTransvaginal.OnClick := 'ScanTypeClick';

  // --- Medication ---
  ccbMedication.Properties.OnChange := 'ccbMedicationChange';

  // --- Surgical History ---
  ccbPastSurgery.Properties.OnChange := 'ccbPastSurgeryChange';

  // --- Uterus ---
  chkHysterectomy.OnClick := 'chkHysterectomyClick';
  chkCongenitalAbnormality.OnClick := 'chkCongenitalAbnormalityClick';
  rbAdenoDiffuse.OnClick := 'cbToggleCheckOnClick';
  rbAdenoFocal.OnClick := 'cbToggleCheckOnClick';
  chkAdenomyosis.OnClick := 'chkAdenomyosisClick';
  chkFibroidsPresent.OnClick := 'chkFibroidsPresentClick';
  seFibroidCount.Properties.OnChange := 'seFibroidCountChange';

  // --- Endometrium ---
  chkFocalLesion.OnClick := 'chkFocalLesionClick';
  sePolypCount.Properties.OnChange := 'sePolypCountChange';
  chkIUDCorrect.OnClick := 'cbToggleCheckOnClick';
  chkIUDIncorrect.OnClick := 'cbToggleCheckOnClick';
  rbRPOCVascular.OnClick := 'cbToggleCheckOnClick';
  rbRPOCAvascular.OnClick := 'cbToggleCheckOnClick';
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
  chkUterusMobile.OnClick := 'cbToggleCheckOnClick';
  chkUterusLimitedMobility.OnClick := 'cbToggleCheckOnClick';
  chkUterusFixed.OnClick := 'cbToggleCheckOnClick';
  chkUterusTender.OnClick := 'cbToggleCheckOnClick';
  chkUterusNonTender.OnClick := 'cbToggleCheckOnClick';

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
  rbRightTubePatent.OnClick := 'cbToggleCheckOnClick';
  rbRightTubeNotDemonstrated.OnClick := 'cbToggleCheckOnClick';
  rbRightTubeAbsent.OnClick := 'cbToggleCheckOnClick';
  rbLeftTubePatent.OnClick := 'cbToggleCheckOnClick';
  rbLeftTubeNotDemonstrated.OnClick := 'cbToggleCheckOnClick';
  rbLeftTubeAbsent.OnClick := 'cbToggleCheckOnClick';

  // --- Ovary mobility/tenderness ---
  chkRightMobile.OnClick := 'cbToggleCheckOnClick';
  chkRightReducedMobility.OnClick := 'cbToggleCheckOnClick';
  chkRightStuck.OnClick := 'cbToggleCheckOnClick';
  chkRightRigid.OnClick := 'cbToggleCheckOnClick';
  chkLeftMobile.OnClick := 'cbToggleCheckOnClick';
  chkLeftReducedMobility.OnClick := 'cbToggleCheckOnClick';
  chkLeftStuck.OnClick := 'cbToggleCheckOnClick';
  chkLeftRigid.OnClick := 'cbToggleCheckOnClick';

  chkRightTender.OnClick := 'cbToggleCheckOnClick';
  chkRightNonTender.OnClick := 'cbToggleCheckOnClick';
  chkLeftTender.OnClick := 'cbToggleCheckOnClick';
  chkLeftNonTender.OnClick := 'cbToggleCheckOnClick';

  InitializeScreen;

end;

StartScript;