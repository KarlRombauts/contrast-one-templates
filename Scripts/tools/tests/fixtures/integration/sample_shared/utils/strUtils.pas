#ifndef __SHARED_UTILS_STRUTILS
#define __SHARED_UTILS_STRUTILS

function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  try
    result := StrToFloat(inString);
  except
    result := inDefault;
  end;
end;

#endif
