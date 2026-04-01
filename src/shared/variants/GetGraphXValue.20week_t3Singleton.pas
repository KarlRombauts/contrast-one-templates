#ifndef __SHARED_VARIANTS_GETGRAPHXVALUE_20WEEK_T3SINGLETON
#define __SHARED_VARIANTS_GETGRAPHXVALUE_20WEEK_T3SINGLETON

 function GetGraphXValue(inControl: String): Real;
var
  vUpper: String;
begin
  result := 0;
  vUpper := UpperCase(inControl);
 // GetOriginalDating('');
  if (pos('EDTBPD', vUpper) > 0) or (pos('EDTOFD', vUpper) > 0) or (pos('EDTHC', vUpper) > 0) or (pos('EDTAC', vUpper) > 0) or (pos('EDTHL', vUpper) > 0) or (pos('EDTFL', vUpper) > 0) or (pos('SEESTFETAL', vUpper) > 0) or (pos('EDTAFI', vUpper) > 0) or(pos('EDTCEREBCPR', vUpper) > 0) or(pos('EDTMIDCERARTPI', vUpper) > 0) or (pos('EDTUMBILICALARTPI', vUpper) > 0) then
  begin
    result := GetGestWeeks + (GetGestDays / 7);
  end;
end;

#endif
