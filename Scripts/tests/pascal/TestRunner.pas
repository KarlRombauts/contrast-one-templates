program TestRunner;
{$mode objfpc}{$H+}
uses
  Classes, SysUtils, consoletestrunner,
  TestPureUtils, TestGestationalAge, TestStubControls,
  TestClinicalHistory, TestEDDHandling;

var
  App: TTestRunner;
begin
  App := TTestRunner.Create(nil);
  try
    App.Initialize;
    App.Run;
  finally
    App.Free;
  end;
end.
