#ifndef __SHARED_OBSTETRIC_OVARIES
#define __SHARED_OBSTETRIC_OVARIES

function getOvaryWarning : Boolean
begin
result := FALSE;
if (cbLeftOvaryAbNormal.checked) or (cbRightOvaryAbNormal.checked) then
begin
   result := TRUE;
 end;
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

#endif
