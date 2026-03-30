#ifndef __SHARED_VARIANTS_GETSINGLEFIBROID_GYNAE
#define __SHARED_VARIANTS_GETSINGLEFIBROID_GYNAE

function GetSingleFibroid: string;
begin
  result := '';
  if cbFibroidsLeftRight1.Text <> '' then
    result := InitCaps(cbFibroidsLeftRight1.Text, true) + ' ';
  result := result + cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
end;

#endif
