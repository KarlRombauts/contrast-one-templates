function GetFindings: String;
begin
  result := 'Normal anatomy';
end;

procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Add('Findings=''' + GetFindings + '''');
end;
