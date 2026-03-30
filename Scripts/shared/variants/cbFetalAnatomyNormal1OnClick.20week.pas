#ifndef __SHARED_VARIANTS_CBFETALANATOMYNORMAL1ONCLICK_20WEEK
#define __SHARED_VARIANTS_CBFETALANATOMYNORMAL1ONCLICK_20WEEK

procedure cbFetalAnatomyNormal1OnClick(sender);
var
  vgb: TcxGroupBox;
  vChecked: TcxCheckBox;
  i: Integer;
begin
  cbToggleCheckOnClick(Sender);
  vgb := TWinControl(pgFetusMeasusements.Owner).FindComponent('cxgbAbnormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  vChecked := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalAnatomyAbNormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  if assigned(vgb) then
  begin
    SetAbnormalCheckes(vgb, vChecked.Checked);
  end;
  btnSelectAll1OnClick(sender);
end;

#endif
