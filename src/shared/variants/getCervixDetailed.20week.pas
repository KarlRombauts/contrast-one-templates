#ifndef __SHARED_VARIANTS_GETCERVIXDETAILED_20WEEK
#define __SHARED_VARIANTS_GETCERVIXDETAILED_20WEEK

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

#endif
