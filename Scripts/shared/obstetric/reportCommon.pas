#ifndef __SHARED_OBSTETRIC_REPORTCOMMON
#define __SHARED_OBSTETRIC_REPORTCOMMON

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
        result := AddFullStop(result);
      result := result + cxccbObstetricHistory.ShortDescription[i];
    end;
  end;
  if (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := AddFullStop(result);
    result := result + trim(edtOtherPastHistory1.Text);
  end;
  if result <> '' then
    result := 'Past History: ' + AddFullStop(result);
end;

procedure cxccbObstetricHistoryChange(Sender);
begin
  edtOtherPastHistory1.Enabled := (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1);
end;

 function getReportHeading : String
 begin
   result := '';
   if (cxccbReferralIndication.states[5] = 1) then
   begin
     if (cxccbReferralIndication.states[8] = 1) then
        result := 'Second Trimester Ultrasound and Aminiocentesis'
     else if (cxccbReferralIndication.states[1] = 1) then
         result := 'Early Second Trimester Ultrasound and Aminiocentesis'
   end
   if (cxccbReferralIndication.states[6] = 1) then
       result := 'Second Trimester Ultrasound Report'
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

#endif
