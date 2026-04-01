#ifndef __SHARED_VARIANTS_CBFETALANATOMYNORMAL1ONCLICK_PE12WEEK
#define __SHARED_VARIANTS_CBFETALANATOMYNORMAL1ONCLICK_PE12WEEK

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
  if (cbFetalAnatomyNormal1.checked) or (cbFetalAnatomyAbNormal1.checked) then
     btnSelectAll1OnClick(sender);
  else
    btnClear1OnClick(sender)
end;

#endif
