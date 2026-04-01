#ifndef __SHARED_VARIANTS_GETNORMALMCAPIRANGE_20WEEK
#define __SHARED_VARIANTS_GETNORMALMCAPIRANGE_20WEEK

function GetNormalMCAPIRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    21: result := 1.18;
    22: result := 1.25;
    23: result := 1.32;
    24: result := 1.38;
    25: result := 1.44;
    26: result := 1.50;
    27: result := 1.55;
    28: result := 1.58;
    29: result := 1.61;
    30: result := 1.62;
    31: result := 1.62;
    32: result := 1.61;
    33: result := 1.58;
    34: result := 1.53;
    35: result := 1.47;
    36: result := 1.39;
    37: result := 1.30;
    38: result := 1.20;
    39: result := 1.10;
  end;
end;

#endif
