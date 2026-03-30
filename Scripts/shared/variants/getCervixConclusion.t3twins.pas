#ifndef __SHARED_VARIANTS_GETCERVIXCONCLUSION_T3TWINS
#define __SHARED_VARIANTS_GETCERVIXCONCLUSION_T3TWINS

 Function getCervixConclusion : String
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
  result := AddFullStop(Result);
 end;

#endif
