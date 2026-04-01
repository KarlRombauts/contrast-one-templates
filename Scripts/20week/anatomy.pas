#ifndef __SHARED_VARIANTS_GETANATOMY_20WEEK
#define __SHARED_VARIANTS_GETANATOMY_20WEEK

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
     if cbEarlyGestation1.checked then
     begin
       result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     end;
     else if cxccbReferralIndication.states[0] = 1 then
     begin
        if cbPoorView.checked then
          result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
        else if cbAverageViews.Checked then
          result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
        else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
          result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
     end
     else if (cxccbReferralIndication.states[1] = 1) then
        result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     else if  (cxccbReferralIndication.states[2] = 1) or (cxccbReferralIndication.states[3] = 1) or (cxccbReferralIndication.states[4] = 1) then
     begin
         if cxccbReferralIndication.states[0] = 1 then
         begin
            if cbPoorView.checked then
              result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
            else if cbAverageViews.Checked then
              result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
            else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
              result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
         end;     
         else if (cxccbReferralIndication.states[1] = 1) then
            result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     end;
   end
   else if cbFetalAnatomyAbNormal1.checked then
   begin
     Result := 'Abnormality. '+ #13#10+#13+#10;
     Result := result + 'Detailed views of the remaining anatomy including head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
   end;
   if result <> '' then
     if vDifficultExam <> '' then
       result := vDifficultExam + result;
   if result = '' then
     result := '##';    
 end;

#endif
