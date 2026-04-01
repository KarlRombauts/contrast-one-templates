unit TestPureUtils;
{
  Tests for pure utility functions from the shared library.
  These functions have no UI dependencies and can be tested in isolation.

  Functions are compiled as an inline PascalScript source string, then
  called individually via the ScriptHost.
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  ScriptHost, PSRegistration;

type
  TTestPureUtils = class(TTestCase)
  private
    FHost: TScriptHost;
    FSetupOk: Boolean;

    { Helper: call a script function returning a string }
    function CallStrFn(const Name: string;
      const Params: array of Variant): string;
    { Helper: call a script function returning a float }
    function CallFloatFn(const Name: string;
      const Params: array of Variant): Double;
    { Helper: call a script function returning an integer }
    function CallIntFn(const Name: string;
      const Params: array of Variant): Integer;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    { StrToFloatDef }
    procedure TestStrToFloatDef_ValidFloat;
    procedure TestStrToFloatDef_InvalidReturnsDefault;
    procedure TestStrToFloatDef_EmptyReturnsDefault;

    { StrToIntDef (PascalScript built-in) }
    procedure TestStrToIntDef_ValidInt;
    procedure TestStrToIntDef_InvalidReturnsDefault;

    { StringReplace }
    procedure TestStringReplace_Basic;
    procedure TestStringReplace_NoMatch;

    { StringReplaceAll }
    procedure TestStringReplaceAll_Multiple;
    procedure TestStringReplaceAll_NoMatch;

    { InitCaps }
    procedure TestInitCaps_Capitalize;
    procedure TestInitCaps_Reduce;
    procedure TestInitCaps_EmptyString;

    { IncludeComma }
    procedure TestIncludeComma_NonEmpty;
    procedure TestIncludeComma_Empty;

    { AddFullStop }
    procedure TestAddFullStop_AddsStop;
    procedure TestAddFullStop_AlreadyHasStop;
    procedure TestAddFullStop_Empty;

    { GetNumberString }
    procedure TestGetNumberString_One;
    procedure TestGetNumberString_Five;
    procedure TestGetNumberString_Nine;
    procedure TestGetNumberString_Ten;

    { RemoveDecimalPointAtEnd }
    procedure TestRemoveDecimalPoint_HasDot;
    procedure TestRemoveDecimalPoint_NoDot;

    { GetIndefinateArticle }
    procedure TestGetArticle_Normal;
    procedure TestGetArticle_Eight;
    procedure TestGetArticle_Eleven;
    procedure TestGetArticle_Caps;

    { Max / Min }
    procedure TestMax_FirstGreater;
    procedure TestMax_SecondGreater;
    procedure TestMin_FirstSmaller;
    procedure TestMin_SecondSmaller;

    { AddToResult }
    procedure TestAddToResult_BothNonEmpty;
    procedure TestAddToResult_FirstEmpty;
    procedure TestAddToResult_SecondEmpty;
    procedure TestAddToResult_BothEmpty;
  end;

implementation

const
  { Inline PascalScript source containing all pure utility functions.
    Copied from Scripts/shared/utils/ with preprocessor guards removed.

    Adaptations for PascalScript runtime:
    - result[n] := chr(...) does not work; use StrSet or string concat instead
    - StrGet2(s, i) is used instead of s[i] for reading chars from result
    - StrToIntDef is a built-in but not callable via GetProc; wrapped here
    - Real type alias registered in PSRegistration }
  PURE_UTILS_SOURCE =
    'function StrToFloatDef(inString: string; inDefault: Real): Real;'  + LineEnding +
    'begin'                                                              + LineEnding +
    '  try'                                                              + LineEnding +
    '    result := StrToFloat(inString);'                                + LineEnding +
    '  except'                                                           + LineEnding +
    '    result := inDefault;'                                           + LineEnding +
    '  end;'                                                             + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    { Wrapper around the PascalScript built-in StrToIntDef so we can call
      it via GetProc/RunProc. The built-in is not directly addressable. }
    'function MyStrToIntDef(inString: string; inDefault: Integer): Integer;' + LineEnding +
    'begin'                                                              + LineEnding +
    '  result := StrToIntDef(inString, inDefault);'                      + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function StringReplace(inSource, inMatch, inReplace: String): String;' + LineEnding +
    'var'                                                                + LineEnding +
    '  i: Integer;'                                                      + LineEnding +
    'begin'                                                              + LineEnding +
    '  result := inSource;'                                              + LineEnding +
    '  i := Pos(inMatch, result);'                                       + LineEnding +
    '  while i > 0 do'                                                   + LineEnding +
    '  begin'                                                            + LineEnding +
    '    result := copy(inSource, 1, i-1) + inReplace + copy(inSource, i+length(inMatch), length(inSource));' + LineEnding +
    '    i := Pos(result, inMatch);'                                     + LineEnding +
    '  end;'                                                             + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function StringReplaceAll(inSource, inMatch, inReplace: String): String;' + LineEnding +
    'var'                                                                + LineEnding +
    '  i: Integer;'                                                      + LineEnding +
    'begin'                                                              + LineEnding +
    '  result := inSource;'                                              + LineEnding +
    '  i := Pos(inMatch, result);'                                       + LineEnding +
    '  while (i > 0) do'                                                 + LineEnding +
    '  begin'                                                            + LineEnding +
    '    result := copy(result, 1, i-1) + inReplace + copy(result, i+length(inMatch), length(result));' + LineEnding +
    '    i := Pos(inMatch, result);'                                     + LineEnding +
    '  end;'                                                             + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    { InitCaps: PascalScript does not support result[1] := chr(...)
      because string index assignment on result does not work.
      We use StrSet on a local var instead to mutate the first char. }
    'function InitCaps(inv: string; inReduce: Boolean): string;'         + LineEnding +
    'var'                                                                + LineEnding +
    '  vDiff: Integer;'                                                  + LineEnding +
    '  vOrd: Integer;'                                                   + LineEnding +
    '  vTmp: string;'                                                    + LineEnding +
    'begin'                                                              + LineEnding +
    '  if inv <> '''' then'                                              + LineEnding +
    '  begin'                                                            + LineEnding +
    '    vDiff := Ord(''A'') - Ord(''a'');'                              + LineEnding +
    '    vTmp := inv;'                                                   + LineEnding +
    '    vOrd := Ord(vTmp[1]);'                                          + LineEnding +
    '    if inReduce then'                                               + LineEnding +
    '    begin'                                                          + LineEnding +
    '      if (vOrd >= Ord(''A'')) and (vOrd <= Ord(''Z'')) then'        + LineEnding +
    '      begin'                                                        + LineEnding +
    '        StrSet(chr(vOrd - vDiff), 1, vTmp);'                        + LineEnding +
    '        result := vTmp;'                                            + LineEnding +
    '      end'                                                          + LineEnding +
    '      else'                                                         + LineEnding +
    '        result := inv;'                                             + LineEnding +
    '    end'                                                            + LineEnding +
    '    else'                                                           + LineEnding +
    '    begin'                                                          + LineEnding +
    '      if (vOrd >= Ord(''a'')) and (vOrd <= Ord(''z'')) then'        + LineEnding +
    '      begin'                                                        + LineEnding +
    '        StrSet(chr(vOrd + vDiff), 1, vTmp);'                        + LineEnding +
    '        result := vTmp;'                                            + LineEnding +
    '      end'                                                          + LineEnding +
    '      else'                                                         + LineEnding +
    '        result := inv;'                                             + LineEnding +
    '    end;'                                                           + LineEnding +
    '  end'                                                              + LineEnding +
    '  else'                                                             + LineEnding +
    '    result := '''';'                                                + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function IncludeComma(inString: string): string;'                   + LineEnding +
    'var'                                                                + LineEnding +
    '  v1: string;'                                                      + LineEnding +
    'begin'                                                              + LineEnding +
    '  v1 := '''';'                                                      + LineEnding +
    '  if Length(inString) > 0 then'                                     + LineEnding +
    '    v1 := inString + '', '';'                                       + LineEnding +
    '  result := v1;'                                                    + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function AddFullStop(inStr: String): String;'                       + LineEnding +
    'var'                                                                + LineEnding +
    '  vt: String;'                                                      + LineEnding +
    'begin'                                                              + LineEnding +
    '  vt := Trim(inStr);'                                               + LineEnding +
    '  if vt <> '''' then'                                               + LineEnding +
    '  begin'                                                            + LineEnding +
    '    if vt[length(vt)] <> ''.'' then'                                + LineEnding +
    '      result := vt + ''.  '''                                       + LineEnding +
    '    else'                                                           + LineEnding +
    '      result := inStr;'                                             + LineEnding +
    '  end'                                                              + LineEnding +
    '  else'                                                             + LineEnding +
    '    result := '''' '                                                + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function GetNumberString(inNumber: Integer): string;'               + LineEnding +
    'begin'                                                              + LineEnding +
    '  result := '''';'                                                  + LineEnding +
    '  if inNumber = 1 then'                                             + LineEnding +
    '    result := ''a single'''                                         + LineEnding +
    '  else'                                                             + LineEnding +
    '  begin'                                                            + LineEnding +
    '    if inNumber = 2 then'                                           + LineEnding +
    '      result := ''two'''                                            + LineEnding +
    '    else if inNumber = 3 then'                                      + LineEnding +
    '      result := ''three'''                                          + LineEnding +
    '    else if inNumber = 4 then'                                      + LineEnding +
    '      result := ''four'''                                           + LineEnding +
    '    else if inNumber = 5 then'                                      + LineEnding +
    '      result := ''five'''                                           + LineEnding +
    '    else if inNumber = 6 then'                                      + LineEnding +
    '      result := ''six'''                                            + LineEnding +
    '    else if inNumber = 7 then'                                      + LineEnding +
    '      result := ''seven'''                                          + LineEnding +
    '    else if inNumber = 8 then'                                      + LineEnding +
    '      result := ''eight'''                                          + LineEnding +
    '    else if inNumber = 9 then'                                      + LineEnding +
    '      result := ''nine'''                                           + LineEnding +
    '    else'                                                           + LineEnding +
    '      result := IntToStr(inNumber);'                                + LineEnding +
    '  end;'                                                             + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    { RemoveDecimalPointAtEnd: Use a local var instead of indexing result
      directly, since PascalScript StrGet on result may not work. }
    'function RemoveDecimalPointAtEnd(inStr: String): String;'           + LineEnding +
    'var'                                                                + LineEnding +
    '  vt: String;'                                                      + LineEnding +
    'begin'                                                              + LineEnding +
    '  vt := Trim(inStr);'                                               + LineEnding +
    '  if vt[length(vt)] = ''.'' then'                                   + LineEnding +
    '    result := copy(vt, 1, length(vt)-1)'                            + LineEnding +
    '  else'                                                             + LineEnding +
    '    result := vt;'                                                  + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function GetIndefinateArticle(inValue: Integer; inDoCaps: Boolean): string;' + LineEnding +
    'var'                                                                + LineEnding +
    '  vTemp: string;'                                                   + LineEnding +
    'begin'                                                              + LineEnding +
    '  result := '''';'                                                  + LineEnding +
    '  vTemp := IntToStr(inValue);'                                      + LineEnding +
    '  if ((length(vTemp) > 0) and (vTemp[1] = ''8'')) or (inValue = 11) or (inValue = 18) then' + LineEnding +
    '  begin'                                                            + LineEnding +
    '    if inDoCaps then'                                               + LineEnding +
    '      result := ''An'''                                             + LineEnding +
    '    else'                                                           + LineEnding +
    '      result := ''an'''                                             + LineEnding +
    '  end'                                                              + LineEnding +
    '  else'                                                             + LineEnding +
    '  begin'                                                            + LineEnding +
    '    if inDoCaps then'                                               + LineEnding +
    '      result := ''A'''                                              + LineEnding +
    '    else'                                                           + LineEnding +
    '      result := ''a'''                                              + LineEnding +
    '  end;'                                                             + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function Max(A, B: Integer): Integer;'                              + LineEnding +
    'begin'                                                              + LineEnding +
    '  if A > B then'                                                    + LineEnding +
    '    result := A'                                                    + LineEnding +
    '  else'                                                             + LineEnding +
    '    result := B;'                                                   + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function Min(in1, in2: Integer): Integer;'                          + LineEnding +
    'begin'                                                              + LineEnding +
    '  if in1 > in2 then'                                                + LineEnding +
    '    result := in2'                                                  + LineEnding +
    '  else'                                                             + LineEnding +
    '    result := in1;'                                                 + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'function AddToResult(inResult, inNew: string): string;'             + LineEnding +
    'begin'                                                              + LineEnding +
    '  result := '''';'                                                  + LineEnding +
    '  if trim(inResult) <> '''' then'                                   + LineEnding +
    '  begin'                                                            + LineEnding +
    '    if trim(inNew) <> '''' then'                                    + LineEnding +
    '      result := inResult + '', '' + trim(inNew);'                   + LineEnding +
    '  end'                                                              + LineEnding +
    '  else'                                                             + LineEnding +
    '  begin'                                                            + LineEnding +
    '    if trim(inNew) <> '''' then'                                    + LineEnding +
    '      result := trim(inNew);'                                       + LineEnding +
    '  end;'                                                             + LineEnding +
    'end;'                                                               + LineEnding +
    ''                                                                   + LineEnding +
    'begin'                                                              + LineEnding +
    'end.';

procedure TTestPureUtils.SetUp;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  if not FHost.CompileScript(PURE_UTILS_SOURCE) then
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

procedure TTestPureUtils.TearDown;
begin
  FHost.Free;
  FHost := nil;
end;

{ ---------- Helpers ---------- }

function TTestPureUtils.CallStrFn(const Name: string;
  const Params: array of Variant): string;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := string(FHost.CallFunctionByName(Name, Params));
end;

function TTestPureUtils.CallFloatFn(const Name: string;
  const Params: array of Variant): Double;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := Double(FHost.CallFunctionByName(Name, Params));
end;

function TTestPureUtils.CallIntFn(const Name: string;
  const Params: array of Variant): Integer;
begin
  AssertTrue('SetUp must succeed before calling functions', FSetupOk);
  Result := Integer(FHost.CallFunctionByName(Name, Params));
end;

{ ---------- StrToFloatDef ---------- }

procedure TTestPureUtils.TestStrToFloatDef_ValidFloat;
var
  R: Double;
begin
  R := CallFloatFn('StrToFloatDef', ['3.14', 0.0]);
  AssertEquals('Should parse valid float', 3.14, R, 0.001);
end;

procedure TTestPureUtils.TestStrToFloatDef_InvalidReturnsDefault;
var
  R: Double;
begin
  R := CallFloatFn('StrToFloatDef', ['abc', 99.5]);
  AssertEquals('Should return default for invalid string', 99.5, R, 0.001);
end;

procedure TTestPureUtils.TestStrToFloatDef_EmptyReturnsDefault;
var
  R: Double;
begin
  R := CallFloatFn('StrToFloatDef', ['', 42.0]);
  AssertEquals('Should return default for empty string', 42.0, R, 0.001);
end;

{ ---------- StrToIntDef (PS built-in) ---------- }

procedure TTestPureUtils.TestStrToIntDef_ValidInt;
var
  R: Integer;
begin
  { PS built-in StrToIntDef is not callable via GetProc; use wrapper }
  R := CallIntFn('MyStrToIntDef', ['123', 0]);
  AssertEquals('Should parse valid integer', 123, R);
end;

procedure TTestPureUtils.TestStrToIntDef_InvalidReturnsDefault;
var
  R: Integer;
begin
  R := CallIntFn('MyStrToIntDef', ['xyz', -1]);
  AssertEquals('Should return default for invalid string', -1, R);
end;

{ ---------- StringReplace ---------- }

procedure TTestPureUtils.TestStringReplace_Basic;
var
  R: string;
begin
  R := CallStrFn('StringReplace', ['hello world', 'world', 'there']);
  AssertEquals('Should replace first occurrence', 'hello there', R);
end;

procedure TTestPureUtils.TestStringReplace_NoMatch;
var
  R: string;
begin
  R := CallStrFn('StringReplace', ['hello world', 'xyz', 'there']);
  AssertEquals('Should return original when no match', 'hello world', R);
end;

{ ---------- StringReplaceAll ---------- }

procedure TTestPureUtils.TestStringReplaceAll_Multiple;
var
  R: string;
begin
  R := CallStrFn('StringReplaceAll', ['aXbXc', 'X', '-']);
  AssertEquals('Should replace all occurrences', 'a-b-c', R);
end;

procedure TTestPureUtils.TestStringReplaceAll_NoMatch;
var
  R: string;
begin
  R := CallStrFn('StringReplaceAll', ['hello', 'xyz', '-']);
  AssertEquals('Should return original when no match', 'hello', R);
end;

{ ---------- InitCaps ---------- }

procedure TTestPureUtils.TestInitCaps_Capitalize;
var
  R: string;
begin
  R := CallStrFn('InitCaps', ['hello', False]);
  AssertEquals('Should capitalize first char', 'Hello', R);
end;

procedure TTestPureUtils.TestInitCaps_Reduce;
var
  R: string;
begin
  R := CallStrFn('InitCaps', ['Hello', True]);
  AssertEquals('Should lowercase first char', 'hello', R);
end;

procedure TTestPureUtils.TestInitCaps_EmptyString;
var
  R: string;
begin
  R := CallStrFn('InitCaps', ['', False]);
  AssertEquals('Should handle empty string', '', R);
end;

{ ---------- IncludeComma ---------- }

procedure TTestPureUtils.TestIncludeComma_NonEmpty;
var
  R: string;
begin
  R := CallStrFn('IncludeComma', ['hello']);
  AssertEquals('Should append comma-space', 'hello, ', R);
end;

procedure TTestPureUtils.TestIncludeComma_Empty;
var
  R: string;
begin
  R := CallStrFn('IncludeComma', ['']);
  AssertEquals('Should return empty for empty input', '', R);
end;

{ ---------- AddFullStop ---------- }

procedure TTestPureUtils.TestAddFullStop_AddsStop;
var
  R: string;
begin
  R := CallStrFn('AddFullStop', ['hello']);
  AssertEquals('Should append period and spaces', 'hello.  ', R);
end;

procedure TTestPureUtils.TestAddFullStop_AlreadyHasStop;
var
  R: string;
begin
  R := CallStrFn('AddFullStop', ['hello.']);
  AssertEquals('Should not add another period', 'hello.', R);
end;

procedure TTestPureUtils.TestAddFullStop_Empty;
var
  R: string;
begin
  R := CallStrFn('AddFullStop', ['']);
  AssertEquals('Should return empty for empty input', '', R);
end;

{ ---------- GetNumberString ---------- }

procedure TTestPureUtils.TestGetNumberString_One;
var
  R: string;
begin
  R := CallStrFn('GetNumberString', [1]);
  AssertEquals('1 should return "a single"', 'a single', R);
end;

procedure TTestPureUtils.TestGetNumberString_Five;
var
  R: string;
begin
  R := CallStrFn('GetNumberString', [5]);
  AssertEquals('5 should return "five"', 'five', R);
end;

procedure TTestPureUtils.TestGetNumberString_Nine;
var
  R: string;
begin
  R := CallStrFn('GetNumberString', [9]);
  AssertEquals('9 should return "nine"', 'nine', R);
end;

procedure TTestPureUtils.TestGetNumberString_Ten;
var
  R: string;
begin
  R := CallStrFn('GetNumberString', [10]);
  AssertEquals('10 should return "10"', '10', R);
end;

{ ---------- RemoveDecimalPointAtEnd ---------- }

procedure TTestPureUtils.TestRemoveDecimalPoint_HasDot;
var
  R: string;
begin
  R := CallStrFn('RemoveDecimalPointAtEnd', ['123.']);
  AssertEquals('Should remove trailing dot', '123', R);
end;

procedure TTestPureUtils.TestRemoveDecimalPoint_NoDot;
var
  R: string;
begin
  R := CallStrFn('RemoveDecimalPointAtEnd', ['123']);
  AssertEquals('Should leave value without dot unchanged', '123', R);
end;

{ ---------- GetIndefinateArticle ---------- }

procedure TTestPureUtils.TestGetArticle_Normal;
var
  R: string;
begin
  R := CallStrFn('GetIndefinateArticle', [5, False]);
  AssertEquals('Should return "a" for normal number', 'a', R);
end;

procedure TTestPureUtils.TestGetArticle_Eight;
var
  R: string;
begin
  R := CallStrFn('GetIndefinateArticle', [8, False]);
  AssertEquals('Should return "an" for 8', 'an', R);
end;

procedure TTestPureUtils.TestGetArticle_Eleven;
var
  R: string;
begin
  R := CallStrFn('GetIndefinateArticle', [11, False]);
  AssertEquals('Should return "an" for 11', 'an', R);
end;

procedure TTestPureUtils.TestGetArticle_Caps;
var
  R: string;
begin
  R := CallStrFn('GetIndefinateArticle', [8, True]);
  AssertEquals('Should return "An" for 8 with caps', 'An', R);
end;

{ ---------- Max / Min ---------- }

procedure TTestPureUtils.TestMax_FirstGreater;
var
  R: Integer;
begin
  R := CallIntFn('Max', [10, 5]);
  AssertEquals('Max(10,5) should be 10', 10, R);
end;

procedure TTestPureUtils.TestMax_SecondGreater;
var
  R: Integer;
begin
  R := CallIntFn('Max', [3, 7]);
  AssertEquals('Max(3,7) should be 7', 7, R);
end;

procedure TTestPureUtils.TestMin_FirstSmaller;
var
  R: Integer;
begin
  R := CallIntFn('Min', [2, 9]);
  AssertEquals('Min(2,9) should be 2', 2, R);
end;

procedure TTestPureUtils.TestMin_SecondSmaller;
var
  R: Integer;
begin
  R := CallIntFn('Min', [8, 4]);
  AssertEquals('Min(8,4) should be 4', 4, R);
end;

{ ---------- AddToResult ---------- }

procedure TTestPureUtils.TestAddToResult_BothNonEmpty;
var
  R: string;
begin
  R := CallStrFn('AddToResult', ['first', 'second']);
  AssertEquals('Should join with comma', 'first, second', R);
end;

procedure TTestPureUtils.TestAddToResult_FirstEmpty;
var
  R: string;
begin
  R := CallStrFn('AddToResult', ['', 'second']);
  AssertEquals('Should return trimmed second', 'second', R);
end;

procedure TTestPureUtils.TestAddToResult_SecondEmpty;
var
  R: string;
begin
  R := CallStrFn('AddToResult', ['first', '']);
  AssertEquals('Should return empty when new is empty', '', R);
end;

procedure TTestPureUtils.TestAddToResult_BothEmpty;
var
  R: string;
begin
  R := CallStrFn('AddToResult', ['', '']);
  AssertEquals('Should return empty when both empty', '', R);
end;

initialization
  RegisterTest(TTestPureUtils);

end.
