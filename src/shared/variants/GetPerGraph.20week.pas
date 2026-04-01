#ifndef __SHARED_VARIANTS_GETPERGRAPH_20WEEK
#define __SHARED_VARIANTS_GETPERGRAPH_20WEEK

function GetPerGraph(sender : TcxMaskEdit; inShowValue: Boolean): String;              
var
  i,inValue: Integer;
  vtempStr : String;
begin
  result := '';
  vtempStr := '';
  if (pos('<',sender.Text) > 0) then
  begin
    vtempStr := StringReplaceAll(sender.Text,' ','');
    if (vtempStr = '<3') then
    begin
      result := 'x[---------|---------]'
    end
  end
  else if (pos('>',sender.Text) > 0) then
  begin
     vtempStr := StringReplaceAll(sender.Text,' ','');
     if (vtempStr = '>97') then
     begin
      result := ' [---------|---------]x';
     end
  end;
  else
  begin
    inValue := StrToFloatDef(sender.Text, 0)
    if inValue > 0 then
    begin
      if inValue < 3 then
        result := 'x[---------|---------]'
      else if inValue < 10 then
        result := ' [x--------|---------]'
      else if inValue < 15 then
        result := ' [-x-------|---------]'
      else if inValue < 20 then
        result := ' [--x------|---------]'
      else if inValue < 25 then
        result := ' [---x-----|---------]'
      else if inValue < 30 then
        result := ' [----x----|---------]'
      else if inValue < 35 then
        result := ' [-----x---|---------]'
      else if inValue < 40 then
        result := ' [------x--|---------]'
      else if inValue < 45 then
        result := ' [-------x-|---------]'
      else if inValue < 50 then
        result := ' [--------x|---------]'
      else if inValue = 50 then
       result := ' [---------x---------]'
      else if inValue > 97 then
        result := ' [---------|---------]x'
      else if inValue > 90 then
        result := ' [---------|--------x]'
      else if inValue > 85 then
        result := ' [---------|-------x-]'
      else if inValue > 80 then
        result := ' [---------|------x--]'
      else if inValue > 75 then
        result := ' [---------|-----x---]'
      else if inValue > 70 then
        result := ' [---------|----x----]'
      else if inValue > 65 then
        result := ' [---------|---x-----]'
      else if inValue > 60 then
        result := ' [---------|--x------]'
      else if inValue > 55 then
        result := ' [---------|-x-------]'
      else if inValue > 50 then
        result := ' [---------|x--------]'
    end;
  end;
end;                                                    

#endif
