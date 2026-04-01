#ifndef __SHARED_OBSTETRIC_CLINICALHISTORY
#define __SHARED_OBSTETRIC_CLINICALHISTORY

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
    result := result + InitCaps(trim(edtReferralIndicator1.Text), False);
  end;
  if result <> '' then
    result := AddFullStop(result);
end;

function GetClinicalHistory: String;
var
  i: Integer;
begin
  result := '';

end;

procedure cxccbReferralIndicatorsChange(Sender);
begin
  edtReferralIndicator1.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);
end;

#endif
