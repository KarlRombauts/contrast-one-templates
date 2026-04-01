unit ScriptHost;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Contnrs,
  uPSCompiler, uPSRuntime, uPSUtils, uPSC_std, uPSR_std;

type
  TCompileEvent = procedure(Compiler: TPSPascalCompiler) of object;
  TExecEvent = procedure(Exec: TPSExec; ClassImporter: TPSRuntimeClassImporter) of object;

  TScriptHost = class
  private
    FCompiler: TPSPascalCompiler;
    FExec: TPSExec;
    FBytecode: tbtstring;
    FCompiled: Boolean;
    FLastError: string;
    FOnCompile: TCompileEvent;
    FOnExec: TExecEvent;
    FClassImporter: TPSRuntimeClassImporter;
  public
    constructor Create;
    destructor Destroy; override;

    function CompileScript(const Source: string): Boolean;
    function LoadAndCompileFile(const FileName: string): Boolean;
    function Execute: Boolean;

    function CallFunctionByName(const Name: string;
      const Params: array of Variant): Variant;
    procedure CallProcedureByName(const Name: string;
      const Params: array of Variant);

    procedure SetVariable(const Name: string; Value: Pointer;
      const TypeName: string);

    { Bind a TObject instance to a script-level global variable.
      Call AFTER Execute. The variable must be declared in the script
      source as 'var VarName: TypeName'. }
    procedure SetVarToInstance(const VarName: string; Instance: TObject);

    property Compiled: Boolean read FCompiled;
    property LastError: string read FLastError;
    property Compiler: TPSPascalCompiler read FCompiler;
    property Exec: TPSExec read FExec;
    property ClassImporter: TPSRuntimeClassImporter read FClassImporter;
    property OnCompile: TCompileEvent read FOnCompile write FOnCompile;
    property OnExec: TExecEvent read FOnExec write FOnExec;
  end;

implementation

constructor TScriptHost.Create;
begin
  inherited Create;
  FCompiler := TPSPascalCompiler.Create;
  FExec := TPSExec.Create;
  FClassImporter := TPSRuntimeClassImporter.Create;
  FCompiled := False;
  FLastError := '';
end;

destructor TScriptHost.Destroy;
begin
  FClassImporter.Free;
  FExec.Free;
  FCompiler.Free;
  inherited Destroy;
end;

function TScriptHost.CompileScript(const Source: string): Boolean;
var
  i: Integer;
begin
  FCompiled := False;
  FLastError := '';

  if not FCompiler.Compile(Source) then
  begin
    FLastError := '';
    for i := 0 to FCompiler.MsgCount - 1 do
    begin
      if FLastError <> '' then
        FLastError := FLastError + LineEnding;
      FLastError := FLastError + FCompiler.Msg[i].MessageToString;
    end;
    Result := False;
    Exit;
  end;

  FCompiler.GetOutput(FBytecode);
  FCompiled := True;
  Result := True;
end;

function TScriptHost.LoadAndCompileFile(const FileName: string): Boolean;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);
    Result := CompileScript(SL.Text);
  finally
    SL.Free;
  end;
end;

function TScriptHost.Execute: Boolean;
begin
  Result := False;
  if not FCompiled then
  begin
    FLastError := 'Script not compiled';
    Exit;
  end;

  if not FExec.LoadData(FBytecode) then
  begin
    FLastError := 'Failed to load bytecode';
    Exit;
  end;

  FExec.RunScript;
  Result := True;
end;

function TScriptHost.CallFunctionByName(const Name: string;
  const Params: array of Variant): Variant;
var
  ProcNo: Cardinal;
  ParamList: TPSList;
  Param, RetVal: PIFVariant;
  i: Integer;
begin
  Result := Null;
  ProcNo := FExec.GetProc(Name);
  if ProcNo = InvalidVal then
  begin
    FLastError := 'Function not found: ' + Name;
    raise Exception.Create(FLastError);
  end;

  ParamList := TPSList.Create;
  try
    // Add parameters in reverse order (PascalScript convention)
    for i := High(Params) downto Low(Params) do
    begin
      Param := CreateHeapVariant(FExec.FindType2(btVariant));
      if Param = nil then
        Param := CreateHeapVariant(FExec.FindType2(btVariant));
      PPSVariantVariant(Param)^.Data := Params[i];
      ParamList.Add(Param);
    end;

    // Return value
    RetVal := CreateHeapVariant(FExec.FindType2(btVariant));
    ParamList.Add(RetVal);

    FExec.RunProc(ParamList, ProcNo);

    Result := PPSVariantVariant(RetVal)^.Data;
  finally
    FreePIFVariantList(ParamList);
  end;
end;

procedure TScriptHost.CallProcedureByName(const Name: string;
  const Params: array of Variant);
var
  ProcNo: Cardinal;
  ParamList: TPSList;
  Param: PIFVariant;
  i: Integer;
begin
  ProcNo := FExec.GetProc(Name);
  if ProcNo = InvalidVal then
  begin
    FLastError := 'Procedure not found: ' + Name;
    raise Exception.Create(FLastError);
  end;

  ParamList := TPSList.Create;
  try
    for i := High(Params) downto Low(Params) do
    begin
      Param := CreateHeapVariant(FExec.FindType2(btVariant));
      PPSVariantVariant(Param)^.Data := Params[i];
      ParamList.Add(Param);
    end;

    FExec.RunProc(ParamList, ProcNo);
  finally
    FreePIFVariantList(ParamList);
  end;
end;

procedure TScriptHost.SetVariable(const Name: string; Value: Pointer;
  const TypeName: string);
begin
  // Will be implemented when stubs are needed
end;

procedure TScriptHost.SetVarToInstance(const VarName: string; Instance: TObject);
var
  V: PIFVariant;
begin
  V := FExec.GetVar2(VarName);
  if V = nil then
    raise Exception.CreateFmt('SetVarToInstance: variable "%s" not found', [VarName]);
  SetVariantToClass(V, Instance);
end;

end.
