#ifndef __SHARED_OBSTETRIC_LIQUOR
#define __SHARED_OBSTETRIC_LIQUOR

function GetLiquor5Centile(inWeeks : integer) : real;
begin
 result := 0.0;
  case inWeeks of
    16: result := 7.9;
    17: result := 8.3;
    18: result := 8.7;
    19: result := 9.0;
    20: result := 9.3;
    21: result := 9.5;
    22: result := 9.7;
    23: result := 9.8;
    24: result := 9.8;
    25: result := 9.7;
    26: result := 9.7;
    27: result := 9.5;
    28: result := 9.4;
    29: result := 9.2;
    30: result := 9.0;
    31: result := 8.8;
    32: result := 8.6;
    33: result := 8.3;
    34: result := 8.1;
    35: result := 7.9;
    36: result := 7.7;
    37: result := 7.5;
    38: result := 7.3;
    39: result := 7.2;
    40: result := 7.1;
    41: result := 7.0;
    41: result := 6.9;
  end;
end;

function GetLiquor95Centile(inWeeks : integer) : Real;
begin
   result := 0.0;
  case inWeeks of
    16: result := 18.5;
    17: result := 19.4;
    18: result := 20.2;
    19: result := 20.7;
    20: result := 21.2;
    21: result := 21.4;
    22: result := 21.6;
    23: result := 21.8;
    24: result := 21.9;
    25: result := 22.1;
    26: result := 22.3;
    27: result := 22.6;
    28: result := 22.8;
    29: result := 23.1;
    30: result := 23.4;
    31: result := 23.8;
    32: result := 24.2;
    33: result := 24.5;
    34: result := 24.8;
    35: result := 24.9;
    36: result := 24.9;
    37: result := 24.4;
    38: result := 23.9;
    39: result := 22.6;
    40: result := 21.4;
    41: result := 19.4;
    41: result := 17.5;
  end;
end;

#endif
