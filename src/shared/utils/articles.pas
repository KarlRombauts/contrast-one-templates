#ifndef __SHARED_UTILS_ARTICLES
#define __SHARED_UTILS_ARTICLES

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

#endif
