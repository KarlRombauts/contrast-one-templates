#ifndef __SHARED_OBSTETRIC_EDDHANDLING
#define __SHARED_OBSTETRIC_EDDHANDLING

procedure cbEDDPrincipleOnChange(Sender: TObject);
begin
  case cbEDDPrinciple.ItemIndex of
    1: begin
         gbEDDDating.Height := 47;
         lblMedication.Visible := False;
       end;
    2: begin
         pcEDDPrinciple.Properties.ActivePage := tsMenstrualEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    0: begin
         pcEDDPrinciple.Properties.ActivePage := tsStatedEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    3: begin
         pcEDDPrinciple.Properties.ActivePage := tsEstEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    4: begin
         pcEDDPrinciple.Properties.ActivePage := tsTimedEDD;
         gbEDDDating.Height := 80;
         lblMedication.Visible := True;
       end;
    5: begin
         pcEDDPrinciple.Properties.ActivePage := tsIVFEDD;
         gbEDDDating.Height := 120;
         lblMedication.Visible := True;
       end;
    6: begin
         pcEDDPrinciple.Properties.ActivePage := tsIVFEDD;
         gbEDDDating.Height := 120;
         lblMedication.Visible := True;
       end;
  end;
end;

procedure cbLMPDateOnChange(Sender);
begin
  if cbEDDPrinciple.ItemIndex = 1 then
  begin
    deMenstrualEDD.Date := deLMPDate.Date + 280;
  end;
end;

procedure PopulateEDDControls(inDate: TcxDateEdit; inWeeks, inDay: TcxSpinEdit);
var
  vWeeks, vDays: Integer;
begin
  vWeeks := 0;
  vDays := 0;
  inDay.Value := 0;
  inWeeks.Value := 0;
  if (deExamDate.Date > 0) and (inDate.Date > 0) then
  begin
    vWeeks := GetWeeksFromDueDate(inDate.Date, deExamDate.Date);
    vDays := GetDaysFromDueDate(inDate.Date, deExamDate.Date);
    inWeeks.Value := vWeeks;
    inDay.Value := vDays;
  end;
end;

procedure deStatedEDDOnChange(Sender);
begin
  PopulateEDDControls(deStatedEDD, seEDDCalGAWeeks, seEDDCalGADays);
end;

procedure deMUFWEddOnChange(Sender);
begin
  PopulateEDDControls(deMUFWEdd, seMUFWGestAgeWeeks, seMUFWGestAgeDays);
end;

procedure deMenstrualEDDOnChange(Sender);
begin
  PopulateEDDControls(deMenstrualEDD, seEDDCalGAWeeks, seEDDCalGADays);
end;

procedure deOvulationEDDOnChange(Sender);
begin
  PopulateEDDControls(deOvulationEDD, spOvualtionGestAgeWeeks, spOvualtionGestAgeDays);
end;

procedure deIVFEDDOnChange(Sender);
begin
  PopulateEDDControls(deIVFEDD, seIVFGAWeeks, seIVFGADays);
end;

#ifndef NOGUI
procedure cbDateOfConceptionOnChange(Sender);
begin
  if deConceptionDate.Date > 0 then
  begin
    deTransferDate.Date := deConceptionDate.Date + seTransferDay.Value;
  end;
end;

procedure seTransferDayOnChange(Sender);
begin
  cbDateOfConceptionOnChange(nil);
end;

procedure cbUSSEDDOnChange(Sender);
var
  vWeeks, vDays: Integer;
begin
  seUSSEDDGAWeeks1.Value := 0;
  seSSEDDGADays1.Value := 0;
  if (deExamDate.Date > 100) and (deUSSEDD1.Date > 100) then
  begin
    vWeeks := GetWeeksFromDueDate(deUSSEDD1.Date, deExamDate.Date);
    vDays := GetDaysFromDueDate(deUSSEDD1.Date, deExamDate.Date);
    seUSSEDDGAWeeks1.Value := vWeeks;
    seSSEDDGADays1.Value := vDays;
  end;
end;

function GetEnteredEDD :String
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'No Dates. ';
  end
  else  }
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
      result := FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deStatedEDD.Date);
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := FormatDateTime('dd/mm/yyyy', deMUFWEdd.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := FormatDateTime('dd/mm/yyyy', deOvulationEDD.Date);
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deIVFEDD.Date);
    end;
  end;
  if not(cbPregnancyRedatedYes.checked) then
  begin
     result := '#|#+BOLD' + result + '#/#'
  end
end;

function getCompositeDate : String;
begin
  result := '';
  result := intToStr(seUSSEDDGAWeeks1.value)   +' weeks '
  if seSSEDDGADays1.value >= 0 then
  begin
    if seSSEDDGADays1.value = 1 then
     result := result + intToStr(seSSEDDGADays1.value)   +' day';
    else
     result := result + intToStr(seSSEDDGADays1.value)   +' days';
  end

  result := AddFullstopToEnd(Result);
end

procedure btnPregnancyRedatedOnClick(Sender);
begin
  cbPregnancyRedatedYes.checked := not(cbPregnancyRedatedYes.checked )
end;

#endif
#endif
