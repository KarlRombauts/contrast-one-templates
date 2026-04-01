#ifndef __SHARED_VARIANTS_GETINTEGERMEASUREDSTRING_EARLYT1SINGLETON
#define __SHARED_VARIANTS_GETINTEGERMEASUREDSTRING_EARLYT1SINGLETON

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
