#ifndef __SHARED_VARIANTS_GETCLINICALINDICATORS_EARLYT1SINGLETON
#define __SHARED_VARIANTS_GETCLINICALINDICATORS_EARLYT1SINGLETON

function GetClinicalIndicators: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbReferralIndicators.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndicators.States[i] = 1 then
    begin
      if result <> '' then
        result := AddFullStop(result);
      result := result + cxccbReferralIndicators.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := AddFullStop(result);
    result := result + InitCaps(trim(edtPresentComplaintOther.Text), False);
  end;
  if result <> '' then
    result := AddFullStop(result);
end;

#endif
