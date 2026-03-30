#ifndef __SHARED_VARIANTS_CBGESTATIONTYPECHANGE_T3SINGLETON
#define __SHARED_VARIANTS_CBGESTATIONTYPECHANGE_T3SINGLETON

procedure cbGestationTypeChange(Sender);
begin
  rglr1.Visible := cbGestationType.ItemIndex > 1;
  rgsi1.Visible := cbGestationType.ItemIndex > 1;
  cxtsFetus2.TabVisible := False;
  tsWellBeing2.TabVisible := False;
  cxtsFetus3.TabVisible := False;
   tsWellBeing3.TabVisible := False;
   
  case cbGestationType.ItemIndex of
    2,3,4: begin
             cxtsFetus2.TabVisible := True;
             tsWellBeing2.TabVisible := True;
           end;
    5: begin
         cxtsFetus2.TabVisible := True;
         cxtsFetus3.TabVisible := True;
         tsWellBeing2.TabVisible := True;
         tsWellBeing3.TabVisible := True;
       end;
  end;
  if cbGestationType.ItemIndex < 2 then
    cxGroupBox3.Height := 1
  else
    cxGroupBox3.Height := 27;


  lblAmnioticIndex1.Enabled := (cbGestationType.ItemIndex > 0);
  edtAFI1.Enabled := (cbGestationType.ItemIndex > 0);
  lblAmnioticMeasure1.Enabled := (cbGestationType.ItemIndex >0 );
  lblAmnioticVerticlePocket1.Enabled := (cbGestationType.ItemIndex > 0);
  edtDeepestPocket1.Enabled := (cbGestationType.ItemIndex > 0);
  lblAmnioticVerticleMeasure1.Enabled := (cbGestationType.ItemIndex > 0);

  lblAmnioticIndex2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  edtAFI2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  lblAmnioticMeasure2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  lblAmnioticVerticlePocket2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  edtDeepestPocket2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  lblAmnioticVerticleMeasure2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));

  lblAmnioticIndex3.Enabled := (cbGestationType.ItemIndex > 4);
  edtAFI3.Enabled := (cbGestationType.ItemIndex > 4);
  lblAmnioticMeasure3.Enabled := (cbGestationType.ItemIndex > 4);
  lblAmnioticVerticlePocket3.Enabled := (cbGestationType.ItemIndex > 4);
  edtDeepestPocket3.Enabled := (cbGestationType.ItemIndex> 4);
  lblAmnioticVerticleMeasure3.Enabled := (cbGestationType.ItemIndex > 4);

  lblPresentingTwin1.visible := (cbGestationType.ItemIndex > 1);
  presentingTwinYes1.visible := (cbGestationType.ItemIndex > 1);
  presentingTwinNo1.visible := (cbGestationType.ItemIndex > 1);
  
  case cbGestationType.ItemIndex of
    2,3: begin
          lblAmnioticIndex1.Enabled := False;
          edtAFI1.Enabled := False;
          lblAmnioticMeasure1.Enabled := False;
          lblAmnioticIndex2.Enabled := False;
          edtAFI2.Enabled := False;
          lblAmnioticMeasure2.Enabled := False;
          edtDeepestPocket2.style.borderColor := clRed;
          edtDeepestPocket2.Style.BorderStyle := 2;
          edtDeepestPocket1.Style.borderColor := clRed;
          edtDeepestPocket1.Style.BorderStyle := 2;
         end;
  end;
  case cbGestationType.ItemIndex of
    1,4: begin
           edtAFI1Onchange(nil);
           edtAFI2Onchange(nil);
         end;
  end;       
end;

#endif
