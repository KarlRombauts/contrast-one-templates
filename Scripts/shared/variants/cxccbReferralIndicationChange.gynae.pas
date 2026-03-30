#ifndef __SHARED_VARIANTS_CXCCBREFERRALINDICATIONCHANGE_GYNAE
#define __SHARED_VARIANTS_CXCCBREFERRALINDICATIONCHANGE_GYNAE

procedure cxccbReferralIndicationChange(Sender)
begin
  edtPresentComplaintOther.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
   if not (cbRightOvaryIdentified.Checked) then
   begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
  end
  else
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := True;
      cbRightVaginalAccessNo.Enabled := True;
      cbRightVaginalNA.Enabled := True;
      gbRightVaginalAccess.Enabled := True;
    end
    else
     begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
  end;
  if (not cbLeftOvaryIdentified.Checked) then
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end;
  end
  else
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := True;
      cbLeftVaginalAccessNo.Enabled := True;
      cbLeftVaginalNA.Enabled := True;
      gbLeftVaginalAccess.Enabled := True;
    end;
    else
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end;
  end;
end;

#endif
