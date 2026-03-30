   6 procedure spFibroidCountOnChange(Sender)
   6 procedure cbToggleCheckOnClick(Sender)
   6 procedure cbFibroidsVisualisedOnClick(sender)
   6 procedure StartScript;
   6 procedure ProduceMergeOrder;
   6 procedure ProduceMergeFieldData;
   6 procedure InitializeScreen;
   6 function StringReplace(inSource, inMatch, inReplace: String): String;
   6 function StrToIntDef(inString: string; inDefault: Integer): Integer;
   6 function StrToFloatDef(inString: string; inDefault: Real): Real;
   6 function Max(A, B: Integer): Integer;
   6 function InitCaps(inv: string; inReduce: Boolean): string;
   6 function IncludeComma(inString: string): string;
   6 function GetSingleFibroidDimensions: string;
   6 function GetSingleFibroid: string;
   6 function GetNumberString(inNumber: Integer): string;
   6 function GetIntegerMeasuredString(v1, v2, v3: Integer; v4: Double; inType: string): string;
   6 function GetIndefinateArticle(inValue: Integer; inDoCaps: Boolean): string;
   6 function GetFullDateString(inDate: TDateTime): string;
   6 function CheckFormComplete: Boolean;
   6 function AddToResult(inResult, inNew: string): string;
   6 function AddFullstopToEnd(inStr: String): String;
   6 function AddFullStop(inStr: String): String;
   5 procedure deStatedEDDOnChange(Sender);
   5 procedure PopulateEDDControls(inDate: TcxDateEdit; inWeeks, inDay: TcxSpinEdit);
   5 function getFibroid : String;
   5 function StringReplaceAll(inSource, inMatch, inReplace: String): String;
   5 function PadDecimalPlaces(inStr: String): String;
   5 function Min(in1, in2: Integer): Integer;
   5 function GetWeeksFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;
   5 function GetSingleCloseOrClear: String;
   5 function GetDaysFromDueDate(inEDDDate, inExamDate: TDateTime): Integer;
   5 function GetClinicalIndicators: String;
   5 function GetClinicalHistory: String;
   5 function GetCavDistortionCount: Integer;
   4 procedure cxccbObstetricHistoryChange(Sender);
   4 procedure cbFetalAnatomyNormal1OnClick(sender);
   4 procedure SetAbnormalCheckes(inControl: TcxGroupBox; inValue: Boolean);
   4 function getEFW(inFetus : integer) : string
   4 function GetValueSuffix(inValue: Integer): String;
   4 function GetPerGraph(sender : TcxMaskEdit; inShowValue: Boolean): String;
   4 function GetObstetricHistory: String;
   4 function GetLiquor95Centile(inWeeks : integer) : Real;
   4 function GetLiquor5Centile(inWeeks : integer) : real;
   4 function GetGraphXValue(inControl: String): Real;
   4 function GetGestWeeks: integer;
   4 function GetGestDays: integer;
   4 function GetFibroidString (inFibroid: Integer): string;
   3 procedure getBiometryPercentiles(sender);
   3 procedure cxccbReferralIndicatorsChange(Sender);
   3 procedure cbUSSEDDOnChange(Sender);
   3 procedure cbGestationTypeChange(Sender);
   3 procedure ToggleCloseToCervixFibroid(sender);
   3 function getCompositeDate : String;
   3 function GetPlacenta: String;
   3 function GetPlacenta1Measure: String;
   3 function GetNormalUAPIRange(inWeeks: Integer): Real;
   3 function GetNormalMCAPIRange(inWeeks: Integer): Real;
   3 function GetNormalCPRRange(inWeeks: Integer): Real;
   3 function GetMoMRange(inWeeks: Integer): Real;
   3 function GetEnteredEDD :String
   2 procedure seTransferDayOnChange(Sender);
   2 procedure deOvulationEDDOnChange(Sender);
   2 procedure deMenstrualEDDOnChange(Sender);
   2 procedure deMUFWEddOnChange(Sender);
   2 procedure deIVFEDDOnChange(Sender);
   2 procedure cxccbReferralIndicationChange(Sender);
   2 procedure cbLMPDateOnChange(Sender);
   2 procedure cbFibroidsTypeOnChange(Sender)
   2 procedure cbEDDPrincipleOnChange(sender)
   2 procedure cbDateOfConceptionOnChange(Sender);
   2 procedure btnSelectAll1OnClick(sender)
   2 procedure btnPregnancyRedatedOnClick(Sender);
   2 procedure btnGeneratePercentilesOnClick(sender);
   2 procedure btnClear1OnClick(sender)
   2 procedure CalcFetalScore(Sender);
   2 function getReportHeading : String
   2 function getPlacentaBeyond(infetus : integer) : string
   2 function getOvaryWarning : Boolean
   2 function getAnatomyWarning : Boolean
   2 function SetAnatomyChecks(inParent: TControl; inChecked: Boolean)
   2 function RemoveDecimalPointAtEnd(inStr: String): String;
   2 function GetWeeksFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;
   2 function GetUAPI : String
   2 function GetSingleFibroidCavity: string;
   2 function GetPlacenta1InvertPosition: String;
   2 function GetMCAPI : String
   2 function GetLargestFibroid(var isDistored: Boolean): Real;
   2 function GetFrozen: String;
   2 function GetFibroidDesc(inFibroid: Integer): string;
   2 function GetFibroidCount: string;
   2 function GetFibroidConcl: string;
   2 function GetFibroidAvg(inFibroid: Integer): integer;
   2 function GetEmbryoTransferCount: string;
   2 function GetDuctusVenosusWarning: Boolean;
   2 function GetDaysFromLMPDate(inLMPDate, inExamDate: TDateTime): Integer;
   2 function GetAnatomy : String
