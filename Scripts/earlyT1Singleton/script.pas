// ******************* Global Variables ************************************//

// --- Shared utilities ---
#include "shared/utils/strUtils.pas"
#include "shared/utils/formatting.pas"
#include "shared/utils/dateUtils.pas"
#include "shared/utils/articles.pas"
#include "shared/utils/formUtils.pas"

// --- Shared obstetric ---
#include "shared/obstetric/gestationalAge.pas"
#include "shared/obstetric/eddHandling.pas"
#include "shared/obstetric/clinicalHistory.pas"
#include "shared/obstetric/ivf.pas"
#include "shared/obstetric/ovaries.pas"

// --- Shared gynae ---
#include "shared/gynae/fibroids.pas"
#include "shared/gynae/fibroidUI.pas"

// --- earlyT1Singleton variants (where this exam differs from shared majority) ---
#include "shared/variants/GetClinicalIndicators.earlyT1Singleton.pas"
#include "shared/variants/GetClinicalHistory.earlyT1Singleton.pas"
#include "shared/variants/cbUSSEDDOnChange.earlyT1Singleton.pas"
#include "shared/variants/cxccbReferralIndicatorsChange.earlyT1Singleton.pas"
#include "shared/variants/deStatedEDDOnChange.earlyT1Singleton_pe12week.pas"

// --- Exam-specific ---
#include "earlyT1Singleton/embryo.pas"
#include "earlyT1Singleton/nips.pas"
#include "earlyT1Singleton/report.pas"
#include "earlyT1Singleton/uiHandlers.pas"

procedure StartScript;
begin

  // ******************* Header Functions *********************************************//
  //cbIndicatorType.Properties.OnChange := 'cbIndicatorTypeOnChange';
  cbClinicalHistory.Properties.OnChange := 'cbClinicalHistoryOnChange';


  // ******************* Dating Functions *********************************************//
  cbEDDPrinciple.Properties.OnChange := 'cbEDDPrincipleOnChange';
 // cbGestationType.Properties.OnChange := 'cbGestationTypeChange';
 // cbPregnancyOutcome.Properties.OnChange := 'cbPregnancyOutcomeOnChange';
  deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';
  deMUFWEdd.Properties.OnChange := 'deMUFWEddOnChange';
  deLMPDate.Properties.OnChange := 'cbLMPDateOnChange';
  deMenstrualEDD.Properties.OnChange := 'deMenstrualEDDOnChange';
  deOvulationEDD.Properties.OnChange := 'deOvulationEDDOnChange';
  deIVFEDD.Properties.OnChange := 'deIVFEDDOnChange';
  deConceptionDate.Properties.OnChange := 'cbDateOfConceptionOnChange';
  seTransferDay.Properties.OnChange := 'seTransferDayOnChange';


  // ******************* Embryo 1 Functions ********************************************//
  deUSSEDD1.Properties.OnChange := 'cbUSSEDDOnChange';
  cbEmbryo1NotVisualised1.OnClick := 'cbEmbryo1NotVisualised1OnClick';

  cbEmbryo1Visualised1.OnClick := 'cbEmbryo1Visualised1OnClick';

  spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
  cbFibroidsType1.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType2.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType3.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType4.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType5.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType6.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType7.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType8.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType9.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType10.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';

  cxccbReferralIndicators.Properties.OnChange := 'cxccbReferralIndicatorsChange';
  cbClinicalHistory.Properties.OnChange := 'cbClinicalHistoryChange';

  cbYolkSacYes1.OnClick := 'cbYolkSacYes1OnClick';
  cbYolkSacNo1.OnClick := 'cbYolkSacNo1OnClick';

  edtEmbroSize1.properties.OnChange := 'edtEmbroSize1OnChange';
  edtYolkSacSize1.Properties.OnChange := 'edtYolkSacSize1OnChange';
  seHeartBPM1.Properties.OnChange := 'seHeartBPM1OnChange';

  cbHeartMotionVisYes1.OnClick := 'cbHeartMotionVisYes1OnClick';
  cbHeartMotionVisNo1.OnClick := 'cbHeartMotionVisNo1OnClick';

  cbPreigHeamYes.OnClick := 'cbPreigHeamYesOnClick';
  cbPreigHeamNo.OnClick := 'cbPreigHeamNoOnClick';

  btnPregnancyRedated.OnClick := 'btnPregnancyRedatedOnClick';

  //cbGestationType.Properties.OnChange := 'cbGestationTypeChange';

  InitializeScreen;
end;

procedure InitializeScreen;
begin
  if (deExamDate.Date < 100) then
    deExamDate.Date := now;
  pcEarlyPregType.HideTabs := True;
  pcEDDPrinciple.HideTabs := True;
  cbGestationType.ItemIndex := 1;
//  cbGestationTypeChange(nil);
  gbEDDDating.Height := 45;
  lblMedication.Visible := False;
  //cbEDDPrinciple.ItemIndex := 0;
  cbEDDPrincipleOnChange(nil);
  //cbPregnancyOutcomeOnChange(nil);
  spFibroidCountOnChange(nil);
  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;
  pcEmbryos.ActivePage := cxtsFetus1;
  //cbGestationTypeChange(nil);
  //cbTooShortIntervalOnClick(nil);
  pcEmbryos.Properties.ActivePage := cxtsFetus1;
  cbEmbryo1Visualised1OnClick(nil);
  pcEDDPrinciple.Properties.HideTabs := true;

end;

StartScript;
