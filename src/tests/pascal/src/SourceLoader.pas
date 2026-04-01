unit SourceLoader;
{
  Loads GPP-preprocessed Pascal source files for PascalScript test execution.
  Applies text substitutions for PascalScript compatibility:
    - .Properties.Items.Count -> .GetItemCount (nested property not supported)
    - .Properties.ActivePage -> .ActivePage (nested property not supported)
}

{$mode objfpc}{$H+}

interface

function LoadPascalSource(const FileName: string): string;

implementation

uses
  Classes, SysUtils;

function LoadPascalSource(const FileName: string): string;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);
    Result := SL.Text;
    Result := StringReplace(Result, '.Properties.Items.Count', '.GetItemCount', [rfReplaceAll]);
    Result := StringReplace(Result, '.Properties.ActivePage', '.ActivePage', [rfReplaceAll]);
  finally
    SL.Free;
  end;
end;

end.
