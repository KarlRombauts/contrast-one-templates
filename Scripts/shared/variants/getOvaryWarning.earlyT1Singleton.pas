#ifndef __SHARED_VARIANTS_GETOVARYWARNING_EARLYT1SINGLETON
#define __SHARED_VARIANTS_GETOVARYWARNING_EARLYT1SINGLETON

Function getOvaryWarning : Boolean;
begin
  result := FALSE;
  if ((cbRightOvaryAbnormal.checked) or (cbLeftOvaryAbnormal.checked)) then
    result := TRUE;
end;

#endif
