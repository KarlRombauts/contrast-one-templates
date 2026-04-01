function CheckFormComplete: Boolean
begin
  result := True;
end;

procedure ProduceMergeFieldData
begin
end;

procedure ProduceMergeOrder
begin
end;

procedure InitializeScreen
begin
  if (deExamDate.Date < 100) then
    deExamDate.Date := now;
end;

// ======================== Event Handlers ==================================//

// --- Scan Type ---

procedure cbTransvaginalClick(Sender)
begin
  cbPainWithProbe.Enabled := cbTransvaginal.Checked;
  if not cbTransvaginal.Checked then
    cbPainWithProbe.Checked := False;
end;

// --- Medication ---

procedure cxccbMedicationChange(Sender)
begin
  edtOtherMedication.Enabled := (cxccbMedication.States[cxccbMedication.Properties.Items.Count-1] = 1);
  if not edtOtherMedication.Enabled then
    edtOtherMedication.Text := '';
end;

// --- Surgical History ---

procedure cxccbPastSurgeryChange(Sender)
begin
  gbLaparoscopy.Visible := (cxccbPastSurgery.States[6] = 1);
end;

// --- Uterus ---

procedure cbHysterectomyClick(Sender)
begin
  cbCervixPresent.Visible := cbHysterectomy.Checked;
  if not cbHysterectomy.Checked then
    cbCervixPresent.Checked := False;
end;

procedure cbAdenomyosisClick(Sender)
begin
  gbAdenomyosis.Visible := cbAdenomyosis.Checked;
end;

procedure cbFibroidsPresentClick(Sender)
begin
  gbFibroids.Visible := cbFibroidsPresent.Checked;
end;

procedure spFibroidCountChange(Sender)
begin
  gbFibroid1.Visible := (spFibroidCount.Value >= 1);
  gbFibroid2.Visible := (spFibroidCount.Value >= 2);
  gbFibroid3.Visible := (spFibroidCount.Value >= 3);
  gbFibroid4.Visible := (spFibroidCount.Value >= 4);
  gbFibroid5.Visible := (spFibroidCount.Value >= 5);
  gbFibroid6.Visible := (spFibroidCount.Value >= 6);
  gbFibroid7.Visible := (spFibroidCount.Value >= 7);
  gbFibroid8.Visible := (spFibroidCount.Value >= 8);
end;

// --- Endometrium ---

procedure cbFocalLesionClick(Sender)
begin
  gbPolyps.Visible := cbFocalLesion.Checked;
end;

procedure cbRPOCClick(Sender)
begin
  gbRPOC.Visible := cbRPOC.Checked;
end;

// --- Ovary Status ---

procedure cbRightOvaryStatusChange(Sender)
begin
  seRightOvaryLength.Enabled := (cbRightOvaryStatus.Text = 'identified');
  seRightOvaryWidth.Enabled := (cbRightOvaryStatus.Text = 'identified');
  seRightOvaryHeight.Enabled := (cbRightOvaryStatus.Text = 'identified');
  seRightOvaryCC.Enabled := (cbRightOvaryStatus.Text = 'identified');
  cbRightOvaryAppearance.Enabled := (cbRightOvaryStatus.Text = 'identified');
  seRightAFC.Enabled := (cbRightOvaryStatus.Text = 'identified');
  seRightMaxFollicle.Enabled := (cbRightOvaryStatus.Text = 'identified');
end;

procedure cbLeftOvaryStatusChange(Sender)
begin
  seLeftOvaryLength.Enabled := (cbLeftOvaryStatus.Text = 'identified');
  seLeftOvaryWidth.Enabled := (cbLeftOvaryStatus.Text = 'identified');
  seLeftOvaryHeight.Enabled := (cbLeftOvaryStatus.Text = 'identified');
  seLeftOvaryCC.Enabled := (cbLeftOvaryStatus.Text = 'identified');
  cbLeftOvaryAppearance.Enabled := (cbLeftOvaryStatus.Text = 'identified');
  seLeftAFC.Enabled := (cbLeftOvaryStatus.Text = 'identified');
  seLeftMaxFollicle.Enabled := (cbLeftOvaryStatus.Text = 'identified');
end;

// --- Common Pathologies: Simple cyst ---

procedure cbRightSimpleCystClick(Sender)
begin
  seRightSimpleCystL.Enabled := cbRightSimpleCyst.Checked;
  seRightSimpleCystW.Enabled := cbRightSimpleCyst.Checked;
  seRightSimpleCystD.Enabled := cbRightSimpleCyst.Checked;
end;

procedure cbLeftSimpleCystClick(Sender)
begin
  seLeftSimpleCystL.Enabled := cbLeftSimpleCyst.Checked;
  seLeftSimpleCystW.Enabled := cbLeftSimpleCyst.Checked;
  seLeftSimpleCystD.Enabled := cbLeftSimpleCyst.Checked;
end;

// --- Common Pathologies: Dermoid ---

procedure cbRightDermoidClick(Sender)
begin
  seRightDermoidL.Enabled := cbRightDermoid.Checked;
  seRightDermoidW.Enabled := cbRightDermoid.Checked;
  seRightDermoidD.Enabled := cbRightDermoid.Checked;
end;

procedure cbLeftDermoidClick(Sender)
begin
  seLeftDermoidL.Enabled := cbLeftDermoid.Checked;
  seLeftDermoidW.Enabled := cbLeftDermoid.Checked;
  seLeftDermoidD.Enabled := cbLeftDermoid.Checked;
end;

// --- Common Pathologies: Fibroma ---

procedure cbRightFibromaClick(Sender)
begin
  seRightFibromaL.Enabled := cbRightFibroma.Checked;
  seRightFibromaW.Enabled := cbRightFibroma.Checked;
  seRightFibromaD.Enabled := cbRightFibroma.Checked;
end;

procedure cbLeftFibromaClick(Sender)
begin
  seLeftFibromaL.Enabled := cbLeftFibroma.Checked;
  seLeftFibromaW.Enabled := cbLeftFibroma.Checked;
  seLeftFibromaD.Enabled := cbLeftFibroma.Checked;
end;

// --- Common Pathologies: Endometrioma (multiple) ---

procedure cbRightEndometriomaClick(Sender)
begin
  seRightEndometriomaCount.Enabled := cbRightEndometrioma.Checked;
  if cbRightEndometrioma.Checked then
  begin
    gbRightEndometrioma1.Visible := (seRightEndometriomaCount.Value >= 1);
    gbRightEndometrioma2.Visible := (seRightEndometriomaCount.Value >= 2);
    gbRightEndometrioma3.Visible := (seRightEndometriomaCount.Value >= 3);
  end
  else
  begin
    gbRightEndometrioma1.Visible := False;
    gbRightEndometrioma2.Visible := False;
    gbRightEndometrioma3.Visible := False;
  end;
end;

procedure cbLeftEndometriomaClick(Sender)
begin
  seLeftEndometriomaCount.Enabled := cbLeftEndometrioma.Checked;
  if cbLeftEndometrioma.Checked then
  begin
    gbLeftEndometrioma1.Visible := (seLeftEndometriomaCount.Value >= 1);
    gbLeftEndometrioma2.Visible := (seLeftEndometriomaCount.Value >= 2);
    gbLeftEndometrioma3.Visible := (seLeftEndometriomaCount.Value >= 3);
  end
  else
  begin
    gbLeftEndometrioma1.Visible := False;
    gbLeftEndometrioma2.Visible := False;
    gbLeftEndometrioma3.Visible := False;
  end;
end;

procedure seRightEndometriomaCountChange(Sender)
begin
  gbRightEndometrioma1.Visible := cbRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 1);
  gbRightEndometrioma2.Visible := cbRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 2);
  gbRightEndometrioma3.Visible := cbRightEndometrioma.Checked and (seRightEndometriomaCount.Value >= 3);
end;

procedure seLeftEndometriomaCountChange(Sender)
begin
  gbLeftEndometrioma1.Visible := cbLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 1);
  gbLeftEndometrioma2.Visible := cbLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 2);
  gbLeftEndometrioma3.Visible := cbLeftEndometrioma.Checked and (seLeftEndometriomaCount.Value >= 3);
end;

// --- Endometriosis: Layout group visibility ---

procedure cbBladderNoduleClick(Sender)
begin
  lgBladderDetails.Visible := cbBladderNodule.Checked;
  lgBladderLocation.Visible := cbBladderNodule.Checked;
end;

procedure cbVaginalNoduleClick(Sender)
begin
  lgVaultDetails.Visible := cbVaginalNodule.Checked;
end;

procedure cbRetroCervicalNoduleClick(Sender)
begin
  lgRCDetails.Visible := cbRetroCervicalNodule.Checked;
end;

procedure cbBowelNodulePresentClick(Sender)
begin
  lgBowelDetails.Visible := cbBowelNodulePresent.Checked;
end;

procedure spBowelNoduleCountChange(Sender)
begin
  lgBowelNod1.Visible := (spBowelNoduleCount.Value >= 1);
  lgBowelNod2.Visible := (spBowelNoduleCount.Value >= 2);
  lgBowelNod3.Visible := (spBowelNoduleCount.Value >= 3);
end;

// --- POD Obliteration (radio toggle) ---

procedure PODObliterationClick(Sender)
begin
  rbPODNoObliteration.Checked := (Sender = rbPODNoObliteration);
  rbPODPartialObliteration.Checked := (Sender = rbPODPartialObliteration);
  rbPODCompleteObliteration.Checked := (Sender = rbPODCompleteObliteration);
  rbPODPostSurgical.Checked := (Sender = rbPODPostSurgical);
  cbPODPartialSide.Enabled := rbPODPartialObliteration.Checked;
end;

// --- USL Nodule measurements ---

procedure cbRightUSLNoduleClick(Sender)
begin
  seRightUSLNoduleLength.Enabled := cbRightUSLNodule.Checked;
  seRightUSLNoduleWidth.Enabled := cbRightUSLNodule.Checked;
  seRightUSLNoduleDepth.Enabled := cbRightUSLNodule.Checked;
end;

procedure cbLeftUSLNoduleClick(Sender)
begin
  seLeftUSLNoduleLength.Enabled := cbLeftUSLNodule.Checked;
  seLeftUSLNoduleWidth.Enabled := cbLeftUSLNodule.Checked;
  seLeftUSLNoduleDepth.Enabled := cbLeftUSLNodule.Checked;
end;

// --- Kidneys ---

procedure cbRightKidneyVisualisedClick(Sender)
begin
  cbRightKidneyObstructed.Enabled := cbRightKidneyVisualised.Checked;
  if not cbRightKidneyVisualised.Checked then
    cbRightKidneyObstructed.Checked := False;
end;

procedure cbLeftKidneyVisualisedClick(Sender)
begin
  cbLeftKidneyObstructed.Enabled := cbLeftKidneyVisualised.Checked;
  if not cbLeftKidneyVisualised.Checked then
    cbLeftKidneyObstructed.Checked := False;
end;

// --- Procedures ---

procedure cbSHGPerformedClick(Sender)
begin
  cbSHGFindings.Enabled := cbSHGPerformed.Checked;
end;

procedure cbTubalPatencyPerformedClick(Sender)
begin
  gbTubalPatency.Visible := cbTubalPatencyPerformed.Checked;
end;

// --- Uterus Mobility (radio toggle) ---

procedure UterusMobilityClick(Sender)
begin
  cbUterusMobile.Checked := (Sender = cbUterusMobile);
  cbUterusLimitedMobility.Checked := (Sender = cbUterusLimitedMobility);
  cbUterusFixed.Checked := (Sender = cbUterusFixed);
end;

procedure UterusTendernessClick(Sender)
begin
  cbUterusTender.Checked := (Sender = cbUterusTender);
  cbUterusNonTender.Checked := (Sender = cbUterusNonTender);
end;

// --- Ovary Mobility (radio toggle) ---

procedure cbRightMobileClick(Sender)
begin
  cbRightMobile.Checked := (Sender = cbRightMobile);
  cbRightReducedMobility.Checked := (Sender = cbRightReducedMobility);
  cbRightStuck.Checked := (Sender = cbRightStuck);
  cbRightRigid.Checked := (Sender = cbRightRigid);
end;

procedure cbLeftMobileClick(Sender)
begin
  cbLeftMobile.Checked := (Sender = cbLeftMobile);
  cbLeftReducedMobility.Checked := (Sender = cbLeftReducedMobility);
  cbLeftStuck.Checked := (Sender = cbLeftStuck);
  cbLeftRigid.Checked := (Sender = cbLeftRigid);
end;

procedure cbRightTenderClick(Sender)
begin
  cbRightTender.Checked := (Sender = cbRightTender);
  cbRightNonTender.Checked := (Sender = cbRightNonTender);
end;

procedure cbLeftTenderClick(Sender)
begin
  cbLeftTender.Checked := (Sender = cbLeftTender);
  cbLeftNonTender.Checked := (Sender = cbLeftNonTender);
end;

// ======================== StartScript =====================================//

procedure StartScript
begin
  // --- Scan Type ---
  cbTransvaginal.OnClick := 'cbTransvaginalClick';

  // --- Medication ---
  cxccbMedication.Properties.OnChange := 'cxccbMedicationChange';

  // --- Surgical History ---
  cxccbPastSurgery.Properties.OnChange := 'cxccbPastSurgeryChange';

  // --- Uterus ---
  cbHysterectomy.OnClick := 'cbHysterectomyClick';
  cbAdenomyosis.OnClick := 'cbAdenomyosisClick';
  cbFibroidsPresent.OnClick := 'cbFibroidsPresentClick';
  spFibroidCount.Properties.OnChange := 'spFibroidCountChange';

  // --- Endometrium ---
  cbFocalLesion.OnClick := 'cbFocalLesionClick';
  cbRPOC.OnClick := 'cbRPOCClick';

  // --- Ovary Status ---
  cbRightOvaryStatus.Properties.OnChange := 'cbRightOvaryStatusChange';
  cbLeftOvaryStatus.Properties.OnChange := 'cbLeftOvaryStatusChange';

  // --- Common Pathologies ---
  cbRightSimpleCyst.OnClick := 'cbRightSimpleCystClick';
  cbLeftSimpleCyst.OnClick := 'cbLeftSimpleCystClick';
  cbRightEndometrioma.OnClick := 'cbRightEndometriomaClick';
  cbLeftEndometrioma.OnClick := 'cbLeftEndometriomaClick';
  seRightEndometriomaCount.Properties.OnChange := 'seRightEndometriomaCountChange';
  seLeftEndometriomaCount.Properties.OnChange := 'seLeftEndometriomaCountChange';
  cbRightDermoid.OnClick := 'cbRightDermoidClick';
  cbLeftDermoid.OnClick := 'cbLeftDermoidClick';
  cbRightFibroma.OnClick := 'cbRightFibromaClick';
  cbLeftFibroma.OnClick := 'cbLeftFibromaClick';

  // --- Endometriosis ---
  cbBladderNodule.OnClick := 'cbBladderNoduleClick';
  cbVaginalNodule.OnClick := 'cbVaginalNoduleClick';
  cbRetroCervicalNodule.OnClick := 'cbRetroCervicalNoduleClick';
  cbBowelNodulePresent.OnClick := 'cbBowelNodulePresentClick';
  spBowelNoduleCount.Properties.OnChange := 'spBowelNoduleCountChange';

  // POD obliteration
  rbPODNoObliteration.OnClick := 'PODObliterationClick';
  rbPODPartialObliteration.OnClick := 'PODObliterationClick';
  rbPODCompleteObliteration.OnClick := 'PODObliterationClick';
  rbPODPostSurgical.OnClick := 'PODObliterationClick';

  // Uterus mobility/tenderness
  cbUterusMobile.OnClick := 'UterusMobilityClick';
  cbUterusLimitedMobility.OnClick := 'UterusMobilityClick';
  cbUterusFixed.OnClick := 'UterusMobilityClick';
  cbUterusTender.OnClick := 'UterusTendernessClick';
  cbUterusNonTender.OnClick := 'UterusTendernessClick';

  // USL nodule measurements
  cbRightUSLNodule.OnClick := 'cbRightUSLNoduleClick';
  cbLeftUSLNodule.OnClick := 'cbLeftUSLNoduleClick';

  // --- Kidneys ---
  cbRightKidneyVisualised.OnClick := 'cbRightKidneyVisualisedClick';
  cbLeftKidneyVisualised.OnClick := 'cbLeftKidneyVisualisedClick';

  // --- Procedures ---
  cbSHGPerformed.OnClick := 'cbSHGPerformedClick';
  cbTubalPatencyPerformed.OnClick := 'cbTubalPatencyPerformedClick';

  // --- Ovary mobility/tenderness ---
  cbRightMobile.OnClick := 'cbRightMobileClick';
  cbRightReducedMobility.OnClick := 'cbRightMobileClick';
  cbRightStuck.OnClick := 'cbRightMobileClick';
  cbRightRigid.OnClick := 'cbRightMobileClick';
  cbLeftMobile.OnClick := 'cbLeftMobileClick';
  cbLeftReducedMobility.OnClick := 'cbLeftMobileClick';
  cbLeftStuck.OnClick := 'cbLeftMobileClick';
  cbLeftRigid.OnClick := 'cbLeftMobileClick';

  cbRightTender.OnClick := 'cbRightTenderClick';
  cbRightNonTender.OnClick := 'cbRightTenderClick';
  cbLeftTender.OnClick := 'cbLeftTenderClick';
  cbLeftNonTender.OnClick := 'cbLeftTenderClick';
end;
