 procedure cbCervixSutureOnClick(sender);
 begin
   cbToggleCheckOnClick(Sender);
   edtSutureToOS.Enabled := cbCervixSutureYes.Checked;
 end;

 Procedure cbNalliPorousOnClick(Sender)
 begin
   if cbParous.checked then
     cbNalliPorous.checked := not(cbParous.checked)
 end;

 procedure edNucTransMeasurement1OnExit(sender);
 begin
   edNucTransMeasurement1.text := PadDecimalPlaces(edNucTransMeasurement1.text);
 end;
