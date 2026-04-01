procedure cxccbClinicalHistoryChange(Sender);
begin
  edtOtherPastHistory.Enabled := (cxccbClinicalHistory.States[cxccbClinicalHistory.Properties.Items.Count-1] = 1);
end;

procedure cxcbGynaeSurgeryChange(Sender)
begin
  edtOtherPastSurgery.Enabled:= (cxcbGynaeSurgery.States[cxcbGynaeSurgery.Properties.Items.Count-1] = 1);
end;

procedure cxcbFamilyHistoryChange(Sender)
begin
  edtOtherFamilyHistory.Enabled:= (cxcbFamilyHistory.States[cxcbFamilyHistory.Properties.Items.Count-1] = 1);
end;

procedure cbMedicationChange(Sender)
begin
  edtOtherMedication.Enabled := (cbMedication.ItemIndex = (cbMedication.Properties.Items.Count - 1));
end;

procedure cbEndometriumChange(Sender)
begin
  case cbEndometrium.ItemIndex of
    2, 3:
      begin
        cbRightCorpusLuteum.Checked := False;
        cbLeftCorpusLuteum.Checked := False;
      end
      3:
      begin
      end;
  else
    begin
      cbRightLeadFollicle.Checked := False;
      cbLeftLeadFollicle.Checked := False;
      cbRightCorpusLuteum.Checked := False;
      cbLeftCorpusLuteum.Checked := False;
    end;
  end;
  if cbendometrium.itemindex = 8 then
  begin
     if seEdometriumThickness.value > 3.9 then
     begin
       showMessage('Error: Measurement incompatible with normal postmenopausal endometrium < 4.0 mm.  ');
     end
  end;
end;

procedure seRightOvarianCystsCountOnChange(Sender)
begin
  gbRightOvarianCyst1.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0);
  gbRightOvarianCyst2.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1);
  gbRightOvarianCyst3.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 2);
  gbRightOvarianCyst4.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 3);
end;

procedure sePolypCountOnChange(Sender)
begin
  edtpolypLength1.Enabled := (sePolypCount.Enabled)  and (sePolypCount.Value > 0);
  edtpolypWidth1.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 0);
  edtpolypDepth1.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 0);
  edtpolypLength2.Enabled := (sePolypCount.Enabled)  and (sePolypCount.Value > 1);
  edtpolypWidth2.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 1);
  edtpolypDepth2.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 1);
end;

procedure cbCervicalPolypOnClick(Sender)
begin
  edtCervicalpolypLength1.Enabled := cbCervicalPolyp.Checked;
  edtCervicalpolypWidth1.Enabled := cbCervicalPolyp.Checked;
  edtCervicalpolypDepth1.Enabled := cbCervicalPolyp.Checked;
end;

procedure seLeftOvarianCystsCountOnChange(Sender)
begin
  gbLeftOvarianCyst1.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0);
  gbLeftOvarianCyst2.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1);
  gbLeftOvarianCyst3.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 2);
  gbLeftOvarianCyst4.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 3);
end;

procedure seRightResidualFolCountOnChange(Sender)
begin
  if seRightResidualFolCount.Value = 0 then
  begin
    seRightFollicle1Size.Enabled := False;
    seRightFolSize.Enabled := False;
  end
  else if seRightResidualFolCount.Value = 1 then
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := False;
  end;
  else
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := true;
  end;
end;

procedure seLeftResidualFolCountOnChange(Sender)
begin
  if seLeftResidualFolCount.Value = 0 then
  begin
    seLeftFollicle1Size.Enabled := False;
    seLeftFolSize.Enabled := False;
  end
  else if seLeftResidualFolCount.Value = 1 then
  begin
    seLeftFollicle1Size.Enabled := True;
    seLeftFolSize.Enabled := False;
  end;
  else
  begin
    seLeftFollicle1Size.Enabled := True;
    seLeftFolSize.Enabled := true;
  end;
end;

procedure seRightFolCountOnChange(Sender)
begin
  cbRightPCO.Checked := False;
  cbRightAFO.Checked := False;
  cbRightOFO.Checked := False;
  // cbRightPCO.Enabled := seRightFolCount.Value < 12;
  if seRightFolCount.Value = 0 then
  begin
    seRightFollicle1Size.Enabled := False;
    seRightFolSize.Enabled := False;
  end
  else if seRightFolCount.Value = 1 then
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := False;
    cbRightOFO.Checked  := ((seRightFolCount.Value > 0) and (seRightFolCount.Value < 4) and (cbRightOvaryIdentified.checked));
  end
  else
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := True;
    cbRightPCO.Checked := seRightFolCount.Value > 24;
    cbRightAFO.Checked := ((seRightFolCount.Value > 3) and (seRightFolCount.Value < 25) and (cbRightOvaryIdentified.checked));
    cbRightOFO.Checked  := (seRightFolCount.Value > 0) and (seRightFolCount.Value < 4)and (cbRightOvaryIdentified.checked);
  end;
end;

procedure seLeftFolCountOnChange(Sender)
begin
 // cbLeftPCO.Enabled := seLeftFolCount.Value < 12;
  cbLeftPCO.Checked := False;
  cbLeftAFO.Checked := False;
  cbLeftOFO.Checked := False;
  if seleftFolCount.Value = 0 then
  begin
    seleftFollicle1Size.Enabled := False;
    seleftFolSize.Enabled := False;
  end
  else if seleftFolCount.Value = 1 then
  begin
    seleftFollicle1Size.Enabled := True;
    seleftFolSize.Enabled := False;
    cbLeftOFO.Checked := (seLeftFolCount.Value > 0) and (seLeftFolCount.Value < 4) and (cbLeftOvaryIdentified.checked);
  end
  else
  begin
    cbLeftPCO.Checked := seLeftFolCount.Value > 24;
    cbLeftAFO.Checked := (seLeftFolCount.Value > 3) and (seLeftFolCount.Value < 25) and (cbLeftOvaryIdentified.checked);
    cbLeftOFO.Checked := (seLeftFolCount.Value > 0) and (seLeftFolCount.Value < 4) and (cbLeftOvaryIdentified.checked);
    seleftFollicle1Size.Enabled := True;
    seleftFolSize.Enabled := True;
  end;
end;

procedure seRightAdnexalMassesOnChange(Sender)
begin
  gbRightCyst1.Visible := (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0);
  gbRightCyst2.Visible := (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 1);
  gbRightCyst3.Visible := (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 2);
end;

procedure seLeftAdnexalMassesOnChange(Sender)
begin
  gbLeftCyst1.Visible := (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0);
  gbLeftCyst2.Visible := (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 1);
  gbLeftCyst3.Visible := (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 2);
end;

procedure seRightCorpusLuteumOnChange(Sender)
begin
   if ((seRightCorpusLuteum.Enabled) and (seRightCorpusLuteum.Value > 0)) then
       cbRightCorpusLuteum.checked := True
   else
       cbRightCorpusLuteum.checked := False;
end;

procedure seRightLeadFollicleOnChange(Sender)
begin
   if ((seRightLeadFollicle.Enabled) and (seRightLeadFollicle.Value > 0)) then
       cbRightLeadFollicle.checked := True
   else
       cbRightLeadFollicle.checked := False;
end;

procedure seLeftLeadFollicleOnChange(Sender)
begin
   if (seLeftLeadFollicle.Enabled and seLeftLeadFollicle.Value > 0) then
       cbLeftLeadFollicle.checked := True
   else
       cbLeftLeadFollicle.checked := False;
end;

procedure seLeftCorpusLuteumOnChange(Sender)
begin
   if ((seLeftCorpusLuteum.Enabled) and (seLeftCorpusLuteum.Value > 0)) then
       cbLeftCorpusLuteum.checked := True
   else
       cbLeftCorpusLuteum.checked := False;
end;

Procedure cbROPPYesOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblNumber.Enabled := cbROPPYes.checked;
   seROPPNumber.Enabled := cbROPPYes.checked;
   lblPPLargest.Enabled := cbROPPYes.checked;
   seROPPL.Enabled := cbROPPYes.checked;
   seROPPW.Enabled := cbROPPYes.checked;
   seROPPD.Enabled := cbROPPYes.checked;
end;

Procedure cbROPPNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblNumber.Enabled := cbROPPYes.checked;
   seROPPNumber.Enabled := cbROPPYes.checked;
   lblPPLargest.Enabled := cbROPPYes.checked;
   seROPPL.Enabled := cbROPPYes.checked;
   seROPPW.Enabled := cbROPPYes.checked;
   seROPPD.Enabled := cbROPPYes.checked;
   lblPPMeasure.Enabled := cbROPPYes.checked;
end;

Procedure ccbROInternalContentsChange(sender)
begin
    ccbROMixed.Enabled := (ccbROInternalContents.ItemIndex = 4);
end;

procedure cbROSolidElementsNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblSolidNumber.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidElementsNumber.Enabled :=  cbROSolidElementsYes.Checked;
   lblSolidLargest.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidEleL.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidEleW.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidEleD.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSoliEleVol.Enabled :=  cbROSolidElementsYes.Checked;
   lblSolidMeasure.Enabled :=  cbROSolidElementsYes.Checked;
   lblSolidVolMeasure.Enabled :=  cbROSolidElementsYes.Checked;
end;

procedure cbROVSYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblROPPColour.Enabled   :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   ccbROPPDoppler.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   lblROPPRI.Enabled  :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   seROPPRI.Enabled  :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   lblROPPPSV.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   seROPPPSV.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   lblPPPSVMeasure.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
end;

procedure cbROSeptumYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblROSepColour.Enabled   :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   ccbROSepDoppler.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   lblROSepRI.Enabled  :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   seROSepRI.Enabled  :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   lblROSepPSV.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   seROSepPSV.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   lblSepPSVMeasure.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
end;

procedure cbROSolidYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblROSolidColour.Enabled   :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   ccbROSolidDoppler.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   lblROSolidRI.Enabled  :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   seROSolidRI.Enabled  :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   lblROSolidPSV.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   seROSolidPSV.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   lblSolidPSVMeasure.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
end;

procedure cbLOVSYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOPPColour.Enabled   :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   ccbLOPPDoppler.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   lblLOPPRI.Enabled  :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   seLOPPRI.Enabled  :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   lblLOPPPSV.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   seLOPPPSV.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   lblLoPPPSVMeasure.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
end;

procedure cbLOSeptumYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOSepColour.Enabled   :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   ccbLOSepDoppler.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   lblLOSepRI.Enabled  :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   seLOSepRI.Enabled  :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   lblLOSepPSV.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   seLOSepPSV.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   lblLOSepPSVMeasure.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
end;

procedure cbLOSolidYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOSolidColour.Enabled   :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   ccbLOSolidDoppler.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   lblLOSolidRI.Enabled  :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   seLOSolidRI.Enabled  :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   lblLOSolidPSV.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   seLOSolidPSV.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   lblLOSolidPSVMeasure.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
end;

Procedure cbLOPPYesOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLONumber.Enabled := cbLOPPYes.checked;
   seLOPPNumber.Enabled := cbLOPPYes.checked;
   lblLOPPLargest.Enabled := cbLOPPYes.checked;
   seLOPPL.Enabled := cbLOPPYes.checked;
   seLOPPW.Enabled := cbLOPPYes.checked;
   seLOPPD.Enabled := cbLOPPYes.checked;
end;

Procedure cbLOPPNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLONumber.Enabled := cbLOPPYes.checked;
   seLOPPNumber.Enabled := cbLOPPYes.checked;
   lblLOPPLargest.Enabled := cbLOPPYes.checked;
   seLOPPL.Enabled := cbLOPPYes.checked;
   seLOPPW.Enabled := cbLOPPYes.checked;
   seLOPPD.Enabled := cbLOPPYes.checked;
   lblLOPPMeasure.Enabled := cbLOPPYes.checked;
end;

Procedure ccbLOInternalContentsChange(sender)
begin
    ccbLOMixed.Enabled := (ccbLOInternalContents.ItemIndex = 4);
end;

procedure cbLOSolidElementsNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOSolidNumber.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidElementsNumber.Enabled :=  cbLOSolidElementsYes.Checked;
   lblLOSolidLargest.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidEleL.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidEleW.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidEleD.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSoliEleVol.Enabled :=  cbLOSolidElementsYes.Checked;
   lblLOSolidMeasure.Enabled :=  cbLOSolidElementsYes.Checked;
   lblLOSolidVolMeasure.Enabled :=  cbLOSolidElementsYes.Checked;
end;

procedure cbUterineShapeOnChange(Sender)
begin
  spSeptumlength.Enabled := {(cbUterineShape.ItemIndex = 1) or (cbUterineShape.ItemIndex = 2) or }(cbUterineShape.ItemIndex = 3);
 { lblRightCervix.Visible := cbUterineShape.ItemIndex > 5;
  lblLeftCervix.Visible := cbUterineShape.ItemIndex > 5;
  spRightCerivalLength.Enabled := cbUterineShape.ItemIndex > 5; }

  {lblRCervixMM.Enabled := cbUterineShape.ItemIndex > 2;
  lblLeftUterine.Visible := cbUterineShape.ItemIndex > 2;
  lblRightUterine.Visible := cbUterineShape.ItemIndex > 2;
  seRightUterineCavityLength.Enabled := cbUterineShape.ItemIndex > 2;
  lblRUterineCavityMM.Enabled := cbUterineShape.ItemIndex > 2;   }
end;

procedure cbVBShadowingNotPresentOnClick(sender);
begin
  if cbVBShadowingNotPresent.Checked then
    cbVBShadowingPresent.Checked := False;
end;

procedure cbVBShadowingPresentOnClick(sender);
begin
  if cbVBShadowingPresent.Checked then
    cbVBShadowingNotPresent.Checked := False;
end;

procedure cbOvaryCystTypeOnChange(sender);
begin
  if  sender.selection = 2 then
  begin
    showMessage('Please choose the type of haemorrhagic cyst.');
    sender.selection := 0;
  end;
end;

procedure cbROSmoothYesOnClick(sender);
begin
   cbToggleCheckOnClick(sender);
      cbROMIYes.Enabled := not(cbROSmoothYes.checked);
      cbROMINo.Enabled := not(cbROSmoothYes.checked);
      cbROPPYes.Enabled := not(cbROSmoothYes.checked);
      cbROPPNo.Enabled := not(cbROSmoothYes.checked);
    if (cbROSmoothYes.checked) then//and ((ccbROClassification.ItemIndex = 0) or (ccbROClassification.ItemIndex = 2) )then
    begin
       lblROVascularPP.Enabled := False;
       cbROVSYes.Enabled := False;
       cbROVSNo.Enabled := False;
    end
    else
    begin
       lblROVascularPP.Enabled := True;
       cbROVSYes.Enabled := True;
       cbROVSNo.Enabled := True;
    end;
end;

procedure cbLOSmoothYesOnClick(sender);
begin
   cbToggleCheckOnClick(sender);
      cbLOMIYes.Enabled := not(cbLOSmoothYes.checked);
      cbLOMINo.Enabled := not(cbLOSmoothYes.checked);
      cbLOPPYes.Enabled := not(cbLOSmoothYes.checked);
      cbLOPPNo.Enabled := not(cbLOSmoothYes.checked);
    if (cbLOSmoothYes.checked) then//and ((ccbLOClassification.ItemIndex = 0) or (ccbLOClassification.ItemIndex = 2) )then
    begin
       lblLOVascularPP.Enabled := False;
       cbLOVSYes.Enabled := False;
       cbLOVSNo.Enabled := False;
    end
    else
    begin
       lblLOVascularPP.Enabled := True;
       cbLOVSYes.Enabled := True;
       cbLOVSNo.Enabled := True;
    end;
end;

procedure cbIncVasNotPresentOnClick(Sender)
begin
  if cbIncVasNotPresent.Checked then
    cbIncVasPresent.Checked := False;
end;

procedure cbIncVasPresentOnClick(Sender)
begin
  if cbIncVasPresent.Checked then
    cbIncVasNotPresent.Checked := False;
end;

procedure cbMyometrialCystsNotPresentOnClick(Sender)
begin
  if cbMyometrialCystsNotPresent.Checked then
    cbMyometrialCystsPresent.Checked := False;
end;

procedure cbMyometrialCystsPresentOnClick(Sender)
begin
  if cbMyometrialCystsPresent.Checked then
    cbMyometrialCystsNotPresent.Checked := False;
end;

procedure cbAdenomyosisPresentOnClick(sender)
begin
  if cbAdenomyosisPresent.Checked then
  begin
    cbAdenomyosisNotPresent.Checked := False;
  end;
  ActiveAdenomyosisControls;
end;

procedure cbAdenomyosisNotPresentOnClick(sender)
begin
  if cbAdenomyosisNotPresent.Checked then
  begin
    cbAdenomyosisPresent.Checked := False;
  end;
  ActiveAdenomyosisControls;
end;

procedure cbProceduresPerformedOnClick(sender)
begin
  cbSalinehysterograph.Enabled := cbSalinePerformed.Checked;
  cbTubalPatencyTestSaline.Enabled := cbTubalPerformed.Checked;
  cbTubalPatencyTestLevovist.Enabled := cbTubalLevovistPerformed.Checked;
  seLeftOvarianCystAspiration.Enabled := cbLeftCystAspirationPerf.Checked;
  seRightOvarianCystAspiration.Enabled := cbRightCystAspirationPerf.Checked;
  seAscitesDrainage.Enabled := cbAscitesPerformed.Checked;
end;

procedure cbHysterectomyOnClick(sender)
begin
  cbUterus.Enabled := not cbHysterectomy.Checked;
  cbUterineShape.Enabled := not cbHysterectomy.Checked;
  seUterusLength.Enabled := not cbHysterectomy.Checked;
  seUterusWidth.Enabled := not cbHysterectomy.Checked;
  seUterusHeight.Enabled := not cbHysterectomy.Checked;
  seUterusCC.Enabled := not cbHysterectomy.Checked;
  cbCervixPresentYes.Enabled := cbHysterectomy.Checked;
  cbCervixPresentNo.Enabled := cbHysterectomy.Checked;
  cbVaultNormalYes.Enabled := cbHysterectomy.Checked;
  cbVaultNormalNo.Enabled := cbHysterectomy.Checked;
  if cbHysterectomy.Checked then
  begin
    cbCervixPresentYes.Style.BorderColor := clRed;
    cbCervixPresentYes.Style.BorderStyle := 2;
    cbCervixPresentNo.Style.BorderColor := clRed;
    cbCervixPresentNo.Style.BorderStyle := 2;
    cbVaultNormalYes.Style.BorderColor := clRed;
    cbVaultNormalYes.Style.BorderStyle := 2;
    cbVaultNormalNo.Style.BorderColor := clRed;
    cbVaultNormalNo.Style.BorderStyle := 2;
    seEdometriumThickness.Style.BorderColor := clwindowFrame;
    seEdometriumThickness.Style.BorderStyle := 5;
    seCervicalLength.Style.BorderColor := clwindowFrame;
    seCervicalLength.Style.BorderStyle := 5;
    seUterineCavityLength.Style.BorderColor := clwindowFrame;
    seUterineCavityLength.Style.BorderStyle := 5;
  end
  else
   begin
    cbCervixPresentYes.Style.BorderColor := clwindowFrame;
    cbCervixPresentYes.Style.BorderStyle := 5;
    cbCervixPresentNo.Style.BorderColor := clwindowFrame;
    cbCervixPresentNo.Style.BorderStyle := 5;
    cbVaultNormalYes.Style.BorderColor := clwindowFrame;
    cbVaultNormalYes.Style.BorderStyle := 5;
    cbVaultNormalNo.Style.BorderColor := clwindowFrame;
    cbVaultNormalNo.Style.BorderStyle := 5;
    seEdometriumThickness.Style.BorderColor := clRed;
    seEdometriumThickness.Style.BorderStyle := 2;
    seCervicalLength.Style.BorderColor := clRed;
    seCervicalLength.Style.BorderStyle := 2;
    seUterineCavityLength.Style.BorderColor := clRed;
    seUterineCavityLength.Style.BorderStyle := 2;
  end;
end;

procedure cbCervixPresentYesOnClick(sender)
begin
  if cbCervixPresentYes.Checked then
  begin
    cbCervixPresentNo.Checked := False;
    cbCervixPresentYes.Style.BorderColor := clwindowFrame;
    cbCervixPresentYes.Style.BorderStyle := 5;
    cbCervixPresentNo.Style.BorderColor := clwindowFrame;
    cbCervixPresentNo.Style.BorderStyle := 5;
  end;
  else if not(cbCervixPresentYes.Checked or cbCervixPresentNo.Checked) then
  begin
    cbCervixPresentYes.Style.BorderColor := clRed;
    cbCervixPresentYes.Style.BorderStyle := 2;
    cbCervixPresentNo.Style.BorderColor := clRed;
    cbCervixPresentNo.Style.BorderStyle := 2;
  end;
end;

procedure cbCervixPresentNoOnClick(sender)
begin
  if cbCervixPresentNo.Checked then
  begin
    cbCervixPresentYes.Checked := False;
    cbCervixPresentYes.Style.BorderColor := clwindowFrame;
    cbCervixPresentYes.Style.BorderStyle := 5;
    cbCervixPresentNo.Style.BorderColor := clwindowFrame;
    cbCervixPresentNo.Style.BorderStyle := 5;
  end;
  else if not(cbCervixPresentYes.Checked or cbCervixPresentNo.Checked) then
  begin
    cbCervixPresentYes.Style.BorderColor := clRed;
    cbCervixPresentYes.Style.BorderStyle := 2;
    cbCervixPresentNo.Style.BorderColor := clRed;
    cbCervixPresentNo.Style.BorderStyle := 2;
  end;
end;

procedure cbVaultNormalYesOnClick(sender)
begin
  if cbVaultNormalYes.Checked then
  begin
    cbVaultNormalNo.Checked := False;
    cbVaultNormalYes.Style.BorderColor := clwindowFrame;
    cbVaultNormalYes.Style.BorderStyle := 5;
    cbVaultNormalNo.Style.BorderColor := clwindowFrame;
    cbVaultNormalNo.Style.BorderStyle := 5;
  end
  else if not(cbVaultNormalYes.Checked or cbVaultNormalNo.Checked) then
  begin
     cbVaultNormalYes.Style.BorderColor := clRed;
    cbVaultNormalYes.Style.BorderStyle := 2;
    cbVaultNormalNo.Style.BorderColor := clRed;
    cbVaultNormalNo.Style.BorderStyle := 2;
  end;
end;

procedure cbVaultNormalNoOnClick(sender)
begin
  if cbVaultNormalNo.Checked then
  begin
    cbVaultNormalYes.Checked := False;
    cbVaultNormalYes.Style.BorderColor := clwindowFrame;
    cbVaultNormalYes.Style.BorderStyle := 5;
    cbVaultNormalNo.Style.BorderColor := clwindowFrame;
    cbVaultNormalNo.Style.BorderStyle := 5;
  end
  else if not(cbVaultNormalYes.Checked or cbVaultNormalNo.Checked) then
  begin
     cbVaultNormalYes.Style.BorderColor := clRed;
    cbVaultNormalYes.Style.BorderStyle := 2;
    cbVaultNormalNo.Style.BorderColor := clRed;
    cbVaultNormalNo.Style.BorderStyle := 2;
  end;
end;

Procedure seEdometriumThicknessOnChange(sender)
begin
    if seEdometriumThickness.value > 0 then
    begin
       if  ((seEdometriumThickness.value > 3.9) and (cbEndometrium.itemindex = 8)) then
       begin
          ShowMessage('Error: Measurement incompatible with normal postmenopausal endometrium < 4.0 mm.  ');
       end;
    end;
end;

Procedure cbPostMenopausalOnClick(Sender)
begin
    cbHRTYes.Enabled := cbPostMenopausal.checked;
    cbHRTNo.Enabled := cbPostMenopausal.checked;
    lblHRT.Enabled := cbPostMenopausal.checked;
    seRightResidualFolCount.visible := cbPostMenopausal.checked;
    lblResidualFollicleCount.visible := cbPostMenopausal.checked;
    seLeftResidualFolCount.visible := cbPostMenopausal.checked;
    lblLeftResidualFollicleCount.visible := cbPostMenopausal.checked;
    seRightFolCount.visible := not(cbPostMenopausal.checked);
    lblRightFollicleRange.visible := not(cbPostMenopausal.checked);
    seLeftFolCount.visible := not(cbPostMenopausal.checked);
    lblLeftFollicleRange.visible := not(cbPostMenopausal.checked);
    if (not(seRightFolCount.visible)) then
       seRightFolCount.value := 0
    if (not(seleftFolCount.visible)) then
       seleftFolCount.value := 0
end;

procedure deLMPDateOnChange(sender)
begin
  try
    spStartDay.Value := Max(1, (trunc(Now - deLMPDate.Date) + 1));
  except
    spStartDay.Value := 1;
  end;
end;

procedure tcbMedicationChange(Sender)
begin
  if (tcbMedication.selection = 22) then
    edtOtherMedication.Enabled :=true;
  else
    edtOtherMedication.Enabled :=False;
end;
