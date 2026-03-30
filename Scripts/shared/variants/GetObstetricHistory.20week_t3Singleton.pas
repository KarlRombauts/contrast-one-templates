#ifndef __SHARED_VARIANTS_GETOBSTETRICHISTORY_20WEEK_T3SINGLETON
#define __SHARED_VARIANTS_GETOBSTETRICHISTORY_20WEEK_T3SINGLETON

function GetObstetricHistory: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbObstetricHistory.Properties.Items.Count - 2 do
  begin
    if cxccbObstetricHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cxccbObstetricHistory.ShortDescription[i];
    end;
  end;
  if (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtOtherPastHistory1.Text);
  end;
  if result <> '' then
     result := 'Past Hx: ' + result;
  if result <> '' then
    result := AddFullStop(result);
end;

#endif
