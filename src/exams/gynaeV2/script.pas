// ******************* GynaeV2 UI Control Script ****************************//
//
// Handles show/hide logic and form control interactions for the gynaeV2 form.
// This script wires up event handlers and manages conditional visibility
// of form sections based on user input.
//

// ======================== Event Handlers ==================================//

// --- Scan Type ---

procedure cbTransvaginalClick(Sender: TObject);
begin
  cbPainWithProbe.Enabled := cbTransvaginal.Checked;
  if not cbTransvaginal.Checked then
    cbPainWithProbe.Checked := False;
end;

// --- Medication ---

procedure cxccbMedicationChange(Sender: TObject);
var
  HasOther: Boolean;
begin
  HasOther := Pos('Other', cxccbMedication.Text) > 0;
  edtOtherMedication.Enabled := HasOther;
  if not HasOther then
    edtOtherMedication.Text := '';
end;

// --- Surgical History ---

procedure cxccbPastSurgeryChange(Sender: TObject);
var
  HasLap: Boolean;
begin
  HasLap := Pos('Lap', cxccbPastSurgery.Text) > 0;
  gbLaparoscopy.Visible := HasLap;
end;

// --- Uterus ---

procedure cbHysterectomyClick(Sender: TObject);
begin
  cbCervixPresent.Visible := cbHysterectomy.Checked;
  if not cbHysterectomy.Checked then
    cbCervixPresent.Checked := False;
end;

procedure cbCongenitalAbnormalityClick(Sender: TObject);
begin
  gbCongenitalAbnormality.Visible := TcxCheckBox(Sender).Checked;
end;

procedure cbAdenomyosisClick(Sender: TObject);
begin
  gbAdenomyosis.Visible := cbAdenomyosis.Checked;
end;

procedure cbFibroidsPresentClick(Sender: TObject);
begin
  gbFibroids.Visible := cbFibroidsPresent.Checked;
end;

procedure spFibroidCountChange(Sender: TObject);
var
  I, Count: Integer;
  gb: TcxGroupBox;
begin
  Count := spFibroidCount.Value;
  for I := 1 to 8 do
  begin
    gb := TcxGroupBox(FindComponent('gbFibroid' + IntToStr(I)));
    if gb <> nil then
      gb.Visible := (I <= Count);
  end;
end;

// --- Endometrium ---

procedure cbFocalLesionClick(Sender: TObject);
begin
  gbPolyps.Visible := cbFocalLesion.Checked;
end;

procedure cbRPOCClick(Sender: TObject);
begin
  gbRPOC.Visible := cbRPOC.Checked;
end;

// --- Ovaries ---

procedure UpdateOvaryVisibility(const Side: String);
var
  cbStatus: TcxComboBox;
  IsVisible: Boolean;
begin
  cbStatus := TcxComboBox(FindComponent('cb' + Side + 'OvaryStatus'));
  if cbStatus = nil then Exit;

  IsVisible := (cbStatus.Text = 'identified');

  TcxSpinEdit(FindComponent('se' + Side + 'OvaryLength')).Enabled := IsVisible;
  TcxSpinEdit(FindComponent('se' + Side + 'OvaryWidth')).Enabled := IsVisible;
  TcxSpinEdit(FindComponent('se' + Side + 'OvaryHeight')).Enabled := IsVisible;
  TcxSpinEdit(FindComponent('se' + Side + 'OvaryCC')).Enabled := IsVisible;
  TcxComboBox(FindComponent('cb' + Side + 'OvaryAppearance')).Enabled := IsVisible;
  TcxSpinEdit(FindComponent('se' + Side + 'AFC')).Enabled := IsVisible;
  TcxSpinEdit(FindComponent('se' + Side + 'MaxFollicle')).Enabled := IsVisible;
end;

procedure cbRightOvaryStatusChange(Sender: TObject);
begin
  UpdateOvaryVisibility('Right');
end;

procedure cbLeftOvaryStatusChange(Sender: TObject);
begin
  UpdateOvaryVisibility('Left');
end;

// --- Common Pathologies ---

procedure UpdateSimplePathologyEnable(cb: TcxCheckBox; const Prefix: String);
begin
  TcxSpinEdit(FindComponent(Prefix + 'L')).Enabled := cb.Checked;
  TcxSpinEdit(FindComponent(Prefix + 'W')).Enabled := cb.Checked;
  TcxSpinEdit(FindComponent(Prefix + 'D')).Enabled := cb.Checked;
end;

procedure cbRightSimpleCystClick(Sender: TObject);
begin
  UpdateSimplePathologyEnable(cbRightSimpleCyst, 'seRightSimpleCyst');
end;

procedure cbLeftSimpleCystClick(Sender: TObject);
begin
  UpdateSimplePathologyEnable(cbLeftSimpleCyst, 'seLeftSimpleCyst');
end;

procedure cbRightDermoidClick(Sender: TObject);
begin
  UpdateSimplePathologyEnable(cbRightDermoid, 'seRightDermoid');
end;

procedure cbLeftDermoidClick(Sender: TObject);
begin
  UpdateSimplePathologyEnable(cbLeftDermoid, 'seLeftDermoid');
end;

procedure cbRightFibromaClick(Sender: TObject);
begin
  UpdateSimplePathologyEnable(cbRightFibroma, 'seRightFibroma');
end;

procedure cbLeftFibromaClick(Sender: TObject);
begin
  UpdateSimplePathologyEnable(cbLeftFibroma, 'seLeftFibroma');
end;

// --- Endometrioma (multiple support) ---

procedure UpdateEndometriomaEntries(const Side: String; cb: TcxCheckBox; seCount: TcxSpinEdit);
var
  I, Count: Integer;
  gb: TcxGroupBox;
begin
  seCount.Enabled := cb.Checked;
  if cb.Checked then
    Count := seCount.Value
  else
    Count := 0;

  for I := 1 to 3 do
  begin
    gb := TcxGroupBox(FindComponent('gb' + Side + 'Endometrioma' + IntToStr(I)));
    if gb <> nil then
      gb.Visible := (I <= Count);
  end;
end;

procedure cbRightEndometriomaClick(Sender: TObject);
begin
  UpdateEndometriomaEntries('Right', cbRightEndometrioma, seRightEndometriomaCount);
end;

procedure cbLeftEndometriomaClick(Sender: TObject);
begin
  UpdateEndometriomaEntries('Left', cbLeftEndometrioma, seLeftEndometriomaCount);
end;

procedure seRightEndometriomaCountChange(Sender: TObject);
begin
  UpdateEndometriomaEntries('Right', cbRightEndometrioma, seRightEndometriomaCount);
end;

procedure seLeftEndometriomaCountChange(Sender: TObject);
begin
  UpdateEndometriomaEntries('Left', cbLeftEndometrioma, seLeftEndometriomaCount);
end;

// --- Endometriosis (TdxLayoutControl groups) ---

procedure cbBladderNoduleClick(Sender: TObject);
begin
  lgBladderDetails.Visible := cbBladderNodule.Checked;
  lgBladderLocation.Visible := cbBladderNodule.Checked;
end;

procedure cbVaginalNoduleClick(Sender: TObject);
begin
  lgVaultDetails.Visible := cbVaginalNodule.Checked;
end;

procedure cbRetroCervicalNoduleClick(Sender: TObject);
begin
  lgRCDetails.Visible := cbRetroCervicalNodule.Checked;
end;

procedure cbBowelNodulePresentClick(Sender: TObject);
begin
  lgBowelDetails.Visible := cbBowelNodulePresent.Checked;
end;

procedure spBowelNoduleCountChange(Sender: TObject);
var
  Count: Integer;
begin
  Count := spBowelNoduleCount.Value;
  lgBowelNod1.Visible := (Count >= 1);
  lgBowelNod2.Visible := (Count >= 2);
  lgBowelNod3.Visible := (Count >= 3);
end;

procedure rbPODPartialObliterationClick(Sender: TObject);
begin
  cbPODPartialSide.Enabled := rbPODPartialObliteration.Checked;
end;

// --- USL Nodule measurements ---

procedure cbRightUSLNoduleClick(Sender: TObject);
begin
  seRightUSLNoduleLength.Enabled := cbRightUSLNodule.Checked;
  seRightUSLNoduleWidth.Enabled := cbRightUSLNodule.Checked;
  seRightUSLNoduleDepth.Enabled := cbRightUSLNodule.Checked;
end;

procedure cbLeftUSLNoduleClick(Sender: TObject);
begin
  seLeftUSLNoduleLength.Enabled := cbLeftUSLNodule.Checked;
  seLeftUSLNoduleWidth.Enabled := cbLeftUSLNodule.Checked;
  seLeftUSLNoduleDepth.Enabled := cbLeftUSLNodule.Checked;
end;

// --- Kidneys ---

procedure cbRightKidneyVisualisedClick(Sender: TObject);
begin
  cbRightKidneyObstructed.Enabled := cbRightKidneyVisualised.Checked;
  if not cbRightKidneyVisualised.Checked then
    cbRightKidneyObstructed.Checked := False;
end;

procedure cbLeftKidneyVisualisedClick(Sender: TObject);
begin
  cbLeftKidneyObstructed.Enabled := cbLeftKidneyVisualised.Checked;
  if not cbLeftKidneyVisualised.Checked then
    cbLeftKidneyObstructed.Checked := False;
end;

// --- Procedures ---

procedure cbSHGPerformedClick(Sender: TObject);
begin
  cbSHGFindings.Enabled := cbSHGPerformed.Checked;
end;

procedure cbTubalPatencyPerformedClick(Sender: TObject);
begin
  gbTubalPatency.Visible := cbTubalPatencyPerformed.Checked;
end;

// --- POD Obliteration toggle (radio-button behaviour) ---

procedure PODObliterationClick(Sender: TObject);
var
  Clicked: TcxCheckBox;
begin
  Clicked := TcxCheckBox(Sender);
  if Clicked <> rbPODNoObliteration then rbPODNoObliteration.Checked := False;
  if Clicked <> rbPODPartialObliteration then rbPODPartialObliteration.Checked := False;
  if Clicked <> rbPODCompleteObliteration then rbPODCompleteObliteration.Checked := False;
  if Clicked <> rbPODPostSurgical then rbPODPostSurgical.Checked := False;
  cbPODPartialSide.Enabled := rbPODPartialObliteration.Checked;
end;

// --- Uterus mobility toggle ---

procedure UterusMobilityClick(Sender: TObject);
var
  Clicked: TcxCheckBox;
begin
  Clicked := TcxCheckBox(Sender);
  if Clicked <> cbUterusMobile then cbUterusMobile.Checked := False;
  if Clicked <> cbUterusLimitedMobility then cbUterusLimitedMobility.Checked := False;
  if Clicked <> cbUterusFixed then cbUterusFixed.Checked := False;
end;

procedure UterusTendernessClick(Sender: TObject);
var
  Clicked: TcxCheckBox;
begin
  Clicked := TcxCheckBox(Sender);
  if Clicked <> cbUterusTender then cbUterusTender.Checked := False;
  if Clicked <> cbUterusNonTender then cbUterusNonTender.Checked := False;
end;

// --- Ovary mobility toggle ---

procedure OvaryMobilityClick(Sender: TObject);
var
  Clicked: TcxCheckBox;
  Side: String;
  cbMob, cbRed, cbStk, cbRig: TcxCheckBox;
begin
  Clicked := TcxCheckBox(Sender);
  if Pos('Right', Clicked.Name) > 0 then Side := 'Right' else Side := 'Left';
  cbMob := TcxCheckBox(FindComponent('cb' + Side + 'Mobile'));
  cbRed := TcxCheckBox(FindComponent('cb' + Side + 'ReducedMobility'));
  cbStk := TcxCheckBox(FindComponent('cb' + Side + 'Stuck'));
  cbRig := TcxCheckBox(FindComponent('cb' + Side + 'Rigid'));
  if Clicked <> cbMob then cbMob.Checked := False;
  if Clicked <> cbRed then cbRed.Checked := False;
  if Clicked <> cbStk then cbStk.Checked := False;
  if Clicked <> cbRig then cbRig.Checked := False;
end;

procedure OvaryTendernessClick(Sender: TObject);
var
  Clicked: TcxCheckBox;
  Side: String;
  cbT, cbNT: TcxCheckBox;
begin
  Clicked := TcxCheckBox(Sender);
  if Pos('Right', Clicked.Name) > 0 then Side := 'Right' else Side := 'Left';
  cbT := TcxCheckBox(FindComponent('cb' + Side + 'Tender'));
  cbNT := TcxCheckBox(FindComponent('cb' + Side + 'NonTender'));
  if Clicked <> cbT then cbT.Checked := False;
  if Clicked <> cbNT then cbNT.Checked := False;
end;

// ======================== StartScript =====================================//

procedure StartScript;
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

  // --- Endometriosis (TdxLayoutControl groups) ---
  cbBladderNodule.OnClick := 'cbBladderNoduleClick';
  cbVaginalNodule.OnClick := 'cbVaginalNoduleClick';
  cbRetroCervicalNodule.OnClick := 'cbRetroCervicalNoduleClick';
  cbBowelNodulePresent.OnClick := 'cbBowelNodulePresentClick';
  spBowelNoduleCount.Properties.OnChange := 'spBowelNoduleCountChange';

  // POD obliteration (radio toggle)
  rbPODNoObliteration.OnClick := 'PODObliterationClick';
  rbPODPartialObliteration.OnClick := 'PODObliterationClick';
  rbPODCompleteObliteration.OnClick := 'PODObliterationClick';
  rbPODPostSurgical.OnClick := 'PODObliterationClick';

  // Uterus mobility/tenderness (radio toggle)
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

  // --- Ovary mobility/tenderness (radio toggle) ---
  cbRightMobile.OnClick := 'OvaryMobilityClick';
  cbRightReducedMobility.OnClick := 'OvaryMobilityClick';
  cbRightStuck.OnClick := 'OvaryMobilityClick';
  cbRightRigid.OnClick := 'OvaryMobilityClick';
  cbLeftMobile.OnClick := 'OvaryMobilityClick';
  cbLeftReducedMobility.OnClick := 'OvaryMobilityClick';
  cbLeftStuck.OnClick := 'OvaryMobilityClick';
  cbLeftRigid.OnClick := 'OvaryMobilityClick';

  cbRightTender.OnClick := 'OvaryTendernessClick';
  cbRightNonTender.OnClick := 'OvaryTendernessClick';
  cbLeftTender.OnClick := 'OvaryTendernessClick';
  cbLeftNonTender.OnClick := 'OvaryTendernessClick';
end;
