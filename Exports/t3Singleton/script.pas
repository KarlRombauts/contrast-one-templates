// ******************* Global Variables ************************************//
Var
   GLiquorWarning, GPlacentaWarning, GPresentationWarning, GCervixWarning, GUAPIWarning, GMCAPIWarning, GAnatomyWarning, GFibroidWarning : Boolean;

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

function PrefixZeroDecimal(inStr: String): String;   
var
  tempStr : String;
begin                
  result := Trim(inStr);                        
  if (pos('.', result) > 0) then        
  begin 
    tempStr  := copy(result, 1, (pos('.', result) -1));
    if tempStr = '' then
      result := '0' + inStr;                
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
    vt := vt + '. '
  else
    vt := vt + ' ';
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
    20: result := 1.227;
    21: result := 1.278;
    22: result := 1.330;
    23: result := 1.381;
    24: result := 1.430;
    25: result := 1.476;
    26: result := 1.517;
    27: result := 1.553;
    28: result := 1.580;
    29: result := 1.599;
    30: result := 1.607;
    31: result := 1.603;
    32: result := 1.586;
    33: result := 1.555;
    34: result := 1.511;
    35: result := 1.453;
    36: result := 1.382;
    37: result := 1.300;
    38: result := 1.208;
    39: result := 1.108;
    40: result := 1.002;
    41: result := 0.894;
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
  for i := 0 to cxccbReferralIndicators.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndicators.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cxccbReferralIndicators.ShortDescription[i];
    end;
  end;                     
  if (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtReferralIndicator1.Text);
  end;
  if result <> '' then
    result := AddFullStop(result);
  result := result + ' ';  
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
    result := (sePlacentaExtendsBy1.text)
  end
  else
  begin
    if strToFloatDef(meInternalOS1.Text, 0) > 0 then
      result := meInternalOS1.Text + 'mm from'
    else
      result := 'at'
  end;
end;  

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



 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta was ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
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
          else if (StrToFloatDef(vmeInternalOS.text,0) = 0 ) then
            result := result + 'The inferior edge reaching the internal cervical os.  '
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
       result := result + 'Low lying ';
       result := result + GetPlacenta + ' placenta';
       if meInternalOS1.text <> '' then
       begin
        if (StrToFloatDef(meInternalOS1.text,0) > 0 ) then
            result := result+', ' + GetPlacenta1Measure + ' from the internal cervical os.  '
        else if (StrToFloatDef(meInternalOS1.text,0) = 0 ) then
            result := result + ' with the inferior edge reaching the internal cervical os.  '
       end;     
    end;
    if result <> '' then
      result := AddFullStop(result);
 end;

 function getPresentationDetail : String
 begin
   result := '';
   GPresentationWarning := FALSE;
   if  cbPresentation1.itemIndex > 1 then
   begin
     result := result +  Trim(cbPresentation1.Text) ;
     GPresentationWarning := TRUE;
   end;
   else
   begin
     result := result +  Trim(cbPresentation1.Text);
     GPresentationWarning := False;
   end;
   if (result <> '') and  (cbPresentation1.itemIndex < 5) then
     result := result + ' presentation';
   if result <> '' then
     result := AddFullStop(result);
 end;

  function getPresentation : String
 begin
   result := '';
   GPresentationWarning := FALSE;
   if  cbPresentation1.itemIndex > 1 then
   begin
     result := result +  Trim(cbPresentation1.Text) ;
     GPresentationWarning := TRUE;
   end;
   else
   begin
     result := result +  Trim(cbPresentation1.Text);
     GPresentationWarning := False;
   end;
   if (result <> '') and  (cbPresentation1.itemIndex < 5) then
     result := result + ' presentation';
 end;


  Function getCervix : String
 var
   vCervicalLength : Real;
 begin
  result := '';
  vCervicalLength := 0.0;
  GCervixWarning := FALSE;
  if (meCervicalLength.text) <> '' then
  begin
      vCervicalLength := StrToFloatDef(meCervicalLength.text, 0);
      if ((vCervicalLength > 25)) then
      begin
         result := 'The cervix is long and closed measuring ';
         GCervixWarning := False;
      end
      else if (vCervicalLength > 0) and (vCervicalLength < 25) then
      begin
         result := 'The cervix is shortened measuring ';
         GCervixWarning := True;
      end
      result := result + meCervicalLength.text + 'mm'
      if cbCervixTVS.checked then
        result := result + ' on transvaginal ultrasound'
      else if cbCervixTA.checked then
        result := result + ' on transabdominal ultrasound'
  end;
  result := AddFullStop(Result);
 end;


 Function getCervixConclusion : String
 var
   vCervicalLength : Real;
 begin
  result := '';
  if (vCervicalLength > 0) and (vCervicalLength < 25) then
  begin
    GCervixWarning := True;
  end
  {vCervicalLength := 0.0;
  GCervixWarning := FALSE;
  if (meCervicalLength.text) <> '' then
  begin
      vCervicalLength := StrToFloatDef(meCervicalLength.text, 0);
      if ((vCervicalLength > 25)) then
      begin
         result := 'Long and closed cervix ';
         GCervixWarning := False;
      end
      else if (vCervicalLength > 0) and (vCervicalLength < 25) then
      begin
         result := 'Shortened cervix ';
         GCervixWarning := True;
      end
      result := result + '('+ meCervicalLength.text + 'mm'
      if cbCervixTVS.checked then
        result := result + ' on transvaginal ultrasound'
      else if cbCervixTA.checked then
        result := result + ' on transabdominal ultrasound'
      result := result + ')';
  end;
  result := AddFullStop(Result);  }
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
 
 function GetDuctusVenosusWarning: Boolean;
begin
result := False;                                               
if cbDVWAbNormal1.checked then              
    result := True;
end;  

 function getAssessPlacentalSite: String;
begin
result := '';                                               
    if cxccbReferralIndicators.States[6] = 1 then 
    begin
        if cbLowLyingPlacentaNo1.checked then 
           result := 'Placenta is no longer low lying.';
     end;   
end;         

Function getConclusionWarnings : String
begin
result := '';
  if (GAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GPlacentaWarning = TRUE) then
     result := result + getPlacentaConclusion;  
  if getAssessPlacentalSite <> '' then
     result := result + getAssessPlacentalSite ;
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE)or (GetDuctusVenosusWarning = TRUE) or (cbFeatlMovementsNo1.checked) then
     result := result + 'Dictate WELL-BEING.  '
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

//--------------------- Doppler calculations ---------------------------------------//
function GetUAPI : String
var
  vUmbilicalArtPI1,vCalc : Real;
begin
result := '';
vUmbilicalArtPI1 := 0.0;  
GUAPIWarning := FALSE;
vCalc := 0.0;
  if Length(Trim(edtUmbilicalArtPI1.Text)) > 0 then                                                    
  begin
      if edtUmbilicalArtPI1.Text <> '0.00' then
      begin
        vUmbilicalArtPI1 := StrToFloat(Trim(edtUmbilicalArtPI1.Text));
        vCalc := GetNormalUAPIRange(GetGestWeeks);
        if vCalc > 0 then
        begin
          if(vUmbilicalArtPI1 < vCalc) then
          begin
             result := 'normal';
             GUAPIWarning := False;
          end;
          else
          Begin                                                  
             result := 'above 95%';
             GUAPIWarning := True;
          end;
        end;
     end;
  end;
end;

function GetMCAPI : String
var
  vMidCerArtPI1,vCalc : Real;
begin
result := '';
GMCAPIWarning := FALSE;
  if Length(Trim(edtMidCerArtPI1.Text)) > 0 then
  begin
      if edtMidCerArtPI1.Text <> '0.00' then
      begin
        vMidCerArtPI1 := StrToFloat(Trim(edtMidCerArtPI1.Text));
        vCalc := GetNormalMCAPIRange(GetGestWeeks);
        if vCalc > 0 then
        begin
          if(vMidCerArtPI1 >= vCalc) then
          begin
             result := 'normal';
             GMCAPIWarning := False;
          end;
          else
          begin
             result := 'below 10%';        
             GMCAPIWarning := True;
          end;
        end;
     end; 
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

Function getDuctusVenosus : String
begin
  result := '';
  if cbDVWNormal1.checked then
    result := result + 'normal wave form'
  else if cbDVWAbNormal1.checked then
    result := result + 'abnormal wave form'
  if result <> '' then
    result := #13#10 + 'Ductus venosus' + #9#9 + result;  
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
  vv := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(inFibroid));
  vl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidLength' + intToStr(inFibroid));
  vw := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidWidth' + intToStr(inFibroid));
  vd := TWinControl(tsFibroids.Owner).FindComponent('edtFibroiddepth' + intToStr(inFibroid));
  vp := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(inFibroid));
  vt := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(inFibroid));
  vlr := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(inFibroid));
  vCheck := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
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
          result := result  + format('%d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]) + ' ' ;
            if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
        else
        begin
          result := result  + format('%d x %d x %dmm', [v1, v2, v3]) + ' ' ;
           if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
      end
      else
      begin
        result := result + format('%d x %dmm', [v1, v2]) + ' ' ;
         if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
      end;
    end
    else
    begin
      result := result + format('%dmm', [v1])+ ' ' ;
       if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
       result := result + vp.Text + ' ' + vt.Text;
    end;
    if result <> '' then
      result := result + ' fibroid'
  end;
  if vCheck.Checked then
  begin
    vv := TWinControl(tsFibroids.Owner).FindComponent('seCloseToCrevix' + intToStr(inFibroid));
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
      result := result + ', clear of the cervix';
  end;
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
             result := result + ' and ';
          else
             result := result + ', ';
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


procedure edtAFI1Onchange(sender)
var
  vWeeks : Integer;
begin
   vWeeks := GetGestWeeks;
   if (cbGestationType.ItemIndex= 1) or (cbGestationType.ItemIndex= 4) then
   begin
     if  (StrToFloatDef(edtAFI1.Text, 0) > 0) and (edtAFI1.enabled) then
     begin
        if (StrToFloatDef(edtAFI1.Text, 0) >= GetLiquor5Centile(VWeeks))  and (StrToFloatDef(edtAFI1.Text, 0)<= GetLiquor95Centile(vWeeks)) then
        begin
          cbFetalWellLiqor1.ItemIndex := 0;
        end;
        else if (StrToFloatDef(edtAFI1.Text, 0) > GetLiquor95Centile(vWeeks)) then
        begin
          cbFetalWellLiqor1.ItemIndex := 1;
        end;
        else if (StrToFloatDef(edtAFI1.Text, 0) > 0)  and (StrToFloatDef(edtAFI1.Text, 0)< GetLiquor5Centile(vWeeks)) then
        begin
          cbFetalWellLiqor1.ItemIndex := 2;
        end;
     end
     else if (StrToFloatDef(edtAFI1.Text, 0) = 0)  then
     begin
      cbFetalWellLiqor1.ItemIndex := 3;
     end;
   end;
end;

  procedure ToggleCloseToCervixFibroid(sender);
  var
    vControlName: String;
    vControl: TcxSpinEdit;
  begin
    vControlName := TcxCheckBox(sender).Name;
    if vControlName[length(vControlName)] = '0' then
      vControl := TWinControl(sender.Owner).FindComponent('seCloseToCrevix10')
    else
      vControl := TWinControl(sender.Owner).FindComponent('seCloseToCrevix' + vControlName[length(vControlName)]);
    vControl.Enabled := TcxCheckBox(sender).Checked;
  end;

procedure edtAFI2Onchange(sender)
begin
   if (cbGestationType.ItemIndex= 1) or (cbGestationType.ItemIndex= 4) then
   begin
     if  (StrToFloatDef(edtAFI2.Text, 0) > 0) and (edtAFI2.enabled) then
     begin
        if (StrToFloatDef(edtAFI2.Text, 0) >= 7)  and (StrToFloatDef(edtAFI2.Text, 0)<= 25) then
          cbFetalWellLiqor2.ItemIndex := 0;
        else if (StrToFloatDef(edtAFI2.Text, 0) > 25) then
        begin
          cbFetalWellLiqor2.ItemIndex := 1;
        end;
        else if (StrToFloatDef(edtAFI2.Text, 0) > 0)  and (StrToFloatDef(edtAFI2.Text, 0)< 7) then
        begin
          cbFetalWellLiqor2.ItemIndex := 2;
        end;
     end;
    else if (StrToFloatDef(edtAFI2.Text, 0) = 0)  then
      begin
        cbFetalWellLiqor2.ItemIndex := 3;
      end
   end;
end;

procedure cxccbReferralIndicatorsChange(Sender);
begin
  edtReferralIndicator1.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);
end;

procedure cxccbObstetricHistoryChange(Sender);
begin
  edtOtherPastHistory1.Enabled := (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1);
end;


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

procedure cbFeatlMovementsClick(Sender);
begin
  cbToggleCheckOnClick(Sender);
  cbFetalTone1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbFetalTone1.checked := cbFeatlMovementsYes1.Checked;
  cbFetalMovement1.Enabled :=((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbFetalMovement1.Checked := cbFeatlMovementsYes1.Checked;
  cbFetalBreathing1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbFetalBreathing1.Checked := cbFeatlMovementsYes1.Checked;
  cbLiqur1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  cbLiqur1.checked := cbFeatlMovementsYes1.Checked;
  lblBioPhysicalScore1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  seBiophysicalScore1.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
  lbldivBy81.Enabled := ((cbFeatlMovementsYes1.Checked) or (cbFeatlMovementsNo1.Checked));
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
end; 
                                                                                                       
procedure edtMidCerArtPI1Exit(Sender: TObject);
begin
  edtMidCerArtPI1.text := PadDecimalPlaces(edtMidCerArtPI1.text);                          
end;  

procedure edtAFI1Exit(Sender: TObject);
begin            
   edtAFI1.text := PadDecimalPlaces(edtAFI1.text); 
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

procedure InitializeScreen;
begin
  Gwarning := False;
  GPlacentaWarning := FALSE;
  GPresentationWarning := FALSE;
  GCervixWarning := FALSE;
  GUAPIWarning := FALSE;
  GMCAPIWarning := FALSE;
  GAnatomyWarning := FALSE;
  if (deExamDate.Date < 100) then
    deExamDate.Date := Now;
  pgFetusMeasusements.ActivePage := cxtsFetusGeneral1;
  //edtPtNameOnChange(nil);
  cbGestationType.ItemIndex := 1;
  cbGestationTypeChange(nil);
  spFibroidCountOnChange(nil);

end;


procedure StartScript;
begin
    // -----------------------------------------------------------------------------//
    InitializeScreen;
    cbGestationType.Properties.OnChange := 'cbGestationTypeChange';
    deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';
    PresentingTwinYes1.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinNo1.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinYes2.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinNo2.OnClick := 'cbToggleCheckOnClick';
    cbLowLyingPlacentaYes1.OnClick := 'cbToggleCheckOnClick';
    cbLowLyingPlacentaNo1.OnClick := 'cbToggleCheckOnClick';
    cbFetalAnatomyNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cbFetalAnatomyAbNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cxccbReferralIndicators.Properties.OnChange := 'cxccbReferralIndicatorsChange';
    cxccbObstetricHistory.Properties.OnChange := 'cxccbObstetricHistoryChange';

    cbLiqur1.OnClick := 'CalcFetalScore';
    cbFetalBreathing1.OnClick := 'CalcFetalScore';
    cbFetalMovement1.OnClick := 'CalcFetalScore';
    cbFetalTone1.OnClick := 'CalcFetalScore';

    cbLiqur2.OnClick := 'CalcFetalScore';
    cbFetalBreathing2.OnClick := 'CalcFetalScore';
    cbFetalMovement2.OnClick := 'CalcFetalScore';
    cbFetalTone2.OnClick := 'CalcFetalScore';

    cbLiqur3.OnClick := 'CalcFetalScore';
    cbFetalBreathing3.OnClick := 'CalcFetalScore';
    cbFetalMovement3.OnClick := 'CalcFetalScore';
    cbFetalTone3.OnClick := 'CalcFetalScore';

    cbFeatlMovementsYes1.OnClick := 'cbFeatlMovementsClick';
    cbFeatlMovementsNo1.OnClick := 'cbFeatlMovementsClick';

    cbCervixTVS.OnClick := 'cbToggleCheckOnClick';
    cbCervixTA.OnClick := 'cbToggleCheckOnClick';

    cbDVWNormal1.OnClick := 'cbToggleCheckOnClick';
    cbDVWAbNormal1.OnClick := 'cbToggleCheckOnClick';

    edtAFI1.Properties.Onchange := 'edtAFI1Onchange';
    edtAFI2.Properties.Onchange := 'edtAFI2Onchange';

    btnGeneratePercentiles.OnClick := 'btnGeneratePercentilesOnClick'
    btnCalGrowthPer1.OnClick := 'btnCalGrowthPer1OnClick';

    spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
    cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';

        cbCavityDistortion1.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion2.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion3.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion4.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion5.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion6.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion7.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion8.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion9.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion10.OnClick := 'ToggleCloseToCervixFibroid';

    seEstFetalWeight1.Properties.Onchange :=  'btnCalGrowthPer1OnClick';

    edtBPD1.Properties.OnChange := 'getBiometryPercentiles';
    edtAC1.Properties.OnChange := 'getBiometryPercentiles';
    edtHC1.Properties.OnChange := 'getBiometryPercentiles';
    edtFL1.Properties.OnChange := 'getBiometryPercentiles'; 
    edtHL1.Properties.OnChange := 'getBiometryPercentiles';  
    edtMidCerArtPI1.OnExit := 'edtMidCerArtPI1Exit' ; 
    edtAFI1.OnExit := 'edtAFI1Exit';

end;

                       

StartScript;