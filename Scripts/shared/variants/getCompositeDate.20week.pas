#ifndef __SHARED_VARIANTS_GETCOMPOSITEDATE_20WEEK
#define __SHARED_VARIANTS_GETCOMPOSITEDATE_20WEEK

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

#endif
