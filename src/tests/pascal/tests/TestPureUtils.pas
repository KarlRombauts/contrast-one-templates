unit TestPureUtils;
{
  Tests for pure utility functions from the shared library.
  These functions have no UI dependencies and can be tested in isolation.

  Source is loaded from GPP-preprocessed build/ files at runtime via
  SourceLoader, then compiled and called individually via the ScriptHost.
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

uses SourceLoader;

procedure TTestPureUtils.SetUp;
var
  Source: string;
begin
  FSetupOk := False;
  FHost := TScriptHost.Create;
  FHost.Compiler.OnUses := @StandardOnUses;

  Source := LoadPascalSource('build/strUtils.pas') +
            LoadPascalSource('build/formatting.pas') +
            LoadPascalSource('build/articles.pas') +
            LoadPascalSource('build/formUtils.pas') +
            LineEnding + 'begin' + LineEnding + 'end.';

  if not FHost.CompileScript(Source) then
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
  R := CallIntFn('StrToIntDef', ['42', 0]);
  AssertEquals('Should parse valid int', 42, R);
end;

procedure TTestPureUtils.TestStrToIntDef_InvalidReturnsDefault;
var
  R: Integer;
begin
  R := CallIntFn('StrToIntDef', ['xyz', -1]);
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
  AssertEquals('Should append period and space', 'hello. ', R);
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
