unit TestFibroids;
{
  Tests for fibroid functions from:
    Scripts/shared/gynae/fibroids.pas
    Scripts/shared/gynae/fibroidUI.pas

  Functions tested:
    - GetFibroidCount: returns descriptive string for fibroid count
    - GetSingleCloseOrClear: returns cervix proximity description
    - spFibroidCountOnChange: sets gbFibroid1..10 visibility
    - cbFibroidsVisualisedOnClick: enables/disables spFibroidCount
    - GetSingleFibroidDimensions: formats dimension string

  Test strategy:
    Controls are created inside PascalScript as global variables.
    Dependency functions (GetNumberString, InitCaps) are inlined.
    InitCaps adapted to avoid result[1]:= (uses local var approach).
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration, StubControls;

type
  TTestFibroids = class(TTestCase)
  private
    FHost: TScriptHost;
    FSetupOk: Boolean;
    function CallCheck(const Name: string): string;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    { GetFibroidCount }
    procedure TestGetFibroidCount_Zero;
    procedure TestGetFibroidCount_One;
    procedure TestGetFibroidCount_Three;
    procedure TestGetFibroidCount_Ten;
    { GetSingleCloseOrClear }
    procedure TestGetSingleCloseOrClear_Distortion;
    procedure TestGetSingleCloseOrClear_NoDist_ZeroDist;
    procedure TestGetSingleCloseOrClear_NoDist_WithDist;
    { spFibroidCountOnChange }
    procedure TestCountOnChange_Vis3;
    procedure TestCountOnChange_NotVis;
    procedure TestCountOnChange_Zero;
    { cbFibroidsVisualisedOnClick }
    procedure TestVisualisedOnClick_Checked;
    procedure TestVisualisedOnClick_Unchecked;
    { GetSingleFibroidDimensions }
    procedure TestSingleDimensions_AllFour;
    procedure TestSingleDimensions_ThreeDims;
    procedure TestSingleDimensions_TwoDims;
    procedure TestSingleDimensions_OneOnly;
    procedure TestSingleDimensions_None;
  end;

implementation

const
  FIBROID_SOURCE =
    { --- Dependency: GetNumberString (from formatting.pas) --- }
    'function GetNumberString(inNumber: Integer): string;'           + LineEnding +
    'begin'                                                          + LineEnding +
    '  result := '''';'                                              + LineEnding +
    '  if inNumber = 1 then'                                         + LineEnding +
    '    result := ''a single'''                                     + LineEnding +
    '  else'                                                         + LineEnding +
    '  begin'                                                        + LineEnding +
    '    if inNumber = 2 then'                                       + LineEnding +
    '      result := ''two'''                                        + LineEnding +
    '    else if inNumber = 3 then'                                  + LineEnding +
    '      result := ''three'''                                      + LineEnding +
    '    else if inNumber = 4 then'                                  + LineEnding +
    '      result := ''four'''                                       + LineEnding +
    '    else if inNumber = 5 then'                                  + LineEnding +
    '      result := ''five'''                                       + LineEnding +
    '    else if inNumber = 6 then'                                  + LineEnding +
    '      result := ''six'''                                        + LineEnding +
    '    else if inNumber = 7 then'                                  + LineEnding +
    '      result := ''seven'''                                      + LineEnding +
    '    else if inNumber = 8 then'                                  + LineEnding +
    '      result := ''eight'''                                      + LineEnding +
    '    else if inNumber = 9 then'                                  + LineEnding +
    '      result := ''nine'''                                       + LineEnding +
    '    else'                                                       + LineEnding +
    '      result := IntToStr(inNumber);'                            + LineEnding +
    '  end;'                                                         + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- Dependency: InitCaps (adapted for PascalScript) ---
      Uses local var approach to avoid result[1] := char assignment }
    'function InitCaps(inv: string; inReduce: Boolean): string;'     + LineEnding +
    'var'                                                             + LineEnding +
    '  vDiff: Integer;'                                              + LineEnding +
    '  vFirst: Char;'                                                + LineEnding +
    '  vTmp: string;'                                                + LineEnding +
    'begin'                                                          + LineEnding +
    '  if inv <> '''' then'                                          + LineEnding +
    '  begin'                                                        + LineEnding +
    '    vDiff := Ord(''A'') - Ord(''a'');'                          + LineEnding +
    '    vTmp := inv;'                                               + LineEnding +
    '    vFirst := vTmp[1];'                                         + LineEnding +
    '    if inReduce then'                                           + LineEnding +
    '    begin'                                                      + LineEnding +
    '      if (Ord(vFirst) >= Ord(''A'')) and (Ord(vFirst) <= Ord(''Z'')) then' + LineEnding +
    '        vFirst := chr(Ord(inv[1]) - vDiff);'                    + LineEnding +
    '    end'                                                        + LineEnding +
    '    else'                                                       + LineEnding +
    '    begin'                                                      + LineEnding +
    '      if (Ord(vFirst) >= Ord(''a'')) and (Ord(vFirst) <= Ord(''z'')) then' + LineEnding +
    '        vFirst := chr(Ord(inv[1]) + vDiff);'                    + LineEnding +
    '    end;'                                                       + LineEnding +
    '    result := vFirst + Copy(vTmp, 2, Length(vTmp) - 1);'        + LineEnding +
    '  end'                                                          + LineEnding +
    '  else'                                                         + LineEnding +
    '    result := '''';'                                            + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- Global control variables --- }
    'var'                                                             + LineEnding +
    '  spFibroidCount: TcxSpinEdit;'                                 + LineEnding +
    '  cbFibroidsVisualised: TcxCheckBox;'                           + LineEnding +
    '  cbCavityDistortion1: TcxCheckBox;'                            + LineEnding +
    '  seCloseToCrevix1: TcxSpinEdit;'                               + LineEnding +
    '  gbFibroid1: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid2: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid3: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid4: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid5: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid6: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid7: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid8: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid9: TcxGroupBox;'                                     + LineEnding +
    '  gbFibroid10: TcxGroupBox;'                                    + LineEnding +
    '  edtFibroidLength1: TcxSpinEdit;'                              + LineEnding +
    '  edtFibroidWidth1: TcxSpinEdit;'                               + LineEnding +
    '  edtFibroiddepth1: TcxSpinEdit;'                               + LineEnding +
    '  edtFibroidVolume1: TcxSpinEdit;'                              + LineEnding +
    ''                                                               + LineEnding +

    { --- Setup/Teardown helpers --- }
    'procedure SetupFibroidControls;'                                + LineEnding +
    'begin'                                                          + LineEnding +
    '  spFibroidCount := TcxSpinEdit.Create(nil);'                   + LineEnding +
    '  cbFibroidsVisualised := TcxCheckBox.Create(nil);'             + LineEnding +
    '  cbCavityDistortion1 := TcxCheckBox.Create(nil);'              + LineEnding +
    '  seCloseToCrevix1 := TcxSpinEdit.Create(nil);'                 + LineEnding +
    '  gbFibroid1 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid2 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid3 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid4 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid5 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid6 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid7 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid8 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid9 := TcxGroupBox.Create(nil);'                       + LineEnding +
    '  gbFibroid10 := TcxGroupBox.Create(nil);'                      + LineEnding +
    '  edtFibroidLength1 := TcxSpinEdit.Create(nil);'                + LineEnding +
    '  edtFibroidWidth1 := TcxSpinEdit.Create(nil);'                 + LineEnding +
    '  edtFibroiddepth1 := TcxSpinEdit.Create(nil);'                 + LineEnding +
    '  edtFibroidVolume1 := TcxSpinEdit.Create(nil);'                + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'procedure TeardownFibroidControls;'                             + LineEnding +
    'begin'                                                          + LineEnding +
    '  edtFibroidVolume1.Free;'                                      + LineEnding +
    '  edtFibroiddepth1.Free;'                                       + LineEnding +
    '  edtFibroidWidth1.Free;'                                       + LineEnding +
    '  edtFibroidLength1.Free;'                                      + LineEnding +
    '  gbFibroid10.Free;'                                            + LineEnding +
    '  gbFibroid9.Free;'                                             + LineEnding +
    '  gbFibroid8.Free;'                                             + LineEnding +
    '  gbFibroid7.Free;'                                             + LineEnding +
    '  gbFibroid6.Free;'                                             + LineEnding +
    '  gbFibroid5.Free;'                                             + LineEnding +
    '  gbFibroid4.Free;'                                             + LineEnding +
    '  gbFibroid3.Free;'                                             + LineEnding +
    '  gbFibroid2.Free;'                                             + LineEnding +
    '  gbFibroid1.Free;'                                             + LineEnding +
    '  seCloseToCrevix1.Free;'                                       + LineEnding +
    '  cbCavityDistortion1.Free;'                                    + LineEnding +
    '  cbFibroidsVisualised.Free;'                                   + LineEnding +
    '  spFibroidCount.Free;'                                         + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- GetFibroidCount (from fibroids.pas) --- }
    'function GetFibroidCount: string;'                              + LineEnding +
    'var'                                                             + LineEnding +
    '  vNumber: string;'                                             + LineEnding +
    'begin'                                                          + LineEnding +
    '  if spFibroidCount.Value = 0 then'                             + LineEnding +
    '    result := ''No fibroids were'''                             + LineEnding +
    '  else'                                                         + LineEnding +
    '  begin'                                                        + LineEnding +
    '    vNumber := GetNumberString(Trunc(spFibroidCount.Value));'   + LineEnding +
    '    if spFibroidCount.Value = 1 then'                           + LineEnding +
    '      result := vNumber + '' fibroid is'''                      + LineEnding +
    '    else'                                                       + LineEnding +
    '    begin'                                                      + LineEnding +
    '      result := vNumber + '' fibroids are'';'                   + LineEnding +
    '    end;'                                                       + LineEnding +
    '  end;'                                                         + LineEnding +
    '  result := InitCaps(result, False);'                           + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- GetSingleCloseOrClear (from fibroids.pas) --- }
    'function GetSingleCloseOrClear: String;'                        + LineEnding +
    'begin'                                                          + LineEnding +
    '  if cbCavityDistortion1.Checked then'                          + LineEnding +
    '    result := ''close to the cervix'''                          + LineEnding +
    '  else'                                                         + LineEnding +
    '  begin'                                                        + LineEnding +
    '    result := ''clear of the cervix'';'                         + LineEnding +
    '  end;'                                                         + LineEnding +
    '  if seCloseToCrevix1.Value > 0 then'                           + LineEnding +
    '    result := result + '' (within '' + IntToStr(Trunc(seCloseToCrevix1.Value)) + '' mm)'';' + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- spFibroidCountOnChange (from fibroidUI.pas) ---
      Adapted: added semicolon after (Sender), typed Sender }
    'procedure spFibroidCountOnChange(Sender: TObject);'             + LineEnding +
    'begin'                                                          + LineEnding +
    '  gbFibroid1.Visible := False;'                                 + LineEnding +
    '  gbFibroid2.Visible := False;'                                 + LineEnding +
    '  gbFibroid3.Visible := False;'                                 + LineEnding +
    '  gbFibroid4.Visible := False;'                                 + LineEnding +
    '  gbFibroid5.Visible := False;'                                 + LineEnding +
    '  gbFibroid6.Visible := False;'                                 + LineEnding +
    '  gbFibroid7.Visible := False;'                                 + LineEnding +
    '  gbFibroid8.Visible := False;'                                 + LineEnding +
    '  gbFibroid9.Visible := False;'                                 + LineEnding +
    '  gbFibroid10.Visible := False;'                                + LineEnding +
    '  if spFibroidCount.Value > 0 then'                             + LineEnding +
    '  begin'                                                        + LineEnding +
    '    cbFibroidsVisualised.Checked := True;'                      + LineEnding +
    '  end;'                                                         + LineEnding +
    '  if cbFibroidsVisualised.Checked then'                         + LineEnding +
    '  begin'                                                        + LineEnding +
    '    if spFibroidCount.Value > 0 then'                           + LineEnding +
    '    begin'                                                      + LineEnding +
    '      gbFibroid1.Visible := True;'                              + LineEnding +
    '      if spFibroidCount.Value > 1 then'                         + LineEnding +
    '      begin'                                                    + LineEnding +
    '        gbFibroid2.Visible := True;'                            + LineEnding +
    '        if spFibroidCount.Value > 2 then'                       + LineEnding +
    '        begin'                                                  + LineEnding +
    '          gbFibroid3.Visible := True;'                          + LineEnding +
    '          if spFibroidCount.Value > 3 then'                     + LineEnding +
    '          begin'                                                + LineEnding +
    '            gbFibroid4.Visible := True;'                        + LineEnding +
    '            if spFibroidCount.Value > 4 then'                   + LineEnding +
    '            begin'                                              + LineEnding +
    '              gbFibroid5.Visible := True;'                      + LineEnding +
    '              if spFibroidCount.Value > 5 then'                 + LineEnding +
    '              begin'                                            + LineEnding +
    '                gbFibroid6.Visible := True;'                    + LineEnding +
    '                if spFibroidCount.Value > 6 then'               + LineEnding +
    '                begin'                                          + LineEnding +
    '                  gbFibroid7.Visible := True;'                  + LineEnding +
    '                  if spFibroidCount.Value > 7 then'             + LineEnding +
    '                  begin'                                        + LineEnding +
    '                    gbFibroid8.Visible := True;'                + LineEnding +
    '                    if spFibroidCount.Value > 8 then'           + LineEnding +
    '                    begin'                                      + LineEnding +
    '                      gbFibroid9.Visible := True;'              + LineEnding +
    '                      if spFibroidCount.Value > 9 then'         + LineEnding +
    '                      begin'                                    + LineEnding +
    '                        gbFibroid10.Visible := True;'           + LineEnding +
    '                      end;'                                     + LineEnding +
    '                    end;'                                       + LineEnding +
    '                  end;'                                         + LineEnding +
    '                end;'                                           + LineEnding +
    '              end;'                                             + LineEnding +
    '            end;'                                               + LineEnding +
    '          end;'                                                 + LineEnding +
    '        end;'                                                   + LineEnding +
    '      end;'                                                     + LineEnding +
    '    end;'                                                       + LineEnding +
    '  end;'                                                         + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- cbFibroidsVisualisedOnClick (from fibroidUI.pas) --- }
    'procedure cbFibroidsVisualisedOnClick(Sender: TObject);'        + LineEnding +
    'begin'                                                          + LineEnding +
    '  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;'      + LineEnding +
    '  spFibroidCountOnChange(nil);'                                 + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- GetSingleFibroidDimensions (from fibroids.pas) ---
      Adapted: Format() calls replaced with string concatenation
      since Format is not available in PascalScript }
    'function GetSingleFibroidDimensions: string;'                   + LineEnding +
    'var'                                                             + LineEnding +
    '  v1, v2, v3, v4: Integer;'                                     + LineEnding +
    'begin'                                                          + LineEnding +
    '  result := '''';'                                              + LineEnding +
    '  v1 := Trunc(edtFibroidLength1.Value);'                        + LineEnding +
    '  v2 := Trunc(edtFibroidWidth1.Value);'                         + LineEnding +
    '  v3 := Trunc(edtFibroiddepth1.Value);'                         + LineEnding +
    '  v4 := Trunc(edtFibroidVolume1.Value);'                        + LineEnding +
    '  if v1 > 0 then'                                               + LineEnding +
    '  begin'                                                        + LineEnding +
    '    if v2 > 0 then'                                             + LineEnding +
    '    begin'                                                      + LineEnding +
    '      if v3 > 0 then'                                           + LineEnding +
    '      begin'                                                    + LineEnding +
    '        if v4 > 0 then'                                         + LineEnding +
    '        begin'                                                  + LineEnding +
    '          result := result + IntToStr(v1) + '' x '' + IntToStr(v2) + '' x '' + IntToStr(v3) + ''mm (vol. '' + IntToStr(v4) + ''cc)'';' + LineEnding +
    '        end'                                                    + LineEnding +
    '        else'                                                   + LineEnding +
    '          result := result + IntToStr(v1) + '' x '' + IntToStr(v2) + '' x '' + IntToStr(v3) + ''mm'';' + LineEnding +
    '      end'                                                      + LineEnding +
    '      else'                                                     + LineEnding +
    '        result := result + IntToStr(v1) + '' x '' + IntToStr(v2) + ''mm'';' + LineEnding +
    '    end'                                                        + LineEnding +
    '    else'                                                       + LineEnding +
    '      result := result + IntToStr(v1) + ''mm'';'                + LineEnding +
    '  end;'                                                         + LineEnding +
    '  if result <> '''' then'                                       + LineEnding +
    '    result := '' '' + result;'                                  + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { ============== Test functions ============== }

    { --- GetFibroidCount tests --- }

    'function TestFibroidCount_Zero: string;'                        + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  spFibroidCount.Value := 0;'                                   + LineEnding +
    '  res := GetFibroidCount;'                                      + LineEnding +
    '  if res = ''No fibroids were'' then'                           + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected "No fibroids were" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestFibroidCount_One: string;'                         + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  spFibroidCount.Value := 1;'                                   + LineEnding +
    '  res := GetFibroidCount;'                                      + LineEnding +
    '  if res = ''A single fibroid is'' then'                        + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected "A single fibroid is" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestFibroidCount_Three: string;'                       + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  spFibroidCount.Value := 3;'                                   + LineEnding +
    '  res := GetFibroidCount;'                                      + LineEnding +
    '  if res = ''Three fibroids are'' then'                         + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected "Three fibroids are" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestFibroidCount_Ten: string;'                         + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  spFibroidCount.Value := 10;'                                  + LineEnding +
    '  res := GetFibroidCount;'                                      + LineEnding +
    '  if res = ''10 fibroids are'' then'                            + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected "10 fibroids are" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- GetSingleCloseOrClear tests --- }

    'function TestCloseOrClear_Distortion: string;'                  + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  cbCavityDistortion1.Checked := True;'                         + LineEnding +
    '  seCloseToCrevix1.Value := 0;'                                 + LineEnding +
    '  res := GetSingleCloseOrClear;'                                + LineEnding +
    '  if res = ''close to the cervix'' then'                        + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected "close to the cervix" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestCloseOrClear_NoDist_Zero: string;'                 + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  cbCavityDistortion1.Checked := False;'                        + LineEnding +
    '  seCloseToCrevix1.Value := 0;'                                 + LineEnding +
    '  res := GetSingleCloseOrClear;'                                + LineEnding +
    '  if res = ''clear of the cervix'' then'                        + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected "clear of the cervix" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestCloseOrClear_NoDist_WithDist: string;'             + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  cbCavityDistortion1.Checked := False;'                        + LineEnding +
    '  seCloseToCrevix1.Value := 15;'                                + LineEnding +
    '  res := GetSingleCloseOrClear;'                                + LineEnding +
    '  if res = ''clear of the cervix (within 15 mm)'' then'         + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected "clear of the cervix (within 15 mm)" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- spFibroidCountOnChange tests --- }

    'function TestCountChange_Vis3: string;'                         + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  cbFibroidsVisualised.Checked := True;'                        + LineEnding +
    '  spFibroidCount.Value := 3;'                                   + LineEnding +
    '  spFibroidCountOnChange(nil);'                                 + LineEnding +
    '  if gbFibroid1.Visible and gbFibroid2.Visible and gbFibroid3.Visible' + LineEnding +
    '     and (not gbFibroid4.Visible) and (not gbFibroid5.Visible)' + LineEnding +
    '     and (not gbFibroid10.Visible) then'                        + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''gb1='' + IntToStr(Ord(gbFibroid1.Visible)) +'   + LineEnding +
    '      '' gb2='' + IntToStr(Ord(gbFibroid2.Visible)) +'          + LineEnding +
    '      '' gb3='' + IntToStr(Ord(gbFibroid3.Visible)) +'          + LineEnding +
    '      '' gb4='' + IntToStr(Ord(gbFibroid4.Visible));'           + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestCountChange_NotVis: string;'                       + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  cbFibroidsVisualised.Checked := False;'                       + LineEnding +
    '  spFibroidCount.Value := 0;'                                   + LineEnding +
    '  spFibroidCountOnChange(nil);'                                 + LineEnding +
    '  if (not gbFibroid1.Visible) and (not gbFibroid2.Visible) and (not gbFibroid10.Visible) then' + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected all hidden, gb1='' + IntToStr(Ord(gbFibroid1.Visible));' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestCountChange_Zero: string;'                         + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  cbFibroidsVisualised.Checked := True;'                        + LineEnding +
    '  spFibroidCount.Value := 0;'                                   + LineEnding +
    '  spFibroidCountOnChange(nil);'                                 + LineEnding +
    '  if (not gbFibroid1.Visible) and (not gbFibroid2.Visible) and (not gbFibroid10.Visible) then' + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected all hidden, gb1='' + IntToStr(Ord(gbFibroid1.Visible));' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- cbFibroidsVisualisedOnClick tests --- }

    'function TestVisClick_Checked: string;'                         + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  spFibroidCount.Enabled := False;'                             + LineEnding +
    '  cbFibroidsVisualised.Checked := True;'                        + LineEnding +
    '  spFibroidCount.Value := 0;'                                   + LineEnding +
    '  cbFibroidsVisualisedOnClick(nil);'                            + LineEnding +
    '  if spFibroidCount.Enabled then'                               + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''spFibroidCount should be Enabled'';'            + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestVisClick_Unchecked: string;'                       + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  spFibroidCount.Enabled := True;'                              + LineEnding +
    '  cbFibroidsVisualised.Checked := False;'                       + LineEnding +
    '  spFibroidCount.Value := 0;'                                   + LineEnding +
    '  cbFibroidsVisualisedOnClick(nil);'                            + LineEnding +
    '  if not spFibroidCount.Enabled then'                           + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''spFibroidCount should be Disabled'';'           + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    { --- GetSingleFibroidDimensions tests --- }

    'function TestDimensions_AllFour: string;'                       + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  edtFibroidLength1.Value := 30;'                               + LineEnding +
    '  edtFibroidWidth1.Value := 20;'                                + LineEnding +
    '  edtFibroiddepth1.Value := 15;'                                + LineEnding +
    '  edtFibroidVolume1.Value := 10;'                               + LineEnding +
    '  res := GetSingleFibroidDimensions;'                           + LineEnding +
    '  if res = '' 30 x 20 x 15mm (vol. 10cc)'' then'               + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected " 30 x 20 x 15mm (vol. 10cc)" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestDimensions_ThreeDims: string;'                     + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  edtFibroidLength1.Value := 30;'                               + LineEnding +
    '  edtFibroidWidth1.Value := 20;'                                + LineEnding +
    '  edtFibroiddepth1.Value := 15;'                                + LineEnding +
    '  edtFibroidVolume1.Value := 0;'                                + LineEnding +
    '  res := GetSingleFibroidDimensions;'                           + LineEnding +
    '  if res = '' 30 x 20 x 15mm'' then'                           + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected " 30 x 20 x 15mm" got "'' + res + ''"'';' + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestDimensions_TwoDims: string;'                       + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  edtFibroidLength1.Value := 30;'                               + LineEnding +
    '  edtFibroidWidth1.Value := 20;'                                + LineEnding +
    '  edtFibroiddepth1.Value := 0;'                                 + LineEnding +
    '  edtFibroidVolume1.Value := 0;'                                + LineEnding +
    '  res := GetSingleFibroidDimensions;'                           + LineEnding +
    '  if res = '' 30 x 20mm'' then'                                + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected " 30 x 20mm" got "'' + res + ''"'';'  + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestDimensions_OneOnly: string;'                       + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  edtFibroidLength1.Value := 30;'                               + LineEnding +
    '  edtFibroidWidth1.Value := 0;'                                 + LineEnding +
    '  edtFibroiddepth1.Value := 0;'                                 + LineEnding +
    '  edtFibroidVolume1.Value := 0;'                                + LineEnding +
    '  res := GetSingleFibroidDimensions;'                           + LineEnding +
    '  if res = '' 30mm'' then'                                     + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected " 30mm" got "'' + res + ''"'';'       + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'function TestDimensions_None: string;'                          + LineEnding +
    'var res: string;'                                               + LineEnding +
    'begin'                                                          + LineEnding +
    '  SetupFibroidControls;'                                        + LineEnding +
    '  edtFibroidLength1.Value := 0;'                                + LineEnding +
    '  edtFibroidWidth1.Value := 0;'                                 + LineEnding +
    '  edtFibroiddepth1.Value := 0;'                                 + LineEnding +
    '  edtFibroidVolume1.Value := 0;'                                + LineEnding +
    '  res := GetSingleFibroidDimensions;'                           + LineEnding +
    '  if res = '''' then'                                           + LineEnding +
    '    Result := ''OK'''                                           + LineEnding +
    '  else'                                                         + LineEnding +
    '    Result := ''Expected empty got "'' + res + ''"'';'          + LineEnding +
    '  TeardownFibroidControls;'                                     + LineEnding +
    'end;'                                                           + LineEnding +
    ''                                                               + LineEnding +

    'begin'                                                          + LineEnding +
    'end.';

{ ====== Setup / TearDown ====== }

procedure TTestFibroids.SetUp;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  if not FHost.CompileScript(FIBROID_SOURCE) then
  begin
    WriteLn('COMPILE ERROR: ', FHost.LastError);
    Exit;
  end;

  RegisterRuntimeStd(FHost.Exec, FHost.ClassImporter);

  if not FHost.Execute then
  begin
    WriteLn('EXECUTE ERROR: ', FHost.LastError);
    Exit;
  end;

  FSetupOk := True;
end;

procedure TTestFibroids.TearDown;
begin
  FHost.Free;
  FHost := nil;
end;

function TTestFibroids.CallCheck(const Name: string): string;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := string(FHost.CallFunctionByName(Name, []));
end;

{ ====== Test methods ====== }

{ GetFibroidCount }

procedure TTestFibroids.TestGetFibroidCount_Zero;
begin
  AssertEquals('Zero fibroids', 'OK', CallCheck('TestFibroidCount_Zero'));
end;

procedure TTestFibroids.TestGetFibroidCount_One;
begin
  AssertEquals('One fibroid', 'OK', CallCheck('TestFibroidCount_One'));
end;

procedure TTestFibroids.TestGetFibroidCount_Three;
begin
  AssertEquals('Three fibroids', 'OK', CallCheck('TestFibroidCount_Three'));
end;

procedure TTestFibroids.TestGetFibroidCount_Ten;
begin
  AssertEquals('Ten fibroids', 'OK', CallCheck('TestFibroidCount_Ten'));
end;

{ GetSingleCloseOrClear }

procedure TTestFibroids.TestGetSingleCloseOrClear_Distortion;
begin
  AssertEquals('Cavity distortion', 'OK', CallCheck('TestCloseOrClear_Distortion'));
end;

procedure TTestFibroids.TestGetSingleCloseOrClear_NoDist_ZeroDist;
begin
  AssertEquals('No distortion zero distance', 'OK', CallCheck('TestCloseOrClear_NoDist_Zero'));
end;

procedure TTestFibroids.TestGetSingleCloseOrClear_NoDist_WithDist;
begin
  AssertEquals('No distortion with distance', 'OK', CallCheck('TestCloseOrClear_NoDist_WithDist'));
end;

{ spFibroidCountOnChange }

procedure TTestFibroids.TestCountOnChange_Vis3;
begin
  AssertEquals('Count=3 visible', 'OK', CallCheck('TestCountChange_Vis3'));
end;

procedure TTestFibroids.TestCountOnChange_NotVis;
begin
  AssertEquals('Not visualised', 'OK', CallCheck('TestCountChange_NotVis'));
end;

procedure TTestFibroids.TestCountOnChange_Zero;
begin
  AssertEquals('Count=0', 'OK', CallCheck('TestCountChange_Zero'));
end;

{ cbFibroidsVisualisedOnClick }

procedure TTestFibroids.TestVisualisedOnClick_Checked;
begin
  AssertEquals('Visualised checked', 'OK', CallCheck('TestVisClick_Checked'));
end;

procedure TTestFibroids.TestVisualisedOnClick_Unchecked;
begin
  AssertEquals('Visualised unchecked', 'OK', CallCheck('TestVisClick_Unchecked'));
end;

{ GetSingleFibroidDimensions }

procedure TTestFibroids.TestSingleDimensions_AllFour;
begin
  AssertEquals('All four dimensions', 'OK', CallCheck('TestDimensions_AllFour'));
end;

procedure TTestFibroids.TestSingleDimensions_ThreeDims;
begin
  AssertEquals('Three dimensions', 'OK', CallCheck('TestDimensions_ThreeDims'));
end;

procedure TTestFibroids.TestSingleDimensions_TwoDims;
begin
  AssertEquals('Two dimensions', 'OK', CallCheck('TestDimensions_TwoDims'));
end;

procedure TTestFibroids.TestSingleDimensions_OneOnly;
begin
  AssertEquals('One dimension', 'OK', CallCheck('TestDimensions_OneOnly'));
end;

procedure TTestFibroids.TestSingleDimensions_None;
begin
  AssertEquals('No dimensions', 'OK', CallCheck('TestDimensions_None'));
end;

initialization
  RegisterTest(TTestFibroids);

end.
