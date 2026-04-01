#ifndef __SHARED_VARIANTS_GETPLACENTA_PE12WEEK
#define __SHARED_VARIANTS_GETPLACENTA_PE12WEEK

function GetPlacenta: String;
begin
result := '';
 if cbPlacentaSite1.text <> '' then
  result := result + lowercase(trim(cbPlacentaSite1.text)) + 'ly';
end;

#endif
