#ifndef __SHARED_VARIANTS_CBFIBROIDSTYPEONCHANGE_GYNAE
#define __SHARED_VARIANTS_CBFIBROIDSTYPEONCHANGE_GYNAE

procedure cbFibroidsTypeOnChange(Sender)
var
  vControlIdx: Integer;
  vCheckBox, vProjection: TWinControl;
begin
  vControlIdx := Sender.Tag;
  if vControlIdx > 0 then
  begin
    vCheckBox := TWinControl(Sender).Owner.FindComponent('cbCavityDistortion' + intToStr(vControlIdx));
    vProjection:= TWinControl(Sender).Owner.FindComponent('cbProjection' + intToStr(vControlIdx));
    if assigned(vCheckBox) then
    begin
      TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 0;
      if (TcxComboBox(Sender).ItemIndex = 2) then
      begin
        TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 2;
        TcxCheckBox(vCheckBox).caption := 'Cavity projection';
      end;
      else
        TcxCheckBox(vCheckBox).caption := 'Cavity distortion'
    end;
    TcxComboBox(vProjection).visible := TcxComboBox(Sender).ItemIndex = 2
  end;
end;

#endif
