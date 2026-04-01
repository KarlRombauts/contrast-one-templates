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
  if seEDDCalGADays.value > 1 then
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' days''');
  else if seEDDCalGADays.value = 1 then                                          
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' day''');
  else
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' days''');
  lbMergeDataMergeFields.Items.Add('BPD1='''+  PadDecimalPlaces(edtBPD1.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD1=''' +  PadDecimalPlaces(edtOFD1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC1='''   + PadDecimalPlaces(edHC1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC1='''  +  PadDecimalPlaces(edAC1.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL1='''  +  PadDecimalPlaces(edFL1.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL1='''  +  PadDecimalPlaces(edHL1.Text)     +'cm''');
 
  lbMergeDataMergeFields.Items.Add('BPDPer1='''+   GetPerGraph(edtBPDPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer1=''' +  GetPerGraph(edtOFDPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer1='''   +  GetPerGraph(edHCPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer1='''  +   GetPerGraph(edACPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer1='''  +  GetPerGraph(edFLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer1='''  +  GetPerGraph(edHLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('EFW1='''+ getEFW(1)+'''');
  lbMergeDataMergeFields.Items.Add('EFWPer1='''+ getEFWPer(seWeightPercentile1.text,1) +'''');               
                                                                                                                        
  lbMergeDataMergeFields.Items.Add('BPD2='''+  PadDecimalPlaces(edtBPD2.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD2=''' +  PadDecimalPlaces(edtOFD2.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC2='''   + PadDecimalPlaces(edHC2.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC2='''  +  PadDecimalPlaces(edAC2.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL2='''  +  PadDecimalPlaces(edFL2.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL2='''  +  PadDecimalPlaces(edHL2.Text)     +'cm''');

  lbMergeDataMergeFields.Items.Add('BPDPer2='''+   GetPerGraph(edtBPDPer2, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer2=''' +  GetPerGraph(edtOFDPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer2='''   +  GetPerGraph(edHCPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer2='''  +   GetPerGraph(edACPer2, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer2='''  +  GetPerGraph(edFLPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer2='''  +  GetPerGraph(edHLPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('EFW2='''+ getEFW(2)+'''');
  lbMergeDataMergeFields.Items.Add('EFWPer2='''+ getEFWPer(seWeightPercentile2.text,2) +'''');


  if Trim(cbPresentation1.Text) <> '' then   
    lbMergeDataMergeFields.Items.Add('Presentation1='''  +   getPresentationDetail1  + '.''');
  else                                                                            
    lbMergeDataMergeFields.Items.Add('Presentation1=''##''');   
  if Trim(cbPresentation2.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('Presentation2='''  +   getPresentationDetail2  + '.''');
  else
    lbMergeDataMergeFields.Items.Add('Presentation2=''##''');      
                                                     
  if Trim(cbPresentation1.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1='''   +  (lowercase(getPresentationDetail1))  +'''');
  else
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1=''##'''); 
  if Trim(cbPresentation2.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('PresentationConclusion2='''  +  (lowercase(getPresentationDetail2))  +'''');
  else
    lbMergeDataMergeFields.Items.Add('PresentationConclusion2=''##''');   

  {if edtAFI1.text <> '' then
   if strToFloatdef(edtAFI1.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('AFI1='''  +   edtAFI1.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('AFI1=''##''');
  else
    lbMergeDataMergeFields.Items.Add('AFI1=''##'''); }   
    
  if edtDeepestPocket1.text <> '' then
   if strToFloatdef(edtDeepestPocket1.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('DVP1='''  +   edtDeepestPocket1.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('DVP1=''##''');   
  else
    lbMergeDataMergeFields.Items.Add('DVP1=''##''');   
  
  if edtDeepestPocket2.text <> '' then
   if strToFloatdef(edtDeepestPocket2.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('DVP2='''  +   edtDeepestPocket2.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('DVP2=''##''');   
  else
    lbMergeDataMergeFields.Items.Add('DVP2=''##'''); 
    
  if edtUmbilicalArtSD1.text <> '' then
     if strToFloatdef(edtUmbilicalArtSD1.text,0) > 0 then
       lbMergeDataMergeFields.Items.Add('UASD1='''  +   edtUmbilicalArtSD1.text  +'''');
     else                                                                  
        lbMergeDataMergeFields.Items.Add('UASD1=''##''');
  else
     lbMergeDataMergeFields.Items.Add('UASD1=''##'''); 
     
  if edtUmbilicalArtSD2.text <> '' then
     if strToFloatdef(edtUmbilicalArtSD2.text,0) > 0 then
       lbMergeDataMergeFields.Items.Add('UASD2='''  +   edtUmbilicalArtSD2.text  +'''');
     else
        lbMergeDataMergeFields.Items.Add('UASD2=''##''');
  else
     lbMergeDataMergeFields.Items.Add('UASD2=''##'''); 
     
  if edtUmbilicalArtPI1.text  <> '' then
   if strToFloatdef(edtUmbilicalArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('UAPI1='''  +   edtUmbilicalArtPI1.text   +'''');
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
     lbMergeDataMergeFields.Items.Add('MCAPI1='''  +   edtMidCerArtPI1.text   +'''');
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
  if edtUmbilicalArtPI2.text  <> '' then
   if strToFloatdef(edtUmbilicalArtPI2.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('UAPI2='''  +   edtUmbilicalArtPI2.text   +'''');
      lbMergeDataMergeFields.Items.Add('UAPIRange='''  +   getUAPI  +'''');
   end
   else
   begin
      lbMergeDataMergeFields.Items.Add('UAPI2=''##''');
      lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
   end
  else
  begin                                                               
     lbMergeDataMergeFields.Items.Add('UAPI2=''##''');
     lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
  end;   
  if edtMidCerArtPI2.text  <> '' then
   if strToFloatdef(edtMidCerArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('MCAPI2='''  +   edtMidCerArtPI2.text   +'''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange='''  +   getMCAPI  +'''');
   end;
   else
   begin
      lbMergeDataMergeFields.Items.Add('MCAPI2=''##''');
       lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
   end;
  else
  begin                                                                          
     lbMergeDataMergeFields.Items.Add('MCAPI2=''##''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
  end;   
  
  lbMergeDataMergeFields.Items.Add('GestationDetails='''+ GetgestationDetails +'''');
  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ObstetricHistory='''+ GetObstetricHistory +'''');
  lbMergeDataMergeFields.Items.Add('Features1='''+ GetFeatures(1) +'''');
  lbMergeDataMergeFields.Items.Add('Features2='''+ GetFeatures(2) +'''');
  lbMergeDataMergeFields.Items.Add('GestationType='''+ GetgestationDetails +'''');                           
             
  if (ccbGestationType.States[0]= 1) then 
      begin
       if (sePlacentaExtendsBy1.Value > 0) then
            lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'The placenta for twin 1 is ' + GetPlacenta1Beyond +'''');
       else 
            lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'The placenta for twin 1 is ' + GetPlacenta1Position +'''');    
       if (sePlacentaExtendsBy2.Value > 0) then
            lbMergeDataMergeFields.Items.Add('Placenta2='''+ 'The placenta for twin 2 is ' + GetPlacenta2Beyond +'''');                  
       else  
            lbMergeDataMergeFields.Items.Add('Placenta2='''+ 'The placenta for twin 2 is ' + GetPlacenta2Position +''''); 
      end
  else  
  begin  
  if (sePlacentaExtendsBy1.Value > 0) then 
      begin
        lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'There is a single placenta. The placenta is ' + GetPlacenta1Beyond +''''); 
        lbMergeDataMergeFields.Items.Add('Placenta2='''+ '''');       
      end  
  else 
      begin
        lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'There is a single placenta. The placenta is ' + GetPlacenta1Position +'''');
        lbMergeDataMergeFields.Items.Add('Placenta2='''+ '''');    
      end  
  end
                                                   
  if seBiophysicalScore1.enabled then
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1='''+ intToStr(seBiophysicalScore1.value) +'''');
  else
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1=''0'''); 
   if seBiophysicalScore2.enabled then
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore2='''+ intToStr(seBiophysicalScore2.value) +'''');
  else
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore2=''0''');   
   
  
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
  if cbFetalAnatomyNormal2.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy2=''normal''');
     GAnatomyWarning := False;
  end
  else if cbFetalAnatomyAbNormal2.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy2=''#|#+BOLDABNORMAL#/#''');
     GAnatomyWarning := TRUE;
   end; 
  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervix + '''');

  lbMergeDataMergeFields.Items.Add('liquorLevel1='''+ inItCaps(cbFetalWellLiqor1.text,True) + '''');  
  lbMergeDataMergeFields.Items.Add('liquorLevel2='''+ inItCaps(cbFetalWellLiqor2.text,True) + '''');

  if cbFeatlMovementsYes1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''(limb and breathing movements present)''');
  else if cbFeatlMovementsNo1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''#|#+BOLDABNORMAL#/#''');
  else
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''##'''); 
    
  if cbFeatlMovementsYes2.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical2=''(limb and breathing movements present)''');
  else if cbFeatlMovementsNo2.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical2=''#|#+BOLDABNORMAL#/#''');
  else
    lbMergeDataMergeFields.Items.Add('BioPhysical2=''##''');

  lbMergeDataMergeFields.Items.Add('BioPhysicalConclusion=''' + GetBioPhysicalconc +'''');

  lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
  lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');  
     

  lbMergeDataMergeFields.Items.Add('MCAPSV1='''+ getMCAPSV1 + '''');
  lbMergeDataMergeFields.Items.Add('MCAPSV2='''+ getMCAPSV2 + '''');

  lbMergeDataMergeFields.Items.Add('DuctusVenosus1='''+ getDuctusVenosus1 + ''''); 
  lbMergeDataMergeFields.Items.Add('DuctusVenosus2='''+ getDuctusVenosus2 + '''');
  lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

end;

procedure ProduceMergeOrder;
var
  vHeading : Boolean;                                                
begin
  vHeading := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
  {if (GPlacentaWarning = TRUE) or (GPresentationWarning = TRUE) or (GCervixWarning = TRUE) or (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) or (GAnatomyWarning = TRUE) or ( GFibroidWarning = TRUE)or (getFunnelingMembranes = TRUE) or (GetDuctusVenosusWarning = TRUE)then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;  
  if (meCervicalLength.text <> '') then
  begin
     if StrToFloatDef(meCervicalLength.text,0)> 0 then
       lbMergeDataMergeOrder.Items.Add('T3_ACCESSCERVICALLENGTH');        
     else
     lbMergeDataMergeOrder.Items.Add('T3_ALL');  
  end;
  else} 
  lbMergeDataMergeOrder.Items.Add('T3_ALL');

  if (seEstFetalWeight1.value > 0) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('GraphImages');
  end;
end;
