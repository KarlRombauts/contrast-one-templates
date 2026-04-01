#ifndef __SHARED_VARIANTS_ADDFULLSTOPTOEND_EARLYT1SINGLETON_PE12WEEK
#define __SHARED_VARIANTS_ADDFULLSTOPTOEND_EARLYT1SINGLETON_PE12WEEK

function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := trim(inStr);
  if vt[length(vt)] <> '.' then
    vt := vt + '.  '
  else
    vt := inStr;
  result := vt;
end;

#endif
