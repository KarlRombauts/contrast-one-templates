#ifndef __SHARED_OBSTETRIC_OVARIES
#define __SHARED_OBSTETRIC_OVARIES

Function getOvaryWarning : Boolean;
begin
  result := FALSE;
  if ((cbRightOvaryAbnormal.checked) or (cbLeftOvaryAbnormal.checked)) then
    result := TRUE;
end;

 Function GetOvaryConc : string;
begin
  result := '';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Abnormal ovaries.  ';
     else
       result := result + 'Abnormal right ovary.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'Abnormal left ovary.  ';

  if getCervixConclusion <> '' then
    result := result +  getCervixConclusion;

    result := result + getAnatomyConc;
    result := result + getFibroidConc;
end;

Function GetOvary : string;
begin
  result := '';
  if cbRightOvaryIdentified.checked then
  begin
     if cbLeftOvaryIdentified.checked then
       result := result + 'Both ovaries are not identified. ';
     else
       result := result + 'The right ovary is not identified. ';
  end
  else if cbLeftOvaryIdentified.checked then
     result := result + 'The left ovary is not identified. ';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := result + 'Both ovaries appear normal. ';
     else
       result := result + 'The right ovary is normal. ';
  end
  else if cbLeftOvaryNormal.checked then
     result := result + 'The left ovary is normal. ';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal. ';
     else
       result := result + 'The right ovary is abnormal. ';
  end
  else if cbLeftOvaryAbnormal.checked then
     result := result + 'The left ovary is abnormal. ';

  if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries. ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary. ';
  end
  else if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum is visualised in the left ovary. ';

  if result <> '' then
     result := #13#10+#13#10 + '#|#+BOLDOvaries:#/#' + #13#10 + result;
end;

#endif
