#ifndef __SHARED_OBSTETRIC_GESTATIONALAGE
#define __SHARED_OBSTETRIC_GESTATIONALAGE

function GetWeeksFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;
var
  v1: Integer;
begin
  v1 := (trunc(inEDDDate) - 280);
  result := (trunc(inExamDate) - v1) div 7;
end;

function GetDaysFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;
var
  v1: Integer;
begin
  v1 := (trunc(inEDDDate) - 280);
  result := (trunc(inExamDate) - v1) mod 7;
end;

function GetWeeksFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;
begin
  result := (trunc(inExamDate) - Trunc(inLMPDate)) div 7;
end;

function GetDaysFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;
begin
  result := (trunc(inExamDate) - Trunc(inLMPDate)) mod 7;
end;

function GetLMPWeeks(inDate: TDateTime): Integer;
begin
  result := (trunc(now) - trunc(inDate)) div 7;
end;

function GetLMPDays(inDate: TDateTime): Integer;
begin
  result := (trunc(now) - trunc(inDate)) mod 7;
end;

function GetGestDays: integer;
var
  inW, inD: Integer;
begin
  result := '';
  inW := 0;
  inD := 0;
    inW := trunc(seEDDCalGAWeeks.Value);
    inD := trunc(seEDDCalGADays.Value);
    result :=  inD;
end;

function GetGestWeeks: integer;
var
  inW, inD: Integer;
begin
  result := '';
  inW := 0;
  inD := 0;
    inW := trunc(seEDDCalGAWeeks.Value);
    inD := trunc(seEDDCalGADays.Value);
    result :=  inW;
end;

#endif
