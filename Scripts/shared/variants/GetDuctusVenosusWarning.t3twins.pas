#ifndef __SHARED_VARIANTS_GETDUCTUSVENOSUSWARNING_T3TWINS
#define __SHARED_VARIANTS_GETDUCTUSVENOSUSWARNING_T3TWINS

function GetDuctusVenosusWarning: Boolean;
begin
result := False;
if cbDVWAbNormal1.checked then
    result := True;  
if cbDVWAbNormal2.checked then
    result := True;    
end;

#endif
