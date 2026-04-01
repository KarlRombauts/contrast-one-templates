#ifndef __SHARED_UTILS_DATEUTILS
#define __SHARED_UTILS_DATEUTILS

function GetFullDateString(inDate: TDateTime): string;
begin
  result := FormatDateTime('dd mmmm yyyy', inDate);
end;

#endif
