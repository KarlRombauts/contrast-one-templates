#ifndef __SHARED_GYNAE_FIBROIDS
#define __SHARED_GYNAE_FIBROIDS

function GetFibroidCount: string;
var
  vNumber: string;
begin
  if spFibroidCount.Value = 0 then
    result := 'No fibroids were'
  else
  begin
    vNumber := GetNumberString(Trunc(spFibroidCount.Value));
    if Trunc(spFibroidCount.Value) = 1 then
      result := vNumber + ' fibroid was'
    else
    begin
      result := vNumber + ' fibroids were';
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
    result := result + ' (within ' + intToStr(Trunc(seCloseToCrevix1.value)) + ' mm)';
end;

function GetCavDistortionCount: Integer;
begin
  result := 0;
  if (gbFibroid1.Visible) and (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
    result := Result + 1;
  if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then
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
    result := Result + 1;
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
  v4 := trunc(vv.Value);
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
        result :=  'There is a ' + result;
    end
    else if spFibroidCount.value > 1 then
    begin
      for i := 1 to spFibroidCount.value do
      begin
        if result <> '' then
        begin
          if i = spFibroidCount.value then
             result := result + ' and ';
          else
             result := result + ', ';
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

#endif
