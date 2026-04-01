// ******************* Global Variables ************************************//

// --- Shared utilities ---

function GetIndefinateArticle(inValue: Integer; inDoCaps: Boolean): string;
var
  vTemp: string;
begin
  result := '';
  vTemp := IntToStr(inValue);
  if ((length(vTemp) > 0) and (vTemp[1] = '8')) or (inValue = 11) or (inValue = 18) then
  begin
    if inDoCaps then
      result := 'An'
    else
      result := 'an'
  end
  else
  begin
    if inDoCaps then
      result := 'A';
  else
    result := 'a';
  end;
end;


function GetFullDateString(inDate: TDateTime): string;
begin
  result := FormatDateTime('dd mmmm yyyy', inDate);
end;


function AddToResult(inResult, inNew: string): string;
begin
  result := '';
  if trim(inResult) <> '' then
  begin
    if trim(inNew) <> '' then
      result := inResult + ', ' + trim(inNew);
  end
  else
  begin
    if trim(inNew) <> '' then
      result := trim(inNew);
  end;
end;

procedure cbToggleCheckOnClick(Sender)
var
  i: Integer;
begin
  if Sender.Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (Sender.Parent.Controls[i].Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          Sender.Parent.Controls[i].Checked := false;
        end;
      end;
    end;
  end;
end;

function Max(A, B: Integer): Integer;
begin
  if A > B then
    result := A
  else
    result := B;
end;

function Min(in1, in2: Integer): Integer;
begin                                                        
  if in1 > in2 then                                 
    result := in2                                               
  else
    result := in1;
end;


function InitCaps(inv: string; inReduce: Boolean): string;
var
  vDiff: Integer;
begin
  if inv <> '' then
  begin
    vDiff := Ord('A') - Ord('a');
    result := inv;
    if inReduce then
    begin
      if (Ord(result[1]) >= Ord('A')) and (Ord(result[1]) <= Ord('Z')) then
        result[1] := chr(Ord(inv[1]) - vDiff);
    end
    else
    begin
      if (Ord(result[1]) >= Ord('a')) and (Ord(result[1]) <= Ord('z')) then
        result[1] := chr(Ord(inv[1]) + vDiff);
    end;
  end
  else
    result := '';
end;

function IncludeComma(inString: string): string;
var
  v1: string;
begin
  v1 := '';
  if Length(inString) > 0 then
    v1 := inString + ', ';
  result := v1;
end;                               

function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.  '
    else
      result := inStr;
  end
  else
    result := ''
end;

function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := trim(inStr);
  if vt[length(vt)] <> '.' then
    vt := vt + '. '
  else
    vt := vt + ' ';
  result := vt;
end;

function PadDecimalPlaces(inStr: String): String;
begin
  result := Trim(inStr);
  if (pos('.', result) = 0) then
    result := result + '.0'
  else if result[0] = '.' then
  begin
      result := '0'+ result ;
  end;
  else
  begin                                  
    if result[length(result)] = '.' then
      result := result + '0';
  end;
end;

function GetNumberString(inNumber: Integer): string;
begin
  result := '';
  if inNumber = 1 then
    result := 'a single'
  else
  begin
    if inNumber = 2 then
      result := 'two'
    else if inNumber = 3 then
      result := 'three'
    else if inNumber = 4 then
      result := 'four'
    else if inNumber = 5 then
      result := 'five'
    else if inNumber = 6 then
      result := 'six'
    else if inNumber = 7 then
      result := 'seven'
    else if inNumber = 8 then
      result := 'eight'
    else if inNumber = 9 then
      result := 'nine'
    else
      result := IntToStr(inNumber);
  end;
end;

function RemoveDecimalPointAtEnd(inStr: String): String;
begin
  result := Trim(inStr);
  if result[length(result)] = '.' then
      result := copy(result, 1, (length(result)-1));
end;

function GetIntegerMeasuredString(v1, v2, v3: Integer; v4: Double; inType: string): string;
begin
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          if trunc(v4) = v4 then
            result := Format('%dx%dx%d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
          else
            result := Format('%dx%dx%d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
        end
        else
          result := Format('%dx%dx%d%s', [v1, v2, v3, inType]);
      end
      else
        result := Format('%dx%d%s', [v1, v2, inType]);
    end
    else
      result := Format('%d%s', [v1, inType]);
  end
  else
    result := '';
end;


function StrToFloatDef(inString: string; inDefault: Real): Real;
begin
  try                                                                                                                                                          
    result := StrToFloat(inString);
  except
    result := inDefault;
  end;
end;

function StrToIntDef(inString: string; inDefault: Integer): Integer;
begin                                              
  try
    result := StrToInt(inString);
  except
    result := inDefault;                          
  end;                                                                             
end;                                              

function StringReplace(inSource, inMatch, inReplace: String): String;
var
  i: Integer;
begin
  result := inSource;
  i := Pos(inMatch, result);
  while i > 0 do
  begin
    result := copy(inSource, 1, i-1) + inReplace + copy(inSource, i+length(inMatch), length(inSource));
    i := Pos(result, inMatch);
  end;
end;

function StringReplaceAll(inSource, inMatch, inReplace: String): String;
var
  i: Integer;                                                             
begin
  result := inSource;
  i := Pos(inMatch, result);
  while (i > 0) do
  begin
    result := copy(result, 1, i-1) + inReplace + copy(result, i+length(inMatch), length(result));
    i := Pos(inMatch, result);
  end;
end;


// --- Shared gynae ---

procedure spFibroidCountOnChange(Sender)
begin
  gbFibroid1.Visible := False;
  gbFibroid2.Visible := False;
  gbFibroid3.Visible := False;
  gbFibroid4.Visible := False;
  gbFibroid5.Visible := False;
  gbFibroid6.Visible := False;
  gbFibroid7.Visible := False;
  gbFibroid8.Visible := False;
  gbFibroid9.Visible := False;
  gbFibroid10.Visible := False;
  if spFibroidCount.Value > 0 then
  begin
     cbFibroidsVisualised.Checked := true;
  end;
  if cbFibroidsVisualised.Checked then
  begin
    if spFibroidCount.Value > 0 then
    begin
      gbFibroid1.Visible := True;
      if spFibroidCount.Value > 1 then
      begin
        gbFibroid2.Visible := True;
        if spFibroidCount.Value > 2 then
        begin
          gbFibroid3.Visible := True;
          if spFibroidCount.Value > 3 then
          begin
            gbFibroid4.Visible := True;
            if spFibroidCount.Value > 4 then
            begin
              gbFibroid5.Visible := True;
              if spFibroidCount.Value > 5 then
              begin
                gbFibroid6.Visible := True;
                if spFibroidCount.Value > 6 then
                begin
                  gbFibroid7.Visible := True;
                  if spFibroidCount.Value > 7 then
                  begin
                    gbFibroid8.Visible := True;
                    if spFibroidCount.Value > 8 then
                    begin
                      gbFibroid9.Visible := True;
                      if spFibroidCount.Value > 9 then
                      begin
                        gbFibroid10.Visible := True;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure cbFibroidsVisualisedOnClick(sender)
begin
  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;
  spFibroidCountOnChange(nil);
end;

procedure cbFibroidsTypeOnChange(Sender)
var
  vControlIdx: Integer;
  vCheckBox: TWinControl;
begin
  vControlIdx := Sender.Tag;
  if vControlIdx > 0 then
  begin
    {  vCheckBox := TWinControl(Sender).Owner.FindComponent('cbCavityDistortion' + intToStr(vControlIdx));
      if assigned(vCheckBox) then
      begin
        TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 0;
      end;  }
  end;
end;


function GetFibroidCount: string;
var
  vNumber: string;
begin
  if spFibroidCount.Value = 0 then
    result := 'No fibroids were'
  else
  begin
    vNumber := GetNumberString(spFibroidCount.Value);
    if spFibroidCount.Value = 1 then
      result := vNumber + ' fibroid is'
    else
    begin
      result := vNumber + ' fibroids are';
    end;
  end;
  result := InitCaps(result, False);
end;

function GetSingleCloseOrClear: String;
begin
  if cbCavityDistortion1.Checked then
    result := 'close to the cervix'
  else
  begin
    result := 'clear of the cervix';
  end;
  if seCloseToCrevix1.value > 0 then
    result := result + ' (within ' + intToStr(seCloseToCrevix1.value) + ' mm)'
end;

function GetCavDistortionCount: Integer;
begin
  result := 0;
  if (gbFibroid1.Visible) and (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
    result := Result + 1;
  {if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then
    result := Result + 1;
  if (gbFibroid3.Visible) and (cbCavityDistortion3.Checked) and (cbCavityDistortion3.Enabled) then
    result := Result + 1;
  if (gbFibroid4.Visible) and (cbCavityDistortion4.Checked) and (cbCavityDistortion4.Enabled) then
    result := Result + 1;
  if (gbFibroid5.Visible) and (cbCavityDistortion5.Checked) and (cbCavityDistortion5.Enabled) then
    result := Result + 1;
  if (gbFibroid6.Visible) and (cbCavityDistortion6.Checked) and (cbCavityDistortion6.Enabled) then
    result := Result + 1;
  if (gbFibroid7.Visible) and (cbCavityDistortion7.Checked) and (cbCavityDistortion7.Enabled) then
    result := Result + 1;
  if (gbFibroid8.Visible) and (cbCavityDistortion8.Checked) and (cbCavityDistortion8.Enabled) then
    result := Result + 1;
  if (gbFibroid9.Visible) and (cbCavityDistortion9.Checked) and (cbCavityDistortion9.Enabled) then
    result := Result + 1;
  if (gbFibroid10.Visible) and (cbCavityDistortion10.Checked) and (cbCavityDistortion10.Enabled) then
    result := Result + 1;}
end;

 function GetSingleFibroidDimensions: string;
var
  v1, v2, v3,v4: Integer;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value);
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + format('%d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]);
        end
        else
          result := result + format('%d x %d x %dmm', [v1, v2, v3]);
      end
      else
        result := result + format('%d x %dmm', [v1, v2]);
    end
    else
      result := result + format('%dmm', [v1]);
  end;
  if result <> '' then
    result := ' ' + result;
end;

function GetSingleFibroid: string;
begin
result := '';
  result := cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
  if cbFibroidsLeftRight1.ItemIndex > 0 then
    result := InitCaps(cbFibroidsLeftRight1.Text, True) + ' ' + result;

  if result <> '' then
    result := ' ' + result;
end;

function GetFibroidString (inFibroid: Integer): string;
var
  v1, v2, v3,v4: Integer;
  vl, vw, vd, vv: TcxSpinEdit;
  vp, vt, vlr: TcxComboBox;
  vCheck: TcxCheckBox;
begin
  result := '';
  vv := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(inFibroid));
  vl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidLength' + intToStr(inFibroid));
  vw := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidWidth' + intToStr(inFibroid));
  vd := TWinControl(tsFibroids.Owner).FindComponent('edtFibroiddepth' + intToStr(inFibroid));
  vp := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(inFibroid));
  vt := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(inFibroid));
  vlr := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(inFibroid));
  vCheck := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
  v1 := trunc(vl.Value);
  v2 := trunc(vw.Value);
  v3 := trunc(vd.Value);
  v4 := trunc(vv.Value)
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result  + format('%d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]) + ' ' ;
            if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
        else
        begin
          result := result  + format('%d x %d x %dmm', [v1, v2, v3]) + ' ' ;
           if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
      end
      else
      begin
        result := result + format('%d x %dmm', [v1, v2]) + ' ' ;
         if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
      end;
    end
    else
    begin
      result := result + format('%dmm', [v1])+ ' ' ;
       if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
       result := result + vp.Text + ' ' + vt.Text;
    end;
    if result <> '' then
      result := result + ' fibroid'
  end;
  if vCheck.Checked then
  begin
    vv := TWinControl(tsFibroids.Owner).FindComponent('seCloseToCrevix' + intToStr(inFibroid));
    if vv.value > 0 then
    begin
        result := result + Format(' within %d mm of the cervix',[trunc(vv.value)]);
    end
    else
      result := result + ' and is close to the cervix';
  end;    
  else
  begin
    if GetCavDistortionCount > 0 then
      result := result + ', clear of the cervix';
  end;
end;  

function GetFibroidDesc(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  if inFibroid <= spFibroidCount.Value then
  begin
    result := GetFibroidString(inFibroid);
  end;
  if trim(result) <> '' then
    result := InitCaps(result, False);
end;

function GetLargestFibroid(var isDistored: Boolean): Real;
var
  vControl: TcxSpinEdit;
  vControl2: TcxCheckBox;
begin
  result := 0.0;
  isDistored := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(i + 1));
    if (assigned(vControl)) and (TcxSpinEdit(vControl).Value > result) then
    begin
      result := TcxSpinEdit(vControl).Value;
      vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      if assigned(vControl2) then
      begin
        if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
          isDistored := True
        else
          isDistored := False;
      end
      else
        result := False;
    end;
  end;
end;

function GetFibroidAvg(inFibroid: Integer): integer;
var
  vControl: TWinControl;
  i: Integer;
  vValue: Integer;
  vCount: integer;
begin
  result := 0;
  vCount := 0;
  vValue := 0;
  vControl := TWinControl(tsFibroids.Owner).FindComponent('gbFibroid' + intToStr(inFibroid));
  if assigned(vControl) then
  begin
    for i := 0 to vControl.ControlCount - 1 do
    begin
      if (vControl.Controls[i] is TcxSpinEdit) and (pos('Volume', vControl.Controls[i].Name) < 1) then
      begin
        if (TcxSpinEdit(vControl.Controls[i]).Value > 0) then
        begin
          vCount := vCount + 1;
          vValue := vValue + TcxSpinEdit(vControl.Controls[i]).Value;
        end;
      end;
    end;
  end;
  if vCount > 0 then
    result := Trunc(vValue / vCount);
end;

function GetSingleFibroidCavity: string;
var
  vControl2: TWinControl;
  v1, v2, v3: TcxComboBox;
begin
  result := '';
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
      begin
        v1 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
        v2 := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
        v3 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if (assigned(v1)) and (TcxComboBox(v1).text <> '') then
          result := result + Trim(TcxComboBox(v1).text) + ' ';
        if (assigned(v2)) and (TcxComboBox(v2).text <> '') then
          result := result + Trim(TcxComboBox(v2).text) + ' ';
        if (assigned(v3)) and (TcxComboBox(v3).text <> '') then
          result := result + Trim(TcxComboBox(v3).text) + ' ';
        break;
      end;
    end;
  end;
end;

function GetHasDistortion: Boolean;
var
  vControl2: TcxCheckBox;
  i: Integer;
begin
  result := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
      begin
        result := True
          break;
      end;
    end;
  end;
end;

function GetFibroidConcl: string;
begin
  result := '';
  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    if (spFibroidCount.Value > 1) then
    begin
      if (spFibroidCount.Value > 2) then
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        for i := 2 to spFibroidCount.Value do
        begin
          vTemp := GetFibroidAvg(i);
          if vTemp > vLargest then
            vLargest := vTemp;
          if vTemp < vSmallest then
            vSmallest := vTemp;
        end;
        result := result + Format('Multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
        if GetHasDistortion then
          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
        else
          result := result + ', all clear of cervix.';  
      end
      else
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        vTemp := GetFibroidAvg(2);
        if vTemp > vLargest then
          vLargest := vTemp;
        if vTemp < vSmallest then
          vSmallest := vTemp;
       result := result + Format('Two fibroids of %dmm and %dmm visualised',[vSmallest, vLargest]);
        if GetHasDistortion then
          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
        else
          result := result +', both clear of cervix.';
      end;
    end
    else
    begin
      result := result + Format(' A single %s fibroid of %dmm was visualised', [cbFibroidsType1.text, GetFibroidAvg(1)]);
      if (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
      begin
        result := result + ' with associated cavity distortion.';
      end;
      else
        result := result + '.';
    end;
  end;
end;

function getFibroid : String;
var
  i : Integer;
begin
result := '';
  if spFibroidCount.value > 0 then
  begin
    if spFibroidCount.value = 1 then
    begin
      if GetSingleFibroidDimensions <> ''  then
         result := result +  GetSingleFibroidDimensions + GetSingleFibroid + ' fibroid seen.  ';
      if (result <> '')  and (GetSingleCloseOrClear <> '') then
         result := result + 'It is ' +  GetSingleCloseOrClear;
      if result <> '' then
        result :=  'There is a' + result;
    end
    else if spFibroidCount.value > 1 then
    begin
      for i := 1 to spFibroidCount.value do
      begin
        if result <> '' then
        begin
          if i = spFibroidCount.value then
             result := result + ' and';
          else
             result := result + ',';
        end;
        result := result + GetFibroidString(i);
      end;
      if result <> '' then
       result := 'There are fibroids identified: ' + result;
    end;
    if result = '' then
    begin
        GFibroidWarning := TRUE;
        if spFibroidCount.value = 1 then
          result := 'Fibroid';
        else if spFibroidCount.value > 1 then
          result := 'Fibroids';
    end;
  end
  else if cbFibroidsVisualised.checked then
  begin
    GFibroidWarning := TRUE;
    result := 'Fibroid/s';
  end;
  else
    result := '';  

  if result <> '' then
    result := #13#10+#13#10 + AddFullSTopToEnd(result);
end;

function GetFibroidAllClear: string;
var
  vFibroidCount: Integer;
  vCheck: TcxCheckBox;
  inFibroid, vNumber : integer;
begin
result := '';
  vNumber := 0;
  vFibroidCount := spFibroidCount.Value;
  for inFibroid :=1 to  vFibroidCount do
  begin
    vCheck := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
    if not(vCheck.Checked) then
    begin
     vNumber := vNumber + 1;
    end;
  end;
  if(vNumber = vFibroidCount) then
  begin
     result := '(all clear of the cervix)';
  end;
  else
     result :='';
end;


// --- gynae variants ---

function GetCavDistortionCount(var isValidDist: Booelan): Integer;
var
  vControl: TcxCheckBox;
  vCombo: TcxComboBox;
  i: Integer;
begin
  result := 0;
  isValidDist := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
    begin
      isValidDist := True;
      if (TcxCheckBox(vControl).Checked) and not(TcxComboBox(vCombo).ItemIndex = 2) then
      begin
        result := Result + 1;
      end;
    end;
  end;
end;


function GetFibroidConcl: string;
var
  vLargest, vSmallest, vTemp, i: Integer;
  vBool: Boolean;
begin
  result := '';
  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    if (spFibroidCount.Value > 1) then
    begin
      if (spFibroidCount.Value > 2) then
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        for i := 2 to spFibroidCount.Value do
        begin
          vTemp := GetFibroidAvg(i);
          if vTemp > vLargest then
            vLargest := vTemp;
          if vTemp < vSmallest then
            vSmallest := vTemp;
        end;
        result := result + Format(', containing multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
        if GetCavDistortionCount(vBool) > 0 then
          result := result + ' with associated cavity distortion';
      end
      else
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        vTemp := GetFibroidAvg(2);
        if vTemp > vLargest then
          vLargest := vTemp;
        if vTemp < vSmallest then
          vSmallest := vTemp;
        result := result + Format(', containing two fibroids of %dmm and %dmm', [vSmallest, vLargest]);
        if GetCavDistortionCount(vBool) > 0 then
          result := result + ' with associated cavity distortion';
      end;
    end
    else
    begin
      result := result + Format(', containing a single %s fibroid of %dmm', [cbFibroidsType1.text, GetFibroidAvg(1)]);
      if ((cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled)) or (cbFibroidsType1.ItemIndex = 2) then
      begin
        if (cbCavityDistortion1.Enabled) then
          result := result + ' with associated cavity distortion';
      end
      else
      begin
        if (cbCavityDistortion1.Enabled) then
        begin
          result := result + ' with no associated cavity distortion';
        end;
      end;
    end;
  end;
end;


function GetFibroidCount: string;
var
  vNumber: string;
begin
  if spFibroidCount.Value = 0 then
    result := 'No fibroids were'
  else
  begin
    vNumber := GetNumberString(spFibroidCount.Value);
    if spFibroidCount.Value = 1 then
      result := vNumber + ' fibroid was'
    else
    begin
      result := vNumber + ' fibroids were';
    end;
  end;
  result := InitCaps(result, False);
end;


function GetFibroidDesc(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
  vParentGroup: TcxGroupBox;
  vFibPosition, vFibType: string;
begin
  result := '';
  if inFibroid <= spFibroidCount.Value then
  begin
    vParentGroup := nil;
    for i := 0 to tsFibroids.ControlCount - 1 do
    begin
      if (tsFibroids.Controls[i].Name = ('gbFibroid' + intToStr(inFibroid))) then
      begin
        vParentGroup := tsFibroids.Controls[i];
        break;
      end;
    end;
    if assigned(vParentGroup) then
    begin
      vFibPosition := '';
      vFibType := '';
      v1 := 0;
      v2 := 0;
      v3 := 0;
      v4 := 0;
      for i := 0 to vParentGroup.ControlCount - 1 do
      begin
        if vParentGroup.Controls[i].Name = ('cbFibroidsLeftRight' + intToStr(inFibroid)) then
        begin
          result := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidLength' + intToStr(inFibroid)) then
        begin
          v1 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidWidth' + intToStr(inFibroid)) then
        begin
          v2 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroiddepth' + intToStr(inFibroid)) then
        begin
          v3 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidVolume' + intToStr(inFibroid)) then
        begin
          v4 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value * 10) / 10;
        end
        else if vParentGroup.Controls[i].Name = ('cbFibriodPosition' + intToStr(inFibroid)) then
        begin
          vFibPosition := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
        else if vParentGroup.Controls[i].Name = ('cbFibroidsType' + intToStr(inFibroid)) then
        begin
          vFibType := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
      end;
      if result <> '' then
        result := result + ' ';
      result := InitCaps(result + Format('%s %s %s', [vFibPosition, vFibType, GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]), False);
    end;
  end;
end;


function GetLargestFibroid(var isDistored: Boolean): Real;
var
  vControl: TcxSpinEdit;
  vControl2: TcxCheckBox;
  i: Integer;
begin
  result := 0.0;
  isDistored := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(i + 1));
    if (assigned(vControl)) and (TcxSpinEdit(vControl).Value > result) then
    begin
      result := TcxSpinEdit(vControl).Value;
      vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      if assigned(vControl2) then
      begin
        if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
          isDistored := True
        else
          isDistored := False;
      end
      else
        result := False;
    end;
  end;
end;


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


function GetSingleFibroid: string;
begin
  result := '';
  if cbFibroidsLeftRight1.Text <> '' then
    result := InitCaps(cbFibroidsLeftRight1.Text, true) + ' ';
  result := result + cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
end;


function GetSingleFibroidCavity: string;
var
  vControl2: TWinControl;
  vCombo: TcxComboBox;
  v1, v2, v3: TcxComboBox;
  i: Integer;
begin
  result := '';
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if ((TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled)) and (vCombo.ItemIndex <> 2) then
      begin
        v1 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
        v2 := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
        v3 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if (assigned(v1)) and (TcxComboBox(v1).text <> '') then
          result := result + InitCaps(Trim(TcxComboBox(v1).text), true) + ' ';
        if (assigned(v2)) and (TcxComboBox(v2).text <> '') then
          result := result + Trim(TcxComboBox(v2).text) + ' ';
        if (assigned(v3)) and (TcxComboBox(v3).text <> '') then
          result := result + Trim(TcxComboBox(v3).text) + ' ';
        break;
      end;
    end;
  end;
end;


function GetSingleFibroidDimensions: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value * 10) / 10;
   if (not(cbCavityDistortion1.Caption = 'Cavity projection')) or
      ((cbCavityDistortion1.Caption = 'Cavity projection') and not(cbCavityDistortion1.checked))then
     result := result + 'was visualised';
  if (GetIntegerMeasuredString(v1, v2, v3, v4, 'mm') <> '') and not((cbFibroidsType1.ItemIndex = 2))then
  begin
   result := result + ' and measured ';
   result :=  result + GetIntegerMeasuredString(v1, v2, v3, v4, 'mm');
  end;
  else if (GetIntegerMeasuredString(v1, v2, v3, v4, 'mm') <> '') and ((cbFibroidsType1.ItemIndex = 2))then
  begin
   result := result + 'measuring ';
   result :=  result + GetIntegerMeasuredString(v1, v2, v3, v4, 'mm');
  end;
  if (cbCavityDistortion1.Enabled) and  (cbCavityDistortion1.Caption = 'Cavity distortion') and (cbFibroidsType1.ItemIndex = 0)then
  begin
    if (cbCavityDistortion1.Checked) then
      result := result + ' with associated cavity distortion'
    else
      result := result + '. There was no associated distortion of the endometrial cavity contour';
  end
  else if (cbCavityDistortion1.Enabled) and  (cbCavityDistortion1.Caption = 'Cavity projection') and (cbFibroidsType1.ItemIndex = 2)then
  begin
      if (cbCavityDistortion1.Checked) then
      begin
         result :=  result + ' was visualised';
         result := result + ' appeared to project '
         if cbProjection1.text <> '' then
         begin
          result := result + cbProjection1.text + ' ';
         end
         result := result + 'into the cavity';
      end
  end;
  else
    result := result + '';
end;


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


procedure cbToggleCheckOnClick(Sender)
var
  i: Integer;
begin
  if TcxCheckBox(Sender).Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (TcxCheckBox(Sender.Parent.Controls[i]).Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          TcxCheckBox(Sender.Parent.Controls[i]).Checked := false;
        end;
      end;
    end;
  end;
end;


procedure cxccbReferralIndicationChange(Sender)
begin
  edtPresentComplaintOther.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
   if not (cbRightOvaryIdentified.Checked) then
   begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
  end
  else
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := True;
      cbRightVaginalAccessNo.Enabled := True;
      cbRightVaginalNA.Enabled := True;
      gbRightVaginalAccess.Enabled := True;
    end
    else
     begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
  end;
  if (not cbLeftOvaryIdentified.Checked) then
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end;
  end
  else
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := True;
      cbLeftVaginalAccessNo.Enabled := True;
      cbLeftVaginalNA.Enabled := True;
      gbLeftVaginalAccess.Enabled := True;
    end;
    else
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end;
  end;
end;


procedure spFibroidCountOnChange(Sender)
var
  v1: TcxGroupBox;
begin
  for i := 1 to 12 do
  begin  
    v1 := TWinControl(tsFibroids.Owner).FindComponent('gbFibroid' + intToStr(i));
    if assigned(v1) then
    begin
      v1.Visible := (i <= spFibroidCount.Value);
    end;
  end;
end;


// --- Exam-specific ---
function CheckFormComplete: Boolean;
begin
  if (seCycleMaxDays.Enabled) and (seCycleMaxDays.Value <> 1) and (seCycleMinDays.Value > seCycleMaxDays.Value) then
  begin
    ShowMessage('Please correct the number of days in the cycle before proceeding.');
    result := False;
  end
  else if (cbUterineShape.Enabled) and (cbUterineShape.ItemIndex < 1) then
  begin
    ShowMessage('Please Select a Uterine Shape before proceeding.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (seEdometriumThickness.value <= 0) and (not(cbHysterectomy.checked)) then
  begin
    ShowMessage('Please endometrium thickness before proceeding.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHysterectomy.checked) and (not(cbCervixPresentYes.checked or cbCervixPresentNo.checked)) then
  begin
    ShowMessage('Please check ''Yes/No'' for cervix present.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHysterectomy.checked) and (not(cbVaultNormalYes.checked or cbVaultNormalNo.checked)) then
  begin
    ShowMessage('Please check ''Yes/No'' for Vault Normal.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHRTYes.enabled) and (cbHRTYes.checked) and (trim(tcbMedication.Text) = '') then
   begin
    showmessage('Specify HRT type in Medication');
    result := False;
  end
  else if (Trim(reDiagnosisComments.Lines.Text) = '') then
  begin
    ShowMessage('Please Complete the Diagnosis Comments before proceeding.');
    pcReportBody.Properties.ActivePage := tsCommentsAndDiagnosis;
    result := False;
  end
  else
    result := true;
end;

procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Clear;
  // ---------------Header Merge Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('ExaminationDate="' + FormatDateTime('dd mmm yyyy', deExamDate.Date) + '"');
  lbMergeDataMergeFields.Items.Add('ReferalIndications="' + GetReferalIndications + '"');
  lbMergeDataMergeFields.Items.Add('Menses="' + GetMenses + '"');
  lbMergeDataMergeFields.Items.Add('GynaecologicalHistory="' + GetGynaecologicalHistory + '"');
  lbMergeDataMergeFields.Items.Add('GynaecologicalSurgery="' + GetGynaecologicalSurgery + '"');
  lbMergeDataMergeFields.Items.Add('FamilyHistory="' + GetFamilyHistory + '"');
  lbMergeDataMergeFields.Items.Add('LMPString="' + GetLMPString + '"');
  lbMergeDataMergeFields.Items.Add('Cycledays="' + GetCycledaysString + '"');
  lbMergeDataMergeFields.Items.Add('StartCycleDay="' + IntToStr(spStartDay.value) + '"');
  lbMergeDataMergeFields.Items.Add('EndCycleDay="' + GetEndCycleDays + '"');
  lbMergeDataMergeFields.Items.Add('Medication="' + GetMedication + '"');

  // ---------------Report Main Merge Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('UterusType="' + GetUterusType + '"');
  lbMergeDataMergeFields.Items.Add('UterusMeasurement="' + GetUterusMeasurement + '"');
  lbMergeDataMergeFields.Items.Add('EndometriumSize="' + GetEndometriumSize + '"'); //
  lbMergeDataMergeFields.Items.Add('EndometriumType="' + getEndometriumType + '"');
  if sePolypCount.value = 1 then
     lbMergeDataMergeFields.Items.Add('EndometrialPolyp="' + GetEndometrialPolyp + '"');
  else if sePolypCount > 1 then
     lbMergeDataMergeFields.Items.Add('EndometrialPolyp="' + GetMultipleEndometrialPolypString + '"');
  lbMergeDataMergeFields.Items.Add('EndometrialLesion="' + getEndometrialLesion + '"');
  lbMergeDataMergeFields.Items.Add('IUCDPlacement="' + GetIUCDPlacement(false) + '"');
  lbMergeDataMergeFields.Items.Add('UterusAppearance="' + GetUterusAppearance + '"');
 { lbMergeDataMergeFields.Items.Add('CervicalLength="' + intToStr(seCervicalLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('UterineCavityLength="' + intToStr(seUterineCavityLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('RightUterineCavityLength="' + intToStr(seRightUterineCavityLength.Value) + '"'); }
  lbMergeDataMergeFields.Items.Add('SeptumLength="' + GetSeptumLengthString + '"');
  lbMergeDataMergeFields.Items.Add('CervixAppearance="' + GetCervixAppearance + '"');
  //lbMergeDataMergeFields.Items.Add('RightCervixMeasurement="' + intToStr(spRightCerivalLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('AdenomysisType="' + GetIncVasAndVenBlind + '"');
  lbMergeDataMergeFields.Items.Add('AnteriorAPMeasure="' + intToStr(spAPAnterior.Value) + '"');
  lbMergeDataMergeFields.Items.Add('PosteriorAPMeasure="' + intToStr(spAPPosterior.Value) + '"');
  lbMergeDataMergeFields.Items.Add('HysterectomyString="' + GetHysterectomyString + '"');
  lbMergeDataMergeFields.Items.Add('GetBulkyUterus="' + GetGetBulkyUterus + '"');
  lbMergeDataMergeFields.Items.Add('LargerMyometrium="' + GetLargerMyometrium + '"');

  // ---------------Fibroids Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('SingleFibroidDimensions="' + GetSingleFibroidDimensions + '"');
  lbMergeDataMergeFields.Items.Add('SingleFibroid="' + GetSingleFibroid + '"');

  lbMergeDataMergeFields.Items.Add('FibroidCount="' + GetFibroidCount + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid1="' + GetFibroidDesc(1) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid2="' + GetFibroidDesc(2) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid3="' + GetFibroidDesc(3) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid4="' + GetFibroidDesc(4) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid5="' + GetFibroidDesc(5) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid6="' + GetFibroidDesc(6) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid7="' + GetFibroidDesc(7) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid8="' + GetFibroidDesc(8) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid9="' + GetFibroidDesc(9) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid10="' + GetFibroidDesc(10) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid11="' + GetFibroidDesc(11) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid12="' + GetFibroidDesc(12) + '"');
  lbMergeDataMergeFields.Items.Add('SingleFibroidCavity="' + GetSingleFibroidCavity + '"');
  lbMergeDataMergeFields.Items.Add('CavityProjection="' + GetCavProjectionString + '"');

  // ---------------Ovary Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('OvaryOverview="' + GetOvaryOverview + '"');

  lbMergeDataMergeFields.Items.Add('NeitherOvaryIdentified="' + GetNeitherOvaryIdentifiedString + '"');
  lbMergeDataMergeFields.Items.Add('RightOvary="' + GetRightOvary + '"');
  lbMergeDataMergeFields.Items.Add('RightOvaryAppearance="' + GetRightOvaryAppearance + '"');
  lbMergeDataMergeFields.Items.Add('RightOvaryCystDesc="' + GetRightOvaryCyst + '"');

  lbMergeDataMergeFields.Items.Add('LeftOvary="' + GetLeftOvary + '"');
  lbMergeDataMergeFields.Items.Add('LeftOvaryAppearance="' + GetLeftOvaryAppearance + '"');
  lbMergeDataMergeFields.Items.Add('LeftOvaryCystDesc="' + GetLeftOvaryCyst + '"');

  if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1) then
  begin
    lbMergeDataMergeFields.Items.Add('NumberOfCysts="' + Format('%s cysts were visualised in this ovary:',[InitCaps(getNumberString(seRightOvarianCystsCount.Value), False)]) + '"');
  end;
  if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1) then
  begin
    lbMergeDataMergeFields.Items.Add('NumberOfCystsL="' + Format('%s cysts were visualised in this ovary:',[InitCaps(getNumberString(seLeftOvarianCystsCount.Value), False)]) + '"');
  end;

   //----------------------IOTA RIGHT OVARY-------------------------------//
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAClassification="' + GetOvaryIOTAClassification('right') + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTACystWall="' + GetRightOvaryIOTACystWall + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAInternalContents="' + GetRightOvaryIOTAInternalContents + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTASolidElements="' + GetRightOvaryIOTASolidElements + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAVascularity="' + GetRightOvaryIOTAVascularity + '"');
   {lbMergeDataMergeFields.Items.Add('RightOvaryIOTAFreeFluid="' + GetRightOvaryIOTAFreeFluid + '"');}
   lbMergeDataMergeFields.Items.Add('RightOvaryAscites="' + GetRightOvaryIOTAAscites + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAAppearance="' + GetRightOvaryIOTAAppearance + '"');
   {lbMergeDataMergeFields.Items.Add('RightOvaryIOTASeptum="' + GetRightOvaryIOTASeptum + '"');}

   //----------------------IOTA Left OVARY-------------------------------//
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAClassification="' + GetOvaryIOTAClassification('left') + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTACystWall="' + GetLeftOvaryIOTACystWall + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAInternalContents="' + GetLeftOvaryIOTAInternalContents + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTASolidElements="' + GetLeftOvaryIOTASolidElements + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAVascularity="' + GetLeftOvaryIOTAVascularity + '"');
   {lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAFreeFluid="' + GetLeftOvaryIOTAFreeFluid + '"');}
   lbMergeDataMergeFields.Items.Add('LeftOvaryAscites="' + GetLeftOvaryIOTAAscites + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAAppearance="' + GetLeftOvaryIOTAAppearance + '"');
   {lbMergeDataMergeFields.Items.Add('LeftOvaryIOTASeptum="' + GetLeftOvaryIOTASeptum + '"');}

  // ---------------Pelvis Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('Adnexal="' + GetAdnexalDesc + '"');
  lbMergeDataMergeFields.Items.Add('PODMeasurement="' + IntToStr(Trunc(sePODDepth.Value)) + '"');
  if (cbBladderNormal.Checked) then
    lbMergeDataMergeFields.Items.Add('BladderAppearance="normal"')
  else
    lbMergeDataMergeFields.Items.Add('BladderAppearance="abnormal"');
  lbMergeDataMergeFields.Items.Add('KidneyAppearance="' + GetKidneyAppearance + '"');

  lbMergeDataMergeFields.Items.Add('AsceticDrainageAmout="' + FloatToStr(seAscitesDrainage.Value) + '"');
  lbMergeDataMergeFields.Items.Add('LeftDrainageAmount="' + FloatToStr(seLeftOvarianCystAspiration.Value) + '"');
  lbMergeDataMergeFields.Items.Add('RightDrainageAmount="' + FloatToStr(seRightOvarianCystAspiration.Value) + '"');

  // ---------------Conclusion Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('UterusConclusion="' + GetUterusConclusion + '"');
  lbMergeDataMergeFields.Items.Add('EndometriumConc="' + GetEndometriumConc + '"');
  lbMergeDataMergeFields.Items.Add('PolpConc="' + GetPolpConc + '"');
    lbMergeDataMergeFields.Items.Add('CervicalPolypConc="' + GetCervicalPolypConc + '"');
  lbMergeDataMergeFields.Items.Add('OvaryConc="' + GetOvaryConc + '"');
  lbMergeDataMergeFields.Items.Add('AdnexalConc="' + GetAdnexalConc + '"');
  lbMergeDataMergeFields.Items.Add('ProcedureConc="' + GetProcedureConc + '"');
   if ((cbRightOvarianCyst.checked) and ((cbRightOvaryCystType1.enabled and cbRightOvaryCystType1.selection = 12) or
     (cbRightOvaryCystType2.enabled and cbRightOvaryCystType2.selection = 12) or
     (cbRightOvaryCystType3.enabled and cbRightOvaryCystType3.selection = 12))) or
     ((cbLeftOvaryCystType1.enabled and cbLeftOvaryCystType1.selection = 12) or
     (cbLeftOvaryCystType2.enabled and cbLeftOvaryCystType2.selection = 12) or
     (cbLeftOvaryCystType3.enabled and cbLeftOvaryCystType3.selection = 12))then
      lbMergeDataMergeFields.Items.Add('IOTAConc="' + GetIOTAConc + '"');
   else
     lbMergeDataMergeFields.Items.Add('IOTAConc=''');
end;

procedure ProduceMergeOrder;
var
  i: Integer;
  vValidDist: Boolean;
begin
  lbMergeDataMergeOrder.Items.Clear; 
  
   //insert Patient Demographics
  lbMergeDataMergeOrder.Items.Add('PatientDemographics');
  //lbMergeDataMergeOrder.Items.Add('<BR>');
  //lbMergeDataMergeOrder.Items.Add('<BR>');
  
  lbMergeDataMergeOrder.Items.Add('ReportHeading');
if (deLMPDate.Date > 10) or (cbPostMenopausal.checked) or (cbAmenorrhoea.checked) or(cbLMPUnknown.checked) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LMP');
    lbMergeDataMergeOrder.Items.Add('CycleDays');
  end
  else
  begin
    if spStartDay.Value > 0 then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('CycleDays');
    end;
  end;
  lbMergeDataMergeOrder.Items.Add('<BR>');
  if cbPerformedTransAbdom.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('TransAbdom');
  end;

  if cbHysterectomy.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Hysterectomy');
  end;
else
  begin
    if Trim(cbUterus.Text <> '') then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('ReportMain');
    end;
  end;
  if cbLUSCSscar.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LUSCSscar');
  end;

  if cbUterineShape.ItemIndex > 0 then
  begin
    if cbUterineShape.ItemIndex < 3 then
    begin
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('NormalUterusShape');
    end
    else if (cbUterineShape.ItemIndex < 5) then
    begin
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('SeptateUterus');
    end
    else if (cbUterineShape.ItemIndex = 6) then
    begin
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('DidelphysisUterus');
    end;
    else if  (cbUterineShape.ItemIndex = 7)  then
    begin
       lbMergeDataMergeOrder.Items.Add('leftUniCornuate');
    end
    else if (cbUterineShape.ItemIndex = 8)  then
    begin
      lbMergeDataMergeOrder.Items.Add('RightUniCornuate');
    end;
  end;

  if cbAdenomyosisPresent.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Adenomysis');
    if (spAPAnterior.Value > 0) or (spAPPosterior.Value > 0) then
      lbMergeDataMergeOrder.Items.Add('AdenomysisAPMeasure');
    if cbLossEMInterface.Checked then
      lbMergeDataMergeOrder.Items.Add('EMInterfaceLoss');
  end;

  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    if spFibroidCount.Value > 1 then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('FibroidsExists');
      for i := 1 to spFibroidCount.Value do
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('Fibroid' + IntToStr(i));
      end;

      if GetCavDistortionCount(vValidDist) = 0 then
      begin
        if (vValidDist) and (not (GetCavProjectionCount(vValidDist) > 0)) then
        begin
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('NoFibroidCavityDistortion');
        end;
      end
      else if GetCavDistortionCount(vValidDist) = 1 then
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('FibroidCavityDistortion');
      end
      else
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('MultipleCavityDistortion');
      end;
      if GetCavProjectionCount(vValidDist) > 0 then
      begin
        if GetCavDistortionCount(vValidDist) = 0 then
        begin
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('<BR>');
        end;
        lbMergeDataMergeOrder.Items.Add('CavityProjection');
      end;
    end
    else
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('SingleFibroid');
    end;
  end;

  // if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');

    //  if (cbRightOvaryIdentified.Checked) then
    begin
      lbMergeDataMergeOrder.Items.Add('RightOvary');
       if not((cbRightOvarianCyst.Checked)) then
           lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');  
       if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1) then
           lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');
      if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0) then
      begin
        if (seRightOvarianCystsCount.Value = 2) and (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
        end
        else
        if (seRightOvarianCystsCount.Value = 3) and ((cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType2.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3');
        end
        else
        if (seRightOvarianCystsCount.Value = 4) and ((cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType4.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3');
          lbMergeDataMergeOrder.Items.Add('MultiCysts4');
        end
        else
          lbMergeDataMergeOrder.Items.Add('RightOvaryCyst');
      end;
      if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value = 1) then
      lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');
    end;
      if not((cbRightOoporectomy.Checked) and (cbLeftOoporectomy.checked)) then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('LeftOvary');
      if not(cbLeftOvarianCyst.Checked) then
           lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
       if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1) then
           lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
      if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0) then
      begin
        if (seLeftOvarianCystsCount.Value = 2) and (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
        end
        else
        if (seLeftOvarianCystsCount.Value = 3) and ((cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType2.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3L');
        end
        else
        if (seLeftOvarianCystsCount.Value = 4) and ((cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType4.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3L');
          lbMergeDataMergeOrder.Items.Add('MultiCysts4L');
        end
        else
          lbMergeDataMergeOrder.Items.Add('LeftOvaryCyst');
      end;
      if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value = 1) then
        lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
    end;
  end;

  if (cbRightOvarianCyst.checked) and ((cbRightOvaryCystType1.enabled and cbRightOvaryCystType1.selection = 12) or
     (cbRightOvaryCystType2.enabled and cbRightOvaryCystType2.selection = 12) or
     (cbRightOvaryCystType3.enabled and cbRightOvaryCystType3.selection = 12)) then
  begin
     lbMergeDataMergeOrder.Items.Add('<BR>');
     lbMergeDataMergeOrder.Items.Add('IOTARightOvary');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;

  if (cbLeftOvaryCystType1.enabled and cbLeftOvaryCystType1.selection = 12) or
     (cbLeftOvaryCystType2.enabled and cbLeftOvaryCystType2.selection = 12) or
     (cbLeftOvaryCystType3.enabled and cbLeftOvaryCystType3.selection = 12) then
  begin
     lbMergeDataMergeOrder.Items.Add('<BR>');
     lbMergeDataMergeOrder.Items.Add('IOTALeftOvary');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;


  if ((cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0)) or ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)) then
  begin
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('YesAdnexal');
  end
  else
  begin
     if not((cbRightOvaryIdentified.Checked) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) and 
        not((cbLeftOvaryIdentified.Checked) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
     begin
      //  lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('NoAdnexalMasses');
     end
  end;

  if cbPerformedTransAbdom.Checked then
  begin
    //   lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('NoTendernessTrans');
  end;

  if cbEFFNormal.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('FreeFluidPresent');
  end
  else
  begin
    if ((cbRightOvaryIdentified.Checked) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) or
       ((cbLeftOvaryIdentified.Checked) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
    end;
    lbMergeDataMergeOrder.Items.Add('NoExcessFreeFluid');
  end;
  if (cbBladderNormal.Checked) or (cbBladderAbnormal.Checked) then
  begin
  //  lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Bladder');
  end;
 { if cbRightKidneyYes.Checked or cbLeftKidneyYes.Checked then
  begin
    //lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('KidneyAppearance');
  end;}
  if cbSalinePerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    if cbSalinehysterograph.ItemIndex = 1 then
      lbMergeDataMergeOrder.Items.Add('SalineProc1')
    else if cbSalinehysterograph.ItemIndex = 2 then
      lbMergeDataMergeOrder.Items.Add('SalineProc2')
    else if cbSalinehysterograph.ItemIndex = 3 then
      lbMergeDataMergeOrder.Items.Add('SalineProc4')
    else if cbSalinehysterograph.ItemIndex = 4 then
      lbMergeDataMergeOrder.Items.Add('SalineProc3')
  end;
  if cbTubalPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Agitated' + IntToStr(cbTubalPatencyTestSaline.ItemIndex));
  end;
  if cbTubalLevovistPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Levovist' + IntToStr(cbTubalPatencyTestLevovist.ItemIndex));
  end;
  if cbRightCystAspirationPerf.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('RightDrainage');
  end;
  if cbLeftCystAspirationPerf.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LeftDrainage');
  end;
  if cbAscitesPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Ascites');
  end;
  lbMergeDataMergeOrder.Items.Add('<BR>');
  lbMergeDataMergeOrder.Items.Add('<BR>');
  lbMergeDataMergeOrder.Items.Add('Conclusion');
end;
procedure cxccbClinicalHistoryChange(Sender);
begin
  edtOtherPastHistory.Enabled := (cxccbClinicalHistory.States[cxccbClinicalHistory.Properties.Items.Count-1] = 1);
end;

procedure cxcbGynaeSurgeryChange(Sender)
begin
  edtOtherPastSurgery.Enabled:= (cxcbGynaeSurgery.States[cxcbGynaeSurgery.Properties.Items.Count-1] = 1);
end;

procedure cxcbFamilyHistoryChange(Sender)
begin
  edtOtherFamilyHistory.Enabled:= (cxcbFamilyHistory.States[cxcbFamilyHistory.Properties.Items.Count-1] = 1);
end;

procedure cbMedicationChange(Sender)
begin
  edtOtherMedication.Enabled := (cbMedication.ItemIndex = (cbMedication.Properties.Items.Count - 1));
end;

procedure cbEndometriumChange(Sender)
begin
  case cbEndometrium.ItemIndex of
    2, 3:
      begin
        cbRightCorpusLuteum.Checked := False;
        cbLeftCorpusLuteum.Checked := False;
      end
      3:
      begin
      end;
  else
    begin
      cbRightLeadFollicle.Checked := False;
      cbLeftLeadFollicle.Checked := False;
      cbRightCorpusLuteum.Checked := False;
      cbLeftCorpusLuteum.Checked := False;
    end;
  end;
  if cbendometrium.itemindex = 8 then
  begin
     if seEdometriumThickness.value > 3.9 then
     begin
       showMessage('Error: Measurement incompatible with normal postmenopausal endometrium < 4.0 mm.  ');
     end
  end;
end;

procedure seRightOvarianCystsCountOnChange(Sender)
begin
  gbRightOvarianCyst1.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0);
  gbRightOvarianCyst2.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1);
  gbRightOvarianCyst3.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 2);
  gbRightOvarianCyst4.Visible := (cbRightOvarianCyst.Enabled) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 3);
end;

procedure sePolypCountOnChange(Sender)
begin
  edtpolypLength1.Enabled := (sePolypCount.Enabled)  and (sePolypCount.Value > 0);
  edtpolypWidth1.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 0);
  edtpolypDepth1.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 0);
  edtpolypLength2.Enabled := (sePolypCount.Enabled)  and (sePolypCount.Value > 1);
  edtpolypWidth2.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 1);
  edtpolypDepth2.Enabled := (sePolypCount.Enabled) and (sePolypCount.Value > 1);
end;

procedure cbCervicalPolypOnClick(Sender)
begin
  edtCervicalpolypLength1.Enabled := cbCervicalPolyp.Checked;
  edtCervicalpolypWidth1.Enabled := cbCervicalPolyp.Checked;
  edtCervicalpolypDepth1.Enabled := cbCervicalPolyp.Checked;
end;

procedure seLeftOvarianCystsCountOnChange(Sender)
begin
  gbLeftOvarianCyst1.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0);
  gbLeftOvarianCyst2.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1);
  gbLeftOvarianCyst3.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 2);
  gbLeftOvarianCyst4.Visible := (cbLeftOvarianCyst.Enabled) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 3);
end;

procedure seRightResidualFolCountOnChange(Sender)
begin
  if seRightResidualFolCount.Value = 0 then
  begin
    seRightFollicle1Size.Enabled := False;
    seRightFolSize.Enabled := False;
  end
  else if seRightResidualFolCount.Value = 1 then
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := False;
  end;
  else
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := true;
  end;
end;

procedure seLeftResidualFolCountOnChange(Sender)
begin
  if seLeftResidualFolCount.Value = 0 then
  begin
    seLeftFollicle1Size.Enabled := False;
    seLeftFolSize.Enabled := False;
  end
  else if seLeftResidualFolCount.Value = 1 then
  begin
    seLeftFollicle1Size.Enabled := True;
    seLeftFolSize.Enabled := False;
  end;
  else
  begin
    seLeftFollicle1Size.Enabled := True;
    seLeftFolSize.Enabled := true;
  end;
end;

procedure seRightFolCountOnChange(Sender)
begin
  cbRightPCO.Checked := False;
  cbRightAFO.Checked := False;
  cbRightOFO.Checked := False;
  // cbRightPCO.Enabled := seRightFolCount.Value < 12;
  if seRightFolCount.Value = 0 then
  begin
    seRightFollicle1Size.Enabled := False;
    seRightFolSize.Enabled := False;
  end
  else if seRightFolCount.Value = 1 then
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := False;
    cbRightOFO.Checked  := ((seRightFolCount.Value > 0) and (seRightFolCount.Value < 4) and (cbRightOvaryIdentified.checked));
  end
  else
  begin
    seRightFollicle1Size.Enabled := True;
    seRightFolSize.Enabled := True;
    cbRightPCO.Checked := seRightFolCount.Value > 24;
    cbRightAFO.Checked := ((seRightFolCount.Value > 3) and (seRightFolCount.Value < 25) and (cbRightOvaryIdentified.checked));
    cbRightOFO.Checked  := (seRightFolCount.Value > 0) and (seRightFolCount.Value < 4)and (cbRightOvaryIdentified.checked);
  end;
end;

procedure seLeftFolCountOnChange(Sender)
begin
 // cbLeftPCO.Enabled := seLeftFolCount.Value < 12;
  cbLeftPCO.Checked := False;
  cbLeftAFO.Checked := False;
  cbLeftOFO.Checked := False;
  if seleftFolCount.Value = 0 then
  begin
    seleftFollicle1Size.Enabled := False;
    seleftFolSize.Enabled := False;
  end
  else if seleftFolCount.Value = 1 then
  begin
    seleftFollicle1Size.Enabled := True;
    seleftFolSize.Enabled := False;
    cbLeftOFO.Checked := (seLeftFolCount.Value > 0) and (seLeftFolCount.Value < 4) and (cbLeftOvaryIdentified.checked);
  end
  else
  begin
    cbLeftPCO.Checked := seLeftFolCount.Value > 24;
    cbLeftAFO.Checked := (seLeftFolCount.Value > 3) and (seLeftFolCount.Value < 25) and (cbLeftOvaryIdentified.checked);
    cbLeftOFO.Checked := (seLeftFolCount.Value > 0) and (seLeftFolCount.Value < 4) and (cbLeftOvaryIdentified.checked);
    seleftFollicle1Size.Enabled := True;
    seleftFolSize.Enabled := True;
  end;
end;

procedure seRightAdnexalMassesOnChange(Sender)
begin
  gbRightCyst1.Visible := (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0);
  gbRightCyst2.Visible := (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 1);
  gbRightCyst3.Visible := (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 2);
end;

procedure seLeftAdnexalMassesOnChange(Sender)
begin
  gbLeftCyst1.Visible := (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0);
  gbLeftCyst2.Visible := (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 1);
  gbLeftCyst3.Visible := (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 2);
end;

procedure seRightCorpusLuteumOnChange(Sender)
begin
   if ((seRightCorpusLuteum.Enabled) and (seRightCorpusLuteum.Value > 0)) then
       cbRightCorpusLuteum.checked := True
   else
       cbRightCorpusLuteum.checked := False;
end;

procedure seRightLeadFollicleOnChange(Sender)
begin
   if ((seRightLeadFollicle.Enabled) and (seRightLeadFollicle.Value > 0)) then
       cbRightLeadFollicle.checked := True
   else
       cbRightLeadFollicle.checked := False;
end;

procedure seLeftLeadFollicleOnChange(Sender)
begin
   if (seLeftLeadFollicle.Enabled and seLeftLeadFollicle.Value > 0) then
       cbLeftLeadFollicle.checked := True
   else
       cbLeftLeadFollicle.checked := False;
end;

procedure seLeftCorpusLuteumOnChange(Sender)
begin
   if ((seLeftCorpusLuteum.Enabled) and (seLeftCorpusLuteum.Value > 0)) then
       cbLeftCorpusLuteum.checked := True
   else
       cbLeftCorpusLuteum.checked := False;
end;

Procedure cbROPPYesOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblNumber.Enabled := cbROPPYes.checked;
   seROPPNumber.Enabled := cbROPPYes.checked;
   lblPPLargest.Enabled := cbROPPYes.checked;
   seROPPL.Enabled := cbROPPYes.checked;
   seROPPW.Enabled := cbROPPYes.checked;
   seROPPD.Enabled := cbROPPYes.checked;
end;

Procedure cbROPPNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblNumber.Enabled := cbROPPYes.checked;
   seROPPNumber.Enabled := cbROPPYes.checked;
   lblPPLargest.Enabled := cbROPPYes.checked;
   seROPPL.Enabled := cbROPPYes.checked;
   seROPPW.Enabled := cbROPPYes.checked;
   seROPPD.Enabled := cbROPPYes.checked;
   lblPPMeasure.Enabled := cbROPPYes.checked;
end;

Procedure ccbROInternalContentsChange(sender)
begin
    ccbROMixed.Enabled := (ccbROInternalContents.ItemIndex = 4);
end;

procedure cbROSolidElementsNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblSolidNumber.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidElementsNumber.Enabled :=  cbROSolidElementsYes.Checked;
   lblSolidLargest.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidEleL.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidEleW.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSolidEleD.Enabled :=  cbROSolidElementsYes.Checked;
   seRoSoliEleVol.Enabled :=  cbROSolidElementsYes.Checked;
   lblSolidMeasure.Enabled :=  cbROSolidElementsYes.Checked;
   lblSolidVolMeasure.Enabled :=  cbROSolidElementsYes.Checked;
end;

procedure cbROVSYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblROPPColour.Enabled   :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   ccbROPPDoppler.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   lblROPPRI.Enabled  :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   seROPPRI.Enabled  :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   lblROPPPSV.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   seROPPPSV.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
   lblPPPSVMeasure.Enabled :=  (cbROVSYes.enabled) and (cbROVSYes.checked );
end;

procedure cbROSeptumYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblROSepColour.Enabled   :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   ccbROSepDoppler.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   lblROSepRI.Enabled  :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   seROSepRI.Enabled  :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   lblROSepPSV.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   seROSepPSV.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
   lblSepPSVMeasure.Enabled :=  (cbROSeptumYes.enabled) and (cbROSeptumYes.checked );
end;

procedure cbROSolidYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblROSolidColour.Enabled   :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   ccbROSolidDoppler.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   lblROSolidRI.Enabled  :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   seROSolidRI.Enabled  :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   lblROSolidPSV.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   seROSolidPSV.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
   lblSolidPSVMeasure.Enabled :=  (cbROSolidYes.enabled) and (cbROSolidYes.checked );
end;

procedure cbLOVSYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOPPColour.Enabled   :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   ccbLOPPDoppler.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   lblLOPPRI.Enabled  :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   seLOPPRI.Enabled  :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   lblLOPPPSV.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   seLOPPPSV.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
   lblLoPPPSVMeasure.Enabled :=  (cbLOVSYes.enabled) and (cbLOVSYes.checked );
end;

procedure cbLOSeptumYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOSepColour.Enabled   :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   ccbLOSepDoppler.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   lblLOSepRI.Enabled  :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   seLOSepRI.Enabled  :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   lblLOSepPSV.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   seLOSepPSV.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
   lblLOSepPSVMeasure.Enabled :=  (cbLOSeptumYes.enabled) and (cbLOSeptumYes.checked );
end;

procedure cbLOSolidYesOnClick(sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOSolidColour.Enabled   :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   ccbLOSolidDoppler.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   lblLOSolidRI.Enabled  :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   seLOSolidRI.Enabled  :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   lblLOSolidPSV.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   seLOSolidPSV.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
   lblLOSolidPSVMeasure.Enabled :=  (cbLOSolidYes.enabled) and (cbLOSolidYes.checked );
end;

Procedure cbLOPPYesOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLONumber.Enabled := cbLOPPYes.checked;
   seLOPPNumber.Enabled := cbLOPPYes.checked;
   lblLOPPLargest.Enabled := cbLOPPYes.checked;
   seLOPPL.Enabled := cbLOPPYes.checked;
   seLOPPW.Enabled := cbLOPPYes.checked;
   seLOPPD.Enabled := cbLOPPYes.checked;
end;

Procedure cbLOPPNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLONumber.Enabled := cbLOPPYes.checked;
   seLOPPNumber.Enabled := cbLOPPYes.checked;
   lblLOPPLargest.Enabled := cbLOPPYes.checked;
   seLOPPL.Enabled := cbLOPPYes.checked;
   seLOPPW.Enabled := cbLOPPYes.checked;
   seLOPPD.Enabled := cbLOPPYes.checked;
   lblLOPPMeasure.Enabled := cbLOPPYes.checked;
end;

Procedure ccbLOInternalContentsChange(sender)
begin
    ccbLOMixed.Enabled := (ccbLOInternalContents.ItemIndex = 4);
end;

procedure cbLOSolidElementsNoOnClick(Sender)
begin
   cbToggleCheckOnClick(Sender);
   lblLOSolidNumber.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidElementsNumber.Enabled :=  cbLOSolidElementsYes.Checked;
   lblLOSolidLargest.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidEleL.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidEleW.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSolidEleD.Enabled :=  cbLOSolidElementsYes.Checked;
   seRoSoliEleVol.Enabled :=  cbLOSolidElementsYes.Checked;
   lblLOSolidMeasure.Enabled :=  cbLOSolidElementsYes.Checked;
   lblLOSolidVolMeasure.Enabled :=  cbLOSolidElementsYes.Checked;
end;

procedure cbUterineShapeOnChange(Sender)
begin
  spSeptumlength.Enabled := {(cbUterineShape.ItemIndex = 1) or (cbUterineShape.ItemIndex = 2) or }(cbUterineShape.ItemIndex = 3);
 { lblRightCervix.Visible := cbUterineShape.ItemIndex > 5;
  lblLeftCervix.Visible := cbUterineShape.ItemIndex > 5;
  spRightCerivalLength.Enabled := cbUterineShape.ItemIndex > 5; }

  {lblRCervixMM.Enabled := cbUterineShape.ItemIndex > 2;
  lblLeftUterine.Visible := cbUterineShape.ItemIndex > 2;
  lblRightUterine.Visible := cbUterineShape.ItemIndex > 2;
  seRightUterineCavityLength.Enabled := cbUterineShape.ItemIndex > 2;
  lblRUterineCavityMM.Enabled := cbUterineShape.ItemIndex > 2;   }
end;

procedure cbVBShadowingNotPresentOnClick(sender);
begin
  if cbVBShadowingNotPresent.Checked then
    cbVBShadowingPresent.Checked := False;
end;

procedure cbVBShadowingPresentOnClick(sender);
begin
  if cbVBShadowingPresent.Checked then
    cbVBShadowingNotPresent.Checked := False;
end;

procedure cbOvaryCystTypeOnChange(sender);
begin
  if  sender.selection = 2 then
  begin
    showMessage('Please choose the type of haemorrhagic cyst.');
    sender.selection := 0;
  end;
end;

procedure cbROSmoothYesOnClick(sender);
begin
   cbToggleCheckOnClick(sender);
      cbROMIYes.Enabled := not(cbROSmoothYes.checked);
      cbROMINo.Enabled := not(cbROSmoothYes.checked);
      cbROPPYes.Enabled := not(cbROSmoothYes.checked);
      cbROPPNo.Enabled := not(cbROSmoothYes.checked);
    if (cbROSmoothYes.checked) then//and ((ccbROClassification.ItemIndex = 0) or (ccbROClassification.ItemIndex = 2) )then
    begin
       lblROVascularPP.Enabled := False;
       cbROVSYes.Enabled := False;
       cbROVSNo.Enabled := False;
    end
    else
    begin
       lblROVascularPP.Enabled := True;
       cbROVSYes.Enabled := True;
       cbROVSNo.Enabled := True;
    end;
end;

procedure cbLOSmoothYesOnClick(sender);
begin
   cbToggleCheckOnClick(sender);
      cbLOMIYes.Enabled := not(cbLOSmoothYes.checked);
      cbLOMINo.Enabled := not(cbLOSmoothYes.checked);
      cbLOPPYes.Enabled := not(cbLOSmoothYes.checked);
      cbLOPPNo.Enabled := not(cbLOSmoothYes.checked);
    if (cbLOSmoothYes.checked) then//and ((ccbLOClassification.ItemIndex = 0) or (ccbLOClassification.ItemIndex = 2) )then
    begin
       lblLOVascularPP.Enabled := False;
       cbLOVSYes.Enabled := False;
       cbLOVSNo.Enabled := False;
    end
    else
    begin
       lblLOVascularPP.Enabled := True;
       cbLOVSYes.Enabled := True;
       cbLOVSNo.Enabled := True;
    end;
end;

procedure cbIncVasNotPresentOnClick(Sender)
begin
  if cbIncVasNotPresent.Checked then
    cbIncVasPresent.Checked := False;
end;

procedure cbIncVasPresentOnClick(Sender)
begin
  if cbIncVasPresent.Checked then
    cbIncVasNotPresent.Checked := False;
end;

procedure cbMyometrialCystsNotPresentOnClick(Sender)
begin
  if cbMyometrialCystsNotPresent.Checked then
    cbMyometrialCystsPresent.Checked := False;
end;

procedure cbMyometrialCystsPresentOnClick(Sender)
begin
  if cbMyometrialCystsPresent.Checked then
    cbMyometrialCystsNotPresent.Checked := False;
end;

procedure cbAdenomyosisPresentOnClick(sender)
begin
  if cbAdenomyosisPresent.Checked then
  begin
    cbAdenomyosisNotPresent.Checked := False;
  end;
  ActiveAdenomyosisControls;
end;

procedure cbAdenomyosisNotPresentOnClick(sender)
begin
  if cbAdenomyosisNotPresent.Checked then
  begin
    cbAdenomyosisPresent.Checked := False;
  end;
  ActiveAdenomyosisControls;
end;

procedure cbProceduresPerformedOnClick(sender)
begin
  cbSalinehysterograph.Enabled := cbSalinePerformed.Checked;
  cbTubalPatencyTestSaline.Enabled := cbTubalPerformed.Checked;
  cbTubalPatencyTestLevovist.Enabled := cbTubalLevovistPerformed.Checked;
  seLeftOvarianCystAspiration.Enabled := cbLeftCystAspirationPerf.Checked;
  seRightOvarianCystAspiration.Enabled := cbRightCystAspirationPerf.Checked;
  seAscitesDrainage.Enabled := cbAscitesPerformed.Checked;
end;

procedure cbHysterectomyOnClick(sender)
begin
  cbUterus.Enabled := not cbHysterectomy.Checked;
  cbUterineShape.Enabled := not cbHysterectomy.Checked;
  seUterusLength.Enabled := not cbHysterectomy.Checked;
  seUterusWidth.Enabled := not cbHysterectomy.Checked;
  seUterusHeight.Enabled := not cbHysterectomy.Checked;
  seUterusCC.Enabled := not cbHysterectomy.Checked;
  cbCervixPresentYes.Enabled := cbHysterectomy.Checked;
  cbCervixPresentNo.Enabled := cbHysterectomy.Checked;
  cbVaultNormalYes.Enabled := cbHysterectomy.Checked;
  cbVaultNormalNo.Enabled := cbHysterectomy.Checked;
  if cbHysterectomy.Checked then
  begin
    cbCervixPresentYes.Style.BorderColor := clRed;
    cbCervixPresentYes.Style.BorderStyle := 2;
    cbCervixPresentNo.Style.BorderColor := clRed;
    cbCervixPresentNo.Style.BorderStyle := 2;
    cbVaultNormalYes.Style.BorderColor := clRed;
    cbVaultNormalYes.Style.BorderStyle := 2;
    cbVaultNormalNo.Style.BorderColor := clRed;
    cbVaultNormalNo.Style.BorderStyle := 2;
    seEdometriumThickness.Style.BorderColor := clwindowFrame;
    seEdometriumThickness.Style.BorderStyle := 5;
    seCervicalLength.Style.BorderColor := clwindowFrame;
    seCervicalLength.Style.BorderStyle := 5;
    seUterineCavityLength.Style.BorderColor := clwindowFrame;
    seUterineCavityLength.Style.BorderStyle := 5;
  end
  else
   begin
    cbCervixPresentYes.Style.BorderColor := clwindowFrame;
    cbCervixPresentYes.Style.BorderStyle := 5;
    cbCervixPresentNo.Style.BorderColor := clwindowFrame;
    cbCervixPresentNo.Style.BorderStyle := 5;
    cbVaultNormalYes.Style.BorderColor := clwindowFrame;
    cbVaultNormalYes.Style.BorderStyle := 5;
    cbVaultNormalNo.Style.BorderColor := clwindowFrame;
    cbVaultNormalNo.Style.BorderStyle := 5;
    seEdometriumThickness.Style.BorderColor := clRed;
    seEdometriumThickness.Style.BorderStyle := 2;
    seCervicalLength.Style.BorderColor := clRed;
    seCervicalLength.Style.BorderStyle := 2;
    seUterineCavityLength.Style.BorderColor := clRed;
    seUterineCavityLength.Style.BorderStyle := 2;
  end;
end;

procedure cbCervixPresentYesOnClick(sender)
begin
  if cbCervixPresentYes.Checked then
  begin
    cbCervixPresentNo.Checked := False;
    cbCervixPresentYes.Style.BorderColor := clwindowFrame;
    cbCervixPresentYes.Style.BorderStyle := 5;
    cbCervixPresentNo.Style.BorderColor := clwindowFrame;
    cbCervixPresentNo.Style.BorderStyle := 5;
  end;
  else if not(cbCervixPresentYes.Checked or cbCervixPresentNo.Checked) then
  begin
    cbCervixPresentYes.Style.BorderColor := clRed;
    cbCervixPresentYes.Style.BorderStyle := 2;
    cbCervixPresentNo.Style.BorderColor := clRed;
    cbCervixPresentNo.Style.BorderStyle := 2;
  end;
end;

procedure cbCervixPresentNoOnClick(sender)
begin
  if cbCervixPresentNo.Checked then
  begin
    cbCervixPresentYes.Checked := False;
    cbCervixPresentYes.Style.BorderColor := clwindowFrame;
    cbCervixPresentYes.Style.BorderStyle := 5;
    cbCervixPresentNo.Style.BorderColor := clwindowFrame;
    cbCervixPresentNo.Style.BorderStyle := 5;
  end;
  else if not(cbCervixPresentYes.Checked or cbCervixPresentNo.Checked) then
  begin
    cbCervixPresentYes.Style.BorderColor := clRed;
    cbCervixPresentYes.Style.BorderStyle := 2;
    cbCervixPresentNo.Style.BorderColor := clRed;
    cbCervixPresentNo.Style.BorderStyle := 2;
  end;
end;

procedure cbVaultNormalYesOnClick(sender)
begin
  if cbVaultNormalYes.Checked then
  begin
    cbVaultNormalNo.Checked := False;
    cbVaultNormalYes.Style.BorderColor := clwindowFrame;
    cbVaultNormalYes.Style.BorderStyle := 5;
    cbVaultNormalNo.Style.BorderColor := clwindowFrame;
    cbVaultNormalNo.Style.BorderStyle := 5;
  end
  else if not(cbVaultNormalYes.Checked or cbVaultNormalNo.Checked) then
  begin
     cbVaultNormalYes.Style.BorderColor := clRed;
    cbVaultNormalYes.Style.BorderStyle := 2;
    cbVaultNormalNo.Style.BorderColor := clRed;
    cbVaultNormalNo.Style.BorderStyle := 2;
  end;
end;

procedure cbVaultNormalNoOnClick(sender)
begin
  if cbVaultNormalNo.Checked then
  begin
    cbVaultNormalYes.Checked := False;
    cbVaultNormalYes.Style.BorderColor := clwindowFrame;
    cbVaultNormalYes.Style.BorderStyle := 5;
    cbVaultNormalNo.Style.BorderColor := clwindowFrame;
    cbVaultNormalNo.Style.BorderStyle := 5;
  end
  else if not(cbVaultNormalYes.Checked or cbVaultNormalNo.Checked) then
  begin
     cbVaultNormalYes.Style.BorderColor := clRed;
    cbVaultNormalYes.Style.BorderStyle := 2;
    cbVaultNormalNo.Style.BorderColor := clRed;
    cbVaultNormalNo.Style.BorderStyle := 2;
  end;
end;

Procedure seEdometriumThicknessOnChange(sender)
begin
    if seEdometriumThickness.value > 0 then
    begin
       if  ((seEdometriumThickness.value > 3.9) and (cbEndometrium.itemindex = 8)) then
       begin
          ShowMessage('Error: Measurement incompatible with normal postmenopausal endometrium < 4.0 mm.  ');
       end;
    end;
end;

Procedure cbPostMenopausalOnClick(Sender)
begin
    cbHRTYes.Enabled := cbPostMenopausal.checked;
    cbHRTNo.Enabled := cbPostMenopausal.checked;
    lblHRT.Enabled := cbPostMenopausal.checked;
    seRightResidualFolCount.visible := cbPostMenopausal.checked;
    lblResidualFollicleCount.visible := cbPostMenopausal.checked;
    seLeftResidualFolCount.visible := cbPostMenopausal.checked;
    lblLeftResidualFollicleCount.visible := cbPostMenopausal.checked;
    seRightFolCount.visible := not(cbPostMenopausal.checked);
    lblRightFollicleRange.visible := not(cbPostMenopausal.checked);
    seLeftFolCount.visible := not(cbPostMenopausal.checked);
    lblLeftFollicleRange.visible := not(cbPostMenopausal.checked);
    if (not(seRightFolCount.visible)) then
       seRightFolCount.value := 0
    if (not(seleftFolCount.visible)) then
       seleftFolCount.value := 0
end;

procedure deLMPDateOnChange(sender)
begin
  try
    spStartDay.Value := Max(1, (trunc(Now - deLMPDate.Date) + 1));
  except
    spStartDay.Value := 1;
  end;
end;

procedure tcbMedicationChange(Sender)
begin
  if (tcbMedication.selection = 22) then
    edtOtherMedication.Enabled :=true;
  else
    edtOtherMedication.Enabled :=False;
end;
procedure cbIrregularCycleClick(Sender)
begin
  cbToggleCheckOnClick(Sender);
  seCycleMinDays.Enabled := not cbIrregularCycle.Checked;
  seCycleMaxDays.Enabled := not cbIrregularCycle.Checked;
  if cbIrregularCycle.Checked then
  begin
    lblCycleDays.Caption := 'irregular cycle';
  end
  else
  begin
    lblCycleDays.Caption := 'day cycle';
  end;
end;

procedure cbRightLeadFollicleClick(Sender)
begin
  seRightLeadFollicleSize.Enabled := cbRightLeadFollicle.Checked;
  seRightLeadFollicleSize2.Enabled := cbRightLeadFollicle.Checked;
  seRightLeadFollicleSize3.Enabled := cbRightLeadFollicle.Checked;
  lblLeadFollicleRight.Enabled := cbRightLeadFollicle.Checked;
  if cbRightLeadFollicle.Checked then
  begin

  end;
end;

procedure cbLeftLeadFollicleClick(Sender)
begin
  seLeftLeadFollicleSize.Enabled := cbLeftLeadFollicle.Checked;
  seLeftLeadFollicleSize2.Enabled := cbLeftLeadFollicle.Checked;
  seLeftLeadFollicleSize3.Enabled := cbLeftLeadFollicle.Checked;
  lblLeadFollicleLeft.Enabled := cbLeftLeadFollicle.Checked;
  if cbLeftLeadFollicle.Checked then
  begin

  end;
end;

procedure cbRightCorpusLuteumClick(Sender)
begin
  cbRightCorpusLuteumSize.Enabled := cbRightCorpusLuteum.Checked;
  cbRightCorpusLuteumSize2.Enabled := cbRightCorpusLuteum.Checked;
  cbRightCorpusLuteumSize3.Enabled := cbRightCorpusLuteum.Checked;
  lblCLRight.Enabled := cbRightCorpusLuteum.Checked;
end;

procedure cbLeftCorpusLuteumClick(Sender)
begin
  cbLeftCorpusLuteumSize.Enabled := cbLeftCorpusLuteum.Checked;
  cbLeftCorpusLuteumSize2.Enabled := cbLeftCorpusLuteum.Checked;
  cbLeftCorpusLuteumSize3.Enabled := cbLeftCorpusLuteum.Checked;
  lblCLLeft.Enabled := cbLeftCorpusLuteum.Checked;
end;

procedure cbEndometrialPolypClick(Sender)
begin
  sePolypCount.Enabled :=  cbEndometrialPolyp.checked;
 { edtpolypLength1.Enabled := cbEndometrialPolyp.Checked;
  edtpolypWidth1.Enabled := cbEndometrialPolyp.Checked;
  edtpolypDepth1.Enabled := cbEndometrialPolyp.Checked;}
end;

procedure cbRightOvaryIdentifiedClick(Sender)
begin
  if not (cbRightOvaryIdentified.Checked) then
  begin
    seRightOvaryLength.Enabled := False;
    seRightOvaryWidth.Enabled := False;
    seRightOvaryHeight.Enabled := False;
    cbRightOoporectomy.Enabled := True;
    cbRightOvaryVisualisedTA.Enabled := False;
    cbRightOvaryVisualisedTV.Enabled := False;
    cbRightOvaryNormal.Enabled := False;
    seRightOvaryCC.Enabled := False;
    seRightFolCount.Enabled := False;
    seRightResidualFolCount.Enabled := False;
    cbRightLeadFollicle.Enabled := False;
    seRightLeadFollicle.Enabled := False;
    cbRightCorpusLuteum.Enabled := False;
    seRightCorpusLuteum.Enabled := False;
    seRightLeadFollicleSize.Enabled := False;
    seRightLeadFollicleSize3.Enabled := False;
    seRightLeadFollicleSize2.Enabled := False;
    cbRightCorpusLuteumSize.Enabled := False;
    cbRightMobile.Enabled := False;
    cbRightLimitedMobility.Enabled := False;
     if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
    cbRightPCO.Enabled := False;
    cbRightTender.Enabled := False;
    cbRightNonTender.Enabled := False;
    lblRightFollicleRange.Enabled := False;
    cbRightOvarianCyst.Enabled := False;
    seRightOvarianCystsCount.Enabled := False;
  end
  else
  begin
    seRightOvaryLength.Enabled := true;
    cbRightOvaryVisualisedTA.Enabled := True;
    cbRightOvaryVisualisedTV.Enabled := True;
    cbRightOoporectomy.Enabled := False;
     if cbRightOoporectomy.checked then
       cbRightOoporectomy.checked := not(cbRightOvaryIdentified.Checked)
    cbRightOvaryNormal.Enabled := True;
    seRightOvaryWidth.Enabled := true;
    seRightOvaryHeight.Enabled := true;
    seRightOvaryCC.Enabled := true;
    seRightFolCount.Enabled := true;
    seRightResidualFolCount.Enabled := true;
    cbRightLeadFollicle.Enabled := true;
    seRightLeadFollicle.Enabled := true;
    cbRightCorpusLuteum.Enabled := true;
    seRightCorpusLuteum.Enabled := true;
    seRightLeadFollicleSize.Enabled := cbRightLeadFollicle.Checked;
    seRightLeadFollicleSize2.Enabled := cbRightLeadFollicle.Checked;
    seRightLeadFollicleSize3.Enabled := cbRightLeadFollicle.Checked;
    cbRightCorpusLuteumSize.Enabled := cbRightCorpusLuteum.Checked;
    cbRightMobile.Enabled := True;
    cbRightLimitedMobility.Enabled := True;
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := True;
      cbRightVaginalAccessNo.Enabled := True;
      cbRightVaginalNA.Enabled := True;
      gbRightVaginalAccess.Enabled := True;
    end;
    //  cbRightPCO.Enabled := True;
    cbRightTender.Enabled := True;
    cbRightNonTender.Enabled := True;
    lblRightFollicleRange.Enabled := True;
    cbRightOvarianCyst.Enabled := True;
    seRightOvarianCystsCount.Enabled := cbRightOvarianCyst.Checked;
  end;
  seRightFolCountOnChange(nil);
  seRightOvarianCystsCountOnChange(nil);
end;

procedure cbLeftOvaryIdentifiedClick(Sender)
begin
  if (not cbLeftOvaryIdentified.Checked) then
  begin
    seLeftOvaryLength.Enabled := False;
    cbLeftOvaryVisualisedTA.Enabled := False;
    cbLeftOvaryVisualisedTV.Enabled := False;
    cbLeftOoporectomy.Enabled := True;
    cbLeftOvaryNormal.Enabled := False;
    seLeftOvaryWidth.Enabled := False;
    seLeftOvaryHeight.Enabled := False;
    seLeftOvaryCC.Enabled := False;
    seLeftResidualFolCount.Enabled := False;
    seLeftFolCount.Enabled := False;
    cbLeftLeadFollicle.Enabled := False;
    seLeftLeadFollicle.Enabled := False;
    cbLeftCorpusLuteum.Enabled := False;
    seLeftCorpusLuteum.Enabled := False;
    seLeftLeadFollicleSize.Enabled := False;
    seLeftLeadFollicleSize2.Enabled := False;
    seLeftLeadFollicleSize3.Enabled := False;
    cbLeftCorpusLuteumSize.Enabled := False;
    cbLeftCorpusLuteumSize2.Enabled := False;
    cbLeftMobile.Enabled := False;
    cbLeftLimitedMobility.Enabled := False;
     if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end
    cbLeftPCO.Enabled := False;
    cbLeftTender.Enabled := False;
    cbLeftNonTender.Enabled := False;
    lblLeftFollicleRange.Enabled := False;
    cbLeftOvarianCyst.Enabled := False;
    seRightOvarianCystsCount.Enabled := cbRightOvarianCyst.Checked;
  end
  else
  begin
    seLeftOvaryLength.Enabled := true;
    seLeftOvaryWidth.Enabled := true;
    seLeftOvaryHeight.Enabled := true;
    cbLeftOvaryVisualisedTA.Enabled := True;
    cbLeftOoporectomy.Enabled := False;
     if cbLeftOoporectomy.checked then
       cbLeftOoporectomy.checked := not(cbLeftOvaryIdentified.Checked)
    cbLeftOvaryNormal.Enabled := True;
    cbLeftOvaryVisualisedTV.Enabled := True;
    seLeftOvaryCC.Enabled := true;
    seLeftResidualFolCount.Enabled := True;
    seLeftFolCount.Enabled := true;
    cbLeftLeadFollicle.Enabled := true;
    seLeftLeadFollicle.Enabled := true;
    cbLeftCorpusLuteum.Enabled := true;
    seLeftCorpusLuteum.Enabled := true;
    seLeftLeadFollicleSize.Enabled := cbLeftLeadFollicle.Checked;
    seLeftLeadFollicleSize2.Enabled := cbLeftLeadFollicle.Checked;
    seLeftLeadFollicleSize3.Enabled := cbLeftLeadFollicle.Checked;
    cbLeftCorpusLuteumSize.Enabled := cbLeftCorpusLuteum.Checked;
    cbLeftCorpusLuteumSize2.Enabled := cbLeftCorpusLuteum.Checked;
    cbLeftMobile.Enabled := True;
    cbLeftLimitedMobility.Enabled := True;
     if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := True;
      cbLeftVaginalNA.Enabled := True;
      cbLeftVaginalAccessNo.Enabled := True;
      gbLeftVaginalAccess.Enabled := True;
    end;  
    //  cbLeftPCO.Enabled := True;
    cbLeftTender.Enabled := True;
    cbLeftNonTender.Enabled := True;
    lblLeftFollicleRange.Enabled := True;
    cbLeftOvarianCyst.Enabled := True;
    seLeftOvarianCystsCount.Enabled := cbLeftOvarianCyst.Checked;
  end;
  seLeftFolCountOnChange(nil);
  seLeftOvarianCystsCountOnChange(nil);
end;

procedure cbRetroFlexedClick(Sender)
begin
  if cbAntiFlexed.Checked and cbRetroFlexed.Checked then
  begin
    cbAntiFlexed.Checked := False;
  end;
end;

procedure cbAntiFlexedClick(Sender)
begin
  if cbAntiFlexed.Checked and cbRetroFlexed.Checked then
  begin
    cbRetroFlexed.Checked := False;
  end;
end;

procedure cbRightLimitedMobilityClick(Sender)
begin
  if cbRightMobile.Checked and cbRightLimitedMobility.Checked then
  begin
    cbRightMobile.Checked := False;
  end;
end;

procedure cbLeftLimitedMobilityClick(Sender)
begin
  if cbLeftMobile.Checked and cbLeftLimitedMobility.Checked then
  begin
    cbLeftMobile.Checked := False;
  end;
end;

procedure cbRightMobileClick(Sender)
begin
  if cbRightMobile.Checked and cbRightLimitedMobility.Checked then
  begin
    cbRightLimitedMobility.Checked := False;
  end;
end;

procedure cbLeftMobileClick(Sender)
begin
  if cbLeftMobile.Checked and cbLeftLimitedMobility.Checked then
  begin
    cbLeftLimitedMobility.Checked := False;
  end;
end;

procedure cbRightTenderClick(Sender)
begin
  if cbRightTender.Checked and cbRightNonTender.Checked then
  begin
    cbRightNonTender.Checked := False;
  end;
end;

procedure cbRightNonTenderClick(Sender)
begin
  if cbRightTender.Checked and cbRightNonTender.Checked then
  begin
    cbRightTender.Checked := False;
  end;
end;

procedure cbLeftTenderClick(Sender)
begin
  if cbLeftTender.Checked and cbLeftNonTender.Checked then
  begin
    cbLeftNonTender.Checked := False;
  end;
end;

procedure cbLeftNonTenderClick(Sender)
begin
  if cbLeftTender.Checked and cbLeftNonTender.Checked then
  begin
    cbLeftTender.Checked := False;
  end;
end;

procedure cbUterusMobileClick(Sender)
begin
  if (cbUterusMobile.Checked) and (cbUterusLimitedMobile.Checked) then
  begin
    cbUterusLimitedMobile.Checked := False;
  end;
end;

procedure cbUterusLimitedMobileClick(Sender)
begin
  if (cbUterusMobile.Checked) and (cbUterusLimitedMobile.Checked) then
  begin
    cbUterusMobile.Checked := False;
  end;
end;

procedure cbUterusTenderClick(Sender)
begin
  if (cbUterusTender.Checked) and (cbUterusNonTender.Checked) then
  begin
    cbUterusNonTender.Checked := False;
  end;
end;

procedure cbUterusNonTenderClick(Sender)
begin
  if (cbUterusTender.Checked) and (cbUterusNonTender.Checked) then
  begin
    cbUterusTender.Checked := False;
  end;
end;

procedure cbRightOvarianCystClick(Sender)
begin
  seRightOvarianCystsCountOnChange(nil);
  seRightOvarianCystsCount.Enabled := cbRightOvarianCyst.Checked;

end;

procedure cbLeftOvarianCystClick(Sender)
begin
  seLeftOvarianCystsCountOnChange(nil);
  seLeftOvarianCystsCount.Enabled := cbLeftOvarianCyst.Checked;
end;

procedure cbBladderNormalClick(Sender)
begin
  if cbBladderNormal.Checked and cbBladderAbnormal.Checked then
  begin
    cbBladderAbnormal.Checked := False;
  end;
end;

procedure cbBladderAbnormalClick(Sender)
begin
  if cbBladderNormal.Checked and cbBladderAbnormal.Checked then
  begin
    cbBladderNormal.Checked := False;
  end;
end;

procedure cbEFFAbnormalClick(Sender)
begin
  if cbEFFAbnormal.Checked and cbEFFNormal.Checked then
  begin
    cbEFFNormal.Checked := False;
  end;
end;

procedure cbEFFNormalClick(Sender)
begin
  if cbEFFAbnormal.Checked and cbEFFNormal.Checked then
  begin
    cbEFFAbnormal.Checked := False;
  end;
  lblPODDEpth.Enabled := (cbEFFNormal.Checked);
  sePODDepth.Enabled := (cbEFFNormal.Checked);
end;

procedure cbRightKidneyNoClick(Sender)
begin
  if cbRightKidneyNo.Checked then
    cbRightKidneyYes.Checked := False;
  teRightKidney.enabled := False;
  cbRightReanalAbnormalYes.enabled := False;
  cbRightReanalAbnormalNo.enabled := False;
end;

procedure cbLeftKidneyNoClick(Sender)
begin
  if cbLeftKidneyNo.Checked then
    cbLeftKidneyYes.Checked := False;
  teLeftKidney.enabled := False;
  cbLeftReanalAbnormalYes.enabled := False;
  cbLeftReanalAbnormalNo.enabled := False;
end;

procedure cbRightKidneyYesClick(Sender)
begin
  if cbRightKidneyYes.Checked then
    cbRightKidneyNo.Checked := False;
  teRightKidney.enabled := cbRightKidneyYes.Checked;
  cbRightReanalAbnormalYes.enabled := cbRightKidneyYes.Checked;
  cbRightReanalAbnormalNo.enabled := cbRightKidneyYes.Checked;
end;

procedure cbLeftKidneyYesClick(Sender)
begin
  if cbLeftKidneyYes.Checked then
    cbLeftKidneyNo.Checked := False;
  teLeftKidney.enabled := cbLeftKidneyYes.Checked;
  cbLeftReanalAbnormalYes.enabled := cbLeftKidneyYes.Checked;
  cbLeftReanalAbnormalNo.enabled := cbLeftKidneyYes.Checked;
end;

procedure cbRightAdnexalMassClick(Sender)
begin
  seRightAdnexalMasses.Enabled := cbRightAdnexalMass.Checked;
  seRightAdnexalMassesOnChange(nil);
end;

procedure cbLeftAdnexalMassClick(Sender)
begin
  seLeftAdnexalMasses.Enabled := cbLeftAdnexalMass.Checked;
  seLeftAdnexalMassesOnChange(nil);
end;

procedure cbCorrectPlacementIUCDonClick(Sender)
begin
  if cbCorrectPlacementIUCD.Checked and cbInCorrectPlacementIUCD.Checked then //cbCorrectPlacementIUS.Checked then
    cbInCorrectPlacementIUCD.Checked := False;
end;

procedure cbInCorrectPlacementIUCDonClick(Sender)
begin
  if cbCorrectPlacementIUCD.Checked and cbInCorrectPlacementIUCD.Checked then //cbCorrectPlacementIUS.Checked then
    cbCorrectPlacementIUCD.Checked := False;
end;

procedure cbCorrectPlacementIUSonClick(Sender)
begin
  if cbCorrectPlacementIUS.Checked and cbInCorrectPlacementIUS.Checked then
    cbInCorrectPlacementIUS.Checked := False;
end;

procedure cbInCorrectPlacementIUSonClick(Sender)
begin
  if cbCorrectPlacementIUS.Checked and cbInCorrectPlacementIUS.Checked then
    cbCorrectPlacementIUS.Checked := False;
end;

procedure cbHRTYesOnclick(sender)
begin
   cbToggleCheckOnClick(sender);
   if cbHRTYes.checked then
   begin
     if trim(tcbMedication.Text) = '' then
     begin
        showmessage('Specify HRT type in Medication');
     end;
   end;
end;

Procedure ccbROClassificationOnChnage(sender)
begin

  cbROSeptumYes.Enabled := (ccbROClassification.ItemIndex > 0);
  lblROSeptum.Enabled := (ccbROClassification.ItemIndex > 0);
  cbROSeptumNo.Enabled := (ccbROClassification.ItemIndex > 0);

  lblROVascularPP.Enabled  := (ccbROClassification.ItemIndex > 0) and (not(cbROSmoothYes.checked));
  cbROVSYes.Enabled := (ccbROClassification.ItemIndex > 0) and (not(cbROSmoothYes.checked)) ;
  cbROVSNo.Enabled  := (ccbROClassification.ItemIndex > 0) and (not(cbROSmoothYes.checked));

  cbROSolidYes.Enabled := (ccbROClassification.ItemIndex > 0);
  cbROSolidNo.Enabled := (ccbROClassification.ItemIndex > 0);
  lblROSolid.Enabled := (ccbROClassification.ItemIndex > 0);

  case ccbROClassification.ItemIndex of
  0: begin
        seROThickestSeptum.Enabled := False;
        cbROSolidElementsYes.Enabled := False;
        cbROSolidElementsNo.Enabled := False;
        lblROThickestSeptum.Enabled := False;
        lblROThickestSeptumMeasure.Enabled := False;
     end;
   1: begin
         seROThickestSeptum.Enabled := False;
        cbROSolidElementsYes.Enabled := True;
        cbROSolidElementsNo.Enabled := True;
        lblROThickestSeptum.Enabled := False;
        lblROThickestSeptumMeasure.Enabled := False;
      end;
   2: begin
         seROThickestSeptum.Enabled := True;
        cbROSolidElementsYes.Enabled := False;
        cbROSolidElementsNo.Enabled := False;
        lblROThickestSeptum.Enabled := True;
        lblROThickestSeptumMeasure.Enabled := True;
      end;
   else
       begin
        seROThickestSeptum.Enabled := True;
        cbROSolidElementsYes.Enabled := True;
        cbROSolidElementsNo.Enabled := True;
        lblROThickestSeptum.Enabled := True;
        lblROThickestSeptumMeasure.Enabled := True;
       end;
 end;
 case ccbROClassification.ItemIndex of
   2: begin
         lblROSolid.Enabled  := False;
         cbROSolidYes.Enabled := False ;
         cbROSolidNo.Enabled  := False;
         if cbROSolidYes.checked then
            cbROSolidYes.Checked := False ;
      end;
   5: begin
        lblROVascularPP.Enabled  := True;
        cbROVSYes.Enabled := True ;
        cbROVSNo.Enabled  := True;
      end
 end;
end;

Procedure ccbLOClassificationOnChnage(sender)
begin

  cbLOSeptumYes.Enabled := (ccbLOClassification.ItemIndex > 0);
  lblLOSeptum.Enabled := (ccbLOClassification.ItemIndex > 0);
  cbLOSeptumNo.Enabled := (ccbLOClassification.ItemIndex > 0);

  lblLOVascularPP.Enabled  := (ccbLOClassification.ItemIndex > 0) and (not(cbLOSmoothYes.checked));
  cbLOVSYes.Enabled := (ccbLOClassification.ItemIndex > 0) and (not(cbLOSmoothYes.checked)) ;
  cbLOVSNo.Enabled  := (ccbLOClassification.ItemIndex > 0) and (not(cbLOSmoothYes.checked));

  cbLOSolidYes.Enabled := (ccbLOClassification.ItemIndex > 0);
  cbLOSolidNo.Enabled := (ccbLOClassification.ItemIndex > 0);
  lblLOSolid.Enabled := (ccbLOClassification.ItemIndex > 0);

    case ccbLOClassification.ItemIndex of
      0: begin
            seLOThickestSeptum.Enabled := False;
            cbLOSolidElementsYes.Enabled := False;
            cbLOSolidElementsNo.Enabled := False;
            lblLOThickestSeptum.Enabled := False;
            lblLOThickestSeptumMeasure.Enabled := False;
         end;
       1: begin
             seLOThickestSeptum.Enabled := False;
            cbLOSolidElementsYes.Enabled := True;
            cbLOSolidElementsNo.Enabled := True;
            lblLOThickestSeptum.Enabled := False;
            lblLOThickestSeptumMeasure.Enabled := False;
          end;
       2: begin
             seLOThickestSeptum.Enabled := True;
            cbLOSolidElementsYes.Enabled := False;
            cbLOSolidElementsNo.Enabled := False;
            lblLOThickestSeptum.Enabled := True;
            lblLOThickestSeptumMeasure.Enabled := True;
          end;
       else
           begin
            seLOThickestSeptum.Enabled := True;
            cbLOSolidElementsYes.Enabled := True;
            cbLOSolidElementsNo.Enabled := True;
            lblLOThickestSeptum.Enabled := True;
            lblLOThickestSeptumMeasure.Enabled := True;
           end;
     end;
     case ccbLOClassification.ItemIndex of
       5: begin
                 lblLOVascularPP.Enabled  := True;
                 cbLOVSYes.Enabled := True ;
                 cbLOVSNo.Enabled  := True;
              end
     end;
end;

procedure cbRightReanalAbnormalYesClick(sender)
begin
   cbToggleCheckOnClick(sender);
   ShowMessage('Please describe the abnormality in ''Comments and Diagnosis'' section');
end;

procedure cbLeftReanalAbnormalYesClick(sender)
begin
   cbToggleCheckOnClick(sender);
   ShowMessage('Please describe the abnormality in ''Comments and Diagnosis'' section');
end ;

function GetAntralNumberString(inNumber: Integer): string;
begin
  result := '';
  if inNumber = 1 then
    result := 'one'
  else
  begin
    if inNumber = 2 then
      result := 'two'
    else if inNumber = 3 then
      result := 'three'
    else if inNumber = 4 then
      result := 'four'
    else if inNumber = 5 then
      result := 'five'
    else if inNumber = 6 then
      result := 'six'
    else if inNumber = 7 then
      result := 'seven'
    else if inNumber = 8 then
      result := 'eight'
    else if inNumber = 9 then
      result := 'nine'
    else
      result := IntToStr(inNumber);
  end;
end;

function GetReferalIndications: string;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbReferralIndication.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndication.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxccbReferralIndication.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtPresentComplaintOther.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
  begin
   ShowMessage('Please select a Referral Indication before proceeding.');
  end;
end;

function GetMenses: string;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbMensturalBleeding.Properties.Items.Count - 2 do
  begin
    if cxccbMensturalBleeding.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxccbMensturalBleeding.ShortDescription[i];
    end;
  end;
  if result <> '' then
    result := '#|#+BOLDMenses:#/# '+AddFullStopToEnd(result);
end;

function GetGynaecologicalHistory: String;
begin
  result := '';
  for i := 0 to cxccbClinicalHistory.Properties.Items.Count - 2 do
  begin
    if cxccbClinicalHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxccbClinicalHistory.ShortDescription[i];
    end;
  end;
  if (cxccbClinicalHistory.States[cxccbClinicalHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtOtherPastHistory.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if trim(result) <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
    result := 'Nil.';  
end;

function GetGynaecologicalSurgery: String;
begin
  result := '';
  for i := 0 to cxccbClinicalHistory.Properties.Items.Count - 2 do
  begin
    if cxcbGynaeSurgery.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxcbGynaeSurgery.ShortDescription[i];
    end;
  end;
  if (cxcbGynaeSurgery.States[cxcbGynaeSurgery.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtOtherPastSurgery.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if trim(result) <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
    result := 'Nil.';
end;

function GetFamilyHistory: String;
begin
  result := '';
  for i := 0 to cxcbFamilyHistory.Properties.Items.Count - 2 do
  begin
    if cxcbFamilyHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + ', ';
      result := result + cxcbFamilyHistory.ShortDescription[i];
    end;
  end;
  if (cxcbFamilyHistory.States[cxcbFamilyHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + ', ';
    result := result + trim(edtOtherFamilyHistory.Text);
  end;
  if result <> '' then
    result := AddFullStopToEnd(result);
  if trim(result) <> '' then
    result := AddFullStopToEnd(result);
  if result = '' then
    result := 'Nil.';
end;

function GetEndCycleDays: string;
begin
  if cbIrregularCycle.Checked then
    result := 'irregular'
  else
  begin
    if (seCycleMaxDays.Value = 1) or (seCycleMinDays.Value = seCycleMaxDays.Value) then
    begin
      result := IntToStr(seCycleMinDays.Value) + ' day';
    end
    else
      result := IntToStr(seCycleMinDays.Value) + '-' + IntToStr(seCycleMaxDays.Value) + ' day';
  end;
end;

function getLMPString : String
begin
   Result := '';
   if cbLMPUnknown.checked then
     result := result + 'LMP unknown.'
   else if cbAmenorrhoea.checked then
     result := result + 'Amenorrhoea'
   else if cbPostMenopausal.checked then
     result := result + 'Postmenopausal';
   else
     begin
     if deLMPDate.Date > 10 then
       result := result +'LMP ' + FormatDateTime('dd mmm yyyy', deLMPDate.Date)+'. ';
     end;
end;

Function GetCycleDaysString : String
begin
   result := '';
   if not ((cbAmenorrhoea.checked) or (cbPostMenopausal.checked)) then
   begin
     if cbIrregularCycle.checked then
       result := result + 'Irregular menses'
     else if cbOligomenorrhoea.checked then
       result := result + 'Oligomenorrhoea'
     else
     begin
      //if ((deLMPDate.Date > 10)  and not(cbLMPUnknown.checked)) then
       result := result +'Day ' + IntToStr(spStartDay.value) + ' of '+ GetEndCycleDays + ' cycle. ';
     end;
   end;
end;

function GetMedication: string;
begin
result := '';
  if (tcbMedication.Text <> '') then
  begin
    if edtOtherMedication.Enabled then
    begin
      if trim(edtOtherMedication.Text) <> '' then
      begin
        result := edtOtherMedication.text;
      end;
    end
    else
    begin
      result := tcbMedication.Text;
      if (Pos('Continuous', tcbMedication.text) > 0) or (Pos('Cyclical', tcbMedication.text)) then
         result := result  + ' HRT';
    end;
  end
  else
    result := '';
  if result <> '' then
    result := result + '. '
  else
    result := 'Nil. ';
end;

function GetCavProjectionCount(var isValidDist: Booelan): Integer;
var
  vControl: TcxCheckBox;
  vCombo: TcxComboBox;
  i: Integer;
begin
  result := 0;
  isValidDist := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
    begin
      isValidDist := True;
      if (TcxCheckBox(vControl).Checked) and (TcxComboBox(vCombo).ItemIndex = 2)then
      begin
        result := Result + 1;
      end;
    end;
  end;
end;

function GetCavProjectionString: String;
var
  vControl: TcxCheckBox;
  vCombo, vComboLeftRight, vcbFibroidPosition,vcbProjection: TcxComboBox;
  vTempStr : String;
  i, vsubnucosalCount: Integer;
  vValidDist : Boolean;

begin
  result := '';
  vTempStr := '';
  vsubnucosalCount := 0;
  vsubmucosalCount := GetCavProjectionCount(vValidDist);
  if vsubmucosalCount =  1 then
  begin
     result := 'The submucosal fibroid appeared to project ';
      for i := 0 to spFibroidCount.Value - 1 do
      begin
        vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
        vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
        begin
          if (TcxCheckBox(vControl).Checked) and (TcxComboBox(vCombo).ItemIndex = 2)then
          begin
            vcbProjection := TWinControl(tsFibroids.Owner).FindComponent('cbProjection' + intToStr(i + 1));
            if vcbProjection.text <> '' then
            begin
              result := result + vcbProjection.text + ' ';
            end
          end;
        end;
      end;
      result := result + 'into the cavity.  '
  end
  else
  begin
    for i := 0 to spFibroidCount.Value - 1 do
    begin
      vTempStr := '';
      vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
      if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
      begin
        if (TcxCheckBox(vControl).Checked) and (TcxComboBox(vCombo).ItemIndex = 2)then
        begin
           vComboLeftRight := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
           vcbFibroidPosition := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
           vcbProjection := TWinControl(tsFibroids.Owner).FindComponent('cbProjection' + intToStr(i + 1));
           if vComboLeftRight.Text <> '' then
              vTempStr := InitCaps(vComboLeftRight.Text, true) + ' ';
           vTempStr := vTempStr + vcbFibroidPosition.Text + ' ' + vCombo.Text;
           if vTempStr <> '' then
             Result := Result + 'The ' + vTempStr + ' fibroid '
           if (vControl.Checked) then
           begin
               result := result + 'appeared to project '
               if vcbProjection.text <> '' then
               begin
                result := result + vcbProjection.text + ' ';
               end
               result := result + 'into the cavity. ';
          end
        end;
      end;
    end;
  end;
end;

function GetUterusType: string;
begin
result := '';
  if Trim(cbUterus.Text) <> '' then
  begin
    result := Trim(cbUterus.Text);
    if cbAntiFlexed.Checked then
      result := result + ' anteflexed'
    else if cbRetroFlexed.Checked then
      result := result + ' retroflexed';
    if lowercase(trim(cbUterineShape.text)) = 'bicornuate' then
      result := result + ' bicornuate';
    if pos('arcuate',lowercase(trim(cbUterineShape.text)))> 0 then
      result := result + ' arcuate';
  end
  else
    result := '';
  if result <> '' then
  begin
    if lowercase(trim(cbUterineShape.text)) = 'normal' then
      result := result + ' uterus was of normal shape and';
    else
      result :=  result + ' uterus';  
  end;
end;

function GetUterusMeasurement: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  v1 := seUterusLength.Value;
  v2 := seUterusWidth.Value;
  v3 := seUterusHeight.Value;
  v4 := trunc(seUterusCC.Value * 10) / 10;
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := Format('%dx%dx%dmm (vol %2.1f cc)', [trunc(v1), trunc(v2), trunc(v3), v4]);
        end
        else
          result := Format('%dx%dx%dmm', [trunc(v1), trunc(v2), trunc(v3)]);
      end
      else
        result := Format('%dx%dmm', [trunc(v1), trunc(v2)]);
    end
    else
      result := Format('%dmm', [trunc(v1)]);
  end;
end;

function GetEndometrialPolyp: string;
var
  v1, v2, v3: Integer;
begin
  v1 := Trunc(edtpolypLength1.Value);
  v2 := Trunc(edtpolypWidth1.Value);
  v3 := Trunc(edtpolypDepth1.Value);
  if (sePolypCount.Value > 0) then
  begin
    if v1 > 0 then
    begin
      if v2 > 0 then
      begin
        if v3 > 0 then
        begin
          result := format(' An echogenic area measuring %dx%dx%dmm was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. ', [trunc(v1),
            trunc(v2), trunc(v3)]);
        end
        else
          result := format(' An echogenic area measuring %dx%dmm was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. ', [trunc(v1),
            trunc(v2)]);
      end
      else
        result := format(' An echogenic area measuring %dmm was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. ', [trunc(v1)]);
    end
    else
      result := ' An echogenic area was seen in the cavity, with an associated feeder vessel, consistent with an endometrial polyp. '
  end
  else
    result := '';
end;

function GetMultipleEndometrialPolyp(inPolyp): string;
var
  v1, v2, v3: Integer;
  vedtpolypLength,vedtpolypwidth,vedtpolypDepth : TcxSpinEdit;
begin

 vedtpolypLength := TWinControl(cxtsGeneral.Owner).FindComponent('edtpolypLength' + intToStr(inPolyp));
 vedtpolypwidth := TWinControl(cxtsGeneral.Owner).FindComponent('edtpolypwidth' + intToStr(inPolyp));
 vedtpolypDepth := TWinControl(cxtsGeneral.Owner).FindComponent('edtpolypDepth' + intToStr(inPolyp));
  v1 := Trunc(vedtpolypLength.Value);
  v2 := Trunc(vedtpolypwidth.Value);
  v3 := Trunc(vedtpolypDepth.Value);
  if (sePolypCount.Value > 0) then
  begin
    if v1 > 0 then
    begin
      if v2 > 0 then
      begin
        if v3 > 0 then
        begin
          result := format('%dx%dx%dmm ', [trunc(v1),trunc(v2), trunc(v3)]);
        end
        else
          result := format('%dx%dmm', [trunc(v1),trunc(v2)]);
      end
      else
        result := format('%dmm', [trunc(v1)]);
    end
    else
      result := ''
  end
  else
    result := '';
end;

function GetMultipleEndometrialPolypString: string;
var
  count : integer;
  vTempStr : string;
begin
  result := '';
  vtempStr:= '';
  count := 0;

  if sePolypCount.value > 0 then
  begin
     for  count := 1 to  sePolypCount.value do
     begin
        if (vtempStr <> '') and (GetMultipleEndometrialPolyp(count) <> '') then
          vtempStr := vtempStr + 'and ';
        vtempStr := vtempStr + GetMultipleEndometrialPolyp(count) ;
     end;
  end;
  if sePolypCount.value = 2 then
  begin
     result := ' Two echogenic areas were seen in the cavity ';
     if vtempStr <> '' then
       result := result + 'and measured ' + vtempStr +' each with an associated feeder vessel, consistent with an endometrial polyp. '
  end
  else
    result := '';
end;

function GetIUCDPlacement(inConc: Boolean): string;
begin
  result := '';
  if cbCorrectPlacementIUCD.Checked then
  begin
    if inConc then
      result := 'Correctly placed IUCD within the endometrial cavity. ';
    else
      result := 'The straight-stemmed IUCD was correctly positioned within the endometrial cavity. ';
  end
  else if cbInCorrectPlacementIUCD.Checked then
  begin
    if inConc then
      result := 'Incorrectly placed IUCD within the endometrial cavity. ';
    else
      result := '#|#+CREDThe intrauterine contraceptive device (IUCD) was noted to be incorrectly positioned within the uterine cavity.#/# ';
  end;
  if cbCorrectPlacementIUS.Checked then
  begin
    if inConc then
      result := result + 'Correctly positioned IUS within the endometrial cavity. ';
    else
      result := result + 'The barrel of the intrauterine system (IUS) was correctly positioned within the endometrial cavity. ';
  end
  else if cbInCorrectPlacementIUS.Checked then
  begin
    if inConc then
      result := result + 'Incorrectly positioned IUS within the endometrial cavity. ';
    else
      result := result + '#|#+CREDThe barrel of the IUS (Mirena) was noted to be incorrectly positioned within the uterine cavity.#/# ';
  end
end;

function GetUterusAppearance: string;
var
  vFound: Integer;
begin
  vFound := 0;
  result := ''
  if cbUterusMobile.Checked then
  begin
    result := result + ' was freely mobile';
    vFound := 1;
  end
  else if cbUterusLimitedMobile.checked then
  begin
    result := result + ' had limited mobility';
    vFound := 2;
  end;
  if cbUterusNonTender.Checked then
  begin
    if vFound > 0 then
    begin
      result := result + ' and';
      if vFound > 1 then
        result := result + ' was';
    end
    else
      result := result + ' was';
    result := result + ' non tender'
  end
  else if cbUterusTender.Checked then
  begin
    if vFound > 0 then
    begin
      result := result + ' and';
      if vFound > 1 then
        result := result + ' was';
    end                                                                                                                          
    else
      result := result + ' was';
    result := result + ' tender'
  end;
  if result <> '' then
    result := 'The uterus' + result + '. ';
end;

function GetCervicalPolyp: string;
var
  v1, v2, v3: Integer;
begin
result := '';
  v1 := Trunc(edtCervicalpolypLength1.Value);
  v2 := Trunc(edtCervicalpolypWidth1.Value);
  v3 := Trunc(edtCervicalpolypDepth1.Value);
    if v1 > 0 then
    begin
      if v2 > 0 then
      begin
        if v3 > 0 then
        begin
          result := format(' A cervical polyp of %dx%dx%dmm was identified. ', [trunc(v1),
            trunc(v2), trunc(v3)]);
        end
        else
          result := format(' A cervical polyp of %dx%dmm was identified. ', [trunc(v1),
            trunc(v2)]);
      end
      else
        result := format(' A cervical polyp of %dmm was identified. ', [trunc(v1)]);
    end
end;

function GetCervixAppearance : String
begin
   result := '';
   if cbCervicalPolyp.checked then
   begin
     if GetCervicalPolyp <> '' then
        result := result + GetCervicalPolyp ;
     else
        result := ' A cervical polyp was identified.  '
   end;
   else
   begin
      result := result + 'The cervix appeared normal. '
   end;
end;

function GetSeptumLengthString: string;
begin
  result := '';
  if  (cbUterineShape.ItemIndex = 3) then
  begin
    result := Format('A partial cavity septation was noted, extending %dmm from the fundal endometrium. ', [Trunc(spSeptumlength.Value)]);
  end;
   if  (cbUterineShape.ItemIndex = 4) then
  begin
    result := Format('A complete cavity septation was noted, extending %dmm from the fundal endometrium. ', [Trunc(spSeptumlength.Value)]);
  end;
end;

function GetRightOvaryAppearance: string;
var
  vFound: Integer;
  vResult: string;
begin
  vFound := 0;
  vResult := ''
    result := '';
  if cbRightMobile.Checked then
  begin
    vResult := vResult + ' was freely mobile';
    vFound := 1;
  end
  else if cbRightLimitedMobility.checked then
  begin
    vResult := vResult + ' was of limited mobility';
    vFound := 2;
  end;
  if cbRightNonTender.Checked then
  begin
    if vFound > 0 then
    begin
      vResult := vResult + ' and';
      if vFound > 1 then
        vResult := vResult + ' was';
    end
    else
      vResult := vResult + ' was';
    vResult := vResult + ' non tender'
  end
  else if cbRightTender.Checked then
  begin
    if cbRightMobile.Checked then
    begin
      if vFound > 0 then
      begin
        vResult := vResult + ' but';
        if vFound > 1 then
          vResult := vResult + ' was';
      end
      else
        vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end
    else if cbRightLimitedMobility.checked then
    begin
      vResult := vResult + ' and mildly tender, raising the possibility of local adhesions';
    end
    else
    begin
      vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end
  end;

  if (cbRightCorpusLuteum.Checked) and (cbRightCorpusLuteumSize.Value > 0) then
  begin
    if cbRightCorpusLuteumSize3.Value > 0 then
    begin
      result := result + Format('Three corpora lutea were visualised measuring %d, %d and %dmm. ', [Trunc(cbRightCorpusLuteumSize.Value), Trunc(cbRightCorpusLuteumSize2.Value),
        Trunc(cbRightCorpusLuteumSize3.Value)]);
    end
    else if cbRightCorpusLuteumSize2.Value > 0 then
    begin
      result := result + Format('Two corpora lutea were visualised measuring %d and %dmm. ', [Trunc(cbRightCorpusLuteumSize.Value), Trunc(cbRightCorpusLuteumSize2.Value)]);
    end
    else
      result := result + Format('%s %dmm corpus luteum was visualised. ', [GetIndefinateArticle(Trunc(cbRightCorpusLuteumSize.Value), true), Trunc(cbRightCorpusLuteumSize.Value)]);
    if vResult <> '' then
      result := result + 'The ovary' + vResult;
    result := AddFullStopToEnd(result);
  end
  else
  begin
    if vResult <> '' then
      result := 'The ovary' + vResult + '. ';
  end;
  if cbRightVaginalAccessYes.Checked then
  begin
    result := result + 'The position of this ovary is suitable for vaginal egg collection. '
  end
  else if cbRightVaginalAccessNo.Checked then
  begin
    result := result + 'Because of its location, this ovary may not be suitable for vaginal egg collection. '
  end;
end;

function GetOvarianCystMeasurement(v1, v2, v3, v4: double; inType: string): string;
begin
  result := GetIntegerMeasuredString(trunc(v1), trunc(v2), trunc(v3), v4, inType);
end;

function GetOvarianCyst(inNumber: Integer; inSide: string): string;
var
  vCystType: TAdvTreeComboBox;
  vl, vw, vd, vv: TcxSpinEdit;
begin
  result := '';
  if inSide = 'R' then
  begin
    case inNumber of
      1:
        begin
          vCystType := cbRightOvaryCystType1;
          vl := seRightOvaryCystLength1;
          vw := seRightOvaryCystWidth1;
          vd := seRightOvaryCystDepth1;
          vv := seRightOvaryCystVolume1;
        end;
      2:
        begin
          vCystType := cbRightOvaryCystType2;
          vl := seRightOvaryCystLength2;
          vw := seRightOvaryCystWidth2;
          vd := seRightOvaryCystDepth2;
          vv := seRightOvaryCystVolume2;
        end;
      3:
        begin
          vCystType := cbRightOvaryCystType3;
          vl := seRightOvaryCystLength3;
          vw := seRightOvaryCystWidth3;
          vd := seRightOvaryCystDepth3;
          vv := seRightOvaryCystVolume3;
        end;
     4:
        begin
          vCystType := cbRightOvaryCystType4;
          vl := seRightOvaryCystLength4;
          vw := seRightOvaryCystWidth4;
          vd := seRightOvaryCystDepth4;
          vv := seRightOvaryCystVolume4;
        end;
    end;
  end
  else
  begin
    case inNumber of
      1:
        begin
          vCystType := cbleftOvaryCystType1;
          vl := seleftOvaryCystLength1;
          vw := seleftOvaryCystWidth1;
          vd := seleftOvaryCystDepth1;
          vv := seleftOvaryCystVolume1;
        end;
      2:
        begin
          vCystType := cbleftOvaryCystType2;
          vl := seleftOvaryCystLength2;
          vw := seleftOvaryCystWidth2;
          vd := seleftOvaryCystDepth2;
          vv := seleftOvaryCystVolume2;
        end;
      3:
        begin
          vCystType := cbleftOvaryCystType3;
          vl := seleftOvaryCystLength3;
          vw := seleftOvaryCystWidth3;
          vd := seleftOvaryCystDepth3;
          vv := seleftOvaryCystVolume3;
        end;
      4:
        begin
          vCystType := cbleftOvaryCystType4;
          vl := seleftOvaryCystLength4;
          vw := seleftOvaryCystWidth4;
          vd := seleftOvaryCystDepth4;
          vv := seleftOvaryCystVolume4;
        end;
    end;
  end;
  case vCystType.selection of
    1: result := format('A thin-walled avascular anechoic cyst was visualised measuring %s.  The appearance is consistent with a simple cyst. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    2: result := '';
    3: result := format('A thin walled avascular cyst was visualised measuring %s, the internal echoes consistent with a haemorrhagic follicular cyst. ',
       [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    4: result := format('A thin-walled avascular cyst was visualised measuring %s.  The internal echoes demonstrate a fluid level in a haemorrhagic cyst. ',[GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    5: result := format('A thin-walled avascular cyst was visualised measuring %s.  The internal echoes are consistent with retracted clot and serum in a haemorrhagic cyst. ',[GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    6: result := format('A thin-walled avascular cyst was visualised measuring %s.  The internal echoes demonstrate clot and stellate fibrin strands in a haemorrhagic cyst.  ',[GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    7: result := format('An avascular cyst was visualised containing homogeneously dispersed low level echoes, characteristic of an endometrioma. The dimensions were %s. ',
      [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    9: result :=
      format('An avascular cyst was visualised containing echoes of mixed echogenicity.  A highly echogenic region was suggestive of fat and a characteristic dot and dash pattern was indicative of hair and sebum in a dermoid cyst. The dimensions were %s. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
   10: result := format('An avascular cyst was visualised containing highly echogenic echoes suggestive of fat in a dermoid cyst. The dimensions were %s. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    11: result := format('An avascular area of increased echogenicity was visualised, measuring %s.  The appearance is consistent with fat in a dermoid plug. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
  else
    result := format('A cyst measuring %s was visualised. ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
  end;
end;

function GetCystsDimensionsForCystList(inList: TStringList; inSide: string; inExtra: Boolean): String;
var                                                                                                   
  vCystType: TcxComboBox;
  vl, vw, vd, vv: TcxSpinEdit;
  i : Integer;
begin
  result := '';
  if inSide = 'R' then
  begin
   if inList.count > 0 then
   begin
    for i := 0 to inList.Count - 1 do
    begin
       if result <> '' then
       begin
         if (i = inList.Count - 1) and (inList.Count > 1) then
           result := result + ' and ';
         else
            result := result + ', ';
       end;
       vl := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystLength' + inList[i]);
       vw := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystWidth' + inList[i]);
       vd := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystDepth' + inList[i]);
       vv := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystVolume' + inList[i]);
       result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
   end;
  end
  else
  begin
   if inList.count > 0 then
   begin
    for i := 0 to inList.Count - 1 do
    begin
       if result <> '' then
       begin
         if (i = inList.Count - 1) and (inList.Count > 1) then
           result := result + ' and ';
         else
            result := result + ', ';
       end;
       vl := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystLength' + inList[i]);
       vw := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystWidth' + inList[i]);
       vd := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystDepth' + inList[i]);
       vv := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystVolume' + inList[i]);
       result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
   end;
  end;
end;

function GetCystsDimensions(inQTY: Integer; inSide: string; inExtra: Boolean): String;
var
  vCystType: TcxComboBox;
  vl, vw, vd, vv: TcxSpinEdit;
begin
  result := '';
  if inSide = 'R' then
  begin
    if inQty > 1 then
    begin
      if inExtra then
      begin
        vl := seRightOvaryCystLength2;
        vw := seRightOvaryCystWidth2;
        vd := seRightOvaryCystDepth2;
        vv := seRightOvaryCystVolume2;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seRightOvaryCystLength3;
        vw := seRightOvaryCystWidth3;
        vd := seRightOvaryCystDepth3;
        vv := seRightOvaryCystVolume3;
      end
      else
      begin
        vl := seRightOvaryCystLength1;
        vw := seRightOvaryCystWidth1;
        vd := seRightOvaryCystDepth1;
        vv := seRightOvaryCystVolume1;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seRightOvaryCystLength2;
        vw := seRightOvaryCystWidth2;
        vd := seRightOvaryCystDepth2;
        vv := seRightOvaryCystVolume2;
      end;
      if inQTY = 2 then
        result := result + ' and '
      else
        result := result + ', ';
      result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
    if inQty > 2 then
    begin
      vl := seRightOvaryCystLength3;
      vw := seRightOvaryCystWidth3;
      vd := seRightOvaryCystDepth3;
      vv := seRightOvaryCystVolume3;
      if inQTY = 3 then
        result := result + ' and '
      else
        result := result + ', ';
      result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
    if inQty > 3 then
    begin
      vl := seRightOvaryCystLength4;
      vw := seRightOvaryCystWidth4;
      vd := seRightOvaryCystDepth4;
      vv := seRightOvaryCystVolume4;
      result := result + Format(' and %s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
   { AddFullstopToEnd(result);
    if trim(result)[length(trim(result)] <> '.'
      result := result + '. ';    }
  end
  else
  begin
    if inQty > 1 then
    begin
      if inExtra then
      begin
        vl := seLeftOvaryCystLength2;
        vw := seLeftOvaryCystWidth2;
        vd := seLeftOvaryCystDepth2;
        vv := seLeftOvaryCystVolume2;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seLeftOvaryCystLength3;
        vw := seLeftOvaryCystWidth3;
        vd := seLeftOvaryCystDepth3;
        vv := seLeftOvaryCystVolume3;
      end
      else
      begin
        vl := seLeftOvaryCystLength1;
        vw := seLeftOvaryCystWidth1;
        vd := seLeftOvaryCystDepth1;
        vv := seLeftOvaryCystVolume1;
        result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
        vl := seLeftOvaryCystLength2;
        vw := seLeftOvaryCystWidth2;
        vd := seLeftOvaryCystDepth2;
        vv := seLeftOvaryCystVolume2;
      end;
      if inQTY = 2 then
        result := result + ' and '
      else
        result := result + ', ';
      result := result + Format('%s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
    if inQty > 2 then
    begin
      vl := seLeftOvaryCystLength3;
      vw := seLeftOvaryCystWidth3;
      vd := seLeftOvaryCystDepth3;
      vv := seLeftOvaryCystVolume3;
      result := result + Format(' and %s', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
  {  AddFullstopToEnd(result);
    if trim(result)[length(trim(result)] <> '.'
      result := result + '. ';    }
  end;
end;

function GetBothorAll(inQty: Integer): String;
begin
  if inQTY = 2 then
    result := 'Both'
  else
    result := 'All';
end;

function GetMultiCystDescriptions(inType: Integer; inQTY: Integer; inSide: string ; cystList : TstringList): String;
var
  vExtra: Boolean;
begin
  vExtra := False;
  if inQTY = 8 then
  begin
    inQty := 2;
    vExtra := True;
  end;
  case inType of
    1: begin
         if (inQTY = 2) then
           result := format('%s thin-walled avascular anechoic cysts were visualised.  The features of both are consistent with simple cysts. ', [InitCaps(getNumberString(inQTY), False)]);
         else
           result := format('%s thin-walled avascular anechoic cysts were visualised.  The features are consistent with simple cysts. ', [InitCaps(getNumberString(inQTY), False)]);
       end;
    2: result := '';
    3: result := format('%s thin walled avascular cysts were visualised, the internal echoes consistent with haemorrhagic follicular cysts. ', [InitCaps(getNumberString(inQTY), False)]);
    4: result := format('%s thin-walled avascular cysts were visualised,  the internal echoes demonstrate a fluid level in haemorrhagic cysts. ', [InitCaps(getNumberString(inQTY), False)]);
    5: result := format('%s thin-walled avascular cysts were visualised.  The internal echoes are consistent with retracted clot and serum in haemorrhagic cysts. ', [InitCaps(getNumberString(inQTY), False)]);
    6: result := format('%s thin walled avascular cysts was visualised with internal echoes consistent with retracted clot and fibrin strands. %s cysts have the appearance of haemorrhagic cysts. ', [InitCaps(getNumberString(inQTY), False), GetBothorAll(inQTY)]);
    7: result := format('%s avascular cysts were visualised containing homogeneously dispersed low level echoes, characteristic of endometriomas. ',[InitCaps(getNumberString(inQTY), False)]);
    9: result := format('%s avascular cysts were visualised containing echoes of mixed echogenicity.  A highly echogenic region was suggestive of fat and a characteristic dot and dash pattern was indicative of hair and sebum in a dermoid cyst. ', [InitCaps(getNumberString(inQTY), False), GetBothorAll(inQTY)]);
    10: result := format('%s avascular cysts were visualised containing highly echogenic echoes suggestive of fat in a dermoid cyst. ', [InitCaps(getNumberString(inQTY), False), GetBothorAll(inQTY)]);
    11: begin
        if (inQty = 2) then
         result := format('%s avascular areas of increased echogenicity were visualised. Both have an appearance consistent with fat in a dermoid plug. ', [InitCaps(getNumberString(inQTY), False)]);
        else
         result := format('%s avascular areas of increased echogenicity were visualised, appearance consistent with fat in a dermoid plug. ', [InitCaps(getNumberString(inQTY), False)]);
       end;
  else
    result := format('%s cysts were visualised. ', [InitCaps(getNumberString(inQTY), False)]);
  end;
  if assigned(cystList) then
  begin
    if cystList.count > 0 then
      result := result + Format('The dimensions were as follows %s. ',[GetCystsDimensionsForCystList(cystList, inSide, vExtra)]);
    else
      result := result + Format('The dimensions were as follows %s. ',[GetCystsDimensions(inQTY, inSide, vExtra)]);
  end
  else
    result := result + Format('The dimensions were as follows %s. ',[GetCystsDimensions(inQTY, inSide, vExtra)]);
end;

function GetRightOvaryCyst: string;
var
  cystList : TStringlist;
begin
  result := '';
  cystList := TStringlist.Create;
  if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0) then
  begin
    if seRightOvarianCystsCount.Value = 1 then
      result := GetOvarianCyst(1, 'R')
    else if seRightOvarianCystsCount.Value = 2 then
    begin
      if (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) then
      begin
        lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
        lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
      end
      else
      begin
        result := format('%s',[GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R','')]);
      end;
    end
    else if seRightOvarianCystsCount.Value = 3 then
    begin
      if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection)  then
      begin
        result := format('%s',[GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R','')]);
      end
      else
      begin
        if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R','')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
        end
        else if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) then
        begin
          cystList.Add('1'); cystList.Add('3')
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
        end
        else
        begin
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
          if (cbRightOvaryCystType2.Selection = cbRightOvaryCystType3.Selection) then
          begin
            lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 8, 'R','')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          end
          else
          begin
            lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          end;
        end;
      end;
    end;
    else
    begin
      if (cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)  then
      begin
        cystList.Add('1');  cystList.Add('2');  cystList.Add('3');  cystList.Add('4'); 
        result := format('%s',[GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 4, 'R',cystList)]);
      end
      else if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection)) or
              ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)) or
              ((cbRightOvaryCystType2.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType2.Selection = cbRightOvaryCystType4.Selection)) or
              ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection))then
      begin
        if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection)) then
        begin
           cystList.Add('1');cystList.Add('2');CystList.Add('3');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
        else if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType2.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)) then
        begin
          cystList.Add('1');cystList.Add('2');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
        else if ((cbRightOvaryCystType1.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType1.Selection = cbRightOvaryCystType4.Selection)) then
        begin
           cystList.Add('1');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
        else if ((cbRightOvaryCystType2.Selection = cbRightOvaryCystType3.Selection) and (cbRightOvaryCystType2.Selection = cbRightOvaryCystType4.Selection)) then
        begin
          cystList.Add('2');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 3, 'R',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
        end
      end;
      else if (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) and
              (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) and
              (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType4.Selection) and
              (cbRightOvaryCystType2.Selection <> cbRightOvaryCystType3.Selection) and
              (cbRightOvaryCystType2.Selection <> cbRightOvaryCystType4.Selection) and
              (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType4.Selection)then
      begin
          lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystRDesc4="' + format('4:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
      end;
      else
      begin
         if (cbRightOvaryCystType1.Selection =  cbRightOvaryCystType2.Selection) then
         begin
            cystList.Add('1');cystList.Add('2')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType3.Selection =  cbRightOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('3');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType3.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
        else if (cbRightOvaryCystType1.Selection =  cbRightOvaryCystType3.Selection) then
        begin
            cystList.Add('1');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType2.Selection =  cbRightOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
        end
        else if (cbRightOvaryCystType1.Selection =  cbRightOvaryCystType4.Selection) then
        begin
            cystList.Add('1');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType2.Selection =  cbRightOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
        end
         else if (cbRightOvaryCystType2.Selection =  cbRightOvaryCystType3.Selection) then
         begin
            cystList.Add('2');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType1.Selection =  cbRightOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
         else if (cbRightOvaryCystType2.Selection =  cbRightOvaryCystType4.Selection) then
         begin
            cystList.Add('2');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType2.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType1.Selection =  cbRightOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
         else if (cbRightOvaryCystType3.Selection =  cbRightOvaryCystType4.Selection) then
         begin
            cystList.Add('3');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystRDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType3.Selection, 2, 'R',cystList)]) + '"');
            if(cbRightOvaryCystType2.Selection =  cbRightOvaryCystType1.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('2')
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbRightOvaryCystType1.Selection, 2, 'R',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsRDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'R')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystRDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(2, 'R')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystRDesc4=""');
            end;
         end
      end;
    end;
  end;
end;

function GetRightFollicleCount: integer
begin
  result := 0;
  result := seRightFolCount.Value + seRightLeadFollicle.Value;
end;

function GetRightOvary: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  if cbRightOvaryIdentified.Checked then
  begin
    v1 := trunc(seRightOvaryLength.Value);
    v2 := trunc(seRightOvaryWidth.Value);
    v3 := trunc(seRightOvaryHeight.Value);
    v4 := trunc(seRightOvaryCC.Value * 10) / 10;
    if ((cbRightOvaryVisualisedTA.Checked) and (not cbRightOvaryVisualisedTV.Checked) and (not cbPerformedTransAbdom.Checked)) then
    begin
      {if cbRightPCO.Checked then
        result := result + format('The multifollicular right ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
      else}
        result := result + format('The right ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
    end
    else
    begin
      {if cbRightPCO.Checked then
        result := result + format('The multifollicular right ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
      else}
        result := result + format('The right ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
    end;
    if (seRightResidualFolCount.visible) and ((seRightResidualFolCount.value) > 0) then
    begin
       if seRightResidualFolCount.value = 1 then
       begin
         result := result + ' and contained single residual follicle ';
          result := result + format(' (%d-%dmm). ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
       end;
       else if (seRightResidualFolCount.visible) and  (seRightResidualFolCount.value) > 1 then
       begin
         result := result +  format(' and contained %s residual follicles', [GetNumberString(trunc(seRightResidualFolCount.value))]);
         result := result + format(' (%d-%dmm). ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
       end;  
    end
    else if GetRightFollicleCount > 0 then
    begin
      if GetRightFollicleCount > 1 then
      begin
        result := result + format(' and contained %s follicles', [GetNumberString(trunc(GetRightFollicleCount))]);
        if GetRightFollicleCount > 2 then
        begin
          if cbRightLeadFollicle.Checked then
          begin
            v1 := trunc(seRightLeadFollicleSize.value);
            v2 := trunc(seRightLeadFollicleSize2.Value);
            v3 := trunc(seRightLeadFollicleSize3.value);
            if v1 > 0 then
            begin
              if v2 > 0 then
              begin
                if v3 > 0 then
                begin
                  if GetRightFollicleCount > 3 then
                  begin
                    if GetRightFollicleCount > 4 then
                      result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d-%dmm). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                    else
                      result := result + format(' (lead follicles %dmm, %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value)]);
                  end
                  else
                    result := result + format(' (lead follicles %dmm, %dmm, %dmm). ', [v1, v2, v3])
         //         if trunc(seRightFolSize.Value) > 0 then
         //           result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d-%dmm). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
        //          else
         //           result := result + format(' (lead follicles %dmm, %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value)]);
                end
                else
                begin
                  if GetRightFollicleCount > 3 then
                    result := result + format(' (lead follicles %dmm, %dmm, rest %d-%dmm). ', [v1, v2, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                  else
                    result := result + format(' (lead follicles %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, trunc(seRightFollicle1Size.Value)]);
                end;
              end
              else
              begin
                if trunc(seRightFolSize.Value) > 0 then
                  result := result + format(' (lead follicle %dmm, rest %d-%dmm). ', [v1, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                else
                  result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
              end;
            end;
          end
          else
            result := result + format(' (%d-%dmm). ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
        end
        else
        begin
          if cbRightLeadFollicle.Checked then
          begin
            v1 := trunc(seRightLeadFollicleSize.value);
            v2 := trunc(seRightLeadFollicleSize2.Value);
            v3 := trunc(seRightLeadFollicleSize3.value);
            if v1 > 0 then
            begin
              if v2 > 0 then
              begin
                if v3 > 0 then
                begin
                    result := result + format(' (lead follicles %dmm, %dmm and %dmm). ', [v1, v2, v3])
       //           if trunc(seRightFolSize.Value) > 0 then
       //             result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d and %dmm). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
       //           else
       //             result := result + format(' (lead follicles %dmm, %dmm, %dmm and %dmm antral follicle). ', [v1, v2, v3, trunc(seRightFollicle1Size.Value)]);
                end
                else
                begin
                //  if trunc(seRightFolSize.Value) > 0 then
                    result := result + format(' (lead follicles %dmm and %dmm). ', [v1, v2])
                //    result := result + format(' (lead follicles %dmm and %dmm, rest %d and %dmm). ', [v1, v2, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
                //  else
                //    result := result + format(' (lead follicles %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, trunc(seRightFollicle1Size.Value)]);
                end;
              end
              else
              begin
              //  result := result + format(' (lead follicle %dmm, antral follicle %dmm). ', [v1, trunc(seRightFollicle1Size.Value)])
                result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
        //        if trunc(seRightFolSize.Value) > 0 then
        //          result := result + format(' (lead follicle %dmm, rest %d and %dmm). ', [v1, trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)])
        //        else
        //          result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
              end;
            end;
          end
          else
            result := result + format(' of %dmm and %dmm. ', [trunc(seRightFollicle1Size.Value), trunc(seRightFolSize.Value)]);
        end;
      end
      else
      begin
        if cbRightLeadFollicle.Checked then
          result := result + format(' and contained a single lead follicle of %dmm. ', [trunc(seRightLeadFollicleSize.Value)])
        else
          result := result + format(' and contained a single antral follicle of %dmm. ', [trunc(seRightFollicle1Size.Value)]);
      end;
    end
    else
    begin
      result := result + ' and contained no follicles. ';
    end;
  end
  else
  begin
    if not(cbleftOvaryIdentified.checked) then
    begin
      if (cbRightOoporectomy.checked) and  (cbLeftOoporectomy.checked) then
        result := result + 'Neither ovary identified, consistent with previous surgical removal.';
      else
        result := result + 'Neither ovary was identified on this occasion.';
    end;
    else
    begin
      result := result + 'The right ovary was not identified';
      if cbRightOoporectomy.checked then
         result := result + ', consistent with previous surgical removal';
       result := result + '.  ';
    end;
  end;
end;

function GetLeftOvaryAppearance: string;
var
  vFound: Integer;
  vResult: string;
begin
  vFound := 0;
  result := ''
    vResult := '';
  if cbLeftMobile.Checked then
  begin
    vResult := vResult + ' was freely mobile';
    vFound := 1;
  end
  else if cbLeftLimitedMobility.checked then
  begin
    vResult := vResult + ' was of limited mobility';
    vFound := 2;
  end;
  if cbLeftNonTender.Checked then
  begin
    if vFound > 0 then
    begin
      vResult := vResult + ' and';
      if vFound > 1 then
        vResult := vResult + ' was';
    end
    else
      vResult := vResult + ' was';
    vResult := vResult + ' non tender'
  end
  else if cbLeftTender.Checked then
  begin
    if cbLeftMobile.Checked then
    begin
      if vFound > 0 then
      begin
        vResult := vResult + ' but';
        if vFound > 1 then
          vResult := vResult + ' was';
      end
      else
        vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end
    else if cbLeftLimitedMobility.checked then
    begin
      vResult := vResult + ' and mildly tender, raising the possibility of local adhesions';
    end
    else
    begin
      vResult := vResult + ' was';
      vResult := vResult + ' tender on gentle probe pressure'
    end;
  end;

  if (cbLeftCorpusLuteum.Checked) and (cbLeftCorpusLuteumSize.Value > 0) then
  begin
    if cbleftCorpusLuteumSize3.Value > 0 then
    begin
      result := result + Format('Three corpora lutea were visualised measuring %d, %d and %dmm. ', [Trunc(cbLeftCorpusLuteumSize.Value), Trunc(cbLeftCorpusLuteumSize2.Value),
        Trunc(cbLeftCorpusLuteumSize3.Value)]);
    end
    else if cbleftCorpusLuteumSize2.Value > 0 then
    begin
      result := result + Format('Two corpora lutea were visualised measuring %d and %dmm. ', [Trunc(cbLeftCorpusLuteumSize.Value), Trunc(cbLeftCorpusLuteumSize2.Value)]);
    end
    else
      result := result + Format('%s %dmm corpus luteum was visualised. ', [GetIndefinateArticle(Trunc(cbLeftCorpusLuteumSize.Value), true), Trunc(cbLeftCorpusLuteumSize.Value)]);
    if vResult <> '' then
      result := result + 'The ovary' + vResult;
    result := AddFullStopToEnd(result);
  //  result := result + '. ';
  end
  else
  begin
    if vResult <> '' then
      result := 'The ovary' + vResult + '. ';
    ;
  end;
  if cbLeftVaginalAccessYes.Checked then
  begin
    result := result + 'The position of this ovary is suitable for vaginal egg collection. '
  end
  else if cbLeftVaginalAccessNo.Checked then
  begin
    result := result + 'Because of its location, this ovary may not be suitable for vaginal egg collection. '
  end;
end;

function GetLeftOvaryCyst: string;
var
  cystList : TStringlist;
begin
  result := '';
  cystList := TStringlist.Create;
  if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0) then
  begin
    if seLeftOvarianCystsCount.Value = 1 then
      result := GetOvarianCyst(1, 'L')
    else if seLeftOvarianCystsCount.Value = 2 then
    begin
      if (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) then
      begin
        lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
        lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
      end
      else
      begin
        result := format('%s',[GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L','')]);
      end;
    end
    else if seLeftOvarianCystsCount.Value = 3 then
    begin
      if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection)  then
      begin
        result := format('%s',[GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L','')]);
      end
      else
      begin
        if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L','')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
        end
        else if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) then
        begin
          cystList.Add('1'); cystList.Add('3')
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
        end
        else
        begin
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
          if (cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType3.Selection) then
          begin
            lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 8, 'L','')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          end
          else
          begin
            lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
            lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          end;
        end;
      end;
    end;
    else
    begin
      if (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)  then
      begin
        cystList.Add('1'); cystList.Add('2');cystList.Add('3');cystList.Add('4');
        result := format('%s',[GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 4, 'L',cystList)]);
      end
      else if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection)) or
              ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)) or
              ((cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType4.Selection)) or
              ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection))then
      begin
        if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection)) then
        begin
           cystList.Add('1');cystList.Add('2');CystList.Add('3');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
        else if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType2.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)) then
        begin
          cystList.Add('1');cystList.Add('2');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
        else if ((cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType1.Selection = cbLeftOvaryCystType4.Selection)) then
        begin
           cystList.Add('1');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
        else if ((cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType3.Selection) and (cbLeftOvaryCystType2.Selection = cbLeftOvaryCystType4.Selection)) then
        begin
          cystList.Add('2');cystList.Add('3');CystList.Add('4');
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 3, 'L',cystList)]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
          lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
        end
      end;
      else if (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) and
              (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) and
              (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType4.Selection) and
              (cbLeftOvaryCystType2.Selection <> cbLeftOvaryCystType3.Selection) and
              (cbLeftOvaryCystType2.Selection <> cbLeftOvaryCystType4.Selection) and
              (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType4.Selection)then
      begin
          lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
          lbMergeDataMergeFields.Items.Add('CystLDesc4="' + format('4:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
      end;
      else
      begin
         if (cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType2.Selection) then
         begin
            cystList.Add('1');cystList.Add('2')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType3.Selection =  cbLeftOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('3');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType3.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
        else if (cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType3.Selection) then
        begin
            cystList.Add('1');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
        end
        else if (cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType4.Selection) then
        begin
            cystList.Add('1');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('2');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
        end
         else if (cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType3.Selection) then
         begin
            cystList.Add('2');cystList.Add('3')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType4.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('4')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(4, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
         else if (cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType4.Selection) then
         begin
            cystList.Add('2');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType2.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType1.Selection =  cbLeftOvaryCystType3.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('3')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format('3:' + #9 + '%s', [GetOvarianCyst(3, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
         else if (cbLeftOvaryCystType3.Selection =  cbLeftOvaryCystType4.Selection) then
         begin
            cystList.Add('3');cystList.Add('4')
            lbMergeDataMergeFields.Items.Add('CystLDesc="' + format('1:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType3.Selection, 2, 'L',cystList)]) + '"');
            if(cbLeftOvaryCystType2.Selection =  cbLeftOvaryCystType1.Selection) then
            begin
              cystList.clear;
              cystList.Add('1');cystList.Add('2')
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetMultiCystDescriptions(cbLeftOvaryCystType1.Selection, 2, 'L',cystList)]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3=""');
              lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end
            else
            begin
              lbMergeDataMergeFields.Items.Add('CystsLDesc2="' + format('2:' + #9 + '%s', [GetOvarianCyst(1, 'L')]) + '"');
              lbMergeDataMergeFields.Items.Add('CystLDesc3="' + format( '3:' + #9 + '%s', [GetOvarianCyst(2, 'L')]) + '"');
               lbMergeDataMergeFields.Items.Add('CystLDesc4=""');
            end;
         end
      end;
    end;
  end;
end;

function GetLeftFollicleCount: integer
begin
  result := 0;
  result := seLeftFolCount.Value + seLeftLeadFollicle.Value;
end;

function GetLeftOvary: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  if cbLeftOvaryIdentified.Checked then
  begin
    v1 := trunc(seLeftOvaryLength.Value);
    v2 := trunc(seLeftOvaryWidth.Value);
    v3 := trunc(seLeftOvaryHeight.Value);
    v4 := trunc(seLeftOvaryCC.Value * 10) / 10;
    if ((cbLeftOvaryVisualisedTA.Checked) and (not cbLeftOvaryVisualisedTV.Checked) and (not cbPerformedTransAbdom.Checked)) then
    begin
     { if cbLeftPCO.Checked then
        result := result + format('The multifollicular left ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
    else  }
      result := Format('The left ovary was only visualised on transabdominal ultrasound and measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
  end
  else
  begin
    {if cbLeftPCO.Checked then
      result := result + format('The multifollicular left ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')])
    else }
      result := Format('The left ovary measured %s', [GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]);
  end;
  if (seLeftResidualFolCount.visible) and ((seLeftResidualFolCount.value) > 0) then
  begin
     if seLeftResidualFolCount.value = 1 then
     begin
       result := result + ' and contained single residual follicle ';
        result := result + format(' (%d-%dmm). ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
     end;
     else if (seLeftResidualFolCount.visible) and  (seLeftResidualFolCount.value) > 1 then
     begin
       result := result +  format(' and contained %s residual follicles', [GetNumberString(trunc(seLeftResidualFolCount.value))]);
       result := result + format(' (%d-%dmm). ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
     end;
  end
  else if GetLeftFollicleCount > 0 then
  begin
    if GetLeftFollicleCount > 1 then
    begin
      result := result + format(' and contained %s follicles', [GetNumberString(trunc(GetLeftFollicleCount))]);
      if GetLeftFollicleCount > 2 then
      begin
        if cbLeftLeadFollicle.Checked then
        begin
          v1 := trunc(seLeftLeadFollicleSize.value);
          v2 := trunc(seLeftLeadFollicleSize2.Value);
          v3 := trunc(seLeftLeadFollicleSize3.value);
          if v1 > 0 then
          begin
            if v2 > 0 then
            begin
              if v3 > 0 then
              begin
                if GetLeftFollicleCount > 3 then
                begin
                  if GetLeftFollicleCount > 4 then
                    result := result + format(' (lead follicles %dmm, %dmm, %dmm, rest %d-%dmm). ', [v1, v2, v3, trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)])
                  else
                    result := result + format(' (lead follicles %dmm, %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, v3, trunc(seLeftFollicle1Size.Value)]);
                end
                else
                  result := result + format(' (lead follicles %dmm, %dmm, %dmm). ', [v1, v2, v3])
              end
              else
              begin
                if GetLeftFollicleCount > 3 then
                  result := result + format(' (lead follicles %dmm, %dmm, rest %d-%dmm). ', [v1, v2, trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)])
                else
                  result := result + format(' (lead follicles %dmm, %dmm, and %dmm antral follicle). ', [v1, v2, trunc(seLeftFollicle1Size.Value)]);
              end;
            end
            else
            begin
              if trunc(seLeftFolSize.Value) > 0 then
                result := result + format(' (lead follicle %dmm, rest %d-%dmm). ', [v1, trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)])
              else
                result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seLeftFollicle1Size.Value)]);
            end;
          end;
        end
        else
          result := result + format(' (%d-%dmm). ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
      end
      else
      begin
        if cbLeftLeadFollicle.Checked then
        begin
          v1 := trunc(seLeftLeadFollicleSize.value);
          v2 := trunc(seLeftLeadFollicleSize2.Value);
          v3 := trunc(seLeftLeadFollicleSize3.value);
          if v1 > 0 then
          begin
            if v2 > 0 then
            begin
              if v3 > 0 then
              begin
                result := result + format(' (lead follicles %dmm, %d and %dmm). ', [v1, v2, v3])
              end
              else
              begin
                result := result + format(' (lead follicles %dmm and %dmm). ', [v1, v2])
              end;
            end
            else
            begin
    //          result := result + format(' (lead follicle %dmm, antral follicle %dmm). ', [v1, trunc(seRightFollicle1Size.Value)])
              result := result + format(' (lead follicle %dmm, and %dmm antral follicle). ', [v1, trunc(seRightFollicle1Size.Value)]);
            end;
          end;
        end
        else
          result := result + format(' of %dmm and %dmm. ', [trunc(seLeftFollicle1Size.Value), trunc(seLeftFolSize.Value)]);
      end;
    end
    else
    begin
      if cbLeftLeadFollicle.Checked then
        result := result + format(' and contained a single lead follicle of %dmm. ', [trunc(seLeftLeadFollicleSize.Value)])
      else
        result := result + format(' and contained a single antral follicle of %dmm. ', [trunc(seLeftFollicle1Size.Value)]);
    end;
  end
  else
  begin
    result := result + ' and contained no follicles. ';
  end;
end
else
begin
    if not(cbRightOvaryIdentified.checked) then
    begin
      if cbRightOoporectomy.checked and  cbLeftOoporectomy.checked then
        result := result + '';
    end;
    else
    begin
      result := result + 'The left ovary was not identified';
      if cbLeftOoporectomy.checked then
         result := result + ', consistent with previous surgical removal';
       result := result + '.  ';
    end
 end;
end;

function GetIOTACystMeasure(inside) : string;
var
 vl, vw, vd, vv: TcxSpinEdit;
 IOTACystNumber : String;
begin
  result := '';
  IOTACystNumber := '';
  if inside = 'right' then
  begin
    if(cbRightOvaryCystType1.enabled)and (cbRightOvaryCystType1.selection = 12) then
       IOTACystNumber := '1';
    else if(cbRightOvaryCystType2.enabled)and (cbRightOvaryCystType2.selection = 12) then
       IOTACystNumber := '2';
    else if(cbRightOvaryCystType3.enabled)and (cbRightOvaryCystType3.selection = 12) then
       IOTACystNumber := '3';
    else if(cbRightOvaryCystType4.enabled)and (cbRightOvaryCystType4.selection = 12) then
       IOTACystNumber := '4';
    if IOTACystNumber <> '' then
    begin
      vl := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystLength' + IOTACystNumber);
      vw := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystWidth' + IOTACystNumber);
      vd := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystDepth' + IOTACystNumber);
      vv := TWinControl(tsOvaries.Owner).FindComponent('seRightOvaryCystVolume' + IOTACystNumber);
      result := format(' %s ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
  end;
  else if inside = 'left' then
  begin
    if(cbLeftOvaryCystType1.enabled)and (cbLeftOvaryCystType1.selection = 12) then
       IOTACystNumber := '1';
    else if(cbLeftOvaryCystType2.enabled)and (cbLeftOvaryCystType2.selection = 12) then
       IOTACystNumber := '2';
    else if(cbLeftOvaryCystType3.enabled)and (cbLeftOvaryCystType3.selection = 12) then
       IOTACystNumber := '3';
     else if(cbLeftOvaryCystType4.enabled)and (cbLeftOvaryCystType4.selection = 12) then
       IOTACystNumber := '4';
    if IOTACystNumber <> '' then
    begin
      vl := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystLength' + IOTACystNumber);
      vw := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystWidth' + IOTACystNumber);
      vd := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystDepth' + IOTACystNumber);
      vv := TWinControl(tsOvaries.Owner).FindComponent('seLeftOvaryCystVolume' + IOTACystNumber);
      result := result + format(' %s ', [GetOvarianCystMeasurement(vl.value, vw.value, vd.value, vv.value, 'mm')]);
    end;
  end;
end;

function GetOvaryIOTAClassification(inSide: String) : String;
var
   vccbClassification : TcxComboBox;
begin
   result := '';
   if(inside = 'right') then
     vccbClassification := TWinControl(pgIOTA.Owner).FindComponent('ccbROClassification');
   else if(inside = 'left') then
     vccbClassification := TWinControl(pgIOTA.Owner).FindComponent('ccbLOClassification');
   if (assigned(vccbClassification)) and (vccbClassification.text <> '') then
   begin
     case  vccbClassification.ItemIndex of
       0: result := result + 'A unilocular cyst';
       1: result := result + 'A unilocular-solid cyst';
       2: result := result + 'A multilocular cyst';
       3: result := result + 'A multilocular-solid cyst';
       4: result := result + 'A solid tumour';
       5: result := result + 'An un-classifiable cyst';
     end;
     if  Trim(GetIOTACystMeasure(inside)) <> '' then
       result := result + ' measuring ' + GetIOTACystMeasure(inside)
     result := result + ' was identified in the '+ inside +' ovary. ';
   end;
end;

function GetRightOvaryIOTACystWall : String;
begin
  result := '';
  if cbROSmoothYes.checked then
    result := result + ' was smooth with neither mural irregularity nor papillary projections. ';
  else
    result := result + 'had ';  
  if (cbROPPNo.Checked)then
  begin
       if (cbROMINo.Checked) then
         result := result + 'neither mural irregularity nor papillary projections. '
       else if (cbROMIYes.checked) then
         result := result + 'mural irregularity but no pappilary projections. '
  end;
  else if (cbROPPYes.Checked)then
  begin
     if (cbROMINo.Checked) then
         result := result + 'no mural irregularity but ';
     else if (cbROMIYes.checked) then
         result := result + 'mural irregularity and '
     if ((seROPPNumber.enabled)) then
     begin
       if (seROPPNumber.value) > 1 then
          result := result +  'multiple '
       else if seROPPNumber.value = 1 then
          result := result + 'a single '

       if cbROVascularityYes.checked then
          result := result + 'vascular '
       else if cbROVascularityNo.Checked then
          result := result + 'avascular '

        if seROPPNumber.value > 1 then
          result := result + 'papillary projections '
        else
          result := result + 'papillary projection '

       if (trim(GetIntegerMeasuredString(trunc(seROPPL.value),trunc(seROPPW.value),trunc(seROPPD.Value),-1,'mm')) <> '') then
       begin
          result := result + '('
          if (seROPPNumber.value > 1) then
            result := result + 'largest '
          result := result + GetIntegerMeasuredString(trunc(seROPPL.value),trunc(seROPPW.value),trunc(seROPPD.Value),-1,'mm') +')';
       end;
    end;
  end;
  if result <> '' then
  begin
     result := 'The cyst wall ' + result;
     result := AddFullStopToEnd(result);
  end;
  If (seROThickestSeptum.value) > 0 then
    result := result + 'Maximum septal thickness measured '+ floattoStr(seROThickestSeptum.value) + 'mm. ';
end;

function GetRightOvaryIOTAInternalContents : String;
begin
result := '';
   if ccbROInternalContents.text <> '' then
   begin
       if ccbROInternalContents.ItemIndex = 4 then
       begin
          case ccbROMixed.itemIndex of
            0: result := result + 'were of mixed echogenicity. ';
            1: result := result + 'were of mixed echogenicity with a blood fluid level. ';
            2: result := result + 'were of mixed echogenicity with a fat fluid level. ';
            3: result := result + 'were of mixed echogenicity suggestive of an abscess. '
          end;  
       end;
       else
       begin
          case ccbROInternalContents.ItemIndex of
           0: result := result + 'were anechoic. ';
           1: result := result + 'were of low level echoes. ';
           2: result := result + 'were of ground glass echoes. ';
           3: result := result + 'included echoes of internal haemorrhage. '
          end;
       end;
   end;
   if result <> '' then
      result := 'The cyst contents ' + result;
end;

function GetRightOvaryIOTASolidElements :String
begin
  result := '';
  if cbROSolidElementsNo.checked then
  begin
     result := result + 'No solid elements were present.  ';
  end;
  else if cbROSolidElementsYes.checked then
  begin
       if seRoSolidElementsNumber.value > 1 then
       begin
         result := result + InItCaps(GetNumberString(seRoSolidElementsNumber.value),False) +' solid areas were present';
         if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
         begin
           result := result + ', the largest measuring ' +(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
         end;
       end;
       else
       begin
          result := result + 'A solid area';
          if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
            result :=result + ' measuring '+ trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
          result := result + ' was present. ';
       end;
  end;
  if (result <> '') then
    result := AddFullStopToEnd(result);
end;

function GetRightOvaryIOTAAscites : String;
begin
 result := '';
   if (cbROAscitesYes.checked) then
   begin
     result := result + 'Ascites was present. ';
   end
   else if(cbROAscitesNo.checked) then
   begin
     result := result + 'No ascites was present. '
   end;
end;

function GetRightOvaryIOTAAppearance: String;
begin
result := '';
 if trim(ccbROAppearance.text) <> '' then
 begin
    case ccbROAppearance.ItemIndex of
      0: Result := result + 'suggest benign pathology. ';
      1: Result := result + 'raise the possibility of malignancy. ';
      2: Result := result + 'are not clearly classifable as either benign or malignant. ';
    end;
 end;
 if result <> '' then
  result := 'The features of this cyst '+ result;
end;

function GetRightOvaryIOTAVascularity: String;
var
 vPPRI, vPPPSV ,vNoVascularity: String;
 vSepRI, vSepPSV : String;
 vSolidRI, vSolidPSV : String;
begin
 result := '';
 vPPRI := '';
 vPPPSV := '';
 vSepRI := '';
 vSepPSV := '';
 vSolidRI := '';
 vSolidPSV := '';

 if (cbROVSYes.Checked) or (cbROSeptumYes.Checked) or (cbROSolidYes.Checked) then
 begin
    // result := result + 'Doppler insonation revealed';
   if (cbROVSYes.Checked) then
   begin
     if trim(ccbROPPDoppler.text) <> '' then
     begin
       case ccbROPPDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the papillary projection';
      if (seROPPRI.enabled) and (seROPPRI.value > 0) then
     begin
       vPPRI := vPPRI + 'RI = ' + floatToStr(seROPPRI.value);
     end;
     if (seROPPPSV.enabled) and (seROPPPSV.value > 0) then
     begin
       vPPPSV := vPPPSV + 'PSV ' + floatToStr(seROPPPSV.value) + 'cm/s';
     end;
     if (vPPRI <> '') and (vPPPSV <> '') then
      result := result + ' ('+ vPPRI + ', '+ vPPPSV + ')'
     else if (vPPRI <> '') or (vPPPSV <> '') then
      result := result + ' (' + vPPRI + vPPPSV + ')'
    end;
  if cbROSeptumYes.Checked then
  begin
     if result <> '' then
       result := result +', ';
     if trim(ccbROSepDoppler.text) <> '' then
     begin
       case ccbROSepDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
     if  result <> '' then
        result := result + ' within the septum';
     if (seROSepRI.enabled) and (seROSepRI.value > 0) then
     begin
       vSepRI := vSepRI + 'RI = ' + floatToStr(seROSepRI.value);
     end;
     if (seROSepPSV.enabled) and (seROSepPSV.value > 0) then
     begin
       vSepPSV := vSepPSV + 'PSV ' + floatToStr(seROSepPSV.value) + 'cm/s';
     end;
     if (vSepRI <> '') and (vSepPSV <> '') then
      result := result + ' ('+ vSepRI + ', '+ vSepPSV + ')'
     else if (vSepRI <> '') or (vSepPSV <> '') then
      result := result + ' (' + vSepRI + vSepPSV + ')'
    end;
  if cbROSolidYes.Checked then
  begin
     if result <> '' then
         result := result +', ';
     if trim(ccbROSolidDoppler.text) <> '' then
     begin
       case ccbROSolidDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the solid area';
      if (seROSolidRI.enabled) and (seROSolidRI.value > 0) then
     begin
       vSolidRI := vSolidRI + 'RI = ' + floatToStr(seROSolidRI.value);
     end;
     if (seROSolidPSV.enabled) and (seROSolidPSV.value > 0) then
     begin
       vSolidPSV := vSolidPSV + 'PSV ' + floatToStr(seROSolidPSV.value) + 'cm/s';
     end;
     if (vSolidRI <> '') and (vSolidPSV <> '') then
      result := result + ' ('+ vSolidRI + ', '+ vSolidPSV + ')'
     else if (vSolidRI <> '') or (vSolidPSV <> '') then
      result := result + ' (' + vSolidRI + vSolidPSV + ')'
   end;
   if result <> '' then
      result := 'Doppler insonation revealed ' + AddFullstop(result);
 end;
 if (cbROVSNo.checked) or (cbROSeptumNo.checked) or (cbROSolidNo.checked) then
 begin
 vNoVascularity := '';
      if (cbROVSNo.checked) then
      begin
        if (cbROSeptumNo.checked) then
           if (cbROSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'papillary projection, septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'papillary projection or septum.'
         else
            vNoVascularity :=  vNoVascularity + 'papillary projection.'
      end
      else  if (cbROSeptumNo.checked) then
      begin
           if (cbROSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'septum.'
      end
      else if (cbROSolidNo.checked) then
          vNoVascularity := vNoVascularity + 'solid area.';
     if vNoVascularity <> '' then
     result := result + 'No increase in vascularity was seen in the ' +  vNoVascularity;
   end;
end;

function GetLeftOvaryIOTACystWall: String;
begin
  result := '';
  if cbLOSmoothYes.checked then
     result := result + ' was smooth with neither mural irregularity nor papillary projections. ';
  else
    result := result + 'had ';
  if (cbLOPPNo.Checked)then
  begin
       if (cbLOMINo.Checked) then
         result := result + 'neither mural irregularity nor papillary projections. '
       else if (cbLOMIYes.checked) then
         result := result + 'mural irregularity but no pappilary projections. '
  end;
  else if (cbLOPPYes.Checked)then
  begin
     if (cbLOMINo.Checked) then
         result := result + 'no mural irregularity but ';
     else if (cbLOMIYes.checked) then
         result := result + 'mural irregularity and '
     if ((seLOPPNumber.enabled)) then
     begin
       if (seLOPPNumber.value) > 1 then
          result := result +  'multiple '
       else if seLOPPNumber.value = 1 then
          result := result + 'a single '

       if cbLOVascularityYes.checked then
          result := result + 'vascular '
       else if cbLOVascularityNo.Checked then
          result := result + 'avascular '

        if seLOPPNumber.value > 1 then
          result := result + 'papillary projections '
        else
          result := result + 'papillary projection '

       if (trim(GetIntegerMeasuredString(trunc(seLOPPL.value),trunc(seLOPPW.value),trunc(seLOPPD.Value),-1,'mm')) <> '') then
       begin
           result := result + '(' ;
           if (seLOPPNumber.value > 1) then
              result := result + 'largest ';
           result := result + GetIntegerMeasuredString(trunc(seLOPPL.value),trunc(seLOPPW.value),trunc(seLOPPD.Value),-1,'mm') +')';
       end;
    end;
  end;
  if result <> '' then
     result := 'The cyst wall ' + result;
  result := AddFullStopToEnd(result);   
end;

function GetLeftOvaryIOTAInternalContents : String;
begin
result := '';
   if ccbLOInternalContents.text <> '' then
   begin
       if ccbLOInternalContents.ItemIndex = 4 then
       begin
          case ccbLOMixed.itemIndex of
            0: result := result + 'were of mixed echogenicity. ';
            1: result := result + 'were of mixed echogenicity with a blood fluid level. ';
            2: result := result + 'were of mixed echogenicity with a fat fluid level. ';
            3: result := result + 'were of mixed echogenicity suggestive of an abscess. '
          end;  
       end;
       else
       begin
          case ccbLOInternalContents.ItemIndex of
           0: result := result + 'were anechoic. ';
           1: result := result + 'were of low level echoes. ';
           2: result := result + 'were of ground glass echoes. ';
           3: result := result + 'included echoes of internal haemorrhage. '
          end;
       end;
   end;
   if result <> '' then
      result := 'The cyst contents ' + result;
end;

function GetLeftOvaryIOTASolidElements :String
begin
  result := '';
  if cbLOSolidElementsNo.checked then
  begin
     result := result + 'No solid elements were present.  ';
  end;
  else if cbLOSolidElementsYes.checked then
  begin
       if seRoSolidElementsNumber.value > 1 then
       begin
         result := result + InItCaps(GetNumberString(seRoSolidElementsNumber.value),False) +' solid areas were present';
         if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
         begin
           result := result + ', the largest measuring ' +(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
         end;
       end;
       else
       begin
          result := result + 'A solid area';
          if trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm')) <> '' then
            result :=result + ' measuring '+ trim(GetIntegerMeasuredString(trunc(seRoSolidEleL.value),trunc(seRoSolidEleW.value),trunc(seRoSolidEleD.Value),trim(seRoSoliElevol.Value),'mm'));
          result := result + ' was present. ';
       end;
  end;
  if result <> '' then
     result := AddFullStopToEnd(result);
end;

function GetLeftOvaryIOTAAscites: String;
begin
 result := '';
   if (cbLOAscitesYes.checked) then
   begin
     result := result + 'Ascites was present. ';
   end
   else if(cbLOAscitesNo.checked) then
   begin
     result := result + 'No ascites was present. '
   end;
end;

function GetLeftOvaryIOTAAppearance : String;
begin
result := '';
 if trim(ccbLOAppearance.text) <> '' then
 begin
    case ccbLOAppearance.ItemIndex of
      0: Result := result + 'suggest benign pathology. ';
      1: Result := result + 'raise the possibility of malignancy. ';
      2: Result := result + 'are not clearly classifable as either benign or malignant. ';
    end;
 end;
 if result <> '' then
  result := 'The features of this cyst '+ result;
end;

function GetLeftOvaryIOTAVascularity: String;
var
 vPPRI, vPPPSV ,vNoVascularity: String;
 vSepRI, vSepPSV : String;
 vSolidRI, vSolidPSV : String;
begin
 result := '';
 vPPRI := '';
 vPPPSV := '';
 vSepRI := '';
 vSepPSV := '';
 vSolidRI := '';
 vSolidPSV := '';

 if (cbLOVSYes.Checked) or (cbLOSeptumYes.Checked) or (cbLOSolidYes.Checked) then
 begin
    // result := result + 'Doppler insonation revealed';
   if (cbLOVSYes.Checked) then
   begin
     if trim(ccbLOPPDoppler.text) <> '' then
     begin
       case ccbLOPPDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the papillary projection';
      if (seLOPPRI.enabled) and (seLOPPRI.value > 0) then
     begin
       vPPRI := vPPRI + 'RI = ' + floatToStr(seLOPPRI.value);
     end;
     if (seLOPPPSV.enabled) and (seLOPPPSV.value > 0) then
     begin
       vPPPSV := vPPPSV + 'PSV ' + floatToStr(seLOPPPSV.value) + 'cm/s';
     end;
     if (vPPRI <> '') and (vPPPSV <> '') then
      result := result + ' ('+ vPPRI + ', '+ vPPPSV + ')'
     else if (vPPRI <> '') or (vPPPSV <> '') then
      result := result + ' (' + vPPRI + vPPPSV + ')'
    end;
  if cbLOSeptumYes.Checked then
  begin
     if result <> '' then
       result := result +', ';
     if trim(ccbLOSepDoppler.text) <> '' then
     begin
       case ccbLOSepDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
     if  result <> '' then
        result := result + ' within the septum';
     if (seLOSepRI.enabled) and (seLOSepRI.value > 0) then
     begin
       vSepRI := vSepRI + 'RI = ' + floatToStr(seLOSepRI.value);
     end;
     if (seLOSepPSV.enabled) and (seLOSepPSV.value > 0) then
     begin
       vSepPSV := vSepPSV + 'PSV ' + floatToStr(seLOSepPSV.value) + 'cm/s';
     end;
     if (vSepRI <> '') and (vSepPSV <> '') then
      result := result + ' ('+ vSepRI + ', '+ vSepPSV + ')'
     else if (vSepRI <> '') or (vSepPSV <> '') then
      result := result + ' (' + vSepRI + vSepPSV + ')'
    end;
  if cbLOSolidYes.Checked then
  begin
     if result <> '' then
         result := result +', ';
     if trim(ccbLOSolidDoppler.text) <> '' then
     begin
       case ccbLOSolidDoppler.ItemIndex of
         0:result := result + '';
         1:result := result + ' minimal flow';
         2:result := result + ' moderately increased flow';
         3:result := result + ' highly increased vascularity';
       end;
     end;
      if  result <> '' then
        result := result + ' within the solid area';
      if (seLOSolidRI.enabled) and (seLOSolidRI.value > 0) then
     begin
       vSolidRI := vSolidRI + 'RI = ' + floatToStr(seLOSolidRI.value);
     end;
     if (seLOSolidPSV.enabled) and (seLOSolidPSV.value > 0) then
     begin
       vSolidPSV := vSolidPSV + 'PSV ' + floatToStr(seLOSolidPSV.value) + 'cm/s';
     end;
     if (vSolidRI <> '') and (vSolidPSV <> '') then
      result := result + ' ('+ vSolidRI + ', '+ vSolidPSV + ')'
     else if (vSolidRI <> '') or (vSolidPSV <> '') then
      result := result + ' (' + vSolidRI + vSolidPSV + ')'
   end;
   if result <> '' then
      result := 'Doppler insonation revealed ' + AddFullstop(result);
 end;
 if (cbLOVSNo.checked) or (cbLOSeptumNo.checked) or (cbLOSolidNo.checked) then
 begin
 vNoVascularity := '';
      if (cbLOVSNo.checked) then
      begin
        if (cbLOSeptumNo.checked) then
           if (cbLOSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'papillary projection, septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'papillary projection or septum.'
         else
            vNoVascularity :=  vNoVascularity + 'papillary projection.'
      end
      else  if (cbLOSeptumNo.checked) then
      begin
           if (cbLOSolidNo.checked) then
               vNoVascularity := vNoVascularity + 'septum or solid area.';
           else
               vNoVascularity :=  vNoVascularity + 'septum.'
      end
      else if (cbLOSolidNo.checked) then
          vNoVascularity := vNoVascularity + 'solid area.';
     if vNoVascularity <> '' then
     result := result + 'No increase in vascularity was seen in the ' +  vNoVascularity;
   end;
end;

function IsAdnexalNormal: Boolean;
begin
  result := not (((cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0)) or ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)));
end;

function GetPluralCystName(inName: String): String;
begin
  result := inName;
  if Trim(UpperCase(inName)) = 'HYDROSALPINX' then result := 'hydrosalpinges';
  else
  if Trim(UpperCase(inName)) = 'FIMBRIAL CYST' then result := 'fimbrial cysts';
  else
  if Trim(UpperCase(inName)) = 'SOLID MASS' then result := 'solid masses';
  else
  if Trim(UpperCase(inName)) = 'PELVIC MASS' then result := 'pelvic masses';
end;

function GetAdnexalConc: string;
var
  i, vIdx, vRightIdx, vLeftIdx: Integer;
  vRight, vLeft, vBi, vt: string;
  vControl: TcxComboBox;
  vRightList, vLeftList, vBiList: TStringList;
  vPos: integer;
begin
  result := '';
  if (IsAdnexalNormal) and ((seRightOvarianCystsCount.Value + seLeftOvarianCystsCount.Value + seRightAdnexalMasses.Value + seLeftAdnexalMasses.Value) = 0) {and (not cbEFFNormal.Checked)} then
    result := '';//'Normal adnexa. ';
  begin
    vRightIdx := 0;
    vLeftIdx := 0;
    vRight := ''; vBi := '';
    vRightList := TStringList.Create;
    vLeftList := TStringList.Create;
    vBiList := TStringList.Create;
    if cbRightAdnexalMass.Checked then
    begin
      for i := 0 to seRightAdnexalMasses.Value - 1 do
      begin
        vControl := TWinControl(tsPelvis.Owner.FindComponent('cbRightAdnexalAppearance' + IntToStr(i + 1)));
        if (assigned(vControl)) {and (TcxComboBox(vControl).Text <> '')} then
        begin
          if (GLocConclusion = '') or (TcxComboBox(vControl).ItemIndex <> 3) then
          begin
            vIdx := vRightList.IndexOf(Trim(TcxComboBox(vControl).Text));
            if vIdx < 0 then
            begin
              if (Trim(TcxComboBox(vControl).Text) <> '') and (trim(uppercase(TcxComboBox(vControl).Text)) <> 'OTHER') then
              begin
                vRightList.Add(Trim(TcxComboBox(vControl).Text))
              end;
              else
              begin
                if vRightList.IndexOf('pelvic mass') < 0 then
                   vRightList.Add('pelvic mass');
              end;
            end
            else
            begin
              vRightIdx := vRightIdx or (1 shl vIdx);
            end;
          end;
        end;
      end;
    end;
    vLeft := '';
    vLeftList := TStringList.Create;
    if cbLeftAdnexalMass.Checked then
    begin
      for i := 0 to seLeftAdnexalMasses.Value - 1 do
      begin
        vControl := TWinControl(tsPelvis.Owner.FindComponent('cbLeftAdnexalAppearance' + IntToStr(i + 1)));
        if (assigned(vControl)) {and (TcxComboBox(vControl).Text <> '')} then
        begin
          if (GLocConclusion = '') or (TcxComboBox(vControl).ItemIndex <> 3) then
          begin
            vIdx := vLeftList.IndexOf(Trim(TcxComboBox(vControl).Text));
            if vIdx < 0 then
            begin
              if (Trim(TcxComboBox(vControl).Text) <> '') and (trim(uppercase(TcxComboBox(vControl).Text)) <> 'OTHER') then
                vLeftList.Add(Trim(TcxComboBox(vControl).Text))
              else
              begin
               if vLeftList.IndexOf('pelvic mass') < 0 then
                 vLeftList.Add('pelvic mass');
              end;
            end
            else
            begin
              vLeftIdx := vLeftIdx or (1 shl vIdx);
            end
          end;
        end;
      end;
    end;
    if vRightList.Count > 0 then
    begin
      for i := vRightList.Count-1 downto 0 do
      begin
        vIdx := vLeftList.IndexOf(vRightList[i]);
        if vIdx > -1 then
        begin
          if (GLocConclusion = '') or (pos('LOCU', upperCase(vRightList[i])) = 0) then
            vBiList.Add(vRightList[i]);
          vLeftList.Delete(vIdx);
          vRightList.Delete(i);
        end;
      end;
    end;
    if vRightList.Count > 0 then
    begin
      for i := 0 to vRightList.Count-1 do
      begin
        if ((i = 1) and (vRightList.Count = 2)) then
          vRight := vRight + ' and '
        else
        if ((i = 1) and (vRightList.Count = 3)) then
          vRight := vRight + ', '
        else
        if i = 2 then
          vRight := vRight + ' and ';
        if ((vRightIdx and (i+1)) = (i+1)) then
        begin
          vRight := vRight + GetPluralCystName(vRightList[i]);
          if vRightList[i] = 'solid' then
            vRight := vRight + ' masses' ;
        end
        else
        begin
          vRight := vRight + vRightList[i];
          if vRightList[i] = 'solid' then
            vRight := vRight + ' mass' ;
        end;
      end;
    end;
    if vLeftList.Count > 0 then
    begin
      for i := 0 to vLeftList.Count-1 do
      begin
        if ((i = 1) and (vLeftList.Count = 2)) then
          vLeft := vLeft + ' and '
        else
        if ((i = 1) and (vLeftList.Count = 3)) then
          vLeft := vLeft + ', '
        else
        if i = 2 then
          vleft := vLeft + ' and ';
        if ((vRightIdx and (i+1)) = (i+1)) then
        begin
          vLeft := vLeft + GetPluralCystName(vLeftList[i]);
          if vLeftList[i] = 'solid' then
            vLeft := vLeft + ' masses' ;
        end
        else
        begin
          vLeft := vLeft + vLeftList[i];
          if vLeftList[i] = 'solid' then
            vleft := vLeft + ' mass';
        end;
      end;
    end;
    if vBiList.Count > 0 then
    begin
      for i := 0 to vBiList.Count-1 do
      begin
        if ((i = 1) and (vBiList.Count = 2)) then
          vBi := vBi + ' and '
        else
        if ((i = 1) and (vBiList.Count = 3)) then
          vBi := vBi + ', '
        else
        if i = 2 then
          vBi := vBi + ' and ';
        vBi := vBi + GetPluralCystName(vBiList[i]);
        if vBiList[i] = 'solid' then
          vBi := vBi + ' masses';
      end;
    end;
    if vRight <> '' then
    begin
      if vLeft <> '' then
      begin
        if vBi <> '' then
        begin
          result := 'Right ' + vRight + ', left ' + vLeft + ', and bilateral ' + vBi + ' identified. ';
        end
        else
          result := 'Right ' + vRight + ' and left ' + vLeft + ' identified. ';
      end
      else
      if vBi <> '' then
      begin
        result := 'Right ' + vRight + ', and bilateral ' + vBi + ' identified. ';
      end
      else
        result := 'Right ' + vRight +  ' identified. ';
    end
    else
    begin
      if vLeft <> '' then
      begin
        if vBi <> '' then
        begin
          result := 'Left ' + vLeft + ', and bilateral ' + vBi + ' identified. ';
        end
        else
          result := 'Left ' + vLeft + ' identified. ';
      end
      else
      if vBi <> '' then
      begin
        result := 'Bilateral ' + vBi + ' identified. ';
      end
    end;                                                       
 //   showMessage(result);
    vPos := pos('left loculated fluid identified', result);
    if vPos > 0 then
    begin
      if trim(copy(result, vPos + 21, length(result))) = 'identified.' then
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid was identified in the left adnexal region. '; // + copy(result, vPos + 21, length(result));  
      else
        result := copy(result, 1, vPos-1) + 'an area of loculated fluid in the left adnexal region' + copy(result, vPos + 31, length(result));
    end;
    vPos := pos('Right loculated fluid', result);          
    if vPos > 0 then
    begin        
      if trim(copy(result, vPos + 21, length(result))) = 'identified.' then
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid was identified in the right adnexal region. '; // + copy(result, vPos + 21, length(result));
      else 
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid in the right adnexal region' + copy(result, vPos + 21, length(result));
    end;
    vPos := pos('Left loculated fluid', result);
    if vPos > 0 then                                                                                       
    begin
      if trim(copy(result, vPos + 21, length(result))) = 'identified.' then
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid was identified in the left adnexal region. '; // + copy(result, vPos + 21, length(result));   
      else
        result := copy(result, 1, vPos-1) + 'An area of loculated fluid in the left adnexal region' + copy(result, vPos + 20, length(result));
    end;
    vPos := pos('and loculated fluid', result);
    if vPos > 0 then
    begin
      result := copy(result, 1, vPos-1) + 'an area of loculated fluid' + copy(result, vPos + 19, length(result));
    end;
    if result = 'Left loculated fluid identified.' then result := 'Area of loculated fluid in ppppthe left adnexal region.';
    if result = 'Right loculated fluid identified.' then result := 'Area of loculated fluid in ppppthe right adnexal region.';
    if GLocConclusion <> '' then
      result := result + GLocConclusion;
    //result := result + GetIUCDPlacement(true);
    vRightList.Free;
    vLeftList.Free;                               
    vBiList.Free;
  end;
end;

function GetAdnexalCystString(inIndex: Integer): string;
begin
  result := '';
  if inIndex = 1 then
    result := 'A simple cyst measuring %s was %svisualised in the %s adnexal region, the features consistent with a fimbrial cyst. '
  else if inIndex = 2 then
    result := 'A cystic tubular lesion measuring %s was %spresent in the %s adnexal region, the appearance consistent with a hydrosalpinx. '
  else if inIndex = 3 then
    result := 'An area of loculated fluid measuring %s was %sseen in the %s adnexal region. '
  else if inIndex = 4 then
    result := 'A solid lesion measuring %s was %sseen in the %s adnexal region. '
  else
    result := 'A mass of mixed echogenicity measuring %s was %sseen in the %s adnexal region. '
end;

function GetDualAdnexalCystString(inIndex: Integer): string;
begin
  result := '';
  if inIndex = 1 then
    result := '%s simple cysts measuring %s%s and %s were %svisualised in the %s adnexal region, the features consistent with fimbrial cysts. '
  else if inIndex = 2 then
    result := '%s cystic tubular lesions measuring %s%s and %s were %spresent in the %s adnexal region, the appearance consistent with hydrosalpinx. '
  else if inIndex = 3 then
    result := '%s areas of loculated fluid measuring %s%s and %s were %sseen in the %s adnexal region. '
  else if inIndex = 4 then
    result := '%s solid lesions measuring %s%s and %s were %sseen in the %s adnexal region. '
  else
    result := '%s masses of mixed echogenicity measuring %s%s and %s were %sseen in the %s adnexal region. '
end;

function GetSingularAdnexalCystsStr(inApp: TcxComboBox; inLength, inWidth, inDepth: Integer; inVolume: Real; inAlso: String; inSide: String): String;
var
  v1, v2, v3, v4: TcxSpinEdit;
begin
  if (inSide = 'right') or (inApp.ItemIndex <> 3) or (GLocConclusion = '') then
  begin
    result := Format(GetAdnexalCystString(inApp.ItemIndex), [GetIntegerMeasuredString(inLength, inWidth, inDepth, inVolume, 'mm'), inAlso, inSide]);
    if inside = 'right' then
    begin
      if (inApp.ItemIndex = 3) and ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)) then
      begin
        for i := 1 to seLeftAdnexalMasses.Value do
        begin
          vControl := TcxComboBox(tsPelvis.Owner).FindComponent('cbLeftAdnexalAppearance' + intToStr(i));
          if (assigned(vControl)) and (vControl.ItemIndex = 3) then
          begin
            v1 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalLength' + intToStr(i));
            v2 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalWidth' + intToStr(i));
            v3 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalDepth' + intToStr(i));
            v4 := TcxSpinEdit(tsPelvis.Owner).FindComponent('seLeftAdnexalVolume' + intToStr(i));
            GLeftLoc :=  Format('Loculated fluid measuring %s was also present in the left adnexal region. ', [GetIntegerMeasuredString(trunc(v1.Value), trunc(v2.Value), trunc(v3.Value), v4.Value, 'mm')]);
            GLocConclusion := 'Loculated fluid was present in both adnexal regions. ';
            break;
          end;
        end;
      end;
    end;
  end
  else
  begin
    if (GLocConclusion <> '') and (inApp.ItemIndex = 3) and (inSide = 'left') then
      result := GLeftLoc
    else
      result := '';
  end;
end;

function GetAdnexalDesc: string;
var
  vRightLoc, vLeftLoc: Boolean;
  i: Integer;
  vControl: TcxComboBox;
begin
  result := '';
  GLocConclusion := '';
  GLeftLoc := '';
  vRightLoc := False;
  vLeftLoc := False;
  if ((cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0)) or ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)) then
  begin
    if (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0) then
    begin
      if seRightAdnexalMasses.Value = 1 then
      begin
        result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
      end
      else
      if seRightAdnexalMasses.Value = 2 then
      begin
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'), '', 'right']);
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance2, trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'also ', 'right');
        end;
      end
      else
      if seRightAdnexalMasses.Value = 3 then
      begin
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance2.ItemIndex) and (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Three',
                          GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'),
                   ', ' + GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'),
                          GetIntegerMeasuredString(trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'mm'), '', 'right']);
        end
        else
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'), '', 'right']);
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance3, trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'also ', 'right');
        end
        else
        if (cbRightAdnexalAppearance2.ItemIndex = cbRightAdnexalAppearance3.ItemIndex) then
        begin
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance3.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'mm'), 'also ', 'right']);
        end
        else
        if (cbRightAdnexalAppearance1.ItemIndex = cbRightAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbRightAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'mm'), 'also ', 'right']);
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance2, trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'also ', 'right');
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance1, trunc(seRightAdnexalLength1.Value), trunc(seRightAdnexalWidth1.Value), trunc(seRightAdnexalDepth1.Value), seRightAdnexalVolume1.Value, '', 'right');
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance2, trunc(seRightAdnexalLength2.Value), trunc(seRightAdnexalWidth2.Value), trunc(seRightAdnexalDepth2.Value), seRightAdnexalVolume2.Value, 'also ', 'right');
          result := result + GetSingularAdnexalCystsStr(cbRightAdnexalAppearance3, trunc(seRightAdnexalLength3.Value), trunc(seRightAdnexalWidth3.Value), trunc(seRightAdnexalDepth3.Value), seRightAdnexalVolume3.Value, 'also ', 'right');
        end;
      end;
    end;
    if (cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0) then
    begin
      if (cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0) then
        result := result + #13#10  + #13#10;
      if seLeftAdnexalMasses.Value = 1 then
      begin
        result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
      end
      else
      if seLeftAdnexalMasses.Value = 2 then
      begin
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'), '', 'left']);
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance2, trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'also ', 'left');
        end;
      end
      else
      if seLeftAdnexalMasses.Value = 3 then
      begin
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance2.ItemIndex) and (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Three',
                          GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'),
                   ', ' + GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'),
                          GetIntegerMeasuredString(trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'mm'), '', 'left']);
        end
        else
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance2.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'), '', 'left']);
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance3, trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'also ', 'left');
        end
        else
        if (cbLeftAdnexalAppearance2.ItemIndex = cbLeftAdnexalAppearance3.ItemIndex) then
        begin
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance3.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'mm'), 'also ', 'left']);
        end
        else
        if (cbLeftAdnexalAppearance1.ItemIndex = cbLeftAdnexalAppearance3.ItemIndex) then
        begin
          result := result + Format(GetDualAdnexalCystString(max(0, cbLeftAdnexalAppearance1.ItemIndex)), ['Two',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, 'mm'), '',
                   GetIntegerMeasuredString(trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'mm'), 'also ', 'left']);
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance2, trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'also ', 'left');
        end
        else
        begin
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance1, trunc(seLeftAdnexalLength1.Value), trunc(seLeftAdnexalWidth1.Value), trunc(seLeftAdnexalDepth1.Value), seLeftAdnexalVolume1.Value, '', 'left');
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance2, trunc(seLeftAdnexalLength2.Value), trunc(seLeftAdnexalWidth2.Value), trunc(seLeftAdnexalDepth2.Value), seLeftAdnexalVolume2.Value, 'also ', 'left');
          result := result + GetSingularAdnexalCystsStr(cbLeftAdnexalAppearance3, trunc(seLeftAdnexalLength3.Value), trunc(seLeftAdnexalWidth3.Value), trunc(seLeftAdnexalDepth3.Value), seLeftAdnexalVolume3.Value, 'also ', 'left');
        end;
      end;
    end;
  end;
end;

function GetUterusConclusion: string;
var
  vIsDistorted: Boolean;
  vTemp: integer;
  vLargest: Integer;
  vSmallest: Integer;
  i: integer;
begin
  result := '';
  if cbHysterectomy.Checked then
  begin
    result := 'Absent uterus, consistent with previous hysterectomy. ';
  end
  else
  begin
    if trim(cbUterus.Text) <> '' then
    begin
      if seUterusCC.Value < 30 then
        result := 'Small'
      else if seUterusCC.Value < 101 then
        result := 'Normal size'
      else if seUterusCC.Value <= 200 then
        result := 'Mildly enlarged'
      else
        result := 'Enlarged ';
      if lowercase(trim(cbUterineShape.text)) = 'normal' then
       begin
         if (seUterusCC.Value >=30) and (seUterusCC.Value < 101) then
           result := 'Normal size and shape';
         else
           result := result + ', normal shape';
       end  
      result := result +' '+ trim(cbUterus.Text) + ' ';
      if lowercase(trim(cbUterineShape.text)) = 'bicornuate' then
        result := result + 'bicornuate ';
      if pos('arcuate',lowercase(trim(cbUterineShape.text))) > 0  then
        result := result + 'arcuate ';
      if lowercase(trim(cbUterineShape.text)) = 'left unicornuate' then
        result := result + 'unicornuate ';
      if lowercase(trim(cbUterineShape.text)) = 'right unicornuate' then
        result := result + 'unicornuate ';
      if lowercase(trim(cbUterineShape.text)) = 'septate partial' then
        result := result + 'partial septate ';
      if lowercase(trim(cbUterineShape.text)) = 'septate complete' then
        result := result + 'complete septate ';
    end
    else
    begin
      if seUterusCC.Value < 101 then
        result := result + 'Normal size '
      else if seUterusCC.Value <= 200 then
        result := result + 'Mildly enlarged '
      else
        result := result + 'Enlarged ';
    end;

    result := result + 'uterus';
    if cbAdenomyosisPresent.Checked then
      result := result + ' with features of adenomyosis';
    result := result + GetFibroidConcl;
    result := result + '. ';
  end;
end;

function GetPolpConc: string;
begin
  result := '';
  if not cbHysterectomy.Checked then
  begin
    if sePolypCount.value > 0 then
    begin
     if not((cbSalinehysterograph.ItemIndex = 2) or (cbSalinehysterograph.itemindex = 3)) then
     begin
      if sePolypCount.value = 2 then
         result := ' Two endometrial polyps identified. '
      else
         result := ' Endometrial polyp identified. '
     end;
    end;
  end;
end;

function GetCervicalPolypConc: string;
begin
  result := '';
    if cbCervicalPolyp.checked then
    begin
      result := ' Cervical polyp identified. '
    end;
end;

function GetIncVasAndVenBlind: string;
begin
  result := '';
  if cbMyometrialCystsPresent.checked then
    result := result + ' and myometrial cysts';
  if cbIncVasPresent.Checked then
    result := result + ' with associated increased vascularity';
  if cbVBShadowingPresent.checked then
  begin
    if result <> '' then
      result := result + ' and '
    else
      result := result + ' with ';
    result := result + '''Venetian blind'' posterior acoustic shadowing';
  end;
end;

function GetEndometriumConc: string;
begin
  if not cbHysterectomy.Checked then
  begin
    if trim(cbEndometrium.Text) <> '' then
      if (seEdometriumThickness.Value < 4) and (pos('non specific', LowerCase(Trim((cbEndometrium.Text)))) > 0) then
        result := 'Thin non-specific type endometrium. '
      else if ( cbEndometrium.ItemIndex = 8 ) then
        result := 'Normal postmenopausal endometrium.  ';
      else
        result := Trim(InitCaps(cbEndometrium.Text, False)) + ' endometrium. '
    else
      result := '';
  end
  else
    result := '';
  if GetIUCDPlacement(true) <> '' then
    result := result + GetIUCDPlacement(true);
end;

function getFollicleString : String
begin
  result := '';
      if (cbRightPCO.Checked) and (cbLeftPCO.Checked) then
      begin
        result := result + 'Both ovaries are multifollicular (>24 antral follicles, Martins et al, UOG 2014). This indicates an increased risk of hyperandrogenic anovulation.'
      end;
      if (cbRightAFO.Checked) and (cbLeftAFO.Checked) then
      begin
        result := result + 'Both ovaries have normal antral follicular count (4-24 follicles, Martins et al, UOG 2014).  ';
      end;
      if (cbRightOFO.Checked) and (cbLeftOFO.Checked) then
      begin
        result := result + 'Both ovaries are oligofollicular (1-3 follicles, Martins et al, UOG 2014).  ';
      end;
      if (seLeftFolCount.value = 0) and (seRightFolCount.value = 0) then
      begin
         if (((seRightLeadFollicle.Value) > 0) or (cbRightCorpusLuteum.Checked)) then
         begin
          if (((seLeftLeadFollicle.Value) > 0) or (cbLeftCorpusLuteum.Checked)) then
          begin
            result := result + 'No antral follicles in either ovary.  ';
          end;
         end;
      end;
      if not(pos('Both',result) > 0)then
      begin
         if(cbRightPCO.Checked) then
           result := result + 'The right ovary is multifollicular (>24 antral follicles).  ';//  This may be associated with an increased risk of hyperandrogenic anovulation.  ';
         else if (cbRightOFO.Checked) then
            result := result + 'The right ovary is oligofollicular (1-3 antral follicles).  ';
         else if (cbRightAFO.Checked) then
            result := result +  'The right ovary has normal antral follicular count (4-24 follicles, Martins et al, UOG 2014).  ' ;
         else
         begin
            if not(pos('either',result) > 0)then
            begin
            if (((seRightLeadFollicle.Value) > 0) or (cbRightCorpusLuteum.Checked)) then
              result := result +'No antral follicles in right ovary.  ';
            end;
        end;
      end;
      if not(pos('Both',result) > 0)then
      begin
         if(cbLeftPCO.Checked) then
           result := result + 'The left ovary is multifollicular (>24 antral follicles).  ';//This may be associated with an increased risk of hyperandrogenic anovulation.  ';
         else if (cbLeftOFO.Checked) then
            result := result + 'The left ovary is oligofollicular (1-3 antral follicles).  ';
         else if (cbLeftAFO.Checked) then
            result := result +  'The left ovary has normal antral follicular count (4-24 follicles, Martins et al, UOG 2014).  ' ;
         else
         begin
            if not(pos('either',result) > 0)then
            begin
              if (((seLeftLeadFollicle.Value) > 0) or (cbLeftCorpusLuteum.Checked)) then
                result := result + 'No antral follicles in left ovary.  ';
            end;
         end;
      end;
end;

function GetProcedureConc: string;
begin
  result := '';
  if cbSalinePerformed.Checked then
  begin
    if cbSalinehysterograph.ItemIndex = 1 then
      result := 'Saline hysterography confirmed the presence of a normal endometrial cavity. '
    else if cbSalinehysterograph.ItemIndex = 2 then
      result := 'Saline hysterography confirmed the presence of an endometrial polyp. '
   else if cbSalinehysterograph.ItemIndex = 3 then
      result := 'Saline hysterography confirmed the presence of two endometrial polyps. ';
    else if cbSalinehysterograph.ItemIndex = 4 then
      result := 'Saline hysterography confirmed the presence of a submucosal fibroid. ';

  end;
  if cbTubalPerformed.Checked then
  begin
    if cbTubalPatencyTestSaline.ItemIndex = 1 then
      result := result + 'Bilateral tubal patency was demonstrated. '
    else if cbTubalPatencyTestSaline.ItemIndex = 2 then
      result := result + 'Patency of the right fallopian tube was demonstrated. '
    else if cbTubalPatencyTestSaline.ItemIndex = 3 then
      result := result + 'Patency of the left fallopian tube was demonstrated. '
    else if cbTubalPatencyTestSaline.ItemIndex = 4 then
      result := result + 'Evaluation of tubal patency could not be performed due to unsuccessful cannulation of the cervical canal. '
    else if cbTubalPatencyTestSaline.ItemIndex = 5 then
      result := result + 'Patency of neither fallopian tube was demonstrated, suggestive of bilateral tubal spasm or blockage. ';
  end;
  if cbTubalLevovistPerformed.Checked then
  begin
    if cbTubalPatencyTestLevovist.ItemIndex = 1 then
      result := result + 'Bilateral tubal patency was demonstrated. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 2 then
      result := result + 'Patency of the right fallopian tube was demonstrated. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 3 then
      result := result + 'Patency of the left fallopian tube was demonstrated. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 4 then
      result := result + 'Evaluation of tubal patency could not be performed due to unsuccessful cannulation of the cervical canal. '
    else if cbTubalPatencyTestLevovist.ItemIndex = 5 then
      result := result + 'Patency of neither fallopian tube was demonstrated, suggestive of bilateral tubal spasm or blockage. ';
  end;
  if cbRightCystAspirationPerf.Checked then
    result := result + Format('%1.1f ml drained from right ovarian cyst. ', [seRightOvarianCystAspiration.Value]);
  if cbLeftCystAspirationPerf.Checked then
    result := result + Format('%1.1f ml drained from left ovarian cyst. ', [seLeftOvarianCystAspiration.Value]);
  if cbAscitesPerformed.Checked then
    result := result + Format('%1.1f ml ascitic fluid drained. ', [seAscitesDrainage.Value]);
end;

function  GetIOTAConc : string;
var
vTempstr; vLeftIOTAStr : String;
begin
  result := '';
  vTempStr := '';
  if cbROVSYes.checked then
    result := result + 'Vascular ';
  else if cbROVSNo.Checked then
    result := result + 'Avascular ';
  vTempStr := GetOvaryIOTAClassification('right');
  if (vTempStr <> '') then
  begin
    if result <> '' then
    begin
      vTempStr := stringReplace(vTempStr, 'A ', '');
    end;
      result := result + vTempStr;
  end;
  if result <> '' then
    if GetOvaryIOTAClassification('right') = '' then
      result := result + 'identified in the right ovary. '
  if ccbROAppearance.text <> '' then
  begin
    result := result + ' The features of this cyst '
    case ccbROAppearance.itemIndex of
      0: result := result + 'suggest benign aetiology. '
      1: result := result + 'raise the possibility of malignancy. '
      2: result := result + 'are not clearly classifiable as either benign or malignant. '
    end;
  end;
  //left IOTA conclusion
  vtempStr := '';
  vLeftIOTAStr := '';
  if cbLOVSYes.checked then
    vLeftIOTAStr := vLeftIOTAStr + 'Vascular ';
  else if cbLOVSNo.Checked then
    vLeftIOTAStr := vLeftIOTAStr + 'Avascular ';
  vTempStr := GetOvaryIOTAClassification('left');
  if (vTempStr <> '') then
  begin
    if vLeftIOTAStr <> '' then
    begin
      vTempStr := stringReplace(vTempStr, 'A ', '');
    end;
      vLeftIOTAStr := vLeftIOTAStr + vTempStr;
  end;
  if vLeftIOTAStr <> '' then
    if GetOvaryIOTAClassification('left') = '' then
      vLeftIOTAStr := vLeftIOTAStr + 'identified in the left ovary. '
  if ccbLOAppearance.text <> '' then
  begin
    vLeftIOTAStr := vLeftIOTAStr + ' The features of this cyst '
    case ccbLOAppearance.itemIndex of
      0: vLeftIOTAStr := vLeftIOTAStr + 'suggest benign aetiology. '
      1: vLeftIOTAStr := vLeftIOTAStr + 'raise the possibility of malignancy. '
      2: vLeftIOTAStr := vLeftIOTAStr + 'are not clearly classifiable as either benign or malignant. '
    end;
  end;
  if vLeftIOTAStr <> '' then
  begin
    result := result + vLeftIOTAStr;
  end;

end;

function GetOvaryOverview: string;
begin
  result := '';
  if cbRightOvaryIdentified.Checked then
  begin
    if cbLeftOvaryIdentified.Checked then
    begin
      if cbRightOvaryNormal.Checked then
      begin
        if cbLeftOvaryNormal.Checked then
          result := 'Both ovaries were visualised and appeared normal. '
        else
          result := 'Both ovaries were visualised. The right ovary was normal. ';
      end
      else
      begin
        if cbLeftOvaryNormal.Checked then
          result := 'Both ovaries were visualised. The left ovary was normal. '
        else
          result := 'Both ovaries were visualised. ';
      end;
    end
    else
    begin
      if cbRightOvaryNormal.Checked then
        result := 'The right ovary was visualised and appeared normal. '
      else
        result := 'The right ovary was visualised. ';
    end;
  end
  else
  begin
    result := result + 'The right ovary was not identified. ';
    if cbLeftOvaryIdentified.Checked then
    begin
      if cbLeftOvaryNormal.Checked then
        result := 'The left ovary was visualised and appeared normal. '
      else
        result := 'The left ovary was visualised. ';
    end
    else
      result := result + 'The left ovary was not identified. ';
  end;
end;

function GetNeitherOvaryIdentifiedString: string;
begin
    result := '';
    if ((not(cbRightOvaryIdentified.checked)and not(cbLeftOvaryIdentified.checked))) then
    begin
       if (cbRightOoporectomy.checked) then
       begin
         if (cbLeftOoporectomy.checked) then
            result := result + 'Neither ovary was identified, consistent with previous surgical removal. '
         else
            result := result + 'The right ovary was not identified, consistent with previous surgical removal. '+#13#10#13#10 +'The Left ovary was not identified. '
       end;
       else if (cbLeftOoporectomy.checked) then
       begin
            result := result + 'The right ovary was not identified. '+#13#10#13#10 + 'The left ovary was not identified, consistent with previous surgical removal. '
       end;
       else
          result := result + 'Neither ovary was identified on this occasion. '
    end;
end;

function GetHysterectomyString: string;
begin
  result := '';
  if cbHysterectomy.Checked then
  begin
    if cbCervixPresentNo.Checked then
    begin
      if cbVaultNormalYes.Checked then
      begin
        result := 'The uterine body and cervix were absent, consistent with previous total hysterectomy. The vaginal vault was unremarkable. ';
      end
      else
        result := 'The uterine body and cervix were absent, consistent with previous total hysterectomy. The vaginal vault appeared abnormal. ';
    end
    else if cbCervixPresentYes.Checked then
    begin
      result := Format('The uterine body was absent, consistent with subtotal hysterectomy.  The cervical stump measured %dmm. ', [Trunc(seCervicalLength.Value)]);
    end;
  end;
end;

function GetKidneyAppearance: string;
begin
  result := '';
  if cbRightKidneyYes.Checked then
  begin
    if cbLeftKidneyYes.Checked then
    begin
      result := result + 'Both kidneys were visualised';
      if cbRightReanalAbnormalNo.Checked then
      begin
        if cbLeftReanalAbnormalNo.Checked then
        begin
          result := result + ' and no abnormality was identified';
        end
        else
          result := result + '. The right kidney appeared normal';
      end
      else
      begin
        if cbLeftReanalAbnormalNo.Checked then
        begin
          result := result + '. The left kidney appeared normal';
        end;
      end;
    end
    else
    begin
      result := result + 'The right kidney was visualised';
      if cbRightReanalAbnormalNo.Checked then
        result := result + ' and no abnormality was identified';
    end;
  end
  else
  begin
    if cbLeftKidneyYes.Checked then
    begin
      result := result + 'The left kidney was visualised';
      if cbLeftReanalAbnormalNo.Checked then
        result := result + ' and no abnormality was identified';
    end;
  end;
  if result <> '' then
    result := result + '. ';
end;

function GetEndometriumSize: string;
var
  vTemp: string;
begin
  result := '';
  vTemp := FloatToStr(seEdometriumThickness.Value);
  if ((length(vTemp) > 0) and (vTemp[1] = '8')) or (trunc(seEdometriumThickness.Value) = 11) or (trunc(seEdometriumThickness.Value) = 18) then
    result := 'an '
  else
    result := 'a ';
  result := result + vTemp + 'mm';
end;

function getEndometrialLesion : String
begin
 result := '';
 if  cbEndometrialLensionNo.checked then
 begin
   result := result + 'No focal endometrial lesion was identified.  '; 
 end;
end;

function getEndometriumType : String
begin
  result := '';
  if cbEndometrium.ItemIndex = 8 then
  begin
     result := result + 'postmenopausal endometrium (normal < 4 mm)';
  end;
  else
    result := result +  cbEndometrium.text + ' endometrium';
end;

function GetGetBulkyUterus: string;
begin
  result := '';
  if (seUterusCC.Value >= 100)  and (seUterusCC.Value <= 200) then
    result := 'mildly enlarged ';
  else if  seUterusCC.Value > 200 then
    result := 'enlarged ';
end;

function GetLargerMyometrium: string;
begin
  result := '';
  if spAPAnterior.value > spAPPosterior.Value then
    result := 'anterior'
  else
    result := 'posterior';
end;

procedure ActiveAdenomyosisControls;
begin
  if cbAdenomyosisPresent.Checked then
  begin
    cbLossEMInterface.Enabled := True;
    cbVBShadowingNotPresent.Enabled := True;
    cbVBShadowingPresent.Enabled := True;
    cbIncVasNotPresent.Enabled := True;
    cbIncVasPresent.Enabled := True;
    cbMyometrialCystsPresent.Enabled := True;
    cbMyometrialCystsNotPresent.Enabled := True;
    spAPPosterior.Enabled := True;
    spAPAnterior.Enabled := True;
    lblVenetianBlindShadowing.Enabled := True;
    lblincVascularity.Enabled := True;
    lblApdiameterAnt.Enabled := True;
    lblAPDiameterposterior.Enabled := True;
    lblMyometrium.Enabled :=  True;
    lblMyometrialCysts.Enabled := True;
  end
  else
  begin
    cbLossEMInterface.Enabled := False;
    cbVBShadowingNotPresent.Enabled := False;
    cbVBShadowingPresent.Enabled := False;
    cbIncVasNotPresent.Enabled := False;
    cbIncVasPresent.Enabled := False;
    cbMyometrialCystsPresent.Enabled := False;
    cbMyometrialCystsNotPresent.Enabled := False;
    spAPPosterior.Enabled := False;
    spAPAnterior.Enabled := False;
    lblVenetianBlindShadowing.Enabled := False;
    lblincVascularity.Enabled := False;
    lblApdiameterAnt.Enabled := False;
    lblAPDiameterposterior.Enabled := False;
    lblMyometrium.Enabled :=  False;
    lblMyometrialCysts.Enabled := False;
  end; 
end;

procedure StartScript;
begin
  cbRightAdnexalMass.onClick := 'cbRightAdnexalMassClick';
  cbLeftAdnexalMass.onClick := 'cbLeftAdnexalMassClick';

  cbBladderNormal.onClick := 'cbBladderNormalClick';
  cbBladderAbnormal.onClick := 'cbBladderAbnormalClick';

  cbEFFAbnormal.onClick := 'cbEFFAbnormalClick';
  cbEFFNormal.onClick := 'cbEFFNormalClick';

  cbRightLeadFollicle.onClick := 'cbRightLeadFollicleClick';
  cbLeftLeadFollicle.onClick := 'cbLeftLeadFollicleClick';
  cbRightCorpusLuteum.onClick := 'cbRightCorpusLuteumClick';
  cbLeftCorpusLuteum.onClick := 'cbLeftCorpusLuteumClick';

  cbEndometrium.Properties.OnChange := 'cbEndometriumChange';
  cxccbReferralIndication.Properties.OnChange := 'cxccbReferralIndicationChange';
  //cbIndicatorType2.Properties.OnChange := 'cbIndicatorType2Change';
  cxccbClinicalHistory.Properties.OnChange := 'cxccbClinicalHistoryChange';
  //cbPastHistory2.Properties.OnChange := 'cbPastHistory2Change';
 // cbPastSurgery.Properties.OnChange := 'cbPastSurgeryChange';
  cxcbGynaeSurgery.Properties.OnChange := 'cxcbGynaeSurgeryChange';
  cxcbFamilyHistory.Properties.OnChange := 'cxcbFamilyHistoryChange'
  cbMedication.Properties.OnChange := 'cbMedicationChange';
  tcbMedication.OnChange := 'tcbMedicationChange';
  //cbEndometrialPolyp.onClick := 'cbEndometrialPolypClick';

  ccbROClassification.Properties.OnChange := 'ccbROClassificationOnChnage';
  ccbLOClassification.Properties.OnChange := 'ccbLOClassificationOnChnage';

  cbRightOvaryCystType1.OnChange := 'cbOvaryCystTypeOnChange';
  cbRightOvaryCystType2.OnChange := 'cbOvaryCystTypeOnChange';
  cbRightOvaryCystType3.OnChange := 'cbOvaryCystTypeOnChange';
  cbRightOvaryCystType4.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType1.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType2.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType3.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType4.OnChange := 'cbOvaryCystTypeOnChange';

  cbEndometrialLensionYes.Onclick := 'cbToggleCheckOnClick';
  cbEndometrialLensionNo.Onclick := 'cbToggleCheckOnClick';



  cbRightOvaryIdentified.onClick := 'cbRightOvaryIdentifiedClick';
  cbLeftOvaryIdentified.onClick := 'cbLeftOvaryIdentifiedClick';

  cbRetroFlexed.onClick := 'cbRetroFlexedClick';
  cbAntiFlexed.onClick := 'cbAntiFlexedClick';
  cbRightLimitedMobility.onClick := 'cbRightLimitedMobilityClick';
  cbLeftLimitedMobility.onClick := 'cbLeftLimitedMobilityClick';
  cbRightMobile.onClick := 'cbRightMobileClick';
  cbLeftMobile.onClick := 'cbLeftMobileClick';

  cbRightTender.onClick := 'cbRightTenderClick';
  cbLeftTender.onClick := 'cbLeftTenderClick';
  cbRightNonTender.onClick := 'cbRightNonTenderClick';
  cbLeftNonTender.onClick := 'cbLeftNonTenderClick';

  cbUterusMobile.onClick := 'cbUterusMobileClick';
  cbUterusLimitedMobile.onClick := 'cbUterusLimitedMobileClick';
  cbUterusTender.onClick := 'cbUterusTenderClick';
  cbUterusNonTender.onClick := 'cbUterusNonTenderClick';

  seRightFolCount.Properties.OnChange := 'seRightFolCountOnChange';
  seLeftFolCount.Properties.OnChange := 'seLeftFolCountOnChange';

  seRightResidualFolCount.Properties.OnChange := 'seRightResidualFolCountOnChange';

  cbRightOvarianCyst.onClick := 'cbRightOvarianCystClick';
  cbLeftOvarianCyst.onClick := 'cbLeftOvarianCystClick';

  cbROSmoothYes.OnClick := 'cbROSmoothYesOnClick';
  cbROSmoothNo.OnClick := 'cbROSmoothYesOnClick';
  cbROMIYes.OnClick := 'cbToggleCheckOnClick';
  cbROMINo.OnClick := 'cbToggleCheckOnClick';
  cbROPPYes.OnClick := 'cbROPPYesOnClick';
  cbROPPNo.OnClick := 'cbROPPNoOnClick';
  cbROVascularityYes.onClick := 'cbToggleCheckOnClick';
  cbROVascularityNo.onClick := 'cbToggleCheckOnClick';
  ccbROInternalContents.Properties.OnChange := 'ccbROInternalContentsChange';
  cbROSolidElementsNo.OnClick := 'cbROSolidElementsNoOnClick';
  cbROSolidElementsYes.OnClick := 'cbROSolidElementsNoOnClick';
  cbROVSYes.OnClick := 'cbROVSYesOnClick'
  cbROVSNo.OnClick  := 'cbROVSYesOnClick'
  cbROSeptumYes.OnClick := 'cbROSeptumYesOnClick'
  cbROSolidYes.OnClick  :=  'cbROSolidYesOnClick'
  cbROSolidNo.OnClick  :=  'cbROSolidYesOnClick'
  cbROSeptumNo.OnClick := 'cbROSeptumYesOnClick'
  cbROAscitesYes.OnClick := 'cbToggleCheckOnClick';
  cbROAscitesNo.OnClick := 'cbToggleCheckOnClick';

  cbLOSmoothYes.OnClick := 'cbLOSmoothYesOnClick';
  cbLOSmoothNo.OnClick := 'cbLOSmoothYesOnClick';
  cbLOMIYes.OnClick := 'cbToggleCheckOnClick';
  cbLOMINo.OnClick := 'cbToggleCheckOnClick';
  cbLOPPYes.OnClick := 'cbLOPPYesOnClick';
  cbLOPPNo.OnClick := 'cbLOPPNoOnClick';
  cbLOVascularityYes.onClick := 'cbToggleCheckOnClick';
  cbLOVascularityNo.onClick := 'cbToggleCheckOnClick';
  ccbLOInternalContents.Properties.OnChange := 'ccbLOInternalContentsChange';
  cbLOSolidElementsNo.OnClick := 'cbLOSolidElementsNoOnClick';
  cbLOSolidElementsYes.OnClick := 'cbLOSolidElementsNoOnClick';
  cbLOVSYes.OnClick := 'cbLOVSYesOnClick'
  cbLOVSNo.OnClick  := 'cbLOVSYesOnClick'
  cbLOSeptumYes.OnClick := 'cbLOSeptumYesOnClick'
  cbLOSolidYes.OnClick  :=  'cbLOSolidYesOnClick'
  cbLOSolidNo.OnClick  :=  'cbLOSolidYesOnClick'
  cbLOSeptumNo.OnClick := 'cbLOSeptumYesOnClick'
  cbLOAscitesYes.OnClick := 'cbToggleCheckOnClick';
  cbLOAscitesNo.OnClick := 'cbToggleCheckOnClick';

  cbHRTYes.OnClick := 'cbHRTYesOnclick';
  cbHRTNo.OnClick := 'cbToggleCheckOnClick';

  spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
  cbFibroidsType1.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType2.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType3.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType4.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType5.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType6.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType7.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType8.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType9.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType10.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType11.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType12.Properties.OnChange := 'cbFibroidsTypeOnChange';

  seRightAdnexalMasses.Properties.OnChange := 'seRightAdnexalMassesOnChange';
  seLeftAdnexalMasses.Properties.OnChange := 'seLeftAdnexalMassesOnChange';

  sePolypCount.Properties.OnChange := 'sePolypCountOnChange';
  cbCervicalPolyp.OnClick :='cbCervicalPolypOnClick';

  seRightOvarianCystsCount.Properties.OnChange := 'seRightOvarianCystsCountOnChange';
  seLeftOvarianCystsCount.Properties.OnChange := 'seLeftOvarianCystsCountOnChange';

  seRightCorpusLuteum.Properties.OnChange := 'seRightCorpusLuteumOnChange';
  seRightLeadFollicle.Properties.OnChange := 'seRightLeadFollicleOnChange';

  seLeftCorpusLuteum.Properties.OnChange := 'seLeftCorpusLuteumOnChange';
  seLeftLeadFollicle.Properties.OnChange := 'seLEftLeadFollicleOnChange';

  cbRightKidneyNo.onClick := 'cbRightKidneyNoClick';
  cbLeftKidneyNo.onClick := 'cbLeftKidneyNoClick';
  cbRightKidneyYes.onClick := 'cbRightKidneyYesClick';
  cbLeftKidneyYes.onClick := 'cbLeftKidneyYesClick';

  seEdometriumThickness.Properties.Onchange := 'seEdometriumThicknessOnChange';

  cbCorrectPlacementIUCD.OnClick := 'cbCorrectPlacementIUCDonClick';
  cbCorrectPlacementIUS.OnClick := 'cbCorrectPlacementIUSonClick';
  cbInCorrectPlacementIUCD.OnClick := 'cbInCorrectPlacementIUCDonClick';
  cbInCorrectPlacementIUS.OnClick := 'cbInCorrectPlacementIUSonClick';

  cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';
  cbUterineShape.Properties.OnChange := 'cbUterineShapeOnChange';

  cbAdenomyosisPresent.OnClick := 'cbAdenomyosisPresentOnClick';
  cbAdenomyosisNotPresent.OnClick := 'cbAdenomyosisNotPresentOnClick';

  cbVBShadowingNotPresent.OnClick := 'cbVBShadowingNotPresentOnClick';
  cbVBShadowingPresent.OnClick := 'cbVBShadowingPresentOnClick';

  cbIncVasNotPresent.OnClick := 'cbIncVasNotPresentOnClick';
  cbIncVasPresent.onClick := 'cbIncVasPresentOnClick';

  cbMyometrialCystsPresent.OnClick := 'cbMyometrialCystsPresentOnClick';
  cbMyometrialcystsnotPresent.onClick := 'cbMyometrialCystsNotPresentOnClick';

  cbAscitesPerformed.OnClick := 'cbProceduresPerformedOnClick';
  cbLeftCystAspirationPerf.OnClick := 'cbProceduresPerformedOnClick';
  cbRightCystAspirationPerf.OnClick := 'cbProceduresPerformedOnClick';
  cbTubalLevovistPerformed.OnClick := 'cbProceduresPerformedOnClick';
  cbTubalPerformed.OnClick := 'cbProceduresPerformedOnClick';
  cbSalinePerformed.OnClick := 'cbProceduresPerformedOnClick';

  cbLeftVaginalAccessYes.OnClick := 'cbToggleCheckOnClick';
  cbLeftVaginalAccessNo.OnClick := 'cbToggleCheckOnClick';
  cbRightVaginalAccessYes.OnClick := 'cbToggleCheckOnClick';
  cbRightVaginalAccessNo.OnClick := 'cbToggleCheckOnClick';

  cbLMPUnknown.OnClick := 'cbToggleCheckOnClick';
  cbAmenorrhoea.OnClick := 'cbToggleCheckOnClick';
  cbPostMenopausal.OnClick := 'cbPostMenopausalOnClick';

  cbOligomenorrhoea.OnClick := 'cbToggleCheckOnClick';


  deLMPDate.Properties.onChange := 'deLMPDateOnChange';

  cbRightReanalAbnormalYes.OnClick := 'cbRightReanalAbnormalYesClick'; //'cbToggleCheckOnClick';
  cbRightReanalAbnormalNo.OnClick := 'cbToggleCheckOnClick';
  cbLeftReanalAbnormalYes.OnClick := 'cbLeftReanalAbnormalYesClick'; //'cbToggleCheckOnClick';
  cbLeftReanalAbnormalNo.OnClick := 'cbToggleCheckOnClick';

  cbLeftVaginalNA.OnClick := 'cbToggleCheckOnClick';
  cbRightVaginalNA.OnClick := 'cbToggleCheckOnClick';
  cbHysterectomy.OnClick := 'cbHysterectomyOnClick';
  cbCervixPresentYes.OnClick := 'cbCervixPresentYesOnClick';
  cbCervixPresentNo.OnClick := 'cbCervixPresentNoOnClick';
  cbVaultNormalYes.OnClick := 'cbVaultNormalYesOnClick';
  cbVaultNormalNo.OnClick := 'cbVaultNormalNoOnClick';

  InitializeScreen;

end;

procedure InitializeScreen;
begin
  if (deExamDate.Date < 100) then
    deExamDate.Date := now;
  spFibroidCountOnChange(nil);
  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;
  pcReportBody.Properties.ActivePage := cxtsGeneral;
  seRightAdnexalMassesOnChange(nil);
  seLeftAdnexalMassesOnChange(nil);
  seRightOvarianCystsCountOnChange(nil);
  seLeftOvarianCystsCountOnChange(nil)
    cbUterineShapeOnChange(nil);
  ActiveAdenomyosisControls;
  cbProceduresPerformedOnClick(nil);
end;

StartScript;
