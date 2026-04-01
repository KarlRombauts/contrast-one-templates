// ******************* Global Variables ************************************//

// --- Shared utilities ---
#include "shared/utils/articles.pas"
#include "shared/utils/dateUtils.pas"
#include "shared/utils/formUtils.pas"
#include "shared/utils/formatting.pas"
#include "shared/utils/strUtils.pas"

// --- Shared obstetric ---
#include "shared/obstetric/anatomy.pas"
#include "shared/obstetric/biometry.pas"
#include "shared/obstetric/cervix.pas"
#include "shared/obstetric/clinicalHistory.pas"
#include "shared/obstetric/eddHandling.pas"
#include "shared/obstetric/gestationalAge.pas"
#include "shared/obstetric/ivf.pas"
#include "shared/obstetric/liquor.pas"
#include "shared/obstetric/ovaries.pas"
#include "shared/obstetric/reportCommon.pas"
#include "shared/obstetric/uiCommon.pas"

// --- Shared gynae ---
#include "shared/gynae/fibroidUI.pas"
#include "shared/gynae/fibroids.pas"

// --- pe12week variants ---
#include "shared/variants/GetClinicalIndicators.pe12week.pas"
#include "shared/variants/GetPerGraph.pe12week.pas"
#include "shared/variants/GetPlacenta.pe12week.pas"
#include "shared/variants/cbFetalAnatomyNormal1OnClick.pe12week.pas"
#include "shared/variants/deStatedEDDOnChange.earlyT1Singleton_pe12week.pas"
#include "shared/variants/getFibroid.pe12week.pas"

// --- Exam-specific ---
#include "pe12week/report.pas"
#include "pe12week/uiHandlers.pas"
#include "pe12week/clinical.pas"

procedure StartScript;
begin
    // -----------------------------------------------------------------------------//
    InitializeScreen;
    cbGestationType.Properties.OnChange := 'cbGestationTypeChange';
    cbEDDPrinciple.Properties.OnChange := 'cbEDDPrincipleOnChange';
    deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';
    deMUFWEdd.Properties.OnChange := 'deMUFWEddOnChange';
    deLMPDate.Properties.OnChange := 'cbLMPDateOnChange';
    deMenstrualEDD.Properties.OnChange := 'deMenstrualEDDOnChange';
    deOvulationEDD.Properties.OnChange := 'deOvulationEDDOnChange';
    deIVFEDD.Properties.OnChange := 'deIVFEDDOnChange';
    deConceptionDate.Properties.OnChange := 'cbDateOfConceptionOnChange';
    seTransferDay.Properties.OnChange := 'seTransferDayOnChange';
    cbFetalAnatomyNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cbFetalAnatomyAbNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cxccbReferralIndication.Properties.OnChange := 'cxccbReferralIndicationChange';
    cxccbObstetricHistory.Properties.OnChange := 'cxccbObstetricHistoryChange';

    deUSSEDD1.Properties.OnChange := 'cbUSSEDDOnChange';

    cbCervixTVS.OnClick := 'cbToggleCheckOnClick';
    cbCervixTA.OnClick := 'cbToggleCheckOnClick';
    spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
    cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';

    cbCervixShortYes.OnClick := 'cbToggleCheckOnClick';
    cbCervixShortNo.OnClick := 'cbToggleCheckOnClick';

    cbFunnellingofmembranesYes.OnClick := 'cbToggleCheckOnClick';
    cbFunnellingofmembranesNo.OnClick := 'cbToggleCheckOnClick';

    cbCervixSutureYes.OnClick := 'cbCervixSutureOnClick'
    cbCervixSutureNo.OnClick := 'cbCervixSutureOnClick'

    btnSelectAll1.OnClick := 'btnSelectAll1OnClick';
    btnClear1.OnClick := 'btnClear1OnClick';

    cbRightOvaryNormal.OnClick := 'cbToggleCheckOnClick';
    cbRightOvaryAbNormal.OnClick := 'cbToggleCheckOnClick';
    cbLeftOvaryNormal.OnClick := 'cbToggleCheckOnClick';
    cbLeftOvaryAbNormal.OnClick := 'cbToggleCheckOnClick';

    cbNasalVisualised1.OnClick := 'cbToggleCheckOnClick';
    cbNasaAbsent1.OnClick := 'cbToggleCheckOnClick';
    cbNasalNotClear1.OnClick := 'cbToggleCheckOnClick';


   //----------------------------PE Screen----------------
    cbSmokingYes.OnClick := 'cbToggleCheckOnClick';
    cbSmokingNo.OnClick := 'cbToggleCheckOnClick';
    cbPEYes.OnClick := 'cbToggleCheckOnClick';
    cbPENo.OnClick := 'cbToggleCheckOnClick';
    cbPrevPEYes.OnClick := 'cbToggleCheckOnClick';
    cbPrevPENo.OnClick := 'cbToggleCheckOnClick';
    cbNalliPorous.OnClick := 'cbNalliPorousOnClick';
    cbPEDoneYes.OnClick := 'cbToggleCheckOnClick';
    cbPEDoneNo.OnClick := 'cbToggleCheckOnClick';
    cbParous.OnClick   := 'cbParousClick'

    cbCavityDistortion1.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion2.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion3.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion4.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion5.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion6.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion7.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion8.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion9.OnClick := 'ToggleCloseToCervixFibroid';
    cbCavityDistortion10.OnClick := 'ToggleCloseToCervixFibroid';

    btnPregnancyRedated.OnClick := 'btnPregnancyRedatedOnClick';
    edNucTransMeasurement1.OnExit := 'edNucTransMeasurement1OnExit'
end;

procedure InitializeScreen;
begin
  Gwarning := False;
  GPlacentaWarning := FALSE;
  GPresentationWarning := FALSE;
  GCervixWarning := FALSE;
  pcEDDPrinciple.HideTabs := True;
  cbGestationType.ItemIndex := 1;
//  cbGestationTypeChange(nil);
  gbEDDDating.Height := 45;
  lblMedication.Visible := False;
  //cbEDDPrinciple.ItemIndex := 0;
  cbEDDPrincipleOnChange(nil);
  GAnatomyWarning := FALSE;
  if (deExamDate.Date < 100) then
    deExamDate.Date := Now;
  pgFetusMeasusements.ActivePage := cxtsFetusGeneral1;
    pcEDDPrinciple.Properties.HideTabs := true;
  spFibroidCountOnChange(nil);
  //edtPtNameOnChange(nil);
  cbGestationType.ItemIndex := 1;
   //cxccbReferralIndication.States[0] := 1;
  cbGestationTypeChange(nil);

end;

StartScript;
