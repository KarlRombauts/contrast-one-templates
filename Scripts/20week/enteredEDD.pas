#ifndef __SHARED_VARIANTS_GETENTEREDEDD_20WEEK
#define __SHARED_VARIANTS_GETENTEREDEDD_20WEEK

function GetEnteredEDD :String
Begin                                                                       
result := '';
    if (deStatedEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deStatedEDD.Date);
    end
end;                                            

#endif
