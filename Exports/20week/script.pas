// ******************* Global Variables ************************************//
Var
   GLiquorWarning, GPlacentaWarning, GPresentationWarning, GCervixWarning, GUAPIWarning, GMCAPIWarning, GFibroidWarning : Boolean;                       

// ******************* Utility Functions ************************************//
      
function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  try                                                                                                                                                          
    result := StrToFloat(inString);
  except                                 
    result := inDefault;
  end;                                           
end;                                                                                                                                                                           
                                                                
function Min(in1, in2: Integer): Integer;
begin                                                                         
  if in1 > in2 then                                 
    result := in2                                                        
  else
    result := in1;                                                        
end;
                                                                           
function StrToIntDef(inString: string; inDefault: Integer): Integer;
begin
  try                                              
    result := StrToInt(inString);
  except                                                              
    result := inDefault;
  end;
end;                                              
                                                                
function GetIndefinateArticle(inValue: Integer; inDoCaps: Boolean): string;
var
  vTemp: string;
begin
  result := '';
  vTemp := IntToStr(inValue);
  if ((length(vTemp) > 0) and (vTemp[1] = '8')) or (inValue = 11) or (inValue = 18) then
  begin               
    if inDoCaps then
      result := 'An'
    else
      result := 'an'
  end
  else
  begin
    if inDoCaps then
      result := 'A';
  else
    result := 'a';
  end;
end;

function GetFullDateString(inDate: TDateTime): string;
begin
  result := FormatDateTime('dd mmmm yyyy', inDate);
end;

function IncludeComma(inString: string): string;
var
  v1: string;
begin
  v1 := '';
  if Length(inString) > 0 then
    v1 := inString + ', ';
  result := v1;
end;

function PadDecimalPlaces(inStr: String): String;
begin
  result := Trim(inStr);
  if (pos('.', result) = 0) then
    result := result + '.0'
  else if result[0] = '.' then
  begin
      result := '0'+ result ;
  end;                           
  else
  begin
    if result[length(result)] = '.' then
      result := result + '0';
  end;
end;


function GetIntegerMeasuredString(v1, v2, v3: Integer; v4: Double; inType: string): string;
begin
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          if trunc(v4) = v4 then
            result := Format('%dx%dx%d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
          else
            result := Format('%dx%dx%d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
        end
        else
          result := Format('%dx%dx%d%s', [v1, v2, v3, inType]);
      end
      else
        result := Format('%dx%d%s', [v1, v2, inType]);
    end
    else
      result := Format('%d%s', [v1, inType]);
  end
  else
    result := '';
end;

function InitCaps(inv: string; inReduce: Boolean): string;
var
  vDiff: Integer;
begin
  if inv <> '' then
  begin
    vDiff := Ord('A') - Ord('a');
    result := inv;
    if inReduce then
    begin
      if (Ord(result[1]) >= Ord('A')) and (Ord(result[1]) <= Ord('Z')) then
        result[1] := chr(Ord(inv[1]) - vDiff);
    end
    else
    begin
      if (Ord(result[1]) >= Ord('a')) and (Ord(result[1]) <= Ord('z')) then
        result[1] := chr(Ord(inv[1]) + vDiff);
    end;
  end
  else
    result := '';
end;

function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.  '
    else
      result := inStr;
  end
  else
    result := ''
end;

function GetNumberString(inNumber: Integer): string;
begin
  result := '';
  if inNumber = 1 then
    result := 'a single'
  else
  begin
    if inNumber = 2 then
      result := 'two'
    else if inNumber = 3 then
      result := 'three'
    else if inNumber = 4 then
      result := 'four'
    else if inNumber = 5 then
      result := 'five'
    else if inNumber = 6 then
      result := 'six'
    else if inNumber = 7 then
      result := 'seven'
    else if inNumber = 8 then
      result := 'eight'
    else if inNumber = 9 then
      result := 'nine'
    else
      result := IntToStr(inNumber);
  end;
end;




procedure cbToggleCheckOnClick(Sender)
var
  i: Integer;
begin
  if Sender.Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (Sender.Parent.Controls[i].Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          Sender.Parent.Controls[i].Checked := false;
        end;
      end;
    end;
  end;
end;

function Max(A, B: Integer): Integer;
begin
  if A > B then
    result := A
  else
    result := B;
end;



function AddToResult(inResult, inNew: string): string;
begin
  result := '';
  if trim(inResult) <> '' then
  begin
    if trim(inNew) <> '' then
      result := inResult + ', ' + trim(inNew);
  end
  else
  begin
    if trim(inNew) <> '' then
      result := trim(inNew);
  end;
end;

function StringReplaceAll(inSource, inMatch, inReplace: String): String;
var
  i: Integer;                                                             
begin
  result := inSource;
  i := Pos(inMatch, result);
  while (i > 0) do
  begin
    result := copy(result, 1, i-1) + inReplace + copy(result, i+length(inMatch), length(result));
    i := Pos(inMatch, result);
  end;
end;

function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := trim(inStr);
  if vt[length(vt)] <> '.' then
    vt := vt + '.  '
  else
    vt := vt + '  ';
  result := vt;
end;

function StringReplace(inSource, inMatch, inReplace: String): String;
var
  i: Integer;
begin
  result := inSource;
  i := Pos(inMatch, result);
  while i > 0 do
  begin
    result := copy(inSource, 1, i-1) + inReplace + copy(inSource, i+length(inMatch), length(inSource));
    i := Pos(result, inMatch);
  end;
end;

function GetWeeksFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;
var
  v1: Integer;                            
begin                                        
  v1 := (trunc(inEDDDate) - 280);
  result := (trunc(inExamDate) - v1) div 7;
end;    


function GetDaysFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;
var
  v1: Integer;
begin
  v1 := (trunc(inEDDDate) - 280);
  result := (trunc(inExamDate) - v1) mod 7;
end;

procedure cbUSSEDDOnChange(Sender);
var
  vWeeks, vDays: Integer;
begin
  seUSSEDDGAWeeks1.Value := 0;
  seSSEDDGADays1.Value := 0;
  if (deExamDate.Date > 100) and (deUSSEDD1.Date > 100) then
  begin
    vWeeks := GetWeeksFromDueDate(deUSSEDD1.Date, deExamDate.Date);
    vDays := GetDaysFromDueDate(deUSSEDD1.Date, deExamDate.Date);
    seUSSEDDGAWeeks1.Value := vWeeks;
    seSSEDDGADays1.Value := vDays;
  end;
end;                                                  





// **********************************************************************************//
// ******************* Header Functions *********************************************//

function GetNormalUAPIRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    19: result := 1.66;           
    20: result := 1.62;
    21: result := 1.58;
    22: result := 1.54;
    23: result := 1.50;
    24: result := 1.47;
    25: result := 1.44;
    26: result := 1.41;
    27: result := 1.38;
    28: result := 1.35;
    29: result := 1.32;
    30: result := 1.29;
    31: result := 1.27;
    32: result := 1.25;
    33: result := 1.22;
    34: result := 1.20;
    35: result := 1.18;
    36: result := 1.16;
    37: result := 1.14;
    38: result := 1.12;
    39: result := 1.10;
    40: result := 1.09;
    41: result := 1.07;
  end;
end;

function GetNormalMCAPIRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    21: result := 1.18;
    22: result := 1.25;
    23: result := 1.32;
    24: result := 1.38;
    25: result := 1.44;
    26: result := 1.50;
    27: result := 1.55;
    28: result := 1.58;
    29: result := 1.61;
    30: result := 1.62;
    31: result := 1.62;
    32: result := 1.61;
    33: result := 1.58;
    34: result := 1.53;
    35: result := 1.47;
    36: result := 1.39;
    37: result := 1.30;
    38: result := 1.20;
    39: result := 1.10;
  end;
end;

function GetNormalCPRRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    21: result := 0.9;
    22: result := 0.98;
    23: result := 1.07;
    24: result := 1.16;
    25: result := 1.24;
    26: result := 1.32;
    27: result := 1.4;
    28: result := 1.47;
    29: result := 1.53;
    30: result := 1.58;
    31: result := 1.62;
    32: result := 1.64;
    33: result := 1.65;
    34: result := 1.63;
    35: result := 1.6;
    36: result := 1.55;
    37: result := 1.48;
    38: result := 1.4;
    39: result := 1.29;
  end;
end;

function GetMoMRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    18,19: result := 34.8;
    20,21: result := 38.2;
    22,23: result := 41.9;
    24,25: result := 46.0;
    26,27: result := 50.4;
    28,29: result := 55.4;
    30,31: result := 60.7;
    32,33: result := 66.6;
    34,35: result := 73.1;       
    36,37: result := 80.2;
    38,39: result := 88.0;
   40: result := 96.6;
  end;
end;


function GetLiquor5Centile(inWeeks : integer) : real;
begin
 result := 0.0;
  case inWeeks of                                                                                              
    16: result := 7.9;
    17: result := 8.3;
    18: result := 8.7;
    19: result := 9.0;
    20: result := 9.3;
    21: result := 9.5;
    22: result := 9.7;
    23: result := 9.8;
    24: result := 9.8;
    25: result := 9.7;
    26: result := 9.7;
    27: result := 9.5;
    28: result := 9.4;
    29: result := 9.2;
    30: result := 9.0;
    31: result := 8.8;
    32: result := 8.6;
    33: result := 8.3;
    34: result := 8.1;
    35: result := 7.9;
    36: result := 7.7;
    37: result := 7.5;
    38: result := 7.3;
    39: result := 7.2;
    40: result := 7.1;
    41: result := 7.0;
    41: result := 6.9;
  end;
end;

function GetLiquor95Centile(inWeeks : integer) : Real;
begin
   result := 0.0;
  case inWeeks of
    16: result := 18.5;
    17: result := 19.4;
    18: result := 20.2;
    19: result := 20.7;
    20: result := 21.2;
    21: result := 21.4;
    22: result := 21.6;
    23: result := 21.8;
    24: result := 21.9;
    25: result := 22.1;
    26: result := 22.3;
    27: result := 22.6;
    28: result := 22.8;
    29: result := 23.1;
    30: result := 23.4;
    31: result := 23.8;
    32: result := 24.2;
    33: result := 24.5;
    34: result := 24.8;
    35: result := 24.9;
    36: result := 24.9;
    37: result := 24.4;
    38: result := 23.9;
    39: result := 22.6;
    40: result := 21.4;
    41: result := 19.4;
    41: result := 17.5;
  end;
end;




procedure PopulateEDDControls(inDate: TcxDateEdit; inWeeks, inDay: TcxSpinEdit);
var
  vWeeks, vDays: Integer;
begin
  vWeeks := 0;
  vDays := 0;
  inDay.Value := 0;
  inWeeks.Value := 0;
  if (deExamDate.Date > 0) and (inDate.Date > 0) then
  begin
    vWeeks := GetWeeksFromDueDate(inDate.Date, deExamDate.Date);
    vDays := GetDaysFromDueDate(inDate.Date, deExamDate.Date);
    inWeeks.Value := vWeeks;
    inDay.Value := vDays;
  end;
end;



function GetClinicalHistory: String;
var
  i: Integer;
begin
  result := '';

end;

function GetAneuploidyRisk: String;
begin
  result := '';
  case cbAneuploidy.ItemIndex of
    0: result := 'Normal NIPS.  ';
    1: result := 'Low risk combined screen.  ';
    2: result := 'Normal microarray.  ';
    3: result := 'Normal karyotype.  ';
    4: result := 'Increased risk NIPS.  ';
    5: result := 'Increased risk combined screen.  ';
    6: result := 'No aneuploidy screening.  ';
  end;
end;

function GetValueSuffix(inValue: Integer): String;
var
  vVal: String;
begin
  Result := '';
  vVal := Copy(Trim(IntToStr(inValue)), Length(Trim(IntToStr(inValue))),1);
  if ((StrToInt(vVal) = 1) and (inValue <> 11)) then
  begin
    Result := Result + '#|#+SUPSst#/#';
  end
  else if ((StrToInt(vVal) = 2) and (inValue <> 12)) then
  begin
    Result := Result + '#|#+SUPSnd#/#';
  end
  else if ((StrToInt(vVal) = 3) and (inValue <> 13)) then
  begin
    Result := Result + '#|#+SUPSrd#/#';
  end
  else                                                
  begin
    Result := Result + '#|#+SUPSth#/#';
  end
end;

function GetClinicalIndicators: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbReferralIndication.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndication.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cxccbReferralIndication.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtReferralIndicator1.Text);
  end;
  if result <> '' then
    result := AddFullStop(result);
  //result := result + ' ';  
end;

function GetObstetricHistory: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbObstetricHistory.Properties.Items.Count - 2 do
  begin
    if cxccbObstetricHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cxccbObstetricHistory.ShortDescription[i];
    end;
  end;
  if (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtOtherPastHistory1.Text);
  end;
  if result <> '' then
     result := 'Past Hx: ' + result;
  if result <> '' then
    result := AddFullStop(result);
end;


function getEFW(inFetus : integer) : string
var
vFW : TcxSpinEdit;
begin
    result := '';
    vFW := TWinControl(pgFetusMeasusements.Owner).FindComponent('seEstFetalWeight' + intToStr(infetus));
    if (vFW.Value > 0) then
     Result := Result + IntToStr(vFW.Value);
end;

function GetGestWeeks: integer;
var
  inW, inD: Integer;
begin
  result := '';
  inW := 0;
  inD := 0;
    inW := trunc(seEDDCalGAWeeks.Value);
    inD := trunc(seEDDCalGADays.Value);
    result :=  inW;
end;

function GetGestDays: integer;
var
  inW, inD: Integer;
begin
  result := '';
  inW := 0;
  inD := 0;
    inW := trunc(seEDDCalGAWeeks.Value);
    inD := trunc(seEDDCalGADays.Value);
    result :=  inD;
end;

 function GetGraphXValue(inControl: String): Real;
var
  vUpper: String;
begin
  result := 0;
  vUpper := UpperCase(inControl);
 // GetOriginalDating('');
  if (pos('EDTBPD', vUpper) > 0) or (pos('EDTOFD', vUpper) > 0) or (pos('EDTHC', vUpper) > 0) or (pos('EDTAC', vUpper) > 0) or (pos('EDTHL', vUpper) > 0) or (pos('EDTFL', vUpper) > 0) or (pos('SEESTFETAL', vUpper) > 0) or (pos('EDTAFI', vUpper) > 0) or(pos('EDTCEREBCPR', vUpper) > 0) or(pos('EDTMIDCERARTPI', vUpper) > 0) or (pos('EDTUMBILICALARTPI', vUpper) > 0) then
  begin
    result := GetGestWeeks + (GetGestDays / 7);
  end;
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
    end
  end
  else if (pos('>',sender.Text) > 0) then
  begin
     vtempStr := StringReplaceAll(sender.Text,' ','');
     if (vtempStr = '>97') then
     begin
      result := ' [---------|---------]x';
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
    end;
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



function GetEnteredEDD :String
Begin                                                                       
result := '';
    if (deStatedEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deStatedEDD.Date);
    end
end;                                            
                                                                             
Function getGAFromEnteredEDD :String;                                      
Begin                                             
result := '';
  result := Trim(IntToStr(seEDDCalGAWeeks.Value)) + ' weeks ';
  if seEDDCalGADays.Value >= 0 then
  begin
     if seEDDCalGADays.Value = 1 then
      result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' day';
     else
       result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' days';
  end;          
                                                               
end;

 function getCompositeDate : String;
begin
  result := '';
  result := intToStr(seUSSEDDGAWeeks1.value)   +' weeks '               
  if seSSEDDGADays1.value >= 0 then
  begin
    if seSSEDDGADays1.value = 1 then
     result := result + intToStr(seSSEDDGADays1.value)   +' day';
    else
     result := result + intToStr(seSSEDDGADays1.value)   +' days';
  end
     
  result := AddFullstopToEnd(Result);
end

                                                                               
function GetSuccenturiateType: String;
begin
  result := '';
  if trim(cbSuccentPos1.Text) <> '' then
    result := trim(initCaps(cbSuccentPos1.Text, true)) + ' ';
end;                                                                                                                                                                                                      

function GetPlacenta1InvertPosition: String;
begin
  result := Uppercase(trim(cbPlacentaSite1.text));
  if pos('ANTERIOR', UpperCase(result)) > 0 then
    result := StringReplace(result, 'ANTERIOR', 'POSTERIORLY')
  else
  if pos('POSTERIOR', UpperCase(result)) > 0 then
    result := StringReplace(result, 'POSTERIOR', 'ANTERIORLY')
  result := lowercase(result);
end;

function GetPlacenta: String;
begin
result := '';
  result := result + lowercase(trim(cbPlacentaSite1.text));
end;

function GetPlacenta1Measure: String;
begin
  if sePlacentaExtendsBy1.text <> '' then
  begin
    result := sePlacentaExtendsBy1.text
  end
  else
  begin
    if strToFloatDef(meInternalOS1.Text, 0) > 0 then
      result := meInternalOS1.Text + 'mm from'
    else
      result := 'at'
  end;
end; 



 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta is ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
 end;

 Function getPlacentalPosition(infetus : integer)  : String
 var
  vControl: TcxComboBox;                     
  vLowLyingYes, vLowLyingNo : TcxCheckBox;
  vmeInternalOS :TCXMaskEdit;
 begin
  result := '';
  GPlacentaWarning := FALSE;
  vControl := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbPlacentaSite' + intToStr(infetus));
  vLowLyingYes := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbLowLyingPlacentaYes' + intToStr(infetus));
  vLowLyingNo := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbLowLyingPlacentaNo' + intToStr(infetus));
  vmeInternalOS := TwinControl(pgFetusMeasusements.Owner).FindComponent('meInternalOS' + intToStr(infetus));
  if assigned(vControl) then
  begin
    result := trim(vControl.text) ;
    if vLowLyingYes.checked then
    begin
       result := result + ' and low lying.  ';
       GPlacentaWarning := TRUE;
       if vmeInternalOS.text <> '' then
        begin
          if (StrToFloatDef(vmeInternalOS.text,0) > 0 ) then
            result := result + 'Leading edge ' + GetPlacenta1Measure + ' the internal cervical os.  '
        end;
    end
    else if vLowLyingNo.checked then
    begin
        result := result + ' and not low lying.  ';
        GPlacentaWarning := False;
    end;
  end
  result := AddFullStop(Result);
 end;

 Function getPlacentaConclusion : String
 begin
 result := '';
    if cbLowLyingPlacentaYes1.checked then
    begin
       result := result + 'Low lying placenta. Review of placental site at 32 weeks is indicated.';
      {result := result + GetPlacenta + ' placenta';
        if (StrToFloatDef(meInternalOS1.text,0) > 0 ) then
            result := result+', ' + GetPlacenta1Measure + ' from the internal cervical os.  '}
    end;
    if result <> '' then
      result := AddFullStop(result);
   if cbVasaPraeviaYes1.checked then
     result := result + 'Vasa praevia identified.  ';
   else if cbVasaPraeviaNo1.checked then
     result := result + 'No evidence of vasa praevia.  ';
   if cbSuccenturiateLobeYes1.checked then
   begin
     if (cbLowLyingYes11.enabled) and (cbLowLyingYes11.checked) then
     begin
        if (cbSuccentPos1.Enabled) and (cbSuccentPos1.text <> '') then
          result := result + 'Low lying ' + lowercase(cbSuccentPos1.text) + ' succenturiate lobe identified.  '
        else
          result := result + 'Low lying succenturiate lobe identified.  ';
     end
     else
        result := result + 'Succenturiate lobe identified.  ';
   end;
 end;

 Function getLowLyingPlacentaString : String;
 var
  vPlacentaString : String;
   vCordString : String;
   vlowLying :Stirng;
 begin
 result := '';
 vPlacentaString := '';
 vCordString := '';
 vlowLying := '';
   if cbPlacentaSite1.text <> '' then
     vPlacentaString := vPlacentaString + cbPlacentaSite1.text;
   else
     vPlacentaString := '##'
   if cbVCI1.checked then
     vCordString :=  'velamentous cord insertion'
   else if cbMCI1.checked then
     vCordString :=  'marginal cord insertion';
   else if cbCCI1.checked then
     vCordString :=  'central cord insertion';
   if cbLowLyingPlacentaYes1.checked then
     vlowLying := 'and presently low lying.';
   result := result + vPlacentaString + ' with a '+ vCordString;
   if vlowLying <> '' then
     result := result + ' '+ vlowLying;
   if meInternalOS1.text <> '' then
   begin
     if StrToFloatDef(meInternalOS1.text,true) > 0 then
       result := result + '  The lower edge is '+ meInternalOS1.text  + 'mm from the internal os.  '
   end
   else if sePlacentaExtendsBy1.text <> '' then
   begin
       if StrToFloatDef(sePlacentaExtendsBy1.text,true) > 0 then
          result := result + '  It extends beyond the internal os by '+ sePlacentaExtendsBy1.text  + 'mm.  '
       else if StrToFloatDef(sePlacentaExtendsBy1.text,true) = 0 then
          result := result + '  The inferior edge reaching the internal cervical os.  '
   end;
   if cbVasaPraeviaYes1.checked then
     result := AddFullStopToEnd(result) +  'Vasa praevia identified.  ';
   else if cbVasaPraeviaNo1.checked then
     result := AddFullStopToEnd(result) +  'No evidence of vasa praevia.  ';
   if cbSuccenturiateLobeYes1.checked then
   begin
     if (cbLowLyingYes11.enabled) and (cbLowLyingYes11.checked) then
     begin
        if (cbSuccentPos1.Enabled) and (cbSuccentPos1.text <> '') then
          result := AddFullStopToEnd(result) + 'Low lying ' + lowercase(cbSuccentPos1.text) + ' succenturiate lobe identified.  '
        else
          result := AddFullStopToEnd(result) + 'Low lying succenturiate lobe identified.  ';
     end
     else
        result := AddFullStopToEnd(result) + 'Succenturiate lobe identified.  ';  
   end;
   if result <> '' then
   begin
     result := #13#10 + #13#10 + '#|#+UNDE#|#+BOLDPlacenta#/#' + #13#10  + result;
   end;
 end;

 
 Function getFunnellingMembrane :  String
 begin
 result := ''
 if cbFunnellingofmembranesYes.checked then
 begin
   result := result +  'Funnelling of membranes is seen.  '
 end;

 end;  
 
 Function getAnatomyChecked :  Boolean
 begin  
     result := False;
     if (cbFetalAnatomyNormal1.checked) or  (cbFetalAnatomyAbNormal1.checked) then 
     begin       
        result := TRUE;  
     end
 end;                     
 
 Function getAnatomyNormalViews :  Boolean
 begin
     result := TRUE;
     if cbFetalAnatomyNormal1.checked then
     begin                              
        if (cbPoorView.checked)or  (cbAverageViews.checked)or (cbGoodViews.checked)or (cbVeryGoodViews.checked) then
           result := TRUE; 
        else 
          result := False;  
     end;
       
 end;                      
      
// **********************************************************************************//
// ******************* Data Validation Functions ************************************//
function CheckFormComplete: Boolean;                                                        
begin                                                                             
    result := true;  

    if GetClinicalIndicators = '' then
    begin        
      ShowMessage('Please enter indication');             
      result := False;
    end;   
    if GetAneuploidyRisk = '' then
    begin        
      ShowMessage('Please enter Aneuploidy Risk');
      result := False;                          
    end;                                                                             
    if deUSSEDD1.date <= 0 then                                                        
    begin        
      ShowMessage('Please enter USS EDD');
      result := False;
    end;                           
    if not getAnatomyChecked then
    begin             
      ShowMessage('Please tick Normal/Abnormal for anatomy');
      result := False;
    end;                                         
     if not getAnatomyNormalViews then       
    begin        
      ShowMessage('Please tick view options for Anatomy');
      result := False;     
    end; 
     if cbPlacentaSite1.text = '' then       
    begin        
      ShowMessage('Please enter placental site');
      result := False;     
    end; 
     if not((cbLowLyingPlacentaYes1.checked) or (cbLowLyingPlacentaNo1.Checked)) then       
    begin        
      ShowMessage('Please enter yes/no for lowlying placenta');
      result := False;     
    end;   
    if meCervicalLength.text <> '' then
    begin
        if not(StrToFloatDef(meCervicalLength.text,0)>0) then       
        begin        
          ShowMessage('Please enter cervix');
          result := False;     
        end; 
     end
     else if meCervicalLength.text = '' then
     begin        
          ShowMessage('Please enter cervix');
          result := False;     
     end;                                   
end;                                   
        
                     
 Function getCervicalSuture : String
 begin
   Result := '';
   if cbCervixSutureYes.checked then
   begin
     result := result + 'The cervical suture is visualised';
     if edtSutureToOS.text <> '' then
     begin
      if StrToInt(edtSutureToOS.text) > 0 then
        result := result + ' and is located '+ edtSutureToOS.text +'mm above the external os. ';
      else
        result :=  result +  ' and is located ##mm above the external os. ';
     end;
   end;
   result := AddFullStop(result);
 end;


 Function getCervixDetailed : String
 var
   vCervicalLength : Integer;
 begin
  result := '';
  vCervicalLength := 0;
  if ((meCervicalLength.text) <> '')  or (getFunnellingMembrane <> '') or (getCervicalSuture <> '') or (cbCervixShortYes.checked) then
  begin
      vCervicalLength := StrToInt(meCervicalLength.text);
      if  vCervicalLength > 0 then
      begin
          if ((vCervicalLength > 25) or (cbCervixShortNo.checked)) then
          begin
             result := 'The cervix is long and closed';
          end
          else if ((vCervicalLength > 0) and (vCervicalLength < 25)) or (cbCervixShortYes.checked = TRUE) then
          begin
             result := 'The cervix is shortened';
          end
          if (vCervicalLength > 0) then
          begin
             if (cbCervixShortYes.checked = TRUE) then
                result := result + ', '+ meCervicalLength.text + 'mm'
             else
                result := result + ', '+ meCervicalLength.text + 'mm';
          end;
          if cbCervixTVS.checked then
            result := result + ' on transvaginal ultrasound.  '
          else if cbCervixTA.checked then
            result := result + ' on transabdominal ultrasound.  '
           result :=AddFullStop(result); 

            result := AddFullStop(Result);
          result :=  #13#10  + '#|#+UNDE#|#+BOLDCervix:#/#'+ #13#10  +  result +getFunnellingMembrane;
     end;
     else
     begin
        if (cbCervixShortYes.checked = TRUE) then
          result := #13#10  + '#|#+UNDE#|#+BOLDCervix:#/#'+ #13#10  + 'The cervix is shortened.  ' +getFunnellingMembrane;
        else if (cbCervixShortNo.checked = TRUE) then
          result := result +  'Cervix:' + #09#09 + 'long and closed  ';
        else
          result := result +  'Cervix:' + #09#09 + '##'
     end;
  end;
  else 
  begin
    if (cbCervixShortYes.checked = TRUE) then
      result := result + 'Cervix:' + #09#09 + 'short.  ';
    else if (cbCervixShortNo.checked = TRUE) then
      result := result +  'Cervix:' + #09#09 + 'long and closed.  ';
    else
      result := result +  'Cervix:' + #09#09 + '##'
  end;
  result := #13#10  + result;
  result := result + getCervicalSuture;
 end;


 Function getCervixConclusion : String
 var
   vCervicalLength : Real;
 begin
  result := '';
  vCervicalLength := 0.0;
  if ((meCervicalLength.text) <> '') then
  begin
         vCervicalLength := StrToFloatDef(meCervicalLength.text, 0);
      if (cbCervixShortYes.checked = TRUE) then
      begin
         result := 'Shortened cervix';
      end
  end;
  result := AddFullStop(Result);
 end;


 function getPlacentaString : String;
 var
   vPlacentaString : String;
   vCordString : String;                                                   
   vlowLying :Stirng;
 begin
 result := '';
 vPlacentaString := '';
 vCordString := '';
 vlowLying := '';
   if cbPlacentaSite1.text <> '' then
     vPlacentaString := vPlacentaString + lowercase(cbPlacentaSite1.text);
   else
     vPlacentaString := '## '
   if cbVCI1.checked then
     vCordString :=  'velamentous cord insertion'
   else if cbMCI1.checked then 
     vCordString :=  'marginal cord insertion';
   else if cbCCI1.checked then
     vCordString :=  'central cord insertion';
   if cbLowLyingPlacentaNo1.checked then
     vlowLying := 'not low lying';
   result := result + vPlacentaString + ' with a '+ vCordString;
   if vlowLying <> '' then
     result := result + ', '+ vlowLying;

   if result <> '' then
   begin
     result := #13#10 + 'Placenta:'+ #09#09  + lowercase(result);
   end;
 end;
                 
 function GetPlacentalSite : String;
 begin
 result := '';
   if trim(cbPlacentaSite1.text) <> '' then
     result := lowercase(cbPlacentaSite1.text) + 'ly ';
   else
     result := '## ';
   if cbVCI1.checked then
       result :=  result + 'with a velamentous cord insertion'      
   else if cbMCI1.checked then
       result := result +  'with a marginal cord insertion';   
   else if cbCCI1.checked then
       result := result + 'with a central cord insertion';   
 end;                

function getFirstName : string;  
begin                                                          
  result := 'The Patient';
end;                                      
                                                      
                                     
function getGenderStr : string;  
begin   
  if cbGendermale1.checked then                          
    result := 'male'
  else if cbGenderFemale1.checked then
    result := 'female'
  else
    result := '##'
end;                                            

                    
function getNipsGenderResult : string;    
begin       
  if cbConsistentNIPTYes1.checked then
    result := 'This is consistent with the NIPS result.'
                                                               
  else if cbConsistentNIPTNo1.checked then
    result := 'This is not consistent with the NIPS result.'

  else if cbConsistentNIPTUnknown1.checked then
    result := 'The patient did not find out the gender from the NIPS result.' 
  else
    result := ''
end;
             

function getGender : string                                                                         
begin
    result := '';                                                                               
                                
    if (cbPatientInformedNo.checked) then 
    begin
      result := 'The fetal gender has been visualised and recorded but has not been revealed at the request of the patient.' 
      result := #13#10 + #13#10 + result;  
    end;                                           
                      
    if (cbPatientInformedYes.checked) then 
    begin                                       
        result := 'The fetal gender appear ' + getGenderStr();       
        result := result + ' and the patient is aware. '      
        result := result + getNipsGenderResult();     
        result := #13#10 + #13#10 + result;  
    end;         
 end;                                  
                                          
 
 function GetAnatomy : String
 var
   vDifficultExam : String;
   v1 : Integer;  
 begin
   result := '';
   vDifficultExam := '';
   if (cbLargeBMI1.Checked) or (cbEarlyGestation1.Checked) or (cbAwkFetalPos1.Checked) then
   begin
    v1 := 0;
    if cbLargeBMI1.Checked then
    begin
      vDifficultExam := vDifficultExam + 'maternal habitus';
      inc(v1);
    end;
    if cbAwkFetalPos1.Checked then
    begin
      if v1 > 0 then
        vDifficultExam := vDifficultExam + ' and';
      vDifficultExam := vDifficultExam + 'fetal position';
    end;
    if vDifficultExam <> '' then
      vDifficultExam := 'Views were more challenging due to '+ AddFullstop(vDifficultExam);
  end;
   if cbFetalAnatomyNormal1.checked then
   begin
     if cbEarlyGestation1.checked then
     begin
       result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     end;
     else if cxccbReferralIndication.states[0] = 1 then
     begin
        if cbPoorView.checked then
          result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
        else if cbAverageViews.Checked then
          result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
        else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
          result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
     end
     else if (cxccbReferralIndication.states[1] = 1) then
        result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     else if  (cxccbReferralIndication.states[2] = 1) or (cxccbReferralIndication.states[3] = 1) or (cxccbReferralIndication.states[4] = 1) then
     begin
         if cxccbReferralIndication.states[0] = 1 then
         begin
            if cbPoorView.checked then
              result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
            else if cbAverageViews.Checked then
              result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
            else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
              result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
         end;     
         else if (cxccbReferralIndication.states[1] = 1) then
            result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     end;
   end
   else if cbFetalAnatomyAbNormal1.checked then
   begin
     Result := 'Abnormality. '+ #13#10+#13+#10;
     Result := result + 'Detailed views of the remaining anatomy including head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
   end;
   if result <> '' then
     if vDifficultExam <> '' then
       result := vDifficultExam + result;
   if result = '' then
     result := '##';    
 end;

 function getReportHeading : String
 begin
   result := '';                                         
   if (cxccbReferralIndication.states[2] = 1) then
   begin
     if (cxccbReferralIndication.states[0] = 1) then
        result := 'Second Trimester Ultrasound and Aminiocentesis'
     else if (cxccbReferralIndication.states[1] = 1) then
         result := 'Early Second Trimester Ultrasound and Aminiocentesis'
   end
   if (cxccbReferralIndication.states[3] = 1) then
       result := 'Second Trimester Ultrasound Report'
 end;

 function GetSingleCloseOrClear: String;
begin
  if cbCavityDistortion1.Checked then
    result := 'close to the cervix'
  else
  begin
    result := 'clear of the cervix';
  end;
  if seCloseToCrevix1.value > 0 then
    result := result + ' (within ' + intToStr(seCloseToCrevix1.value) + ' mm)'
end;



 function GetSingleFibroidDimensions: string;
var
  v1, v2, v3,v4: Integer;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value);
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + format('%d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]);
        end
        else
          result := result + format('%d x %d x %dmm', [v1, v2, v3]);
      end
      else
        result := result + format('%d x %dmm', [v1, v2]);
    end
    else
      result := result + format('%dmm', [v1]);
  end;
  if result <> '' then
    result := ' ' + result;
end;

function GetSingleFibroid: string;
begin
result := '';
  result := cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
  if cbFibroidsLeftRight1.ItemIndex > 0 then
    result := InitCaps(cbFibroidsLeftRight1.Text, True) + ' ' + result;

  if result <> '' then
    result := ' ' + result;
end;

function GetCavDistortionCount: Integer;
begin
  result := 0;
  if (gbFibroid1.Visible) and (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
    result := Result + 1;
  {if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then
    result := Result + 1;
  if (gbFibroid3.Visible) and (cbCavityDistortion3.Checked) and (cbCavityDistortion3.Enabled) then
    result := Result + 1;
  if (gbFibroid4.Visible) and (cbCavityDistortion4.Checked) and (cbCavityDistortion4.Enabled) then
    result := Result + 1;
  if (gbFibroid5.Visible) and (cbCavityDistortion5.Checked) and (cbCavityDistortion5.Enabled) then
    result := Result + 1;
  if (gbFibroid6.Visible) and (cbCavityDistortion6.Checked) and (cbCavityDistortion6.Enabled) then
    result := Result + 1;
  if (gbFibroid7.Visible) and (cbCavityDistortion7.Checked) and (cbCavityDistortion7.Enabled) then
    result := Result + 1;
  if (gbFibroid8.Visible) and (cbCavityDistortion8.Checked) and (cbCavityDistortion8.Enabled) then
    result := Result + 1;
  if (gbFibroid9.Visible) and (cbCavityDistortion9.Checked) and (cbCavityDistortion9.Enabled) then
    result := Result + 1;
  if (gbFibroid10.Visible) and (cbCavityDistortion10.Checked) and (cbCavityDistortion10.Enabled) then
    result := Result + 1;}
end;


function GetFibroidString (inFibroid: Integer): string;
var
  v1, v2, v3,v4: Integer;
  vl, vw, vd, vv: TcxSpinEdit;
  vp, vt, vlr: TcxComboBox;
  vCheck: TcxCheckBox;
begin
  result := '';
  vv := TWinControl(gbFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(inFibroid));
  vl := TWinControl(gbFibroids.Owner).FindComponent('edtFibroidLength' + intToStr(inFibroid));
  vw := TWinControl(gbFibroids.Owner).FindComponent('edtFibroidWidth' + intToStr(inFibroid));
  vd := TWinControl(gbFibroids.Owner).FindComponent('edtFibroiddepth' + intToStr(inFibroid));
  vp := TWinControl(gbFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(inFibroid));
  vt := TWinControl(gbFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(inFibroid));
  vlr := TWinControl(gbFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(inFibroid));
  vCheck := TWinControl(gbFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
  v1 := trunc(vl.Value);
  v2 := trunc(vw.Value);
  v3 := trunc(vd.Value);
  v4 := trunc(vv.Value)
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result  + format(' %d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]) + ' ' ;
            if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
        else
        begin
          result := result  + format(' %d x %d x %dmm', [v1, v2, v3]) + ' ' ;
           if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
      end
      else
      begin
        result := result + format(' %d x %dmm', [v1, v2]) + ' ' ;
         if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
      end;
    end
    else
    begin
      result := result + format(' %dmm', [v1])+ ' ' ;
       if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
       result := result + vp.Text + ' ' + vt.Text;
    end;
    if result <> '' then
      result := result + ' fibroid'
  end;
  if vCheck.Checked then
  begin
    vv := TWinControl(gbFibroids.Owner).FindComponent('seCloseToCrevix' + intToStr(inFibroid));
    if vv.value > 0 then
    begin
        result := result + Format(' within %d mm of the cervix',[trunc(vv.value)]);
    end
    else
      result := result + ' and is close to the cervix';
  end;    
  else
  begin
    if GetCavDistortionCount > 0 then
      result := result + ' clear of the cervix';
  end;
end;  

 Function GetOvary : string;
var
  tempString;
begin
  result := '';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := '';
     else
       result := result + 'The right ovary is normal.  ';
  end
  else  if cbLeftOvaryNormal.checked then
     result := result + 'The left ovary is normal.  ';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal.  ';
     else
       result := result + 'The right ovary is abnormal.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'The left ovary is abnormal.  ';

 { if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries.  ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary.  ';
  end
  else  if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum s visualised in the left ovary.  ' ; }

     if result <> '' then
     result := #13#10+#13#10 + result ;

end;
 
function getAnatomyConclusion : String
begin
result := '';
if cbFetalAnatomyAbNormal1.checked then
  result := result + 'Abnormal anatomy';
else
  result := result + 'Normal fetal appearances';
end;


function getFibroid : String;
var
  i : Integer;
begin
result := '';
  if spFibroidCount.value > 0 then
  begin
    if spFibroidCount.value = 1 then
    begin
      if GetSingleFibroidDimensions <> ''  then
         result := result +  GetSingleFibroidDimensions + GetSingleFibroid + ' fibroid seen.  ';
      if (result <> '')  and (GetSingleCloseOrClear <> '') then
         result := result + 'It is ' +  GetSingleCloseOrClear;
      if result <> '' then
        result :=  'There is a' + result;
    end
    else if spFibroidCount.value > 1 then
    begin
      for i := 1 to spFibroidCount.value do
      begin
        if result <> '' then
        begin
          if i = spFibroidCount.value then
             result := result + ' and';
          else
             result := result + ',';
        end;
        result := result + GetFibroidString(i);
      end;
      if result <> '' then
       result := 'There are fibroids identified: ' + result;
    end;
    if result = '' then
    begin
        GFibroidWarning := TRUE;
        if spFibroidCount.value = 1 then
          result := 'Fibroid';
        else if spFibroidCount.value > 1 then
          result := 'Fibroids';
    end;
  end
  else if cbFibroidsVisualised.checked then
  begin
    GFibroidWarning := TRUE;
    result := 'Fibroid/s';
  end;
  else
    result := '';  

  if result <> '' then
    result := #13#10+#13#10 + AddFullSTopToEnd(result);
end;
// **************************Dictation Warning checks *************************************//

function getNIPSWarning : Boolean
begin
result := FALSE;
if cbConsistentNIPTNo1.checked then
   result := TRUE;
end;

function getCordInsertionWarning : Boolean
begin
result := FALSE;
if cbMCI1.checked then
   result := TRUE;
end;


function getAnatomyWarning : Boolean
begin
result := FALSE;
if cbFetalAnatomyAbNormal1.checked then
begin
   result := TRUE;
 end;
end;

Function getCervixWarning : Boolean
var
  vCervicalLength : integer;
begin
result := FALSE;
vCervicalLength := 0;
if (meCervicalLength.text <> '') then
begin
   vCervicalLength := StrToInt(meCervicalLength.text);
   if (vCervicalLength > 0) and (vCervicalLength < 25) then
      result := TRUE;
end;   
end;

Procedure cbCervixSutureYesOnClick(Sender)
begin
    cbToggleCheckOnClick(sender);
    edtSutureToOS.enabled := cbCervixSutureYes.checked;
end

function getPlacentalWarning : Boolean
begin
result := FALSE;
if cbLowLyingPlacentaYes1.checked then
begin
   result := TRUE;
 end;
end;

function getOvaryWarning : Boolean
begin
result := FALSE;
if (cbLeftOvaryAbNormal.checked) or (cbRightOvaryAbNormal.checked) then
begin
   result := TRUE;
 end;
end;




 // ***************************Anatomy************************************************//

function SetAnatomyChecks(inParent: TControl; inChecked: Boolean)
var
  i: Integer;
begin
  for i := 0 to TWinControl(inParent).ControlCount - 1 do
  begin
    if TWinControl(inParent).Controls[i] is TcxCheckBox then
      if (pos('cbLargeBMI', TcxCheckBox(TWinControl(inParent).Controls[i]).name) < 1) and (pos('cbAwkFetalPos', TcxCheckBox(TWinControl(inParent).Controls[i]).name) < 1)
                     and (pos('cbEarlyGestation', TcxCheckBox(TWinControl(inParent).Controls[i]).name) < 1) then
        TcxCheckBox(TWinControl(inParent).Controls[i]).Checked := inChecked;
  end;
end;

procedure btnSelectAll1OnClick(sender)
begin
  SetAnatomyChecks(cxgbTheChecks1, True);
end;

procedure btnClear1OnClick(sender)
begin
  SetAnatomyChecks(cxgbTheChecks1, False);
end;

Function getPlacentalChecks : Boolean
begin
  result := False;
  if (cbVasaPraeviaYes1.checked) or (cbVasaPraeviaNo1.Checked) then
    result := True;
  if (cbSuccenturiateLobeYes1.checked) or (cbSuccenturiateLobeNo1.Checked) then
    result := True;
  if (cbLowLyingYes11.checked) or (cbLowLyingYes11.Checked) then
    result := True;
end;

Function getConclusionWarnings : String
begin
result := '';
  if (getAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) then
     result := result + 'Dictate WELL-BEING.  '   
  if (getNIPSWarning = TRUE) then
     result := result + 'Dictate NIPS.  '                                             
  if (getCordInsertionWarning = TRUE) then
     result := result + 'Dictate MCI.  ' 
  if (getOvaryWarning = TRUE)  then
     result := result + 'Dictate Ovaries.  '  
   if (getCervixWarning = TRUE)  then
     result := result + 'Dictate Cervix.  ' 
end;              
             
function getOvaryConclusion :String
begin
  result := '';
  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal.  ';
     else
       result := result + 'Abnormal right ovary.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'Abnormal left ovary.  ';
end;

function getFibroidConclusion : String
begin
 result := '';
if cbFibroidsVisualised.checked then
  begin
   if (spFibroidCount.value > 0) then
   begin
     if spFibroidCount.value = 1 then
      result := result + 'Fibroid as described.  ';
     else
      result := result + 'Fibroids as described.  ';
   end
   else
      result := result + 'Fibroid/s as described.  ';
  end;   
end;

function getAbnormalConclusion : string
begin
   Result := '';
   result := result + GetCervixConclusion;
   result := result + getPlacentaConclusion;
   result := result + getOvaryConclusion;
   result := result + getFibroidConclusion;
end;

procedure deStatedEDDOnChange(Sender);
begin
  PopulateEDDControls(deStatedEDD, seEDDCalGAWeeks, seEDDCalGADays);
end;

Function getFunnelingMembranes : Boolean
begin
result := FALSE;
  if cbFunnellingofmembranesYes.checked then
     result := TRUE;
end;

procedure cxccbReferralIndicationChange(Sender);
begin
  edtReferralIndicator1.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
end;

procedure cxccbObstetricHistoryChange(Sender);
begin
  edtOtherPastHistory1.Enabled := (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1);
end;


procedure cbGestationTypeChange(Sender);
begin
  cbGestationType.ItemIndex := 1;
end;

procedure SetAbnormalCheckes(inControl: TcxGroupBox; inValue: Boolean);
begin
  if assigned(inControl) then
  begin
    for i := 0 to inControl.ControlCount - 1 do
    begin
      if inControl.Controls[i] is TcxCheckBox then
      begin
        TcxCheckBox(inControl.Controls[i]).enabled := inValue;
      end;
    end;
  end;
end;

procedure cbSuccenturiateLobeYes1OnClick(Sender)
begin
  cbToggleCheckOnClick(sender);
  if cbSuccenturiateLobeYes1.Checked then
  begin
    cbSuccenturiateLobeNo1.Checked := False;
    cbSuccentPos1.Enabled := True;
  end
  else
  begin
    cbSuccentPos1.Enabled := False;
  end;
end;
procedure cbSuccenturiateLobeNo1OnClick(sender)
begin
   cbToggleCheckOnClick(sender);
  if cbCervixSutureNo.Checked then
  begin
    cbSuccenturiateLobeYes1.Checked := False;
    cbSuccentPos1.Enabled:= False;
  end;
end;

procedure spFibroidCountOnChange(Sender)
begin
  gbFibroid1.Visible := False;
  gbFibroid2.Visible := False;
  gbFibroid3.Visible := False;
  gbFibroid4.Visible := False;
  gbFibroid5.Visible := False;
  gbFibroid6.Visible := False;
  gbFibroid7.Visible := False;
  gbFibroid8.Visible := False;
  gbFibroid9.Visible := False;
  gbFibroid10.Visible := False;
  if spFibroidCount.Value > 0 then
  begin
     cbFibroidsVisualised.Checked := true;
  end;
  if cbFibroidsVisualised.Checked then
  begin
    if spFibroidCount.Value > 0 then
    begin
      gbFibroid1.Visible := True;
      if spFibroidCount.Value > 1 then
      begin
        gbFibroid2.Visible := True;
        if spFibroidCount.Value > 2 then
        begin
          gbFibroid3.Visible := True;
          if spFibroidCount.Value > 3 then
          begin
            gbFibroid4.Visible := True;
            if spFibroidCount.Value > 4 then
            begin
              gbFibroid5.Visible := True;
              if spFibroidCount.Value > 5 then
              begin
                gbFibroid6.Visible := True;
                if spFibroidCount.Value > 6 then
                begin
                  gbFibroid7.Visible := True;
                  if spFibroidCount.Value > 7 then
                  begin
                    gbFibroid8.Visible := True;
                    if spFibroidCount.Value > 8 then
                    begin
                      gbFibroid9.Visible := True;
                      if spFibroidCount.Value > 9 then
                      begin
                        gbFibroid10.Visible := True;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure cbFibroidsVisualisedOnClick(sender)
begin
  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;
  spFibroidCountOnChange(nil);
end;   

procedure cbFetalAnatomyNormal1OnClick(sender);
var
  vgb: TcxGroupBox;
  vChecked: TcxCheckBox;
  i: Integer;
begin
  cbToggleCheckOnClick(Sender);
  vgb := TWinControl(pgFetusMeasusements.Owner).FindComponent('cxgbAbnormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  vChecked := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalAnatomyAbNormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  if assigned(vgb) then
  begin
    SetAbnormalCheckes(vgb, vChecked.Checked);
  end;
  btnSelectAll1OnClick(sender);
end;

procedure edtMeanUAPIOnChange(Sender);
var
  vWeeks: Integer;
begin

      vWeeks := Trunc(seEDDCalGAWeeks.Value);
  case vWeeks of
    11: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.7);
    12: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.53);
    13: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.38);
    14: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.24);
    15: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 2.11);
    16: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.99);
    17: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.88);
    18: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.79);
    19: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.70);
    20: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.61);
    21: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.54);
    22: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.47);
    23: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.41);
    24: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.35);
    25: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.30);
    26: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.25);
    27: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.21);
    28: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.17);
    29: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.13);
    30: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.10);
    31: cbUAPI95.Checked := (StrToFloatDef(edtMeanUAPI.Text, 0) > 1.06);

  end;
  //if cbUAPI95.Checked then cbUAPINormal.Checked := False;
  cbUAPINormal.Checked := not cbUAPI95.Checked;
end;

procedure edtMeanRUAPIOnChange(Sender);
begin
  edtMeanUAPI.text := FloatToStr((StrToFloatDef(edtMeanRUAPI.Text, 0) + StrToFloatDef(edtMeanLUAPI.Text, 0)) / 2);
  edtMeanUAPIOnChange(nil);
end;


procedure ProduceMergeFieldData;
var
  v1: String;
begin                                                                                      
  GAnatomyWarning := False;
  GFibroidWarning := False;
    // ---------------Gestation Details--------------------------------- //
  lbMergeDataMergeFields.Items.Clear;
  if GetEnteredEDD <> '' then
     lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');                    
  else                
     lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

   //-----------------  Entered EDD ----------//
  lbMergeDataMergeFields.Items.Add('GA_from_Entered_EDD='''+  getGAFromEnteredEDD   +'''');
   
   //----------------- Composite US  EDD ----------//  
  lbMergeDataMergeFields.Items.Add('Composite_Ultrasound_Age='''+  intToStr(seUSSEDDGAWeeks1.value)   +' weeks''');
  if seSSEDDGADays1.value >= 0 then
  begin
    if seSSEDDGADays1.value = 1 then
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' day''');
    else                        
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' days''');
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
 

  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetObstetricHistory +'''');
  lbMergeDataMergeFields.Items.Add('AneuploidyRisk=''' +   GetAneuploidyRisk    +'''');
  
   if (cbLowLyingPlacentaNo1.checked) and (not (getPlacentalChecks)) then
     lbMergeDataMergeFields.Items.Add('Placenta=''' +   getPlacentaString    +'''');
   else
     lbMergeDataMergeFields.Items.Add('Placenta=''''');

   if (cbLowLyingPlacentaYes1.checked) or (getPlacentalChecks) then
    lbMergeDataMergeFields.Items.Add('LowLyingPlacenta=''' +   getLowLyingPlacentaString    +'''');
   else
    lbMergeDataMergeFields.Items.Add('LowLyingPlacenta=''''');
   
  if (sePlacentaExtendsBy1.text <> '') then
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentaBeyond(1) +'''');
  else
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentalPosition(1) +'''');

    lbMergeDataMergeFields.Items.Add('PlacentalSite='''+ GetPlacentalSite +'''');

    lbMergeDataMergeFields.Items.Add('Ovary='''+ getOvary +'''');
    lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervixDetailed + '''');
  {if not(cbPatientInformedYes.checked) and (not((cbConsistentNIPTYes1.checked) or (cbConsistentNIPTNo1.checked))) then
    lbMergeDataMergeFields.Items.Add('Gender=''')
  else }
  if getGender <> '' then
  begin
    lbMergeDataMergeFields.Items.Add('Gender='''+ getGender + '''');
  end
  else
     lbMergeDataMergeFields.Items.Add('Gender=''');
  lbMergeDataMergeFields.Items.Add('Anatomy='''+ getAnatomy + '''');
  lbMergeDataMergeFields.Items.Add('ReportHeading='''+ getReportHeading + '''');


     lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
     lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

     lbMergeDataMergeFields.Items.Add('AnatomyConclusion='''+ getAnatomyConclusion + '''');

     lbMergeDataMergeFields.Items.Add('AbnormalConclusion='''+ getAbnormalConclusion + '''');
end;

procedure ProduceMergeOrder;
var
  vHeading : Boolean;
begin
  vHeading := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
  {if (getNIPSWarning = TRUE) or (getAnatomyWarning = TRUE) or (getCervixWarning = TRUE) or (getPlacentalWarning = TRUE) or (getOvaryWarning = TRUE) or (getCordInsertionWarning = TRUE) or (GFibroidWarning = TRUE) then//(GPlacentaWarning = TRUE) or (GPresentationWarning = TRUE) or (GCervixWarning = TRUE) or (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) or (GAnatomyWarning = TRUE) or (getFunnelingMembranes = TRUE) then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end; }
  if cxccbReferralIndication.States[2] then
    lbMergeDataMergeOrder.Items.Add('AMNIOCENTESIS')
  else if cxccbReferralIndication.States[3] then
     lbMergeDataMergeOrder.Items.Add('ACCESS_CERVICAL_LENGTH')
  else if cxccbReferralIndication.States[0] then
    lbMergeDataMergeOrder.Items.Add('ROUTINE_MORPHOLOGY_SCAN')
  else if cxccbReferralIndication.States[1] then
    lbMergeDataMergeOrder.Items.Add('EARLY_ANATOMY_REVIEW')
  else
       lbMergeDataMergeOrder.Items.Add('ROUTINE_MORPHOLOGY_SCAN');
end;
                                                      
  
procedure InitializeScreen;
begin
  Gwarning := False;
  GPlacentaWarning := FALSE;
  GPresentationWarning := FALSE;
  GCervixWarning := FALSE;
 //GUAPIWarning := FALSE;                                     :
  //GMCAPIWarning := FALSE;
  GAnatomyWarning := FALSE;
  if (deExamDate.Date < 100) then
    deExamDate.Date := Now;
  pgFetusMeasusements.ActivePage := cxtsFetusGeneral1;
  spFibroidCountOnChange(nil);
  //edtPtNameOnChange(nil);
  cbGestationType.ItemIndex := 1;
  if (GetClinicalIndicators = '') then
   cxccbReferralIndication.States[0] := 1;
  cbGestationTypeChange(nil);
  spFibroidCount.Enabled := False;

end;


procedure StartScript;
begin                                   
    // -----------------------------------------------------------------------------//
    InitializeScreen;
    cbGestationType.Properties.OnChange := 'cbGestationTypeChange';
    deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';
    cbLowLyingPlacentaYes1.OnClick := 'cbToggleCheckOnClick';
    cbLowLyingPlacentaNo1.OnClick := 'cbToggleCheckOnClick';
    cbFetalAnatomyNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cbFetalAnatomyAbNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cxccbReferralIndication.Properties.OnChange := 'cxccbReferralIndicationChange';
    cxccbObstetricHistory.Properties.OnChange := 'cxccbObstetricHistoryChange';

    deUSSEDD1.Properties.OnChange := 'cbUSSEDDOnChange';

    cbCervixTVS.OnClick := 'cbToggleCheckOnClick';
    cbCervixTA.OnClick := 'cbToggleCheckOnClick';
    spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
    cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';

    edtMeanUAPI.Properties.OnChange := 'edtMeanUAPIOnChange';
    edtMeanRUAPI.Properties.OnChange := 'edtMeanRUAPIOnChange';
    edtMeanLUAPI.Properties.OnChange := 'edtMeanRUAPIOnChange';
    
    btnGeneratePercentiles.OnClick := 'btnGeneratePercentilesOnClick'

    btnSelectAll1.OnClick := 'btnSelectAll1OnClick';
    btnClear1.OnClick := 'btnClear1OnClick';

    cbGendermale1.OnClick := 'cbToggleCheckOnClick';
    cbGenderFemale1.OnClick := 'cbToggleCheckOnClick';
    cbConsistentNIPTYes1.OnClick := 'cbToggleCheckOnClick';
    cbConsistentNIPTNo1.OnClick := 'cbToggleCheckOnClick';
    cbConsistentNIPTUnknown1.OnClick := 'cbToggleCheckOnClick';
    cbRightOvaryNormal.OnClick := 'cbToggleCheckOnClick';
    cbRightOvaryAbNormal.OnClick := 'cbToggleCheckOnClick';
    cbLeftOvaryNormal.OnClick := 'cbToggleCheckOnClick';
    cbLeftOvaryAbNormal.OnClick := 'cbToggleCheckOnClick';

    cbVCI1.OnClick := 'cbToggleCheckOnClick';
    cbMCI1.OnClick := 'cbToggleCheckOnClick';
    cbCCI1.OnClick := 'cbToggleCheckOnClick';

    cbCervixShortYes.OnClick := 'cbToggleCheckOnClick';
    cbCervixShortNo.OnClick := 'cbToggleCheckOnClick';

    cbFunnellingofmembranesYes.OnClick := 'cbToggleCheckOnClick';
    cbFunnellingofmembranesNo.OnClick := 'cbToggleCheckOnClick';

    cbCervixSutureYes.OnClick := 'cbCervixSutureYesOnClick'
    cbCervixSutureNo.OnClick := 'cbCervixSutureYesOnClick'

    cbPoorView.OnClick := 'cbToggleCheckOnClick';
    cbAverageViews.OnClick := 'cbToggleCheckOnClick';
    cbGoodViews.OnClick := 'cbToggleCheckOnClick';
    cbVeryGoodViews.OnClick := 'cbToggleCheckOnClick';

    cbVasaPraeviaYes1.OnClick := 'cbToggleCheckOnClick';               
    cbVasaPraeviaNo1.OnClick := 'cbToggleCheckOnClick';                               
    cbSuccenturiateLobeYes1.OnClick := 'cbSuccenturiateLobeYes1OnClick';
    cbSuccenturiateLobeNo1.OnClick := 'cbSuccenturiateLobeNo1OnClick';
    cbLowLyingYes11.OnClick := 'cbToggleCheckOnClick';
    cbLowLyingNo11.OnClick := 'cbToggleCheckOnClick';

    cbPatientInformedYes.OnClick := 'cbToggleCheckOnClick';
    cbPatientInformedNo.OnClick := 'cbToggleCheckOnClick';

    edtBPD1.Properties.OnChange := 'getBiometryPercentiles';
    edtAC1.Properties.OnChange := 'getBiometryPercentiles';
    edtHC1.Properties.OnChange := 'getBiometryPercentiles';
    edtFL1.Properties.OnChange := 'getBiometryPercentiles';
    edtHL1.Properties.OnChange := 'getBiometryPercentiles';
    
end;

StartScript;