#ifndef __SHARED_VARIANTS_GETOVARYCONC_GYNAE
#define __SHARED_VARIANTS_GETOVARYCONC_GYNAE

function GetOvaryConc: string;
var
  vCystList: TStringList;
  i: Integer;
  vCystControl: TAdvTreeComboBox;
  vCystStr: String;
  vTotalAntralFollicles : Integer;
  vRightEndometriomaCount, vLeftEndometrimoCount : integer;
begin
  result := '';
  vTotalAntralFollicles := 0;

    if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
    begin
       if (cbRightOvaryIdentified.Checked) and (cbLeftOvaryIdentified.Checked) then
       begin
        {if not((cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) then
        begin
          if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
            result := result + 'Normal ovaries.  '
          else
            result := result + 'Normal right ovary.  '
        end
        else
          if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
            result := result + 'Normal left ovary.  ' }
       end
       {else if (cbRightOvaryIdentified.Checked) then
         if not((cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) then
           result := result + ' Normal right ovary.  '
       else if (cbLeftOvaryIdentified.Checked) then
        if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
         result := result + ' Normal left ovary.  '}

      // if(cbIndicatorType.ItemIndex > 0 ) and (cbIndicatorType.ItemIndex < 3)then
      if(cxccbReferralIndication.States[1] = 1) or
          (cxccbReferralIndication.States[2] = 1) then
       begin
        if (cbRightOvaryIdentified.Checked) and (seRightFolCount.visible) then
             vTotalAntralFollicles := vTotalAntralFollicles + seRightFolCount.Value;
        if (cbLeftOvaryIdentified.Checked) and (seRightFolCount.visible) then
            vTotalAntralFollicles := vTotalAntralFollicles +  seLeftFolCount.Value ;
       end
       //-----------------Post Menopausal --------------------------//
         if (cbPostMenopausal.checked) then
         begin
           if (seRightResidualFolCount.visible) and  (seRightResidualFolCount.enabled) and (seRightResidualFolCount.value > 0) then
           begin
              if (seleftResidualFolCount.visible) and  (seleftResidualFolCount.enabled) and (seLeftResidualFolCount.value > 0) then
                 result := result + 'Residual follicles identified in both the ovaries.  ';
              else
                 result := result + 'Residual follicles identified in the right ovary.  ';
           end
           else if (seleftResidualFolCount.visible) and  (seleftResidualFolCount.enabled) and (seLeftResidualFolCount.value > 0) then
               result := result + 'Residual follicles identified in the left ovary.  ';
         end;


      //-----------------Antral Follicle evaluation --------------------------//
      
      if(cxccbReferralIndication.States[1] = 1) or
          (cxccbReferralIndication.States[2] = 1) then
      begin
          if (not(cbPostMenopausal.checked)) and ((vTotalAntralFollicles = 0)) then
          begin
           {if  ((seRightLeadFollicle.Value) + (seLeftLeadFollicle.Value) = 0) then
             result := result + ' This indicates a high risk of poor response to controlled ovarian stimulation. '
           else }
           result := result + 'No antral follicles were visualised.  This may indicate a high risk of poor response to controlled ovarian stimulation. '
         end;
      end;

      if(cxccbReferralIndication.States[1] = 1) or
          (cxccbReferralIndication.States[2] = 1) then
      begin
      vTotalAntralFollicles := 0;
        if (cbRightOvaryIdentified.Checked) and (seRightFolCount.visible) then
             vTotalAntralFollicles := vTotalAntralFollicles + seRightFolCount.Value;
        if (cbLeftOvaryIdentified.Checked) and (seLeftFolCount.visible) then
            vTotalAntralFollicles := vTotalAntralFollicles +  seLeftFolCount.Value ;
            
        if (vTotalAntralFollicles > 0) and (vTotalAntralFollicles <= 8) then
          result := result + 'The total antral follicular count (AFC) is '+ getAntralNumberString(vTotalAntralFollicles) +'.   A total AFC less than 8 may be associated with a suboptimal response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 19)  then
          result := result + 'The total antral follicular count (AFC) is '+ getAntralNumberString(vTotalAntralFollicles) +'.  A total AFC greater than 19 may pose a risk of excess response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else  if ((vTotalAntralFollicles > 8) and (vTotalAntralFollicles <= 19)) then
          result :=  result + 'The total antral follicular count (AFC) is '+ getAntralNumberString(vTotalAntralFollicles) +'. This indicates an expected normal response to controlled ovarian stimulation (Martins et al, UOG 2014).   ';
       { if (vTotalAntralFollicles > 0) and (vTotalAntralFollicles < 5) then
          result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is very low (0-4 follicles).   This indicates a high risk of poor response to controlled ovarian stimulation, (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 4) and (vTotalAntralFollicles < 9) then
          result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is low (5-8 follicles). This indicates a high risk of poor response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 8) and (vTotalAntralFollicles < 20) then
          result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is normal (9-19 follicles). This indicates an expected normal response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 19) then
        begin
           result := result + getFollicleString;
           if((cbRightPCO.Checked) and (cbLeftPCO.Checked)) then
           begin
            if result[length(result)] = '.' then
               result[length(result)] :='';
            result := result + ' and excessive ovarian response to controlled ovarian stimulation (Martins et al, UOG 2014).  ';
           end
           else
           begin
            if (((seRightFolCount.Value > 8) and (seRightFolCount.Value < 20)) and
               ((seLeftFolCount.Value > 8) and (seLeftFolCount.Value < 20)))  then
               result := result + 'In the context of assisted reproduction however, the total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is high (>19 follicles). This indicates a high risk of excessive ovarian response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
            else
               result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is high (>19 follicles). This indicates a high risk of excessive ovarian response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
           end;
        end;}
      end
      else
      begin
        if not(cbPostMenopausal.checked) then
        result := result + getFollicleString;
      end;
  end
  //----------------------------leading follicles ----------------------------//
       if (cbRightOvaryIdentified.Checked) and (seRightLeadFollicle.Value = 1) then
       begin
          if (cbLeftOvaryIdentified.Checked) and (seLeftLeadFollicle.Value = 1) then
             result := result + 'Single lead follicle in both ovaries.  '
          else
             result := result + 'Single lead follicle in the right ovary.  '
       end
       else
       begin
           if (cbleftOvaryIdentified.Checked)and (seLeftLeadFollicle.Value = 1) then
           begin
               result := result + 'Single lead follicle in left ovary.  '
           end;
       end
       if (cbRightOvaryIdentified.Checked)and ((seRightLeadFollicle.Value)+ (seRightFolCount.Value)= 0) then
       begin
          if (cbLeftOvaryIdentified.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0) then
          begin
            if ((not(cbRightCorpusLuteum.Checked)) and (not(cbLeftCorpusLuteum.Checked ))) then
              result := result + 'Both ovaries were inactive.  '
            else if not(cbRightCorpusLuteum.Checked) then
              result := result + 'Inactive right ovary.  '
            else if not(cbLeftCorpusLuteum.Checked) then
              result := result + 'Inactive left ovary.  '
          end;
          else
          begin
           if not(cbRightCorpusLuteum.Checked) then
            result := result + 'Inactive right ovary.  '
          end

       end
       else
       begin
          if (cbLeftOvaryIdentified.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0) then
          begin
            if not(cbLeftCorpusLuteum.Checked ) then
              result := result + 'Inactive left ovary.  '
          end;
       end;

      if ((cbRightOvaryIdentified.Checked) and (seRightLeadFollicle.Value > 1)) then
      begin
        if ((cbLeftOvaryIdentified.Checked) and (seLeftLeadFollicle.Value > 1)) then
           result := result + 'Leading follicles in both ovaries.  ';
        else
           result := result + 'Leading follicles in the right ovary.  ';
      end
      else
      begin
       if (cbLeftOvaryIdentified.Checked) and (seLeftLeadFollicle.Value > 1)  then
           result := result + 'Leading follicles in the left ovary.  ';
      end

      //---------------- Corpus Letunum --------------------//
      if cbRightCorpusLuteum.Checked then
      begin
        if cbLeftCorpusLuteum.Checked then
        begin
          result := result + 'Evidence of ovulation in both ovaries. ';
          {if ((cbRightCorpusLuteum.Checked) and ((seRightLeadFollicle.Value) + (seRightFolCount.Value) = 0)) then
          begin
             if ((cbLeftCorpusLuteum.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0)) then
                 result := result + 'No antral follicles in the both ovaries.  '
             else
                 result := result + 'No antral follicles in the right ovary.  ';
          end
          else if ((cbLeftCorpusLuteum.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0)) then
             result := result + 'No antral follicles in the left ovary.  '; }
        end
        else
        begin
          result := result + 'Evidence of ovulation in the right ovary. ';
          {if ((cbRightCorpusLuteum.Checked) and ((seRightLeadFollicle.Value) + (seRightFolCount.Value) = 0)) then
          begin
            result := result + 'No antral follicles in the right ovary.  ';
          end;}
        end;
      end
      else
      begin
        if cbLeftCorpusLuteum.Checked then
        begin
          result := result + 'Evidence of ovulation in the left ovary. ';
          { if ((cbLeftCorpusLuteum.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0)) then
             result := result + 'No antral follicles in the left ovary.  ';}
        end;
      end;


  //---------------ovarian cysts --------------------------//

  if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0) then
  begin
    vCystList := TStringList.Create;
    try
      vCystStr := '';
      for i := 1 to Trunc(seRightOvarianCystsCount.Value) do
      begin
        vCystControl := TAdvTreeComboBox(tsOvaries.Owner).FindComponent('cbRightOvaryCystType' + intToStr(i));
        if assigned(vCystControl) then
        begin
         if (not(vCystControl.selection = 12)) then
         begin
          if vCystList.IndexOf(trim(vCystControl.Text)) < 0 then
          begin
            vCystList.Add(Trim(vCystControl.Text));
            if ((i > 1) and (i=Trunc(seRightOvarianCystsCount.Value))) then
            begin
               if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
               begin
                if vCystStr <> '' then

                  vCystStr := vCystStr + ' and ';
               end;
            end;
            else if((i > 1) and (i<>Trunc(seRightOvarianCystsCount.Value))) then
            begin
              if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then

               vCystStr := vCystStr + ', '
            end;
            if pos('CYST', Uppercase(vCystControl.Text)) > 0 then
            begin
              if (vCystControl.selection = 3) then
                vCystStr := vCystStr + 'Haemorrhagic follicular cyst';
              else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + ' cyst';
              else
              begin
                vCystStr := vCystStr + InitCaps(Trim(copy(vCystControl.Text,1,pos('CYST', Uppercase(vCystControl.Text))-1)), (i > 1));
                vCystStr := vCystStr +' cyst';
              end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
               if not(pos('Haemorrhagic', vCystStr) > 0) then
               begin
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + ' cyst';
               end;
            end;
            else
            begin
              if (not(Trim(vCystControl.Text) = 'Endometrioma')) and (not(Trim(vCystControl.Text) = 'Dermoid plug' )) then
              begin
                vCystStr := vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1)) + ' cyst';
              end;
              else
              begin
                vCystStr :=  vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1));
              end;
            end
          end;
          else if (vCystList.IndexOf(trim(vCystControl.Text)) >= 0 ) then
          begin
            if (vCystControl.selection = 3) then
            begin
                if (pos(UpperCase('Haemorrhagic follicular cyst'),UpperCase(vCystStr)) > 0) then
                  if not(pos(UpperCase('Haemorrhagic follicular cysts'), UpperCase(vCystStr)) > 0) then
                  begin
                    vCystStr :=StringReplace(UpperCase(vCystStr),UpperCase('Haemorrhagic follicular cyst'),UpperCase('Haemorrhagic follicular cysts'))
                    vCystStr := InitCaps(Lowercase(vCystStr), False);
                  end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
              if (pos(UpperCase('Haemorrhagic'), UpperCase(vCystStr)) > 0) then
              begin
                if not(pos(UpperCase('Haemorrhagic cysts'), UpperCase(vCystStr)) > 0) then
                begin
                  vCystStr := StringReplace(uppercase(vCystStr),upperCase('Haemorrhagic cyst'),UpperCase('Haemorrhagic cysts'))
                  vCystStr := InitCaps(Lowercase(vCystStr), False);
                end;
              end;
            end;
           else if not((trim(vCystControl.Text) = 'Endometrioma') or (trim(vCystControl.Text) = 'Dermoid plug' )) then
           begin
              if not((pos('cysts', vCystStr)) > 0) then
                vCystStr  := StringReplace(uppercase(vCystStr),uppercase(trim(vCystControl.Text)+ ' cyst'),uppercase(trim(vCystControl.Text)+ ' cysts')) ;
              vCystStr := InitCaps(Lowercase(vCystStr),False);
           end;
           else if (trim(vCystControl.Text) = 'Endometrioma') then
            vCystList.Add(Trim(vCystControl.Text));
          end;
        end;
       end;
      end;
      vRightEndometriomaCount := 0;

      if vCystList.Count > 0 then
      begin
       for i := 0 to vCystList.Count-1 do
       begin
           if (vCystList[i] = 'Endometrioma') then
             vRightEndometriomaCount :=vRightEndometriomaCount + 1;

       end;
       if vRightEndometriomaCount > 1 then

        begin
          vCystStr  := StringReplace(UpperCase(vCystStr),UpperCase('Endometrioma'),InitCaps(getNumberString(vRightEndometriomaCount),false) + ' endometriomas') ;
          vCystStr := InitCaps(Lowercase(vCystStr), False);
        end;
        vCystStr := vCystStr + ' identified in the right ovary.  '
      end;
      if vCystStr <> '' then
      begin
        if not(pos(' and ',vCystStr)> 0) then
        begin
          if (pos(', ',vCystStr)> 0) then
            vCystStr := StringReplace(vCystStr, ', ', ' and ');
        end;
      end;
      if vCystStr <> '' then
        result := result + vCystStr;
      if (pos('fat only cyst',result)> 0) then
         result :=  StringReplace(result , 'fat only cyst', 'dermoid cyst');
      if (pos('Fat only cyst',result)> 0) then
          result :=  StringReplace(result , 'Fat only cyst', 'Dermoid cyst'); 
    finally
      if assigned(vCystList) then
        vCystList.Free;

    end;
    vRightEndometriomaCount := 0;
  end;
  if (cbleftOvarianCyst.Checked) and (seleftOvarianCystsCount.Value > 0) then
  begin
    vCystList := TStringList.Create;
    try
      vCystStr := '';
      for i := 1 to Trunc(seleftOvarianCystsCount.Value) do
      begin
        vCystControl := TAdvTreeComboBox(tsOvaries.Owner).FindComponent('cbleftOvaryCystType' + intToStr(i));
        if assigned(vCystControl) then
        begin
         if (not(vCystControl.selection = 12)) then
         begin
          if vCystList.IndexOf(trim(vCystControl.Text)) < 0 then
          begin
            vCystList.Add(Trim(vCystControl.Text));
            if ((i > 1) and (i=Trunc(seleftOvarianCystsCount.Value))) then
            begin
              if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
                vCystStr := vCystStr + ' and ';
            end;
            else if((i > 1) and (i<>Trunc(seleftOvarianCystsCount.Value))) then
            begin
             if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
               vCystStr := vCystStr + ', '
            end;
            if pos('CYST', Uppercase(vCystControl.Text)) > 0 then
            begin
              if (vCystControl.selection = 3) then
                vCystStr := vCystStr + 'Haemorrhagic follicular cyst';
              else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + 'cyst';
              else
              begin
                vCystStr := vCystStr + InitCaps(Trim(copy(vCystControl.Text,1,pos('CYST', Uppercase(vCystControl.Text))-1)), (i > 1));
                vCystStr := vCystStr +' cyst';
              end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
               if not(pos('Haemorrhagic', vCystStr) > 0) then
               begin
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + ' cyst';
               end;
            end;
            else
            begin
              if (not(Trim(vCystControl.Text) = 'Endometrioma')) and (not(Trim(vCystControl.Text) = 'Dermoid plug' )) then
              begin
                vCystStr := vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1)) + ' cyst';
              end;
              else
              begin
                vCystStr :=  vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1));
              end;
            end
          end;
          else if (vCystList.IndexOf(trim(vCystControl.Text)) >= 0 ) then
          begin
            if (vCystControl.selection = 3) then
            begin
                if (pos(UpperCase('Haemorrhagic follicular cyst'),UpperCase(vCystStr)) > 0) then
                  if not(pos(UpperCase('Haemorrhagic follicular cysts'), UpperCase(vCystStr)) > 0) then
                  begin
                    vCystStr :=StringReplace(UpperCase(vCystStr),UpperCase('Haemorrhagic follicular cyst'),UpperCase('Haemorrhagic follicular cysts'))
                    vCystStr := InitCaps(Lowercase(vCystStr), False);
                  end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
              if (pos(UpperCase('Haemorrhagic'), UpperCase(vCystStr)) > 0) then
              begin
                if not(pos(UpperCase('Haemorrhagic cysts'), UpperCase(vCystStr)) > 0) then
                begin
                  vCystStr := StringReplace(uppercase(vCystStr),upperCase('Haemorrhagic cyst'),UpperCase('Haemorrhagic cysts'))
                  vCystStr := InitCaps(Lowercase(vCystStr), False);
                end;
              end;
            end;
           else if not((trim(vCystControl.Text) = 'Endometrioma') or (trim(vCystControl.Text) = 'Dermoid plug' )) then
           begin
              if not((pos('cysts', vCystStr)) > 0) then
                vCystStr  := StringReplace(uppercase(vCystStr),uppercase(trim(vCystControl.Text)+ ' cyst'),uppercase(trim(vCystControl.Text)+ ' cysts')) ;
              vCystStr := InitCaps(Lowercase(vCystStr),False);
           end;
           else if (trim(vCystControl.Text) = 'Endometrioma') then
            vCystList.Add(Trim(vCystControl.Text));
          end;
        end;
       end; 
      end;
      vLeftEndometriomaCount := 0;
      if vCystList.Count > 0 then
      begin
       for i := 0 to vCystList.Count-1 do
       begin
           if (vCystList[i] = 'Endometrioma') then
             vLeftEndometriomaCount :=vLeftEndometriomaCount + 1;
       end;
       if vLeftEndometriomaCount > 1 then
        begin
          vCystStr  := StringReplace(uppercase(vCystStr),uppercase('Endometrioma'),InitCaps(getNumberString(vLeftEndometriomaCount),false) + ' endometriomas') ;
           vCystStr := InitCaps(Lowercase(vCystStr), False);
        end;
        vCystStr := vCystStr + ' identified in the left ovary.  '
      end;
      if vCystStr <> '' then
      begin
        if not(pos(' and ',vCystStr)> 0) then
        begin
          if (pos(', ',vCystStr)> 0) then
            vCystStr := StringReplace(vCystStr, ', ', ' and ');
        end;
      end;
      if vCystStr <> '' then
        result := result + vCystStr;
       if (pos('fat only cyst',result)> 0) then
         result :=  StringReplace(result , 'fat only cyst', 'dermoid cyst');
      if (pos('Fat only cyst',result)> 0) then
          result :=  StringReplace(result , 'Fat only cyst', 'Dermoid cyst');
    finally
      vCystList.Free;
    end;
  end;
  {if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0) then
  begin
    vCystList := TStringList.Create;
    try
      vCystStr := '';
      for i := 1 to Trunc(seLeftOvarianCystsCount.Value) do
      begin
        vCystControl := TAdvTreeComboBox(tsOvaries.Owner).FindComponent('cbLeftOvaryCystType' + intToStr(i));
        if assigned(vCystControl) then
        begin
          if vCystList.IndexOf(trim(vCystControl.Text)) < 0 then
          begin
            vCystList.Add(Trim(vCystControl.Text));
            if i > 1 then
              if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
                vCystStr := vCystStr + ' and ';
            if pos('CYST', Uppercase(vCystControl.Text)) > 0 then
            begin
              if (vCystControl.selection = 3) then
                vCystStr := vCystStr + 'Haemorrhagic follicular';
              else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
                vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1));
              else
                vCystStr := vCystStr + InitCaps(Trim(copy(vCystControl.Text,1,pos('CYST', Uppercase(vCystControl.Text))-1)), (i > 1));
            end
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
               if not(pos('Haemorrhagic', vCystStr) > 0) then
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1));
            end;
            else
              vCystStr := vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1));
          end;
        end;
      end;
      if vCystList.Count > 0 then
      begin
         if not((vCystStr = 'Endometrioma') or (vCystStr = 'Dermoid plug' )) then
        begin
            vCystStr := vCystStr + ' cyst'
        end;
        if (vCystList.Count > 1) or (seLeftOvarianCystsCount.Value > 1) then
          vCystStr := vCystStr + 's';
        vCystStr := vCystStr + ' identified in the left ovary.  '
      end;
      if vCystStr <> '' then
        result := result + vCystStr;
    finally
      vCystList.Free;
    end;
  end; }
  if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
    begin
       if (cbRightOvaryIdentified.Checked) and (not(cbLeftOvaryIdentified.Checked)) then
         result := result + 'Left ovary not identified.  ';
       if (cbLeftOvaryIdentified.Checked) and (not(cbRightOvaryIdentified.Checked)) then
         result := result + 'Right ovary not identified.  ';
    end;
  if (pos('Other  - go to IOTA',result) > 0 )then
  begin
    result := stringReplace(result , 'Other  - go to IOTA', 'Other')
  end;
  

end;

#endif
