#ifndef __SHARED_OBSTETRIC_BIOMETRY
#define __SHARED_OBSTETRIC_BIOMETRY

function getEFW(inFetus : integer) : string
var
vFW : TcxSpinEdit;
begin
    result := '';
    vFW := TWinControl(pgFetusMeasusements.Owner).FindComponent('seEstFetalWeight' + intToStr(infetus));
    if (vFW.Value > 0) then
     Result := Result + IntToStr(vFW.Value);
end;

 function getEFWPer(inString : String) : String
 var
   vCentile : integer;
   vtempStr : String;
 begin
 result := '';
   if inString <> '' then
   begin
      if (pos('<',inString) > 0) then
      begin
        vtempStr := StringReplaceAll(inString,' ','');
        if (vtempStr = '<3') then
        begin
            result := result +' below 3';
        end
      end
      else if (pos('>',inString) > 0) then
      begin
         vtempStr := StringReplaceAll(inString,' ','');
         if (vtempStr = '>97') then
         begin
            result := result +' above 97';
         end
      end
      else
      begin
        vCentile := round(StrToFloatDef(inString,0));
        result := IntToStr(vCentile);
      end;  
   end;
   if (trim(seWeightPercentile1.text) = '<3') then
    result := result + GetValueSuffix(3)
   else
    result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile1.text,0));
 end;

procedure getBiometryPercentiles(sender);
var
  vBaseControl: TWinControl;
  vedtBiometry,vedtBiometryPer : TcxMaskEdit;
  vlblLabel: TcxLabel;
  i,inFetus: Integer;
  vBiometry : String;
  vBiometryPer : String;
  vAuthor,vTempString,vCaption : String;
  vGestWeeks,vGestDays : integer;
  vGeastation,vBiometryValue : Real
  vPercentile : integer
  vedtBiometryForm : TcxTextEdit;
  vDays : Float;
begin
  result := true;
  inFetus := 1;
  vAuthor := 'CHITTY';
  vDays := 0.0;
  cxGraphData.lines.clear;
  vAuthor := cbBioPercentile1.text;
  vGestWeeks := getGestWeeks;
  vGestDays := getGestDays;
  vDays := vGestDays / 7;
  vTempString := Format('%.2f',[vGestWeeks + vDays]);
  vGestation := StrtoFloatDef(vTempString,0);
  vBiometryValue := 0.0;
  if  vGestation > 0 then
  begin
  //showmessage('inhere')
    vedtBiometry := Sender;
     vTempString := StringReplace(vedtBiometry.name,intToStr(infetus),'Per'+intToStr(infetus));
     vedtBiometryPer := TWinControl(pgFetusMeasusements.Owner).FindComponent(vTempString);
     vTempString := StringReplace(vedtBiometry.name,intToStr(infetus),'Form'+intToStr(infetus));
     vedtBiometryForm := TcxTextEdit(TWinControl(pgFetusMeasusements.Owner).FindComponent(vTempString));
     vlblLabel := TWinControl(pgFetusMeasusements.Owner).FindComponent(StringReplace(vedtBiometry.name,'edt','lbl'));

      if vedtBiometry.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(vedtBiometry.text,0);
        //showmessage('inhere' + FloatToStr(vBiometryValue))
      end;
      vCaption :=  vlblLabel.Caption +' (' +  vAuthor + ')';
      if vBiometryValue > 0 then
      begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
                 //showMessage('inhere2' + intToStr(vPercentile))
           end;
           {if vPercentile > 0 then
           begin }
             if (vPercentile > 0) and (vPercentile < 3) then
               vedtBiometryPer.text := '<3';
             else if (vPercentile > 97) then
                vedtBiometryPer.text := '>97';
             else
             begin
             //showMessage('inhere3' + intToStr(vPercentile))
               vedtBiometryPer.text := intToStr(vPercentile);
             end;
            { end; }
           vedtBiometryForm.Text := vlblLabel.Caption +', ' +  vAuthor;
       end;
     end;
     else
       ShowMessage('Please enter the Gestation age to calculate the percentile');
end;

function GetPerGraph(sender : TcxMaskEdit; inShowValue: Boolean): String;              
var
  i,inValue: Integer;
  vtempStr : String;
begin
  result := '';
  vtempStr := '';
  if (pos('<',sender.Text) > 0) then
  begin
    vtempStr := StringReplaceAll(sender.Text,' ','');
    if (vtempStr = '<3') then
    begin
      result := 'x[---------|---------]'
      //if inShowValue then
      //  result := result +' below 3%';
      //result := StringReplace(result,'x','#|#+CREDx#/#');
    end
  end
  else if (pos('>',sender.Text) > 0) then
  begin
     vtempStr := StringReplaceAll(sender.Text,' ','');
     if (vtempStr = '>97') then
     begin
      result := ' [---------|---------]x'
     // if inShowValue then
      //  result := result +' above 97%';
      //result := StringReplace(result,'x','#|#+CREDx#/#');
     end
  end;
  else
  begin
    inValue := StrToFloatDef(sender.Text, 0)
    if inValue > 0 then
    begin
      if inValue < 3 then
        result := 'x[---------|---------]'
      else if inValue < 10 then
        result := ' [x--------|---------]'
      else if inValue < 15 then
        result := ' [-x-------|---------]'
      else if inValue < 20 then
        result := ' [--x------|---------]'
      else if inValue < 25 then
        result := ' [---x-----|---------]'
      else if inValue < 30 then
        result := ' [----x----|---------]'
      else if inValue < 35 then
        result := ' [-----x---|---------]'
      else if inValue < 40 then
        result := ' [------x--|---------]'
      else if inValue < 45 then
        result := ' [-------x-|---------]'
      else if inValue < 50 then
        result := ' [--------x|---------]'
      else if inValue = 50 then
       result := ' [---------x---------]'
      else if inValue > 97 then
        result := ' [---------|---------]x'
      else if inValue > 90 then
        result := ' [---------|--------x]'
      else if inValue > 85 then
        result := ' [---------|-------x-]'
      else if inValue > 80 then
        result := ' [---------|------x--]'
      else if inValue > 75 then
        result := ' [---------|-----x---]'
      else if inValue > 70 then
        result := ' [---------|----x----]'
      else if inValue > 65 then
        result := ' [---------|---x-----]'
      else if inValue > 60 then
        result := ' [---------|--x------]'
      else if inValue > 55 then
        result := ' [---------|-x-------]'
      else if inValue > 50 then
        result := ' [---------|x--------]'
      //result := StringReplace(result,'x','#|#+CREDx#/#');
      //if inShowValue then
       // result := result +' '+ IntToStr(round(invalue))+'%';
    end;
  end;
end;

 function GetGraphXValue(inControl: String): Real;
var
  vUpper: String;
begin
  result := 0;
  vUpper := UpperCase(inControl);
 // GetOriginalDating('');
  if (pos('EDTBPD', vUpper) > 0) or (pos('EDTOFD', vUpper) > 0) or (pos('EDHC', vUpper) > 0) or (pos('EDAC', vUpper) > 0) or (pos('EDHL', vUpper) > 0) or (pos('EDFL', vUpper) > 0) or (pos('SEESTFETAL', vUpper) > 0) or (pos('EDTAFI', vUpper) > 0) or(pos('EDTCEREBCPR', vUpper) > 0) or(pos('EDTMIDCERARTPI', vUpper) > 0) or (pos('EDTUMBILICALARTPI', vUpper) > 0) then
  begin
    result := GetGestWeeks + (GetGestDays / 7);
  end;
end;

Procedure GetGraphData(vAuthor :String);
var
 i,j,k : integer;
 vTempString : String;
 graphFound :boolean;
begin
    graphFound := False;
    for i := 0 to mmoGraphData.lines.Count - 1 do
    begin
     graphFound := False;
     cxGraphData.lines.clear;
      if (Pos('<Graph>',mmoGraphData.lines[i]) > 0) then
      begin
        for j := i to mmoGraphData.lines.Count - 1 do
        begin
          if not((Pos('</Graph>',mmoGraphData.lines[j]) > 0)) then
          begin
            cxGraphData.lines.add(mmoGraphData.lines[j]) ;
          end
          else
          begin
            cxGraphData.lines.add('</Graph>') ;
            for k := 0 to cxGraphData.lines.Count - 1 do
            begin
              if (Pos('<Caption>',cxGraphData.lines[k]) > 0) then
              begin
                vStart := Pos('<Caption>',cxGraphData.lines[k]) + length('<Caption>') - 1 ;
                vEnd := Pos('</Caption>',cxGraphData.lines[k]);
                vTempString := copy(cxGraphData.lines[k],vStart+1,vEnd-(vStart+1)) ;
                if(pos(vTempString,vAuthor ) >0) then
                begin
                   graphFound := True;
                   i := mmoGraphData.lines.Count - 1;
                end;
              end;
             end;
             if Not(graphFound) then
                 i:=j;
             break;
          end;
        end;
      end
    end;
    if not(graphFound) then
      cxGraphData.lines.clear;
end;

Procedure btnCalGrowthPer1OnClick(Sender);
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
     if seEstFetalWeight1.value > 0 then
     begin
        vWeightValue := seEstFetalWeight1.value;
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
         seWeightPercentile1.text := '<3';
       else if (vPercentile > 97) then
         seWeightPercentile1.text := '>97';
       else
         seWeightPercentile1.text := intToStr(vPercentile);
         cbWeightChart1.text := vAuthor;
    end;   
  end;
  else
   begin
     ShowMessage('Please enter the Gestation age to calculate percentile.');
   end;
end;

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

 procedure CalcFetalScore(Sender);            
var
  vSenderName: String;
  vEmbryoIndex: Integer;
  v1, v2, v3, v4: TcxCheckBox;
  vResult: TcxSpinEdit;
  vTotal: Integer;
begin
  vSenderName := TWinControl(Sender).Name;
  vEmbryoIndex := StrToIntDef(vSenderName[length(vSenderName)], -1);
  v1 := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalTone' + intToStr(vEmbryoIndex));
  v2 := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalMovement' + intToStr(vEmbryoIndex));
  v3 := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalBreathing' + intToStr(vEmbryoIndex));
  v4 := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbLiqur' + intToStr(vEmbryoIndex));
  vTotal := 0;
  if v1.Checked then
    vTotal := vTotal + 2;
  if v2.Checked then
    vTotal := vTotal + 2;
  if v3.Checked then
    vTotal := vTotal + 2;
  if v4.Checked then
    vTotal := vTotal + 2;
  vResult := TWinControl(pgFetusMeasusements.Owner).FindComponent('seBiophysicalScore' + intToStr(vEmbryoIndex));
  vResult.Value := vTotal;
end; 

  Function GetBioPhysicalConc: String
 begin
 result := '';
  if cbFeatlMovementsYes1.checked then
  begin
    result := 'Biophysically well';
  end
  else
  begin
      result := '##';                                      
   end;                                                     
 end; 

#endif
