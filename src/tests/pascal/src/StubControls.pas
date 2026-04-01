unit StubControls;
{
  Stub DevExpress UI control classes for PascalScript test harness.

  These are simple property bags that mimic the DevExpress controls
  used in Contrast One exam scripts. They hold property values but
  perform no real UI rendering.

  Class hierarchy mirrors what Delphi scripts expect:
    TComponent (from Classes)
      -> TStubWinControl  (registered as TWinControl)
           -> TStubTextEdit     (TcxTextEdit)
           -> TStubMaskEdit     (TcxMaskEdit)
           -> TStubCheckBox     (TcxCheckBox)
           -> TStubComboBox     (TcxComboBox)
           -> TStubSpinEdit     (TcxSpinEdit)
           -> TStubDateEdit     (TcxDateEdit)
           -> TStubGroupBox     (TcxGroupBox)
           -> TStubLabel        (TcxLabel)
           -> TStubPageControl  (TcxPageControl)
           -> TStubTabSheet     (TcxTabSheet)
           -> TStubTreeComboBox (TAdvTreeComboBox)
}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Contnrs;

type

  { Forward declarations }
  TStubWinControl = class;
  TStubItems = class;
  TStubProperties = class;
  TComponentRegistry = class;

  { ---- Nested property objects ---- }

  { TStubItems - holds the Items list for combo boxes.
    Accessed as ComboBox.Properties.Items.Count / Items[i] }
  TStubItems = class(TObject)
  private
    FList: TStringList;
    function GetCount: Integer;
    function GetItem(Index: Integer): string;
    procedure SetItem(Index: Integer; const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const S: string): Integer;
    procedure Clear;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: string read GetItem write SetItem; default;
    property List: TStringList read FList;
  end;

  { TStubProperties - intermediate object for the .Properties accessor.
    Holds Items (for combo boxes) and ActivePage (for page controls). }
  TStubProperties = class(TObject)
  private
    FItems: TStubItems;
    FActivePage: TComponent;
  public
    constructor Create;
    destructor Destroy; override;
    property Items: TStubItems read FItems;
    property ActivePage: TComponent read FActivePage write FActivePage;
  end;

  { ---- Control classes ---- }

  { TStubWinControl - base for all stub controls.
    Registered with PascalScript as TWinControl.
    Provides FindComponent, ControlCount, Controls[i], Enabled, Visible. }
  TStubWinControl = class(TComponent)
  private
    FEnabled: Boolean;
    FVisible: Boolean;
    FControls: TList;
    function GetControlCount: Integer;
    function GetControl(Index: Integer): TComponent;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddControl(AControl: TComponent);
    property Enabled: Boolean read FEnabled write FEnabled;
    property Visible: Boolean read FVisible write FVisible;
    property ControlCount: Integer read GetControlCount;
    property Controls[Index: Integer]: TComponent read GetControl;
  end;

  { TStubTextEdit - registered as TcxTextEdit }
  TStubTextEdit = class(TStubWinControl)
  private
    FText: string;
  public
    property Text: string read FText write FText;
  end;

  { TStubMaskEdit - registered as TcxMaskEdit }
  TStubMaskEdit = class(TStubWinControl)
  private
    FText: string;
  public
    property Text: string read FText write FText;
  end;

  { TStubCheckBox - registered as TcxCheckBox }
  TStubCheckBox = class(TStubWinControl)
  private
    FChecked: Boolean;
  public
    property Checked: Boolean read FChecked write FChecked;
  end;

  { TStubComboBox - registered as TcxComboBox.
    Also doubles as TcxCheckComboBox with States[] and ShortDescription[]. }
  TStubComboBox = class(TStubWinControl)
  private
    FItemIndex: Integer;
    FText: string;
    FProperties: TStubProperties;
    FStates: array of Integer;
    FShortDescriptions: array of string;
    function GetState(Index: Integer): Integer;
    procedure SetState(Index: Integer; Value: Integer);
    function GetShortDescription(Index: Integer): string;
    procedure SetShortDescription(Index: Integer; const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Ensure States/ShortDescriptions arrays are at least Count elements }
    procedure EnsureStateCount(ACount: Integer);
    { Add an item to Properties.Items and ensure States/ShortDescriptions
      arrays are sized to match. Returns the new index. }
    function AddItem(const AText: string): Integer;
    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property Text: string read FText write FText;
    property Properties: TStubProperties read FProperties;
    property States[Index: Integer]: Integer read GetState write SetState;
    property ShortDescription[Index: Integer]: string read GetShortDescription write SetShortDescription;
  end;

  { TStubSpinEdit - registered as TcxSpinEdit }
  TStubSpinEdit = class(TStubWinControl)
  private
    FValue: Double;
  public
    property Value: Double read FValue write FValue;
  end;

  { TStubDateEdit - registered as TcxDateEdit }
  TStubDateEdit = class(TStubWinControl)
  private
    FDate: TDateTime;
  public
    property Date: TDateTime read FDate write FDate;
  end;

  { TStubGroupBox - registered as TcxGroupBox }
  TStubGroupBox = class(TStubWinControl)
  private
    FHeight: Integer;
    FCaption: string;
  public
    property Height: Integer read FHeight write FHeight;
    property Caption: string read FCaption write FCaption;
  end;

  { TStubLabel - registered as TcxLabel }
  TStubLabel = class(TStubWinControl)
  private
    FCaption: string;
  public
    property Caption: string read FCaption write FCaption;
  end;

  { TStubPageControl - registered as TcxPageControl }
  TStubPageControl = class(TStubWinControl)
  private
    FProperties: TStubProperties;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Properties: TStubProperties read FProperties;
  end;

  { TStubTabSheet - registered as TcxTabSheet }
  TStubTabSheet = class(TStubWinControl)
  private
    FTabVisible: Boolean;
  public
    property TabVisible: Boolean read FTabVisible write FTabVisible;
  end;

  { TStubTreeComboBox - registered as TAdvTreeComboBox }
  TStubTreeComboBox = class(TStubWinControl)
  private
    FText: string;
    FSelection: string;
  public
    property Text: string read FText write FText;
    property Selection: string read FSelection write FSelection;
  end;


  { ---- Component Registry ---- }

  { TComponentRegistry - flat name->component dictionary.
    Used by FindComponent to resolve dynamic control lookups.
    Case-insensitive. Owns all registered components. }
  TComponentRegistry = class(TComponent)
  private
    FMap: TFPHashObjectList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    { Register an existing control }
    procedure RegisterControl(AControl: TComponent);

    { Find by name (case-insensitive) }
    function FindByName(const AName: string): TComponent;

    { Clear all registered controls }
    procedure Clear;

    { Factory methods - create, register and return typed controls }
    function AddTextEdit(const AName: string): TStubTextEdit;
    function AddMaskEdit(const AName: string): TStubMaskEdit;
    function AddCheckBox(const AName: string): TStubCheckBox;
    function AddComboBox(const AName: string): TStubComboBox;
    function AddSpinEdit(const AName: string): TStubSpinEdit;
    function AddDateEdit(const AName: string): TStubDateEdit;
    function AddGroupBox(const AName: string): TStubGroupBox;
    function AddLabel(const AName: string): TStubLabel;
    function AddPageControl(const AName: string): TStubPageControl;
    function AddTabSheet(const AName: string): TStubTabSheet;
    function AddTreeComboBox(const AName: string): TStubTreeComboBox;

    { Typed accessors - find and cast, or nil }
    function TextEdit(const AName: string): TStubTextEdit;
    function MaskEdit(const AName: string): TStubMaskEdit;
    function CheckBox(const AName: string): TStubCheckBox;
    function ComboBox(const AName: string): TStubComboBox;
    function SpinEdit(const AName: string): TStubSpinEdit;
    function DateEdit(const AName: string): TStubDateEdit;
    function GroupBox(const AName: string): TStubGroupBox;
    function LabelCtrl(const AName: string): TStubLabel;
    function PageControl(const AName: string): TStubPageControl;
    function TabSheet(const AName: string): TStubTabSheet;
    function TreeComboBox(const AName: string): TStubTreeComboBox;
  end;

{ Global registry for FindComponent resolution from PascalScript }
procedure SetGlobalRegistry(ARegistry: TComponentRegistry);
function GetGlobalRegistry: TComponentRegistry;

implementation

var
  GRegistry: TComponentRegistry = nil;

procedure SetGlobalRegistry(ARegistry: TComponentRegistry);
begin
  GRegistry := ARegistry;
end;

function GetGlobalRegistry: TComponentRegistry;
begin
  Result := GRegistry;
end;

{ ---- TStubItems ---- }

constructor TStubItems.Create;
begin
  inherited Create;
  FList := TStringList.Create;
end;

destructor TStubItems.Destroy;
begin
  FList.Free;
  inherited Destroy;
end;

function TStubItems.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TStubItems.GetItem(Index: Integer): string;
begin
  Result := FList[Index];
end;

procedure TStubItems.SetItem(Index: Integer; const Value: string);
begin
  FList[Index] := Value;
end;

function TStubItems.Add(const S: string): Integer;
begin
  Result := FList.Add(S);
end;

procedure TStubItems.Clear;
begin
  FList.Clear;
end;

{ ---- TStubProperties ---- }

constructor TStubProperties.Create;
begin
  inherited Create;
  FItems := TStubItems.Create;
  FActivePage := nil;
end;

destructor TStubProperties.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

{ ---- TStubWinControl ---- }

constructor TStubWinControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := True;
  FVisible := True;
  FControls := TList.Create;
end;

destructor TStubWinControl.Destroy;
begin
  FControls.Free;
  inherited Destroy;
end;

procedure TStubWinControl.AddControl(AControl: TComponent);
begin
  FControls.Add(AControl);
end;

function TStubWinControl.GetControlCount: Integer;
begin
  Result := FControls.Count;
end;

function TStubWinControl.GetControl(Index: Integer): TComponent;
begin
  Result := TComponent(FControls[Index]);
end;

{ ---- TStubComboBox ---- }

constructor TStubComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProperties := TStubProperties.Create;
  FItemIndex := -1;
  SetLength(FStates, 0);
  SetLength(FShortDescriptions, 0);
end;

destructor TStubComboBox.Destroy;
begin
  FProperties.Free;
  inherited Destroy;
end;

procedure TStubComboBox.EnsureStateCount(ACount: Integer);
begin
  if Length(FStates) < ACount then
    SetLength(FStates, ACount);
  if Length(FShortDescriptions) < ACount then
    SetLength(FShortDescriptions, ACount);
end;

function TStubComboBox.AddItem(const AText: string): Integer;
begin
  Result := FProperties.Items.Add(AText);
  EnsureStateCount(FProperties.Items.Count);
end;

function TStubComboBox.GetState(Index: Integer): Integer;
begin
  if (Index >= 0) and (Index < Length(FStates)) then
    Result := FStates[Index]
  else
    Result := 0;
end;

procedure TStubComboBox.SetState(Index: Integer; Value: Integer);
begin
  if Index >= Length(FStates) then
    EnsureStateCount(Index + 1);
  FStates[Index] := Value;
end;

function TStubComboBox.GetShortDescription(Index: Integer): string;
begin
  if (Index >= 0) and (Index < Length(FShortDescriptions)) then
    Result := FShortDescriptions[Index]
  else
    Result := '';
end;

procedure TStubComboBox.SetShortDescription(Index: Integer; const Value: string);
begin
  if Index >= Length(FShortDescriptions) then
    EnsureStateCount(Index + 1);
  FShortDescriptions[Index] := Value;
end;

{ ---- TStubPageControl ---- }

constructor TStubPageControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProperties := TStubProperties.Create;
end;

destructor TStubPageControl.Destroy;
begin
  FProperties.Free;
  inherited Destroy;
end;

{ ---- TComponentRegistry ---- }

constructor TComponentRegistry.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { OwnsObjects=False because the registry owns components via TComponent ownership }
  FMap := TFPHashObjectList.Create(False);
end;

destructor TComponentRegistry.Destroy;
begin
  FMap.Free;
  inherited Destroy;
end;

procedure TComponentRegistry.RegisterControl(AControl: TComponent);
begin
  { Insert into the registry. Use UpperCase for case-insensitive lookup. }
  FMap.Add(UpperCase(AControl.Name), AControl);
  { Also insert as a child of this registry so FindComponent works
    through the standard TComponent mechanism }
  AControl.FreeNotification(Self);
end;

function TComponentRegistry.FindByName(const AName: string): TComponent;
var
  Idx: Integer;
begin
  Idx := FMap.FindIndexOf(UpperCase(AName));
  if Idx >= 0 then
    Result := TComponent(FMap.Items[Idx])
  else
    Result := nil;
end;

procedure TComponentRegistry.Clear;
begin
  FMap.Clear;
end;

{ Factory methods }

function TComponentRegistry.AddTextEdit(const AName: string): TStubTextEdit;
begin
  Result := TStubTextEdit.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddMaskEdit(const AName: string): TStubMaskEdit;
begin
  Result := TStubMaskEdit.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddCheckBox(const AName: string): TStubCheckBox;
begin
  Result := TStubCheckBox.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddComboBox(const AName: string): TStubComboBox;
begin
  Result := TStubComboBox.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddSpinEdit(const AName: string): TStubSpinEdit;
begin
  Result := TStubSpinEdit.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddDateEdit(const AName: string): TStubDateEdit;
begin
  Result := TStubDateEdit.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddGroupBox(const AName: string): TStubGroupBox;
begin
  Result := TStubGroupBox.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddLabel(const AName: string): TStubLabel;
begin
  Result := TStubLabel.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddPageControl(const AName: string): TStubPageControl;
begin
  Result := TStubPageControl.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddTabSheet(const AName: string): TStubTabSheet;
begin
  Result := TStubTabSheet.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

function TComponentRegistry.AddTreeComboBox(const AName: string): TStubTreeComboBox;
begin
  Result := TStubTreeComboBox.Create(Self);
  Result.Name := AName;
  RegisterControl(Result);
end;

{ Typed accessors }

function TComponentRegistry.TextEdit(const AName: string): TStubTextEdit;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubTextEdit then Result := TStubTextEdit(C) else Result := nil;
end;

function TComponentRegistry.MaskEdit(const AName: string): TStubMaskEdit;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubMaskEdit then Result := TStubMaskEdit(C) else Result := nil;
end;

function TComponentRegistry.CheckBox(const AName: string): TStubCheckBox;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubCheckBox then Result := TStubCheckBox(C) else Result := nil;
end;

function TComponentRegistry.ComboBox(const AName: string): TStubComboBox;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubComboBox then Result := TStubComboBox(C) else Result := nil;
end;

function TComponentRegistry.SpinEdit(const AName: string): TStubSpinEdit;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubSpinEdit then Result := TStubSpinEdit(C) else Result := nil;
end;

function TComponentRegistry.DateEdit(const AName: string): TStubDateEdit;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubDateEdit then Result := TStubDateEdit(C) else Result := nil;
end;

function TComponentRegistry.GroupBox(const AName: string): TStubGroupBox;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubGroupBox then Result := TStubGroupBox(C) else Result := nil;
end;

function TComponentRegistry.LabelCtrl(const AName: string): TStubLabel;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubLabel then Result := TStubLabel(C) else Result := nil;
end;

function TComponentRegistry.PageControl(const AName: string): TStubPageControl;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubPageControl then Result := TStubPageControl(C) else Result := nil;
end;

function TComponentRegistry.TabSheet(const AName: string): TStubTabSheet;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubTabSheet then Result := TStubTabSheet(C) else Result := nil;
end;

function TComponentRegistry.TreeComboBox(const AName: string): TStubTreeComboBox;
var C: TComponent;
begin
  C := FindByName(AName);
  if C is TStubTreeComboBox then Result := TStubTreeComboBox(C) else Result := nil;
end;

end.
