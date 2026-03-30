#ifndef __SHARED_VARIANTS_SPFIBROIDCOUNTONCHANGE_GYNAE
#define __SHARED_VARIANTS_SPFIBROIDCOUNTONCHANGE_GYNAE

procedure spFibroidCountOnChange(Sender)
var
  v1: TcxGroupBox;
begin
  for i := 1 to 12 do
  begin  
    v1 := TWinControl(tsFibroids.Owner).FindComponent('gbFibroid' + intToStr(i));
    if assigned(v1) then
    begin
      v1.Visible := (i <= spFibroidCount.Value);
    end;
  end;
end;

#endif
