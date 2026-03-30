#ifndef __SHARED_VARIANTS_GETEFWPER_T3TWINS
#define __SHARED_VARIANTS_GETEFWPER_T3TWINS

 function getEFWPer(inString : String; infetus :integer) : String
 var
   vCentile : integer;
   vtempStr : String;
 begin
 result := '';
   if inString <> '' then
   begin
      if (pos('<',inString) > 0) then
      begin
        vtempStr := StringReplaceAll(inString,' ','');
        if (vtempStr = '<3') then
        begin
            result := result +' below 3';
        end
      end
      else if (pos('>',inString) > 0) then
      begin                                                            
         vtempStr := StringReplaceAll(inString,' ','');
         if (vtempStr = '>97') then
         begin
            result := result +' above 97';
         end
      end
      else
      begin
        vCentile := round(StrToFloatDef(inString,0));
        result := IntToStr(vCentile);
      end;  
   end;
   if infetus = 1 then
   begin
   if (trim(seWeightPercentile1.text) = '<3') then
    result := result + GetValueSuffix(3)
   else
    result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile1.text,0));
   end;
   if infetus = 2 then
   begin
   if (trim(seWeightPercentile2.text) = '<3') then
    result := result + GetValueSuffix(3)
   else
    result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile2.text,0));
   end;
 end;

#endif
