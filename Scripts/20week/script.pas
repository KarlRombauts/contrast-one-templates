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
#include "shared/obstetric/doppler.pas"
#include "shared/obstetric/eddHandling.pas"
#include "shared/obstetric/gestationalAge.pas"
#include "shared/obstetric/ivf.pas"
#include "shared/obstetric/liquor.pas"
#include "shared/obstetric/ovaries.pas"
#include "shared/obstetric/placenta.pas"
#include "shared/obstetric/reportCommon.pas"
#include "shared/obstetric/uiCommon.pas"

// --- Shared gynae ---
#include "shared/gynae/fibroidUI.pas"
#include "shared/gynae/fibroids.pas"

// --- 20week variants ---
#include "shared/variants/GetAnatomy.20week.pas"
#include "shared/variants/GetClinicalIndicators.pe12week.pas"
#include "shared/variants/GetEnteredEDD.20week.pas"
#include "shared/variants/GetGraphXValue.20week_t3Singleton.pas"
#include "shared/variants/GetNormalMCAPIRange.20week.pas"
#include "shared/variants/GetPerGraph.20week.pas"
#include "shared/variants/btnGeneratePercentilesOnClick.20week.pas"
#include "shared/variants/cbFetalAnatomyNormal1OnClick.20week.pas"
#include "shared/variants/getReportHeading.20week.pas"

// --- Exam-specific ---
#include "20week/report.pas"
#include "20week/uiHandlers.pas"
#include "20week/clinical.pas"

procedure StartScript;
begin                                   
    // -----------------------------------------------------------------------------//
    InitializeScreen;
    cbGestationType.Properties.OnChange := 'cbGestationTypeChange';
    deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';
    cbLowLyingPlacentaYes1.OnClick := 'cbToggleCheckOnClick';
    cbLowLyingPlacentaNo1.OnClick := 'cbToggleCheckOnClick';
    cbFetalAnatomyNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cbFetalAnatomyAbNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cxccbReferralIndication.Properties.OnChange := 'cxccbReferralIndicationChange';
    cxccbObstetricHistory.Properties.OnChange := 'cxccbObstetricHistoryChange';

    deUSSEDD1.Properties.OnChange := 'cbUSSEDDOnChange';

    cbCervixTVS.OnClick := 'cbToggleCheckOnClick';
    cbCervixTA.OnClick := 'cbToggleCheckOnClick';
    spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
    cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';

    edtMeanUAPI.Properties.OnChange := 'edtMeanUAPIOnChange';
    edtMeanRUAPI.Properties.OnChange := 'edtMeanRUAPIOnChange';
    edtMeanLUAPI.Properties.OnChange := 'edtMeanRUAPIOnChange';
    
    btnGeneratePercentiles.OnClick := 'btnGeneratePercentilesOnClick'

    btnSelectAll1.OnClick := 'btnSelectAll1OnClick';
    btnClear1.OnClick := 'btnClear1OnClick';

    cbGendermale1.OnClick := 'cbToggleCheckOnClick';
    cbGenderFemale1.OnClick := 'cbToggleCheckOnClick';
    cbConsistentNIPTYes1.OnClick := 'cbToggleCheckOnClick';
    cbConsistentNIPTNo1.OnClick := 'cbToggleCheckOnClick';
    cbConsistentNIPTUnknown1.OnClick := 'cbToggleCheckOnClick';
    cbRightOvaryNormal.OnClick := 'cbToggleCheckOnClick';
    cbRightOvaryAbNormal.OnClick := 'cbToggleCheckOnClick';
    cbLeftOvaryNormal.OnClick := 'cbToggleCheckOnClick';
    cbLeftOvaryAbNormal.OnClick := 'cbToggleCheckOnClick';

    cbVCI1.OnClick := 'cbToggleCheckOnClick';
    cbMCI1.OnClick := 'cbToggleCheckOnClick';
    cbCCI1.OnClick := 'cbToggleCheckOnClick';

    cbCervixShortYes.OnClick := 'cbToggleCheckOnClick';
    cbCervixShortNo.OnClick := 'cbToggleCheckOnClick';

    cbFunnellingofmembranesYes.OnClick := 'cbToggleCheckOnClick';
    cbFunnellingofmembranesNo.OnClick := 'cbToggleCheckOnClick';

    cbCervixSutureYes.OnClick := 'cbCervixSutureYesOnClick'
    cbCervixSutureNo.OnClick := 'cbCervixSutureYesOnClick'

    cbPoorView.OnClick := 'cbToggleCheckOnClick';
    cbAverageViews.OnClick := 'cbToggleCheckOnClick';
    cbGoodViews.OnClick := 'cbToggleCheckOnClick';
    cbVeryGoodViews.OnClick := 'cbToggleCheckOnClick';

    cbVasaPraeviaYes1.OnClick := 'cbToggleCheckOnClick';               
    cbVasaPraeviaNo1.OnClick := 'cbToggleCheckOnClick';                               
    cbSuccenturiateLobeYes1.OnClick := 'cbSuccenturiateLobeYes1OnClick';
    cbSuccenturiateLobeNo1.OnClick := 'cbSuccenturiateLobeNo1OnClick';
    cbLowLyingYes11.OnClick := 'cbToggleCheckOnClick';
    cbLowLyingNo11.OnClick := 'cbToggleCheckOnClick';

    cbPatientInformedYes.OnClick := 'cbToggleCheckOnClick';
    cbPatientInformedNo.OnClick := 'cbToggleCheckOnClick';

    edtBPD1.Properties.OnChange := 'getBiometryPercentiles';
    edtAC1.Properties.OnChange := 'getBiometryPercentiles';
    edtHC1.Properties.OnChange := 'getBiometryPercentiles';
    edtFL1.Properties.OnChange := 'getBiometryPercentiles';
    edtHL1.Properties.OnChange := 'getBiometryPercentiles';
    
end;

procedure InitializeScreen;
begin
  Gwarning := False;
  GPlacentaWarning := FALSE;
  GPresentationWarning := FALSE;
  GCervixWarning := FALSE;
 //GUAPIWarning := FALSE;                                     :
  //GMCAPIWarning := FALSE;
  GAnatomyWarning := FALSE;
  if (deExamDate.Date < 100) then
    deExamDate.Date := Now;
  pgFetusMeasusements.ActivePage := cxtsFetusGeneral1;
  spFibroidCountOnChange(nil);
  //edtPtNameOnChange(nil);
  cbGestationType.ItemIndex := 1;
  if (GetClinicalIndicators = '') then
   cxccbReferralIndication.States[0] := 1;
  cbGestationTypeChange(nil);
  spFibroidCount.Enabled := False;

end;

StartScript;
