unit PSRegistration;
{
  Registers built-in functions that PascalScript scripts depend on.

  PascalScript already provides these as built-ins (do NOT register):
    IntToStr, StrToInt, StrToIntDef, Copy, Pos, Delete, Insert,
    Length, SetLength, Trim, UpperCase, LowerCase, StrToFloat,
    FloatToStr, Trunc, Round, Abs, Sin, Cos, Sqrt, Ord, Chr,
    Assigned, High, Low, Inc, Dec, SizeOf

  We register:
    - Format (not built into PascalScript)
    - ShowMessage (no-op for test harness)
    - Date/Time functions via the PascalScript dateutils library
    - TObject/TPersistent/TComponent via the PascalScript std library
}

{$mode objfpc}{$H+}

interface

uses
  uPSCompiler, uPSRuntime, uPSUtils;

function StandardOnUses(Sender: TPSPascalCompiler;
  const Name: tbtstring): Boolean;

procedure RegisterRuntimeStd(Exec: TPSExec;
  ClassImporter: TPSRuntimeClassImporter);

implementation

uses
  SysUtils, Classes,
  uPSC_std, uPSR_std,
  uPSC_dateutils, uPSR_dateutils;

{ ---- Native helper implementations ---- }

procedure ShowMessage_P(const Msg: string);
begin
  // No-op in test harness (no GUI)
end;

function Format_P(const Fmt: string; const Args: array of const): string;
begin
  Result := SysUtils.Format(Fmt, Args);
end;

{ ---- Compile-time registration (OnUses callback) ---- }

function StandardOnUses(Sender: TPSPascalCompiler;
  const Name: tbtstring): Boolean;
begin
  if Name = 'SYSTEM' then
  begin
    { std library: TObject, TPersistent, TComponent }
    SIRegister_Std(Sender);

    { Date/time library: TDateTime, Now, Date, FormatDateTime, etc. }
    RegisterDateTimeLibrary_C(Sender);

    { Type aliases used by Delphi scripts but not built into PascalScript }
    Sender.AddTypeS('Real', 'Double');

    { ShowMessage - no-op stub }
    Sender.AddDelphiFunction(
      'procedure ShowMessage(const Msg: string);');

    Result := True;
  end
  else
    Result := False;
end;

{ ---- Runtime registration ---- }

procedure RegisterRuntimeStd(Exec: TPSExec;
  ClassImporter: TPSRuntimeClassImporter);
begin
  { std library runtime }
  RIRegister_Std(ClassImporter);
  RegisterClassLibraryRuntime(Exec, ClassImporter);

  { Date/time library runtime }
  RegisterDateTimeLibrary_R(Exec);

  { ShowMessage - no-op }
  Exec.RegisterDelphiFunction(@ShowMessage_P, 'ShowMessage', cdRegister);
end;

end.
