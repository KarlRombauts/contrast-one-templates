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
        result := result + '.  ';
      result := result + cxccbReferralIndicators.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtPresentComplaintOther.Text);
  end;
  if result <> '' then
    result := AddFullstopToEnd(result);
  //result := result + ' ';
end;

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

procedure cxccbReferralIndicatorsChange(Sender);
begin
  edtPresentComplaintOther.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);
end;

#endif
