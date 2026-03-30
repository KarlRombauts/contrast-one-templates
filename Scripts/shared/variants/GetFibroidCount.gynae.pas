#ifndef __SHARED_VARIANTS_GETFIBROIDCOUNT_GYNAE
#define __SHARED_VARIANTS_GETFIBROIDCOUNT_GYNAE

function GetFibroidCount: string;
var
  vNumber: string;
begin
  if spFibroidCount.Value = 0 then
    result := 'No fibroids were'
  else
  begin
    vNumber := GetNumberString(spFibroidCount.Value);
    if spFibroidCount.Value = 1 then
      result := vNumber + ' fibroid was'
    else
    begin
      result := vNumber + ' fibroids were';
    end;
  end;
  result := InitCaps(result, False);
end;

#endif
