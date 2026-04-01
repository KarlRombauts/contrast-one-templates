procedure btnGeneratePercentiles1OnClick(sender);
var
  vBaseControl: TWinControl;
  vedtBiometry,vedtBiometryPer : TcxMaskEdit;
  vlblLabel: TcxLabel;
  i,inFetus: Integer;
  vBiometry : String;
  vGraphString : String;
  vBiometryPer,vtempString : String;
  vAuthor,vTempStr,vCaption : String;
  vGestWeeks,vGestDays : integer;
  vGeastation,vBiometryValue : Real
  vPercentile : Real
  vDays : Float;
begin
  result := true;
  inFetus := 1;
  vAuthor := 'CHITTY';
  vTempStr := '';
  vDays := 0.0;
  if cbBioPercentile1.text <> '' then
     vAuthor := cbBioPercentile1.text;
  vGestWeeks := getGestWeeks;
  vGestDays := getGestDays;
  vDays := vGestDays / 7;
  vTempString := Format('%.2f',[vGestWeeks + vDays]);
  vGestation := StrtoFloatDef(vTempString,0);
  vBiometryValue := 0.0;
  vGraphString := '';
  // need to calculate for each percentile as they differ in control names.
  //Tried chnaging the control names to follow a unique pattern and including them into group box but that failswhen calculating the prior values.
  // will have to change all the contraols in all the templates and run a DB query to generalise the code. So calculating each seperatly.
  if  vGestation > 0 then
  begin
      if edtBPD1.text <> '' then
      begin                                                                                                                        
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtBPD1.text),0);
      end;
      vCaption :=  'BPD' +' (' +  vAuthor + ')';
      if vBiometryValue > 0 then
      begin
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
             edtBPDPer1.text := '<3';
           else if (vPercentile > 97) then
              edtBPDPer1.text := '>97';
           else
             edtBPDPer1.text := intToStr(vPercentile);
           edtBPDForm1.Text := 'BPD' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtBPDPer1.text) then
            vTempStr := StringReplace(edtBPDPer1.text,'<','')
          else if pos('>',edtBPDPer1.text) then
            vTempStr := StringReplace(edtBPDPer1.text,'>','')
         else
            vTempStr := edtBPDPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtBPDPer1.text := '<3';
              else if (vPercentile > 97) then
                edtBPDPer1.text := '>97';
              else
                edtBPDPer1.text := intToStr(vPercentile);
              edtBPDForm1.Text := 'BPD' +', ' +  vAuthor;
           end;
       end;
       end;  
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr:= '';
       vPercentile := 0;

    { if edtOFD1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtOFD1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'OFD' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
            if (vPercentile < 3) then
                edtOFDPer1.text := '<3';
            else if (vPercentile > 97) then
               edtOFDPer1.text := '>97';
            else
              edtOFDPer1.text := intToStr(vPercentile);
           edtOFDForm1.Text := 'OFD' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtOFDPer1.text) then
            vTempStr := StringReplace(edtOFDPer1.text,'<','')
          else if pos('>',edtOFDPer1.text) then
            vTempStr := StringReplace(edtOFDPer1.text,'>','')
          else
             vTempStr := edtOFDPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                   vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtOFDPer1.text := '<3';
              else if (vPercentile > 97) then
               edtOFDPer1.text := '>97';
              else
                 edtOFDPer1.text := intToStr(vPercentile);
              edtOFDForm1.Text := 'OFD' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
     end;  }
     if edHC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edHC1.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'HC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edHCPer1.text := '<3';
           else if (vPercentile > 97) then
               edHCPer1.text := '>97';
           else
              edHCPer1.text := intToStr(vPercentile);
           edHCForm1.Text := 'HC' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edHCPer1.text) then
            vTempStr := StringReplace(edHCPer1.text,'<','')
          else if pos('>',edHCPer1.text) then
            vTempStr := StringReplace(edHCPer1.text,'>','')
          else
            vTempStr := edHCPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edHCPer1.text := '<3';
              else if (vPercentile > 97) then
                edHCPer1.text := '>97';
              else
                edHCPer1.text := intToStr(vPercentile);
              edHCForm1.Text := 'HC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edAC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edAC1.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'AC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edACPer1.text := '<3';
           else if (vPercentile > 97) then
                edACPer1.text := '>97';
           else
              edACPer1.text := intToStr(vPercentile);
           edACForm1.Text := 'AC' +', ' +  vAuthor;
       end;
       else
       begin
         if pos('<',edACPer1.text) then
               vTempStr := StringReplace(edACPer1.text,'<','')
            else if pos('>',edACPer1.text) then
              vTempStr := StringReplace(edACPer1.text,'>','')
            else
               vTempStr := edACPer1.text;

          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edACPer1.text := '<3';
               else if (vPercentile > 97) then
                edACPer1.text := '>97';
              else
                 edACPer1.text := intToStr(vPercentile);
              edACPer1.text := intToStr(vPercentile);
              edACForm1.Text := 'AC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edHL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edHL1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'HL' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edHLPer1.text := '<3';
           else if (vPercentile > 97) then
                edHLPer1.text := '>97';
           else
             edHLPer1.text := intToStr(vPercentile);
            edHLForm1.Text := 'HL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edHLPer1.text) then
            vTempStr := StringReplace(edHLPer1.text,'<','')
          else if pos('>',edHLPer1.text) then
            vTempStr := StringReplace(edHLPer1.text,'>','')
         else
            vTempStr := edHLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edHLPer1.text := '<3';
               else if (vPercentile > 97) then
                edHLPer1.text := '>97';
              else
               edHLPer1.text := intToStr(vPercentile);
              edHLForm1.Text := 'HL' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edFL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edFL1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'FL' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edFLPer1.text := '<3';
           else if (vPercentile > 97) then
                edFLPer1.text := '>97';
           else
            edFLPer1.text := intToStr(vPercentile);
           edFLForm1.Text := 'FL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edFLPer1.text) then
            vTempStr := StringReplace(edFLPer1.text,'<','')
          else if pos('>',edFLPer1.text) then
            vTempStr := StringReplace(edFLPer1.text,'>','')
         else
            vTempStr := edFLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edFLPer1.text := '<3';
               else if (vPercentile > 97) then
                edFLPer1.text := '>97';  
              else
                edFLPer1.text := intToStr(vPercentile);
              edFLForm1.Text := 'FL' +', ' +  vAuthor;
           end;
       end;
     end;  
  end;
  else
  begin
   ShowMessage('Please enter the Gestation age to calculate percentiles.');
  end;
end;

procedure btnGeneratePercentiles2OnClick(sender);
var
  vBaseControl: TWinControl;
  vedtBiometry,vedtBiometryPer : TcxMaskEdit;
  vlblLabel: TcxLabel;
  i,inFetus: Integer;
  vBiometry : String;
  vGraphString : String;
  vBiometryPer,vtempString : String;
  vAuthor,vTempStr,vCaption : String;
  vGestWeeks,vGestDays : integer;
  vGeastation,vBiometryValue : Real
  vPercentile : Real
  vDays : Float;
begin
  result := true;
  inFetus := 2;
  vAuthor := 'CHITTY';
  vTempStr := '';
  vDays := 0.0;
  if cbBioPercentile2.text <> '' then
     vAuthor := cbBioPercentile2.text;
  vGestWeeks := getGestWeeks;
  vGestDays := getGestDays;
  vDays := vGestDays / 7;
  vTempString := Format('%.2f',[vGestWeeks + vDays]);
  vGestation := StrtoFloatDef(vTempString,0);
  vBiometryValue := 0.0;
  vGraphString := '';
  // need to calculate for each percentile as they differ in control names.
  //Tried chnaging the control names to follow a unique pattern and including them into group box but that failswhen calculating the prior values.
  // will have to change all the contraols in all the templates and run a DB query to generalise the code. So calculating each seperatly.
  if  vGestation > 0 then
  begin
      if edtBPD2.text <> '' then
      begin                                                                                                                        
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtBPD2.text),0);
      end;
      vCaption :=  'BPD' +' (' +  vAuthor + ')';
      if vBiometryValue > 0 then
      begin
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
             edtBPDPer2.text := '<3';
           else if (vPercentile > 97) then
              edtBPDPer2.text := '>97';
           else
             edtBPDPer2.text := intToStr(vPercentile);
           edtBPDForm2.Text := 'BPD' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtBPDPer2.text) then
            vTempStr := StringReplace(edtBPDPer2.text,'<','')
          else if pos('>',edtBPDPer2.text) then
            vTempStr := StringReplace(edtBPDPer2.text,'>','')
         else
            vTempStr := edtBPDPer2.text;       
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtBPDPer2.text := '<3';
              else if (vPercentile > 97) then
                edtBPDPer2.text := '>97';
              else
                edtBPDPer2.text := intToStr(vPercentile);
              edtBPDForm2.Text := 'BPD' +', ' +  vAuthor;
           end;
       end;
       end;  
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr:= '';
       vPercentile := 0;

    { if edtOFD1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtOFD1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'OFD' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
            if (vPercentile < 3) then
                edtOFDPer1.text := '<3';
            else if (vPercentile > 97) then
               edtOFDPer1.text := '>97';
            else
              edtOFDPer1.text := intToStr(vPercentile);
           edtOFDForm1.Text := 'OFD' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtOFDPer1.text) then
            vTempStr := StringReplace(edtOFDPer1.text,'<','')
          else if pos('>',edtOFDPer1.text) then
            vTempStr := StringReplace(edtOFDPer1.text,'>','')
          else
             vTempStr := edtOFDPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                   vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtOFDPer1.text := '<3';
              else if (vPercentile > 97) then
               edtOFDPer1.text := '>97';
              else
                 edtOFDPer1.text := intToStr(vPercentile);
              edtOFDForm1.Text := 'OFD' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
     end;  }
     if edHC2.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edHC2.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'HC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edHCPer2.text := '<3';                        
           else if (vPercentile > 97) then
               edHCPer2.text := '>97';
           else
              edHCPer2.text := intToStr(vPercentile);
           edHCForm2.Text := 'HC' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edHCPer2.text) then
            vTempStr := StringReplace(edHCPer2.text,'<','')
          else if pos('>',edHCPer2.text) then
            vTempStr := StringReplace(edHCPer2.text,'>','')
          else
            vTempStr := edHCPer2.text;       
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edHCPer2.text := '<3';
              else if (vPercentile > 97) then
                edHCPer2.text := '>97';
              else
                edHCPer2.text := intToStr(vPercentile);
              edHCForm2.Text := 'HC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edAC2.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edAC2.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'AC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edACPer2.text := '<3';                        
           else if (vPercentile > 97) then
                edACPer2.text := '>97';
           else
              edACPer2.text := intToStr(vPercentile);
           edACForm2.Text := 'AC' +', ' +  vAuthor;
       end;
       else
       begin
         if pos('<',edACPer2.text) then
               vTempStr := StringReplace(edACPer2.text,'<','')
            else if pos('>',edACPer2.text) then 
              vTempStr := StringReplace(edACPer2.text,'>','')
            else
               vTempStr := edACPer2.text;      

          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');                                               
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edACPer2.text := '<3';
               else if (vPercentile > 97) then
                edACPer2.text := '>97';
              else
                 edACPer2.text := intToStr(vPercentile);
              edACPer2.text := intToStr(vPercentile);
              edACForm2.Text := 'AC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edHL2.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edHL2.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'HL' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edHLPer2.text := '<3';                        
           else if (vPercentile > 97) then
                edHLPer2.text := '>97';
           else
             edHLPer2.text := intToStr(vPercentile);
            edHLForm2.Text := 'HL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edHLPer2.text) then
            vTempStr := StringReplace(edHLPer2.text,'<','')
          else if pos('>',edHLPer2.text) then
            vTempStr := StringReplace(edHLPer2.text,'>','')
         else
            vTempStr := edHLPer2.text;       
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edHLPer2.text := '<3';
               else if (vPercentile > 97) then
                edHLPer2.text := '>97';
              else
               edHLPer2.text := intToStr(vPercentile);
              edHLForm2.Text := 'HL' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edFL2.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edFL2.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'FL' +' (' +  vAuthor + ')';               
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edFLPer2.text := '<3';                       
           else if (vPercentile > 97) then
                edFLPer2.text := '>97';
           else
            edFLPer2.text := intToStr(vPercentile);
           edFLForm2.Text := 'FL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edFLPer2.text) then
            vTempStr := StringReplace(edFLPer2.text,'<','')
          else if pos('>',edFLPer2.text) then
            vTempStr := StringReplace(edFLPer2.text,'>','')
         else
            vTempStr := edFLPer2.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edFLPer2.text := '<3';
               else if (vPercentile > 97) then
                edFLPer2.text := '>97';  
              else
                edFLPer2.text := intToStr(vPercentile);
              edFLForm2.Text := 'FL' +', ' +  vAuthor;
           end;
       end;
     end;  
  end;
  else
  begin
   ShowMessage('Please enter the Gestation age to calculate percentiles.');
  end;
end;

Procedure btnCalGrowthPer2OnClick(Sender);
var
  vEstFetalWeight : TcxSpinEdit
  vEstFetalWeightPer : TcxMaskEdit;
  vAuthor,vTempString,vCaption,vGraphString : String;
  vGestWeeks,vGestDays : integer;
  vGeastation,vWeightValue : Real
  vPercentile : Real
  vDays : Float;
begin
  result := true;
  vDays := 0.0;
  vGraphString := '';
  vAuthor := 'Australian (Mikolajczyk 2011)';
  vGestWeeks := getGestWeeks;
  vGestDays := getGestDays;
  if vGestWeeks >= 24 then
    vAuthor := 'Australian (Mikolajczyk 2011)';
  else
    vAuthor := 'Hadlock';
  vDays := vGestDays / 7;
  vTempString := Format('%.2f',[vGestWeeks + vDays]);
  vGestation := StrtoFloatDef(vTempString,0);
  vWeightValue := 0.0;

  if  vGestation > 0 then
  begin
     if seEstFetalWeight2.value > 0 then
     begin
        vWeightValue := seEstFetalWeight2.value;
     end;
     if vWeightValue > 0 then
     begin
       vCaption :=  'EFW '  +  vAuthor ;
       getGraphData(vCaption);
       if cxGraphData.lines.count > 0 then
       begin
            vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
            vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vWeightValue)*100)
       end;
       if (vPercentile < 3) then
         seWeightPercentile2.text := '<3';
       else if (vPercentile > 97) then
         seWeightPercentile2.text := '>97';
       else
         seWeightPercentile2.text := intToStr(vPercentile);
         cbWeightChart2.text := vAuthor;
    end;   
  end;
  else
   begin
     ShowMessage('Please enter the Gestation age to calculate percentile.');
   end;
end;

procedure ccbGestationTypeChange(Sender);
begin
  {rglr1.Visible := cbGestationType.ItemIndex > 1;
  rgsi1.Visible := cbGestationType.ItemIndex > 1;
  cxtsFetus2.TabVisible := False;
  tsWellBeing2.TabVisible := False;
  cxtsFetus3.TabVisible := False;
   tsWellBeing3.TabVisible := False;
   
  case ccbGestationTypeChange.ItemIndex of
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
  end;  }
end;

procedure cxpgFetus2Change(Sender: TObject);
begin
  
end;
