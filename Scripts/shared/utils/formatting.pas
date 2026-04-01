#ifndef __SHARED_UTILS_FORMATTING
#define __SHARED_UTILS_FORMATTING

function InitCaps(inv: string; inReduce: Boolean): string;
var
  vDiff: Integer;
  vFirst: Char;
  vTmp: string;
begin
  if inv <> '' then
  begin
    vDiff := Ord('A') - Ord('a');
    vTmp := inv;
    vFirst := vTmp[1];
    if inReduce then
    begin
      if (Ord(vFirst) >= Ord('A')) and (Ord(vFirst) <= Ord('Z')) then
        vFirst := chr(Ord(vFirst) - vDiff);
    end
    else
    begin
      if (Ord(vFirst) >= Ord('a')) and (Ord(vFirst) <= Ord('z')) then
        vFirst := chr(Ord(vFirst) + vDiff);
    end;
    result := vFirst + Copy(vTmp, 2, Length(vTmp) - 1);
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
      result := vt + '. '
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
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '. '
    else
      result := vt;
  end
  else
    result := ''
end;

function PadDecimalPlaces(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if (pos('.', vt) = 0) then
    result := vt + '.0'
  else if vt[1] = '.' then
    result := '0' + vt
  else
  begin
    if vt[length(vt)] = '.' then
      result := vt + '0'
    else
      result := vt;
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
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt[length(vt)] = '.' then
    result := copy(vt, 1, (length(vt)-1))
  else
    result := vt;
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
            result := Format('%dx%dx%d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)])
          else
            result := Format('%dx%dx%d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
        end
        else
          result := Format('%dx%dx%d%s', [v1, v2, v3, inType]);
      end
      else
        result := Format('%dx%d%s', [v1, v2, inType]);
    end
    else
      result := Format('%d%s', [v1, inType]);
  end
  else
    result := '';
end;

#endif
