#ifndef __SHARED_OBSTETRIC_CERVIX
#define __SHARED_OBSTETRIC_CERVIX

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
          if cbCervixTVS.checked then
            result := result + ' on transvaginal ultrasound.  '
          else if cbCervixTA.checked then
            result := result + ' on transabdominal ultrasound.  '
           result :=AddFullStop(result); 
          if (vCervicalLength > 0) then
          begin
             if (cbCervixShortYes.checked = TRUE) then
                result := result + 'The closed length of cervix is '+ meCervicalLength.text + 'mm'
             else
                result := result + 'The closed length of cervix is '+ meCervicalLength.text + 'mm';
          end;
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

Function getFunnelingMembranes : Boolean
begin
result := FALSE;
  if cbFunnellingofmembranesYes.checked then
     result := TRUE;
end;

 Function getFunnellingMembrane :  String
 begin
 result := ''
 if cbFunnellingofmembranesYes.checked then
 begin
   result := result +  'Funnelling of membranes is seen.  '
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

#endif
