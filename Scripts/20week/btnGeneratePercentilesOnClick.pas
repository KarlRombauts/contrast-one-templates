#ifndef __SHARED_VARIANTS_BTNGENERATEPERCENTILESONCLICK_20WEEK
#define __SHARED_VARIANTS_BTNGENERATEPERCENTILESONCLICK_20WEEK

procedure btnGeneratePercentilesOnClick(sender);
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

     if edtHC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtHC1.text),0);
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
                edtHCPer1.text := '<3';
           else if (vPercentile > 97) then
               edtHCPer1.text := '>97';
           else
              edtHCPer1.text := intToStr(vPercentile);
           edtHCForm1.Text := 'HC' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtHCPer1.text) then
            vTempStr := StringReplace(edtHCPer1.text,'<','')
          else if pos('>',edtHCPer1.text) then
            vTempStr := StringReplace(edtHCPer1.text,'>','')
          else
            vTempStr := edtHCPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtHCPer1.text := '<3';
              else if (vPercentile > 97) then
                edtHCPer1.text := '>97';
              else
                edtHCPer1.text := intToStr(vPercentile);
              edtHCForm1.Text := 'HC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtAC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtAC1.text),0);
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
                edtACPer1.text := '<3';
           else if (vPercentile > 97) then
                edtACPer1.text := '>97';
           else
              edtACPer1.text := intToStr(vPercentile);
           edtACForm1.Text := 'AC' +', ' +  vAuthor;
       end;
       else
       begin
         if pos('<',edtACPer1.text) then
               vTempStr := StringReplace(edtACPer1.text,'<','')
            else if pos('>',edtACPer1.text) then
              vTempStr := StringReplace(edtACPer1.text,'>','')
            else
               vTempStr := edtACPer1.text;

          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtACPer1.text := '<3';
               else if (vPercentile > 97) then
                edtACPer1.text := '>97';
              else
                 edtACPer1.text := intToStr(vPercentile);
              edtACPer1.text := intToStr(vPercentile);
              edtACForm1.Text := 'AC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtHL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtHL1.text),0);
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
                edtHLPer1.text := '<3';
           else if (vPercentile > 97) then
                edtHLPer1.text := '>97';
           else
             edtHLPer1.text := intToStr(vPercentile);
            edtHLForm1.Text := 'HL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edtHLPer1.text) then
            vTempStr := StringReplace(edtHLPer1.text,'<','')
          else if pos('>',edtHLPer1.text) then
            vTempStr := StringReplace(edtHLPer1.text,'>','')
         else
            vTempStr := edtHLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtHLPer1.text := '<3';
               else if (vPercentile > 97) then
                edtHLPer1.text := '>97';
              else
               edtHLPer1.text := intToStr(vPercentile);
              edtHLForm1.Text := 'HL' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtFL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtFL1.text),0);
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
                edtFLPer1.text := '<3';
           else if (vPercentile > 97) then
                edtFLPer1.text := '>97';
           else
            edtFLPer1.text := intToStr(vPercentile);
           edtFLForm1.Text := 'FL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edtFLPer1.text) then
            vTempStr := StringReplace(edtFLPer1.text,'<','')
          else if pos('>',edtFLPer1.text) then
            vTempStr := StringReplace(edtFLPer1.text,'>','')
         else
            vTempStr := edtFLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtFLPer1.text := '<3';
               else if (vPercentile > 97) then
                edtFLPer1.text := '>97';  
              else
                edtFLPer1.text := intToStr(vPercentile);
              edtFLForm1.Text := 'FL' +', ' +  vAuthor;
           end;
       end;
     end;  
  end;
  else
  begin
   ShowMessage('Please enter the Gestation age to calculate percentiles.');
  end;
end;

#endif
