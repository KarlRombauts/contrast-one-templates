#ifndef __SHARED_VARIANTS_GETCLINICALHISTORY_EARLYT1SINGLETON
#define __SHARED_VARIANTS_GETCLINICALHISTORY_EARLYT1SINGLETON

function GetClinicalHistory: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cbClinicalHistory.Properties.Items.Count - 2 do
  begin
    if cbClinicalHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cbClinicalHistory.ShortDescription[i];
    end;
  end;
  if (cbClinicalHistory.States[cbClinicalHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtClicnicalHistory.Text);
  end;
  if result <> '' then
    result := AddFullstopToEnd(result);
end;

#endif
