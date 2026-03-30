#ifndef __SHARED_OBSTETRIC_ANATOMY
#define __SHARED_OBSTETRIC_ANATOMY

 function GetAnatomy : String
 var
   vDifficultExam : String;
   v1 : Integer;
 begin
   result := '';
   vDifficultExam := '';
   if (cbLargeBMI1.Checked) or (cbEarlyGestation1.Checked) or (cbAwkFetalPos1.Checked) then
   begin
    v1 := 0;
    if cbLargeBMI1.Checked then
    begin
      vDifficultExam := vDifficultExam + 'maternal habitus';
      inc(v1);
    end;
    if cbAwkFetalPos1.Checked then
    begin
      if v1 > 0 then
        vDifficultExam := vDifficultExam + ' and';
      vDifficultExam := vDifficultExam + 'fetal position';
    end;
    if vDifficultExam <> '' then
      vDifficultExam := 'Views were more challenging due to '+ AddFullstop(vDifficultExam);
  end;
   if cbFetalAnatomyNormal1.checked then
   begin
      result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine appear to be developing normally for the current gestation.  ';
      if (StrtoFloatDef(edNucTransMeasurement1.text,0) > 0) and (StrtoFloatDef(edNucTransMeasurement1.text,0) <= 3.4) then
        result := result + 'The nuchal translucency is within the normal range.  ';
   end
   else if cbFetalAnatomyAbNormal1.checked then
   begin
     Result := 'Abnormality.  ';
   end;
   if result <> '' then
     if vDifficultExam <> '' then
       result := vDifficultExam + result;
   if result = '' then
     result := '##';    
 end;

procedure SetAbnormalCheckes(inControl: TcxGroupBox; inValue: Boolean);
begin
  if assigned(inControl) then
  begin
    for i := 0 to inControl.ControlCount - 1 do
    begin
      if inControl.Controls[i] is TcxCheckBox then
      begin
        TcxCheckBox(inControl.Controls[i]).enabled := inValue;
      end;
    end;
  end;
end;

function SetAnatomyChecks(inParent: TControl; inChecked: Boolean)
var
  i: Integer;
begin
  for i := 0 to TWinControl(inParent).ControlCount - 1 do
  begin
    if TWinControl(inParent).Controls[i] is TcxCheckBox then
      if (pos('cbLargeBMI', TcxCheckBox(TWinControl(inParent).Controls[i]).name) < 1) and (pos('cbAwkFetalPos', TcxCheckBox(TWinControl(inParent).Controls[i]).name) < 1)
                     and (pos('cbEarlyGestation', TcxCheckBox(TWinControl(inParent).Controls[i]).name) < 1) then
        TcxCheckBox(TWinControl(inParent).Controls[i]).Checked := inChecked;
  end;
end;

 Function getAnatomyChecked :  Boolean
 begin  
     result := False;
     if (cbFetalAnatomyNormal1.checked) or  (cbFetalAnatomyAbNormal1.checked) then 
     begin       
        result := TRUE;  
     end
 end;                     

function getAnatomyWarning : Boolean
begin
result := FALSE;
if cbFetalAnatomyAbNormal1.checked then
begin
   result := TRUE;
 end;
end;

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
end; 

#endif
