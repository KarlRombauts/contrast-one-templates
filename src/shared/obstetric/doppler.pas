#ifndef __SHARED_OBSTETRIC_DOPPLER
#define __SHARED_OBSTETRIC_DOPPLER

function GetUAPI : String
var
  vUmbilicalArtPI1,vCalc : Real;
begin
result := '';
vUmbilicalArtPI1 := 0.0;  
GUAPIWarning := FALSE;
vCalc := 0.0;
  if Length(Trim(edtUmbilicalArtPI1.Text)) > 0 then                                                    
  begin
      if edtUmbilicalArtPI1.Text <> '0.00' then
      begin
        vUmbilicalArtPI1 := StrToFloat(Trim(edtUmbilicalArtPI1.Text));
        vCalc := GetNormalUAPIRange(GetGestWeeks);
        if vCalc > 0 then
        begin
          if(vUmbilicalArtPI1 < vCalc) then
          begin
             result := 'normal';
             GUAPIWarning := False;
          end;
          else
          Begin                                                  
             result := 'above 95%';
             GUAPIWarning := True;
          end;
        end;
     end;
  end;
end;

function GetNormalUAPIRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    19: result := 1.66;
    20: result := 1.62;
    21: result := 1.58;
    22: result := 1.54;
    23: result := 1.50;
    24: result := 1.47;
    25: result := 1.44;
    26: result := 1.41;
    27: result := 1.38;
    28: result := 1.35;
    29: result := 1.32;
    30: result := 1.29;
    31: result := 1.27;
    32: result := 1.25;
    33: result := 1.22;
    34: result := 1.20;
    35: result := 1.18;
    36: result := 1.16;
    37: result := 1.14;
    38: result := 1.12;
    39: result := 1.10;
    40: result := 1.09;
    41: result := 1.07;
  end;
end;  

function GetMCAPI : String
var
  vMidCerArtPI1,vCalc : Real;
begin
result := '';
GMCAPIWarning := FALSE;
  if Length(Trim(edtMidCerArtPI1.Text)) > 0 then
  begin
      if edtMidCerArtPI1.Text <> '0.00' then
      begin
        vMidCerArtPI1 := StrToFloat(Trim(edtMidCerArtPI1.Text));
        vCalc := GetNormalMCAPIRange(GetGestWeeks);
        if vCalc > 0 then
        begin
          if(vMidCerArtPI1 >= vCalc) then
          begin
             result := 'normal';
             GMCAPIWarning := False;
          end;
          else
          begin
             result := 'below 10%';        
             GMCAPIWarning := True;
          end;
        end;
     end; 
  end;              
end;

function GetNormalMCAPIRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    20: result := 1.227;
    21: result := 1.278;
    22: result := 1.330;
    23: result := 1.381;
    24: result := 1.430;
    25: result := 1.476;
    26: result := 1.517;
    27: result := 1.553;
    28: result := 1.580;
    29: result := 1.599;
    30: result := 1.607;
    31: result := 1.603;
    32: result := 1.586;
    33: result := 1.555;
    34: result := 1.511;
    35: result := 1.453;
    36: result := 1.382;
    37: result := 1.300;
    38: result := 1.208;
    39: result := 1.108;
    40: result := 1.002;
    41: result := 0.894;
  end;
end;   

function GetNormalCPRRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    21: result := 0.9;
    22: result := 0.98;
    23: result := 1.07;
    24: result := 1.16;
    25: result := 1.24;
    26: result := 1.32;
    27: result := 1.4;
    28: result := 1.47;
    29: result := 1.53;
    30: result := 1.58;
    31: result := 1.62;
    32: result := 1.64;
    33: result := 1.65;
    34: result := 1.63;
    35: result := 1.6;                                                                                                                  
    36: result := 1.55;
    37: result := 1.48;
    38: result := 1.4;
    39: result := 1.29;
  end;
end;

function GetMoMRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    18,19: result := 34.8;
    20,21: result := 38.2;
    22,23: result := 41.9;
    24,25: result := 46.0;
    26,27: result := 50.4;
    28,29: result := 55.4;
    30,31: result := 60.7;
    32,33: result := 66.6;
    34,35: result := 73.1;
    36,37: result := 80.2;
    38,39: result := 88.0;
   40: result := 96.6;
  end;
end;

 function GetDuctusVenosusWarning: Boolean;
begin
result := False;                                               
if cbDVWAbNormal1.checked then              
    result := True;
end;  

#endif
