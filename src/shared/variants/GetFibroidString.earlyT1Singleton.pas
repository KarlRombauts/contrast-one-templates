#ifndef __SHARED_VARIANTS_GETFIBROIDSTRING_EARLYT1SINGLETON
#define __SHARED_VARIANTS_GETFIBROIDSTRING_EARLYT1SINGLETON

function GetFibroidString(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
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
  if vlr.Text <> '' then
    result := vlr.Text + ' ';
  v1 := trunc(vl.Value);
  v2 := trunc(vw.Value);
  v3 := trunc(vd.Value);
  v4 := trunc(vv.Value * 10) / 10;
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + vp.Text + ' ' + vt.Text + format(' %d x %d x %dmm (vol. %3.1f cc)', [v1, v2, v3, v4]);
        end
        else
          result := result + vp.Text + ' ' + vt.Text + format(' %d x %d x %dmm', [v1, v2, v3]);
      end
      else
        result := result + vp.Text + ' ' + vt.Text + format(' %d x %dmm', [v1, v2]);
    end
    else
      result := result + vp.Text + ' ' + vt.Text + format(' %dmm', [v1]);
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
  {else
  begin
    if GetCavDistortionCount > 0 then
      result := result + ', clear of the cervix';
  end; }
end;

#endif
