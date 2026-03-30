#ifndef __SHARED_VARIANTS_GETFIBROIDCONCL_GYNAE
#define __SHARED_VARIANTS_GETFIBROIDCONCL_GYNAE

function GetFibroidConcl: string;
var
  vLargest, vSmallest, vTemp, i: Integer;
  vBool: Boolean;
begin
  result := '';
  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    if (spFibroidCount.Value > 1) then
    begin
      if (spFibroidCount.Value > 2) then
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        for i := 2 to spFibroidCount.Value do
        begin
          vTemp := GetFibroidAvg(i);
          if vTemp > vLargest then
            vLargest := vTemp;
          if vTemp < vSmallest then
            vSmallest := vTemp;
        end;
        result := result + Format(', containing multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
        if GetCavDistortionCount(vBool) > 0 then
          result := result + ' with associated cavity distortion';
      end
      else
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        vTemp := GetFibroidAvg(2);
        if vTemp > vLargest then
          vLargest := vTemp;
        if vTemp < vSmallest then
          vSmallest := vTemp;
        result := result + Format(', containing two fibroids of %dmm and %dmm', [vSmallest, vLargest]);
        if GetCavDistortionCount(vBool) > 0 then
          result := result + ' with associated cavity distortion';
      end;
    end
    else
    begin
      result := result + Format(', containing a single %s fibroid of %dmm', [cbFibroidsType1.text, GetFibroidAvg(1)]);
      if ((cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled)) or (cbFibroidsType1.ItemIndex = 2) then
      begin
        if (cbCavityDistortion1.Enabled) then
          result := result + ' with associated cavity distortion';
      end
      else
      begin
        if (cbCavityDistortion1.Enabled) then
        begin
          result := result + ' with no associated cavity distortion';
        end;
      end;
    end;
  end;
end;

#endif
