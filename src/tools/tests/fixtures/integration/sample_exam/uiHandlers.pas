procedure cbOptionOnClick(Sender);
begin
  if Sender.Checked then
    lblStatus.Caption := 'Selected';
end;
