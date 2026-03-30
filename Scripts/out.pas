// ******************* Global Variables ************************************//
// ******************* Utility Functions ************************************//

function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  try                                                                                                                                                          
    result := StrToFloat(inString);
  except
    result := inDefault;
  end;
end;

function StrToIntDef(inString: string; inDefault: Integer): Integer;
begin                                              
  try
    result := StrToInt(inString);
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

function RemoveDecimalPointAtEnd(inStr: String): String;
begin
  result := Trim(inStr);
  if result[length(result)] = '.' then
      result := copy(result, 1, (length(result)-1));
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
    vt := inStr;
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
            result := Format('%d x %d x %d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
        else
          result := Format('%d x %d x %d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
      end
      else
        result := Format('%d x %d x %d%s', [v1, v2, v3, inType]);
    end
    else
      result := Format('%d x %d%s', [v1, v2, inType]);
  end
  else
    result := Format('%d%s', [v1, inType]);
end
else
  result := '';
if result <> '' then
  result := ' of '+ result;

end;

// **********************************************************************************//

// ******************* Header Functions *********************************************//
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
    result := result + trim(edtPresentComplaintOther.Text);
  end;
  if result <> '' then
    result := AddFullstopToEnd(result);
  //result := result + ' ';
end;

function GetClinicalHistory: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cbClinicalHistory.Properties.Items.Count - 2 do
  begin
    if cbClinicalHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cbClinicalHistory.ShortDescription[i];
    end;
  end;
  if (cbClinicalHistory.States[cbClinicalHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtClicnicalHistory.Text);
  end;
  if result <> '' then
    result := AddFullstopToEnd(result);
end;

procedure cxccbReferralIndicatorsChange(Sender);
begin
  edtPresentComplaintOther.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);
end;

procedure cbNaturalMedicationOnChange(sender)
begin
  edtMedicationOther.Enabled := (cbNaturalMedication.ItemIndex = (cbNaturalMedication.Properties.Items.Count - 1));
end;


procedure cbClinicalHistoryOnChange(sender)      
begin
  edtClicnicalHistory.Enabled := (cbClinicalHistory.States[cbClinicalHistory.Properties.Items.Count-1] = 1);
end;

// **********************************************************************************//
// ******************* Dating Functions *********************************************//
function GetWeeksFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;
begin
  result := (trunc(inExamDate) - Trunc(inLMPDate)) div 7;
end;

function GetDaysFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;
begin
  result := (trunc(inExamDate) - Trunc(inLMPDate)) mod 7;
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

function GetEmbryoTransferCount: string;
begin
  result := '';
  case trunc(seNumberTransferred.Value) of
    1: result := 'single';
  else
    result := GetNumberString(seNumberTransferred.Value);
  end;
end;

function GetFrozen: String;
begin
  if cbEDDPrinciple.ItemIndex = 6 then
    result := 'frozen '
  else
    result := '';
end;


function IsLivePregnancy : Boolean;
var
vInFetus : integer;
vEmbryo1Visualised,vHeartMotionVisYes : TcxCheckBox;
vcxtsFetus : TcxTabSheet;
begin
result := True;
for vInFetus := 1 to 4 do
begin
   vEmbryo1Visualised :=  TWinControl(pcEmbryos.Owner).FindComponent('cbEmbryo1Visualised' + intToStr(vInFetus));
   vHeartMotionVisYes :=  TWinControl(pcEmbryos.Owner).FindComponent('cbHeartMotionVisYes' + intToStr(vInFetus));
   vcxtsFetus := TWinControl(pcEmbryos.Owner).FindComponent('cxtsFetus' + intToStr(vInFetus));

       if (vcxtsFetus.TabVisible) then
       begin
         if not ((vEmbryo1Visualised.Checked) and (vHeartMotionVisYes.Checked)) then
             result := false;
       end;
   end;
end;

procedure cbEDDPrincipleOnChange(sender)
begin
  case cbEDDPrinciple.ItemIndex of
    1: begin
         gbEDDDating.Height := 47;
         lblMedication.Visible := False;
       end;
    2: begin
         pcEDDPrinciple.Properties.ActivePage := tsMenstrualEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    0: begin
         pcEDDPrinciple.Properties.ActivePage := tsStatedEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    3: begin
         pcEDDPrinciple.Properties.ActivePage := tsEstEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    4: begin
         pcEDDPrinciple.Properties.ActivePage := tsTimedEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    5: begin
         pcEDDPrinciple.Properties.ActivePage := tsIVFEDD;
         gbEDDDating.Height := 120;
         lblMedication.Visible := True;
       end;
    6: begin
         pcEDDPrinciple.Properties.ActivePage := tsIVFEDD;
         gbEDDDating.Height := 120;
         lblMedication.Visible := True;
       end;
  end;
end;

procedure cbLMPDateOnChange(Sender);
begin
  if cbEDDPrinciple.ItemIndex = 1 then
  begin
    deMenstrualEDD.Date := deLMPDate.Date + 280;
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

procedure deMenstrualEDDOnChange(Sender);
begin
  PopulateEDDControls(deMenstrualEDD, seEDDCalGAWeeks, seEDDCalGADays);
end;

procedure deStatedEDDOnChange(Sender);
begin
  PopulateEDDControls(deStatedEDD, seStatedEDDGestAgeWeeks, seStatedEDDGestAgeDays);
end;

procedure deMUFWEddOnChange(Sender);
begin
  PopulateEDDControls(deMUFWEdd, seMUFWGestAgeWeeks, seMUFWGestAgeDays);
end;

procedure deOvulationEDDOnChange(Sender);
begin
  PopulateEDDControls(deOvulationEDD, spOvualtionGestAgeWeeks, spOvualtionGestAgeDays);
end;

procedure deIVFEDDOnChange(Sender);
begin
  PopulateEDDControls(deIVFEDD, seIVFGAWeeks, seIVFGADays);
end;

procedure cbDateOfConceptionOnChange(Sender);
begin
  if deConceptionDate.Date > 0 then
  begin
    deTransferDate.Date := deConceptionDate.Date + seTransferDay.Value;
  end;
end;

procedure seTransferDayOnChange(Sender);
begin
  cbDateOfConceptionOnChange(nil);
end;


function GetEbmHeartMotion(inOffset: Integer): string;
var
  vEy: TcxCheckBox;
  vsw: TcxSpinEdit;
  vhm: TcxComboBox;
begin
  vEy := TWinControl(pcEmbryos.Owner).FindComponent('cbHeartMotionVisYes' + intToStr(inOffset));
  if vEy.checked then
  begin
    vsw := TWinControl(pcEmbryos.Owner).FindComponent('seHeartBPM' + intToStr(inOffset));
    result := 'heart motion was present (' + Trim(IntToStr(vsw.Value)) + ' bpm).';
    vhm := TWinControl(pcEmbryos.Owner).FindComponent('cbHeartMotion' + intToStr(inOffset));
    case vhm.itemIndex of
      1: result := 'Normal embryonic ' + result;
      2: result := 'Embryonic ' + result + ' Bradycardia was noted.'
      3: result := 'Embryonic ' + result + ' Tachycardia was noted.'
    else
      result := 'Embryonic ' + result;
    end;
  end
  else
  begin
    vEy := TWinControl(pcEmbryos.Owner).FindComponent('cbHeartMotionVisNo' + intToStr(inOffset));
    if vEy.checked then
    begin
      if (cbPregnancyOutcome.ItemIndex <> 4) then
      result := 'No embryonic heart motion was observed.';{ 'Anticipate visualisation of embryonic heart activity once the embryo has reached 7 mm at the latest. ';}
      else
      result := 'No embryonic heart motion was observed.';
    end
    else
      result := '';
  end;
end;

function GetFibroidCount: string;
var
  vNumber: string;
begin
  if spFibroidCount.Value = 0 then
    result := 'No fibroids were'
  else
  begin
    vNumber := GetNumberString(spFibroidCount.Value);
    if spFibroidCount.Value = 1 then
      result := vNumber + ' fibroid is'
    else
    begin
      result := vNumber + ' fibroids are';
    end;
  end;
  result := InitCaps(result, False);
end;

function GetFibroidAllClear: string;
var
  vFibroidCount: Integer;
  vCheck: TcxCheckBox;
  inFibroid, vNumber : integer;
begin
result := '';
  vNumber := 0;
  vFibroidCount := spFibroidCount.Value;
  for inFibroid :=1 to  vFibroidCount do
  begin
    vCheck := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
    if not(vCheck.Checked) then
    begin
     vNumber := vNumber + 1;
    end;
  end;
  if(vNumber = vFibroidCount) then
  begin
     result := '(all clear of the cervix)';
  end;
  else
     result :='';
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

function GetCavDistortionCount: Integer;
begin
  result := 0;
  if (gbFibroid1.Visible) and (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
    result := Result + 1;
  if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then
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
    result := Result + 1;
end;


function GetSingleFibroidDimensions: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value * 10) / 10;
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + format('%d x %d x %dmm (vol. %3.1f cc)', [v1, v2, v3, v4]);
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

function GetFibroidString(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
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
  if vlr.Text <> '' then
    result := vlr.Text + ' ';
  v1 := trunc(vl.Value);
  v2 := trunc(vw.Value);
  v3 := trunc(vd.Value);
  v4 := trunc(vv.Value * 10) / 10;
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + vp.Text + ' ' + vt.Text + format(' %d x %d x %dmm (vol. %3.1f cc)', [v1, v2, v3, v4]);
        end
        else
          result := result + vp.Text + ' ' + vt.Text + format(' %d x %d x %dmm', [v1, v2, v3]);
      end
      else
        result := result + vp.Text + ' ' + vt.Text + format(' %d x %dmm', [v1, v2]);
    end
    else
      result := result + vp.Text + ' ' + vt.Text + format(' %dmm', [v1]);
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
  {else
  begin
    if GetCavDistortionCount > 0 then
      result := result + ', clear of the cervix';
  end; }
end;

function GetFibroidDesc(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  if inFibroid <= spFibroidCount.Value then
  begin
    result := GetFibroidString(inFibroid);
  end;
  if trim(result) <> '' then
    result := InitCaps(result, False);
end;

function GetLargestFibroid(var isDistored: Boolean): Real;
var
  vControl: TcxSpinEdit;
  vControl2: TcxCheckBox;
begin
  result := 0.0;
  isDistored := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(i + 1));
    if (assigned(vControl)) and (TcxSpinEdit(vControl).Value > result) then
    begin
      result := TcxSpinEdit(vControl).Value;
      vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      if assigned(vControl2) then
      begin
        if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
          isDistored := True
        else
          isDistored := False;
      end
      else
        result := False;
    end;
  end;
end;

function GetFibroidAvg(inFibroid: Integer): integer;
var
  vControl: TWinControl;
  i: Integer;
  vValue: Integer;
  vCount: integer;
begin
  result := 0;
  vCount := 0;
  vValue := 0;
  vControl := TWinControl(tsFibroids.Owner).FindComponent('gbFibroid' + intToStr(inFibroid));
  if assigned(vControl) then
  begin
    for i := 0 to vControl.ControlCount - 1 do
    begin
      if (vControl.Controls[i] is TcxSpinEdit) and (pos('Volume', vControl.Controls[i].Name) < 1) then
      begin
        if (TcxSpinEdit(vControl.Controls[i]).Value > 0) then
        begin
          vCount := vCount + 1;
          vValue := vValue + TcxSpinEdit(vControl.Controls[i]).Value;
        end;
      end;
    end;
  end;
  if vCount > 0 then
    result := Trunc(vValue / vCount);
end;

function getFetalHeartRate : string;
begin
  if cbHeartMotionVisNo1.checked then
  begin
    case cbPregnancyOutcome.itemIndex of
        4: result := 'absent'
      2,3: result := 'not seen'
      else
           result := '##'
    end;  
  end
  else if cbHeartMotionVisYes1.checked then
  begin
     if seHeartBPM1.value > 0 then
       result := IntToStr(seHeartBPM1.value) + 'bpm';
     else if (cbHeartMotion1.enabled) and (cbHeartMotion1.ItemIndex = 1) then
       result := 'normal'  
  end;
end;

function getHeartRateLabel : string;
begin
  if cbHeartMotionVisNo1.checked then
  begin
    case cbPregnancyOutcome.itemIndex of
        2,3,4: result := 'Heart Motion'
      else
           result := 'Heart rate'
    end;  
  end
  else if cbHeartMotionVisYes1.checked then
  begin
       result := 'Heart rate'
  end;
end;

function GetSingleFibroidCavity: string;
var
  vControl2: TWinControl;
  v1, v2, v3: TcxComboBox;
begin
  result := '';
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
      begin
        v1 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
        v2 := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
        v3 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if (assigned(v1)) and (TcxComboBox(v1).text <> '') then
          result := result + Trim(TcxComboBox(v1).text) + ' ';
        if (assigned(v2)) and (TcxComboBox(v2).text <> '') then
          result := result + Trim(TcxComboBox(v2).text) + ' ';
        if (assigned(v3)) and (TcxComboBox(v3).text <> '') then
          result := result + Trim(TcxComboBox(v3).text) + ' ';
        break;
      end;
    end;
  end;
end;

function GetHasDistortion: Boolean;
var
  vControl2: TcxCheckBox;
  i: Integer;
begin
  result := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
      begin
        result := True
          break;
      end;
    end;
  end;
end;

function GetFibroidConcl: string;
begin
  result := '';
  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    if (spFibroidCount.Value > 1) then
    begin
      if (spFibroidCount.Value > 2) then
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        for i := 2 to spFibroidCount.Value do
        begin
          vTemp := GetFibroidAvg(i);
          if vTemp > vLargest then
            vLargest := vTemp;
          if vTemp < vSmallest then
            vSmallest := vTemp;
        end;
        result := result + Format('Multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
        if GetHasDistortion then
          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
        else
          result := result + ', all clear of cervix.';  
      end
      else
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        vTemp := GetFibroidAvg(2);
        if vTemp > vLargest then
          vLargest := vTemp;
        if vTemp < vSmallest then
          vSmallest := vTemp;
       result := result + Format('Two fibroids of %dmm and %dmm visualised',[vSmallest, vLargest]);
        if GetHasDistortion then
          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
        else
          result := result +', both clear of cervix.';
      end;
    end
    else
    begin
      result := result + Format(' A single %s fibroid of %dmm was visualised', [cbFibroidsType1.text, GetFibroidAvg(1)]);
      if (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
      begin
        result := result + ' with associated cavity distortion.';
      end;
      else
        result := result + '.';
    end;
  end;
end;

function GetLMPWeeks(inDate: TDateTime): Integer;
begin
  result := (trunc(now) - trunc(inDate)) div 7;
end;

function GetLMPDays(inDate: TDateTime): Integer;
begin
  result := (trunc(now) - trunc(inDate)) mod 7;
end;



// **********************************************************************************//
// **********************************************************************************//

function GetEnteredEDD :String
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'No Dates. ';
  end
  else  }
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
      result := FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deStatedEDD.Date);
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := FormatDateTime('dd/mm/yyyy', deMUFWEdd.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := FormatDateTime('dd/mm/yyyy', deOvulationEDD.Date);
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deIVFEDD.Date);
    end;
  end;
  if not(cbPregnancyRedatedYes.checked) then
  begin
     result := '#|#+BOLD' + result + '#/#'
  end
end;

Function getGAFromEnteredEDD :String;
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'LMP Unknown. ';
  end
  else}
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
    begin
      result := Trim(IntToStr(seEDDCalGAWeeks.Value)) + ' weeks ';
      if seEDDCalGADays.Value >= 0 then
      begin
         if seEDDCalGADays.Value = 1 then
          result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' day';
         else
           result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' days';
      end;     
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := Trim(IntToStr(seStatedEDDGestAgeWeeks.Value)) + ' weeks ';
      if seStatedEDDGestAgeDays.Value >= 0 then
      begin
         if seStatedEDDGestAgeDays.Value = 1 then
          result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' day';
         else
           result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := Trim(IntToStr(seMUFWGestAgeWeeks.Value)) + ' weeks ';
    if seMUFWGestAgeDays.Value >= 0 then
    begin
       if seMUFWGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' days';
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := Trim(IntToStr(spOvualtionGestAgeWeeks.Value)) + ' weeks ';
      if spOvualtionGestAgeDays.Value >= 0 then
      begin
       if spOvualtionGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := Trim(IntToStr(seIVFGAWeeks.Value)) + ' weeks ' ;
      if seIVFGADays.Value >= 0 then
      begin                                                                                        
       if seIVFGADays.Value = 1 then
        result := result + Trim(IntToStr(seIVFGADays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seIVFGADays.Value)) + ' days';
      end;
    end;
  end;
end;

function getNIPSString : String
begin
result := '';
  if ((cbPregnancyOutcome.itemindex = 1) and ( cxccbReferralIndicators.States[2] = 1)) then
     result := result + #13#10 + 'The patient has been given a request for percept#|#+SUPSTM#/# testing and the result is expected in 3-5 days.'
end;

function getNIPSConclusion : String                                                       
begin
 result := '';
  if ((cbPregnancyOutcome.itemindex = 1) and ( cxccbReferralIndicators.States[2] = 1)) then
     result := result + 'The measurements are consistent with the expected gestation.  The patient has been given a request for percept#|#+SUPSTM#/# testing and the result is expected in 3-5 days.'

end;

Function GetOvary : string;
var
  tempString;
begin
  result := '';
  if cbRightOvaryIdentified.checked then
  begin
     if cbLeftOvaryIdentified.checked then
       result := result + 'Both ovaries are not identified.  ';
     else
       result := result + 'The right ovary is not identified.  ';
  end
  else  if cbLeftOvaryIdentified.checked then
     result := result + 'The left ovary is not identified.  ';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := result + 'Both ovaries are normal.  ';
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

  if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries.  ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary.  ';
  end
  else  if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum is visualised in the left ovary.  ' ;

     if result <> '' then
     result := #13#10 + #13#10 + result ;

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


function getCompositeDate : String;
begin
  result := '';
  result := intToStr(seUSSEDDGAWeeks1.value)   +' weeks '               
  if seSSEDDGADays1.value > 0 then
  begin
    if seSSEDDGADays1.value > 1 then
     result := result + intToStr(seSSEDDGADays1.value)   +' days';
    else
     result := result + intToStr(seSSEDDGADays1.value)   +' day';
  end
  else if seSSEDDGADays1.value = 0 then
      result := result + intToStr(seSSEDDGADays1.value)   +' days';
      
  result := AddFullstopToEnd(Result);
end

function getMissedMiscarriageFinding : String ;
begin
  result := '';
  result := 'Unfortunately, this examination confirms a missed miscarriage with embryo dimensions equivalent to '
  if getCompositeDate <> '' then
    result := result + getCompositeDate;
  result := result + 'No embryonic heart motion is detected.  ';
end;

function GetLiveFindings: String;
begin
  result := '';
  if cbPregnancyRedatedYes.checked then
    result := 'There is a single live intrauterine gestation with biometry consistent with ' + getCompositeDate
  else
    result := 'There is a single live intrauterine gestation.  ';
end;

function GetLiveConclusion: String;
begin
  result := '';
  if cbPregnancyRedatedYes.checked then
  begin
    result := 'There is a single live intrauterine gestation with biometry consistent with ' + getCompositeDate
    result := result +  'The pregnancy has been redated. The ultrasound EDD is ' + FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date) +'.  '
  end;
  else
    result := 'There is a single live intrauterine gestation consistent with the expected gestation.  ';
end;


function getMissedMiscarriageConclusion : String;
begin
result := '';
   result := result + 'Unfortunately this examination confirms a missed miscarriage at ' + getGAFromEnteredEDD;
   result := AddFullStopToEnd(Result);    
   result := result + 'The embryo dimensions are equivalent to '+ getCompositeDate + 'No embryonic heart motion detected.  '
end;

function GetFindings: String;
begin
  case cbPregnancyOutcome.ItemIndex of
    0: result := '##';
    1: result := GetLiveFindings;
    2: result := 'It is too early to visualise a fetal pole.  ';
    3: result := 'It is too early to confirm embryonic viability.  ';
    4: result :=  getMissedMiscarriageFinding;
    5: result := 'A pregnancy of unknown location is identified.  ';
    6: result := 'An ectopic pregnancy is identified.  ';
  else
    result := '##';
  end;
end;

function GetConclusion: String;
begin
  case cbPregnancyOutcome.ItemIndex of
    0: result := '##';
    1: result := GetLiveConclusion
    2: result := 'It is too early to visualise a fetal pole.  ';
    3: result := 'It is too early to confirm embryonic viability.  ';
    4: result :=  getMissedMiscarriageConClusion;
    5: result := 'The findings today are consistent with a pregnancy of unknown location (PUL).  ';
    6: result := 'Ectopic pregnancy identified.  ';
  else
    result := '##';
  end;
  if cbPreigHeamYes.checked then
     result := result + 'Perigestational haemorrhage as described above.  '; 
end;

Function getPerigestationalHaemorrhage : String
begin
   result := '';
   if (cbPreigHeamYes.Checked) and (cbPregnancyOutcome.ItemIndex < 5) then
   begin
    TempStr := '';
    v1 := trunc(sePGHLen.Value);
    v2 := trunc(sePGHWid.Value);
    v3 := trunc(sePGHDep.Value);
    v4 := trunc(sePGHVol.Value * 10) / 10;
    if (v1 > 0) then
      result := Format('A perigestational haemorrhage%s was visualised.',[GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
    else
      result := 'A perigestational haemorrhage was visualised.';
  end;
  else
    result := '';

  if result <> '' then
  begin
    result := #13#10 + #13#10 + result ;
  end;
end;

Function getPregnancyComplication : String;
begin
result := '';
  if cbPregnancyOutcome.ItemIndex = 1 then
  begin
    if (trim(getPerigestationalHaemorrhage) = '') then
      result := #13#10 + #13#10 +'At this early stage there is no evidence of pregnancy complication.  ';
  end;
  else
    result := '';
  if cxccbReferralIndicators.States[2] = 1 then
  begin
    if result <> '' then
      result :=  result + #13#10 +#13#10;
  end;
end;


Function getOvaryWarning : Boolean;
begin
  result := FALSE;
  if ((cbRightOvaryAbnormal.checked) or (cbLeftOvaryAbnormal.checked)) then
    result := TRUE;
end;

Function getFindingsWarning : Boolean;
begin
  result := FALSE;
  case cbPregnancyOutcome.ItemIndex of
   0,2,3,4,5,6 : result := TRUE;
   1: result := FALSE;
  end; 
end;

function getPregnancyRedated : Boolean
begin
  result := FALSE;
  if cbPregnancyRedatedYes.Checked then
    result := TRUE
end;



procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Clear;
  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetClinicalHistory +'''');

  //--------------------No Dates--------------------------
   if cbEDDPrinciple.ItemIndex = 1 then // No Dates
   begin
       lbMergeDataMergeFields.Items.Add('Nodates=''');
       lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''');
       lbMergeDataMergeFields.Items.Add('Expected_Gestation=''');
   end;    
   else
   begin
      lbMergeDataMergeFields.Items.Add('Nodates=''');
      if not(cbPregnancyRedatedYes.checked) then
      begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''#|#+BOLDExpected EDD:#/#''');
      end
      else
      begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''Expected EDD:''');
      end
      lbMergeDataMergeFields.Items.Add('Expected_Gestation='''#13#10 + 'Expected Gestation:''');
   end;
 // ------------------Other EDD-----------------------------
  if GetEnteredEDD <> '' then
     lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');
  else
     lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

   if (deMenstrualEDD.Date > 0) then
     lbMergeDataMergeFields.Items.Add('EDD_from_LMP='''+  FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date)   +'''');
  else
     lbMergeDataMergeFields.Items.Add('EDD_from_LMP=''');

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
  //------------------Average US EDD ---------------------//
  if cbPregnancyRedatedYes.checked then
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''#|#+BOLDUltrasound EDD:#/#''');
  end
  else
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''Ultrasound EDD:''');
  end
  if (deUSSEDD1.Date > 0) then
  begin
     if cbPregnancyRedatedYes.checked then
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age=''#|#+BOLD'+  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'#/#''');
     else
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age='''#9 +  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'''');
  end
  else
    ShowMessage('Please Enter USS EDD');

  //----------------------Findings ----------------------//

    lbMergeDataMergeFields.Items.Add('Findings='''+ GetFindings +'''');

  //----------------------Biometry------------------------//
    lbMergeDataMergeFields.Items.Add('Crown_Rump_Length='''+ edtEmbroSize1.text +'mm''');
    lbMergeDataMergeFields.Items.Add('Gestational_Sac_Diameter='''+ edtSacAvg1.text +'mm''');
    if cbYolkSacYes1.checked then
    begin
      if strToFloatdef(edtYolkSacSize1.text,0) > 0 then
         lbMergeDataMergeFields.Items.Add('Yolk_Sac=''seen''');
    end
    else if cbYolkSacNo1.checked then
    begin
       lbMergeDataMergeFields.Items.Add('Yolk_Sac=''not seen''');
    end;
    else
       lbMergeDataMergeFields.Items.Add('Yolk_Sac=''##''');
       
    lbMergeDataMergeFields.Items.Add('Fetal_Heart_Rate='''+ getFetalHeartRate +'''');
    lbMergeDataMergeFields.Items.Add('HeartRateLabel='''+ getHeartRateLabel+'''');
    lbMergeDataMergeFields.Items.Add('Ovaries='''+ getOvary +'''');

    lbMergeDataMergeFields.Items.Add('PregnancyComplication='''+ getPregnancyComplication +'''');
    lbMergeDataMergeFields.Items.Add('PerigestationalHaemorrhage='''+ getPerigestationalHaemorrhage +'''');
    lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');
    lbMergeDataMergeFields.Items.Add('Conclusion='''+ getConclusion +'''');
    lbMergeDataMergeFields.Items.Add('NIPSConclusion='''+ getNIPSConclusion +'''');
     lbMergeDataMergeFields.Items.Add('NIPS='''+ getNIPSString +'''');


end;

procedure ProduceMergeOrder;
begin
  lbMergeDataMergeOrder.Items.Clear;
  if ((getFindingsWarning) or (getOvaryWarning)) or (getPregnancyRedated) then
    lbMergeDataMergeOrder.Items.Add('WARNING');
  if cxccbReferralIndicators.States[2] = 1 then
    lbMergeDataMergeOrder.Items.Add('EARLY_NIPS');
  else
    lbMergeDataMergeOrder.Items.Add('EARLY_ALL');

end;

// ******************* Data Validation Functions ************************************//
function CheckFormComplete: Boolean;
var
  vTempStr : String;
begin
  if ((cxtsFetus1.TabVisible)and (StrToFloatDef(edtEmbroSize1.text, 0) < 0.1) and (cbEmbryo1Visualised1.Checked)) then
  begin
    ShowMessage('You must enter a CRL measurement if the embryo is visualised');
    result := false;
  end
  else
  if (pcEDDPrinciple.Properties.ActivePage = tsIVFEDD) and ((seTransferDay.Value < 1) or (seNumberTransferred.Value < 1)) and (cbEDDPrinciple.ItemIndex > 4) then
  begin
    ShowMessage('Embryo Transfer Day and Number Transferred should both be > 0');
    result := False;
  end
  else
    result := True;
end;
// **********************************************************************************//

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

procedure cbFibroidsTypeOnChange(Sender)
var
  vControlIdx: Integer;
  vCheckBox: TWinControl;
begin
  vControlIdx := Sender.Tag;
  if vControlIdx > 0 then
  begin
    {  vCheckBox := TWinControl(Sender).Owner.FindComponent('cbCavityDistortion' + intToStr(vControlIdx));
      if assigned(vCheckBox) then
      begin
        TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 0;
      end;  }
  end;
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

procedure cbFibroidsVisualisedOnClick(sender)
begin
  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;
  spFibroidCountOnChange(nil);
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

procedure btnPregnancyRedatedOnClick(Sender);
begin
  cbPregnancyRedatedYes.checked := not(cbPregnancyRedatedYes.checked )
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


procedure cbUSSEDDOnChange(Sender);
var
  vWeeks, vDays: Integer;
begin
end;

procedure InitializeScreen;
begin
  if (deExamDate.Date < 100) then
    deExamDate.Date := now;
  pcEarlyPregType.HideTabs := True;
  pcEDDPrinciple.HideTabs := True;
  cbGestationType.ItemIndex := 1;
//  cbGestationTypeChange(nil);
  gbEDDDating.Height := 45;
  lblMedication.Visible := False;
  //cbEDDPrinciple.ItemIndex := 0;
  cbEDDPrincipleOnChange(nil);
  //cbPregnancyOutcomeOnChange(nil);
  spFibroidCountOnChange(nil);
  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;
  pcEmbryos.ActivePage := cxtsFetus1;
  //cbGestationTypeChange(nil);
  //cbTooShortIntervalOnClick(nil);
  pcEmbryos.Properties.ActivePage := cxtsFetus1;
  cbEmbryo1Visualised1OnClick(nil);
  pcEDDPrinciple.Properties.HideTabs := true;

end;

procedure StartScript;
begin

  // ******************* Header Functions *********************************************//
  //cbIndicatorType.Properties.OnChange := 'cbIndicatorTypeOnChange';
  cbClinicalHistory.Properties.OnChange := 'cbClinicalHistoryOnChange';


  // ******************* Dating Functions *********************************************//
  cbEDDPrinciple.Properties.OnChange := 'cbEDDPrincipleOnChange';
 // cbGestationType.Properties.OnChange := 'cbGestationTypeChange';
 // cbPregnancyOutcome.Properties.OnChange := 'cbPregnancyOutcomeOnChange';
  deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';
  deMUFWEdd.Properties.OnChange := 'deMUFWEddOnChange';
  deLMPDate.Properties.OnChange := 'cbLMPDateOnChange';
  deMenstrualEDD.Properties.OnChange := 'deMenstrualEDDOnChange';
  deOvulationEDD.Properties.OnChange := 'deOvulationEDDOnChange';
  deIVFEDD.Properties.OnChange := 'deIVFEDDOnChange';
  deConceptionDate.Properties.OnChange := 'cbDateOfConceptionOnChange';
  seTransferDay.Properties.OnChange := 'seTransferDayOnChange';


  // ******************* Embryo 1 Functions ********************************************//
  deUSSEDD1.Properties.OnChange := 'cbUSSEDDOnChange';
  cbEmbryo1NotVisualised1.OnClick := 'cbEmbryo1NotVisualised1OnClick';

  cbEmbryo1Visualised1.OnClick := 'cbEmbryo1Visualised1OnClick';

  spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
  cbFibroidsType1.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType2.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType3.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType4.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType5.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType6.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType7.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType8.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType9.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType10.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';

  cxccbReferralIndicators.Properties.OnChange := 'cxccbReferralIndicatorsChange';
  cbClinicalHistory.Properties.OnChange := 'cbClinicalHistoryChange';

  cbYolkSacYes1.OnClick := 'cbYolkSacYes1OnClick';
  cbYolkSacNo1.OnClick := 'cbYolkSacNo1OnClick';

  edtEmbroSize1.properties.OnChange := 'edtEmbroSize1OnChange';
  edtYolkSacSize1.Properties.OnChange := 'edtYolkSacSize1OnChange';
  seHeartBPM1.Properties.OnChange := 'seHeartBPM1OnChange';

  cbHeartMotionVisYes1.OnClick := 'cbHeartMotionVisYes1OnClick';
  cbHeartMotionVisNo1.OnClick := 'cbHeartMotionVisNo1OnClick';

  cbPreigHeamYes.OnClick := 'cbPreigHeamYesOnClick';
  cbPreigHeamNo.OnClick := 'cbPreigHeamNoOnClick';

  btnPregnancyRedated.OnClick := 'btnPregnancyRedatedOnClick';

  //cbGestationType.Properties.OnChange := 'cbGestationTypeChange';

  InitializeScreen;
end;

StartScript;