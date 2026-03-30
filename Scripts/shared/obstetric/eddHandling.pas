#ifndef __SHARED_OBSTETRIC_EDDHANDLING
#define __SHARED_OBSTETRIC_EDDHANDLING

procedure cbEDDPrincipleOnChange(sender)
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
  PopulateEDDControls(deStatedEDD, seStatedEDDGestAgeWeeks, seStatedEDDGestAgeDays);
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
end;

#endif
