procedure cbNaturalMedicationOnChange(sender)
begin
  edtMedicationOther.Enabled := (cbNaturalMedication.ItemIndex = (cbNaturalMedication.Properties.Items.Count - 1));
end;

procedure cbClinicalHistoryOnChange(sender)      
begin
  edtClicnicalHistory.Enabled := (cbClinicalHistory.States[cbClinicalHistory.Properties.Items.Count-1] = 1);
end;

procedure cbClinicalHistoryChange(Sender);
begin
  edtClicnicalHistory.Enabled := (cbClinicalHistory.States[cbClinicalHistory.Properties.Items.Count-1] = 1);
end;

procedure cbYolkSacYes1OnClick(sender);
begin
  if cbYolkSacYes1.Checked then
  begin
    cbYolkSacNo1.Checked := False;
    edtYolkSacSize1.Enabled := True;
  end
  else
  begin
    edtYolkSacSize1.Enabled := False;
  end;
end;

procedure cbYolkSacNo1OnClick(sender);
begin
  if cbYolkSacNo1.Checked then
    cbYolkSacYes1.Checked := False;
  edtYolkSacSize1.Enabled := False;
end;

procedure cbHeartMotionVisYes1OnClick(sender)
begin
  if cbHeartMotionVisYes1.Checked then
  begin
    cbHeartMotionVisNo1.Checked := False;
    seHeartBPM1.Enabled := True;
    cbHeartMotion1.Enabled := True;
    cbHeartMotMMode1.Enabled := False;
    cbHeartMotColDop1.Enabled := False;
  end
  else
  begin
    seHeartBPM1.Enabled := False;
    cbHeartMotion1.Enabled := False;
    cbHeartMotMMode1.Enabled := false;
    cbHeartMotColDop1.Enabled := false;
  end;
end;

procedure cbHeartMotionVisNo1OnClick(sender)
begin
  if cbHeartMotionVisNo1.Checked then
  begin
    cbHeartMotionVisYes1.Checked := False;
    cbHeartMotMMode1.Enabled := True;
    cbHeartMotColDop1.Enabled := True;
  end
  else
  begin
    cbHeartMotMMode1.Enabled := false;
    cbHeartMotColDop1.Enabled := false;
  end;
  seHeartBPM1.Enabled := False;
  cbHeartMotion1.Enabled := False;
end;

procedure cbEmbryo1NotVisualised1OnClick(sender);
begin
  if cbEmbryo1NotVisualised1.Checked then
    cbEmbryo1Visualised1.Checked := False;
  edtEmbroSize1.Enabled := False;
  seEmbryoWeeks1.Enabled := False;
  seEmbryoDays1.Enabled := False;
  cbHeartMotionVisYes1.Enabled := False;
  cbHeartMotionVisNo1.Enabled := False;
  lblHeartRate1.Enabled := False;
  lblHeartVisualised1.Enabled := False;
  seHeartBPM1.Enabled := False;
  cbHeartMotion1.Enabled := False;
  cbHeartMotMMode1.Enabled := False;
  cbHeartMotColDop1.Enabled := False;
end;

procedure cbEmbryo1Visualised1OnClick(sender);
begin
  if cbEmbryo1Visualised1.Checked then
  begin
    cbEmbryo1NotVisualised1.Checked := False;
    edtEmbroSize1.Enabled := True;
    seEmbryoWeeks1.Enabled := True;
    seEmbryoDays1.Enabled := True;
    cbHeartMotionVisYes1.Enabled := True;
    lblHeartRate1.Enabled := False;
    lblHeartVisualised1.Enabled := True;
    cbHeartMotionVisNo1.Enabled := True;
    cbHeartMotionVisYes1OnClick(nil);
  end
  else
  begin
    edtEmbroSize1.Enabled := False;
    seEmbryoWeeks1.Enabled := False;
    seEmbryoDays1.Enabled := False;
    cbHeartMotionVisYes1.Enabled := False;
    lblHeartRate1.Enabled := False;
    lblHeartVisualised1.Enabled := False;
    cbHeartMotionVisNo1.Enabled := False;
    seHeartBPM1.Enabled := False;
    cbHeartMotion1.Enabled := False;
    cbHeartMotMMode1.Enabled := False;
    cbHeartMotColDop1.Enabled := False;
  end;
end;

procedure cbPreigHeamYesOnClick(Sender)
begin
  if cbPreigHeamYes.Checked then
    cbPreigHeamNo.Checked := False;
end;

procedure cbPreigHeamNoOnClick(Sender)
begin
  if cbPreigHeamNo.Checked then
    cbPreigHeamYes.Checked := False;
end;

procedure edtEmbroSize1OnChange(Sender);
begin
   if (StrToFloatDef(edtEmbroSize1.Text ,0) > 0) then
   begin
      cbEmbryo1Visualised1.checked := True;
   end;
end;

procedure edtYolkSacSize1OnChange(Sender);
begin
   if (strToFloatDef(edtYolkSacSize1.text,0) > 0) then
   begin
      cbYolkSacYes1.checked := True;
   end;
end;

Procedure seHeartBPM1OnChange(Sender);
begin
   if seHeartBPM1.Value > 0 then
   begin
      cbHeartMotionVisYes1.checked := True;
   end;
end;

procedure btnPregnancyRedatedOnClick(Sender);
begin
  cbPregnancyRedatedYes.checked := not(cbPregnancyRedatedYes.checked )
end;
