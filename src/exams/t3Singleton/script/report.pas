function CheckFormComplete: Boolean;
begin
  GLiquorWarning := FALSE;
     if  ((cbFetalWellLiqor1.ItemIndex = 0) or (cbFetalWellLiqor1.ItemIndex = 3)) then
     begin
           GLiquorWarning := False;
     end;         
    else if (cbFetalWellLiqor1.ItemIndex = 1) then
    begin                                                                                 
       GLiquorWarning := True;
    end;                                                    
    else if (cbFetalWellLiqor1.ItemIndex = 2) then
    begin
       GLiquorWarning := True;                                                  
    end;
    result := true;   
    if trim(GetClinicalIndicators) = '' then                          
    begin 
       ShowMessage('Please enter indication')                           
       result := False;  
    end;  
    if cbPresentation1.text = '' then
    begin 
       ShowMessage('Please enter presentation')
       result := False;                    
    end; 
    if cbPlacentaSite1.text = '' then
    begin 
       ShowMessage('Please enter placental site')
       result := False;                    
    end; 
    if not((cbLowLyingPlacentaYes1.checked) or (cbLowLyingPlacentaNo1.checked)) then
    begin
       ShowMessage('Please select yes/no for lowlying placenta')
       result := False;   
    end;
    if edtMidCerArtPI1.text <> '' then                                          
    begin
        if not(StrToFloatDef(edtMidCerArtPI1.text,0) > 0) then
        begin  
          ShowMessage('Please enter MCA PI')
           result := False;   
        end;
        else
           result := True;                               
    end;  
     if not((cbFeatlMovementsYes1.checked) or (cbFeatlMovementsNo1.checked)) then 
     begin      
        ShowMessage('Please enter Biophysical well-being');
        result := False;
     end;
end;                                               

procedure ProduceMergeFieldData;
var                             
  v1: String;
begin
  GAnatomyWarning := False;
  GFibroidWarning := False;
    // ---------------Gestation Details--------------------------------- //
  lbMergeDataMergeFields.Items.Clear;
  lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  dateTimeTostr(deStatedEDD.Date)   +'''');
  lbMergeDataMergeFields.Items.Add('GA_Entered_EDD='''+  intToStr(seEDDCalGAWeeks.value)   +' weeks''');
  if seEDDCalGADays.value >= 0 then
  begin                                       
    if seEDDCalGADays.value = 1 then  
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' day''');
  else 
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' days''');
  end
  else
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD=''');   
                                                                                    
     
  lbMergeDataMergeFields.Items.Add('BPD1='''+  PadDecimalPlaces(edtBPD1.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD1=''' +  PadDecimalPlaces(edtOFD1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC1='''   + PadDecimalPlaces(edtHC1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC1='''  +  PadDecimalPlaces(edtAC1.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL1='''  +  PadDecimalPlaces(edtFL1.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL1='''  +  PadDecimalPlaces(edtHL1.Text)     +'cm''');
 
  lbMergeDataMergeFields.Items.Add('BPDPer1='''+   GetPerGraph(edtBPDPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer1=''' +  GetPerGraph(edtOFDPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer1='''   +  GetPerGraph(edtHCPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer1='''  +   GetPerGraph(edtACPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer1='''  +  GetPerGraph(edtFLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer1='''  +  GetPerGraph(edtHLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('EFW1='''+ getEFW(1)+'''');
  lbMergeDataMergeFields.Items.Add('EFWPer1='''+ getEFWPer(seWeightPercentile1.text) +'''');
  if Trim(cbPresentation1.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('Presentation1='''  +   getPresentationDetail  +'''');
  else
    lbMergeDataMergeFields.Items.Add('Presentation1=''##''');

  if Trim(cbPresentation1.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1='''  +   inItCaps(getPresentation,true)  +'''');
  else
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1=''##''');

  if edtAFI1.text <> '' then
   if strToFloatdef(edtAFI1.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('AFI1='''  +   edtAFI1.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('AFI1=''##''');
  else
    lbMergeDataMergeFields.Items.Add('AFI1=''##''');                     
  if edtUmbilicalArtSD1.text <> '' then
     if strToFloatdef(edtUmbilicalArtSD1.text,0) > 0 then
       lbMergeDataMergeFields.Items.Add('UASD1='''  +   edtUmbilicalArtSD1.text  +'''');
     else
        lbMergeDataMergeFields.Items.Add('UASD1=''##''');
  else
     lbMergeDataMergeFields.Items.Add('UASD1=''##''');                                      
  if edtUmbilicalArtPI1.text  <> '' then
   if strToFloatdef(edtUmbilicalArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('UAPI1='''  +   PrefixZerodecimal(edtUmbilicalArtPI1.text)   +'''');
      lbMergeDataMergeFields.Items.Add('UAPIRange='''  +   getUAPI  +'''');  
   end
   else                                                                            
   begin                                                               
      lbMergeDataMergeFields.Items.Add('UAPI1=''##''');
      lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
   end
  else                              
  begin
     lbMergeDataMergeFields.Items.Add('UAPI1=''##''');
     lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
  end;   
  if edtMidCerArtPI1.text  <> '' then
   if strToFloatdef(edtMidCerArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('MCAPI1='''  +   PrefixZerodecimal(edtMidCerArtPI1.text)   +'''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange='''  +   getMCAPI  +'''');
   end;
   else
   begin
      lbMergeDataMergeFields.Items.Add('MCAPI1=''##''');
       lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
   end;
  else
  begin
     lbMergeDataMergeFields.Items.Add('MCAPI1=''##''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
  end;

  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ObstetricHistory='''+ GetObstetricHistory +'''');
  if (sePlacentaExtendsBy1.text <> '') then
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentaBeyond(1) +'''');
  else
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentalPosition(1) +'''');

  if seBiophysicalScore1.enabled then
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1='''+ intToStr(seBiophysicalScore1.value) +'''');
  else
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1=''0''');

  if cbFetalAnatomyNormal1.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy1=''normal''');
     GAnatomyWarning := False;
  end
  else if cbFetalAnatomyAbNormal1.checked then               
  begin
     lbMergeDataMergeFields.Items.Add('anatomy1=''#|#+BOLDABNORMAL#/#''');
     GAnatomyWarning := TRUE;
   end;
  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervix + '''');

  lbMergeDataMergeFields.Items.Add('liquorLevel1='''+ inItCaps(cbFetalWellLiqor1.text,True) + '''');

  if cbFeatlMovementsYes1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''limb and breathing movements present''');
  else if cbFeatlMovementsNo1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''#|#+BOLDABNORMAL#/#''');
  else
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''##''');

    lbMergeDataMergeFields.Items.Add('BiophysicalConc='''+ getBiophysicalConc + '''');

     lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
     lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

  lbMergeDataMergeFields.Items.Add('DuctusVenosus='''+ getDuctusVenosus + '''');
  lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

end;

procedure ProduceMergeOrder;
var
  vHeading : Boolean;
begin
  vHeading := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
 { if (GPlacentaWarning = TRUE) or (GPresentationWarning = TRUE) or (GCervixWarning = TRUE) or (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) or (GAnatomyWarning = TRUE) or ( GFibroidWarning = TRUE)or (getFunnelingMembranes = TRUE) or (GetDuctusVenosusWarning = TRUE)then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end; }
  if cxccbReferralIndicators.States[7] = 1 then
  begin
       lbMergeDataMergeOrder.Items.Add('T3_ACCESSCERVICALLENGTH'); 
  end;
  else
     lbMergeDataMergeOrder.Items.Add('T3_ALL');
                                                       
  if (seEstFetalWeight1.value > 0) then                
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('GraphImages');
  end;
end;
