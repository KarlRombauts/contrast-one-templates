#ifndef __SHARED_VARIANTS_GETBIOPHYSICALCONC_T3TWINS
#define __SHARED_VARIANTS_GETBIOPHYSICALCONC_T3TWINS

  Function GetBioPhysicalConc: String
 begin
 result := '';
  if (cbFeatlMovementsYes1.checked) and (cbFeatlMovementsYes2.checked)then
      result := result + 'Both twins are biophysically well.';
  else
      result := result + 'Dictate biophysical well being';
 end;

#endif
