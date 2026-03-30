#ifndef __SHARED_UTILS_FORMATTING
#define __SHARED_UTILS_FORMATTING

function InitCaps(inv: string; inReduce: Boolean): string;
var
  vDiff: Integer;
begin
  if inv <> '' then
  begin
    vDiff := Ord('A') - Ord('a');
    result := inv;
    if inReduce then
    begin
      if (Ord(result[1]) >= Ord('A')) and (Ord(result[1]) <= Ord('Z')) then
        result[1] := chr(Ord(inv[1]) - vDiff);
    end
    else
    begin
      if (Ord(result[1]) >= Ord('a')) and (Ord(result[1]) <= Ord('z')) then
        result[1] := chr(Ord(inv[1]) + vDiff);
    end;
  end
  else
    result := '';
end;

function IncludeComma(inString: string): string;
var
  v1: string;
begin
  v1 := '';
  if Length(inString) > 0 then
    v1 := inString + ', ';
  result := v1;
end;                               

function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.  '
    else
      result := inStr;
  end
  else
    result := ''
end;

function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := trim(inStr);
  if vt[length(vt)] <> '.' then
    vt := vt + '.  '
  else
    vt := inStr;
  result := vt;
end;

function PadDecimalPlaces(inStr: String): String;
begin
  result := Trim(inStr);
  if (pos('.', result) = 0) then
    result := result + '.0'
  else if result[0] = '.' then
  begin
      result := '0'+ result ;
  end;
  else
  begin                                  
    if result[length(result)] = '.' then
      result := result + '0';
  end;
end;

function GetNumberString(inNumber: Integer): string;
begin
  result := '';
  if inNumber = 1 then
    result := 'a single'
  else
  begin
    if inNumber = 2 then
      result := 'two'
    else if inNumber = 3 then
      result := 'three'
    else if inNumber = 4 then
      result := 'four'
    else if inNumber = 5 then
      result := 'five'
    else if inNumber = 6 then
      result := 'six'
    else if inNumber = 7 then
      result := 'seven'
    else if inNumber = 8 then
      result := 'eight'
    else if inNumber = 9 then
      result := 'nine'
    else
      result := IntToStr(inNumber);
  end;
end;

function RemoveDecimalPointAtEnd(inStr: String): String;
begin
  result := Trim(inStr);
  if result[length(result)] = '.' then
      result := copy(result, 1, (length(result)-1));
end;

function GetIntegerMeasuredString(v1, v2, v3: Integer; v4: Double; inType: string): string;
begin
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          if trunc(v4) = v4 then
            result := Format('%d x %d x %d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
        else
          result := Format('%d x %d x %d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
      end
      else
        result := Format('%d x %d x %d%s', [v1, v2, v3, inType]);
    end
    else
      result := Format('%d x %d%s', [v1, v2, inType]);
  end
  else
    result := Format('%d%s', [v1, inType]);
end
else
  result := '';
if result <> '' then
  result := ' of '+ result;

end;

#endif
