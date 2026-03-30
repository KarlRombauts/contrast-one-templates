#ifndef __SHARED_VARIANTS_GETCLINICALINDICATORS_20WEEK
#define __SHARED_VARIANTS_GETCLINICALINDICATORS_20WEEK

function GetClinicalIndicators: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbReferralIndication.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndication.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cxccbReferralIndication.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtReferralIndicator1.Text);
  end;
  if result <> '' then
    result := AddFullStop(result);
  //result := result + ' ';  
end;

#endif
