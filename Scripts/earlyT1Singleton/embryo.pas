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
