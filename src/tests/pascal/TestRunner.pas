program TestRunner;
{$mode objfpc}{$H+}
uses
  Classes, SysUtils, consoletestrunner,
  SourceLoader,
  TestPureUtils, TestGestationalAge, TestStubControls,
  TestClinicalHistory, TestEDDHandling, TestFibroids;

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
