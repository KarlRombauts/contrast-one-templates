#ifndef __SHARED_UTILS_FORMATTING
#define __SHARED_UTILS_FORMATTING

function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.'
    else
      result := inStr;
  end
  else
    result := '';
end;

#endif
