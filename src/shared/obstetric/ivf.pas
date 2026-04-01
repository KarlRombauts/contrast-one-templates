#ifndef __SHARED_OBSTETRIC_IVF
#define __SHARED_OBSTETRIC_IVF

function GetEmbryoTransferCount: string;
begin
  result := '';
  case trunc(seNumberTransferred.Value) of
    1: result := 'single';
  else
    result := GetNumberString(seNumberTransferred.Value);
  end;
end;

function GetFrozen: String;
begin
  if cbEDDPrinciple.ItemIndex = 6 then
    result := 'frozen '
  else
    result := '';
end;

procedure cbGestationTypeChange(Sender);
begin
  cbGestationType.ItemIndex := 1;
end;

#endif
