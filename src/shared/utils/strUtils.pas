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

function StrToIntDef(inString: string; inDefault: Integer): Integer;
begin                                              
  try
    result := StrToInt(inString);
  except
    result := inDefault;                          
  end;                                                                             
end;                                              

function StringReplace(inSource, inMatch, inReplace: String): String;
var
  i: Integer;
begin
  result := inSource;
  i := Pos(inMatch, result);
  while i > 0 do
  begin
    result := copy(inSource, 1, i-1) + inReplace + copy(inSource, i+length(inMatch), length(inSource));
    i := Pos(result, inMatch);
  end;
end;

function StringReplaceAll(inSource, inMatch, inReplace: String): String;
var
  i: Integer;                                                             
begin
  result := inSource;
  i := Pos(inMatch, result);
  while (i > 0) do
  begin
    result := copy(result, 1, i-1) + inReplace + copy(result, i+length(inMatch), length(result));
    i := Pos(inMatch, result);
  end;
end;

#endif
