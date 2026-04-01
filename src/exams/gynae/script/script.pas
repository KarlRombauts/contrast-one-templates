// ******************* Global Variables ************************************//

// --- Shared utilities ---
#include "shared/utils/articles.pas"
#include "shared/utils/dateUtils.pas"
#include "shared/utils/formUtils.pas"
#include "shared/utils/formatting.pas"
#include "shared/utils/strUtils.pas"

// --- Shared gynae ---
#include "shared/gynae/fibroidUI.pas"
#include "shared/gynae/fibroids.pas"

// --- gynae variants ---
#include "shared/variants/GetCavDistortionCount.gynae.pas"
#include "shared/variants/GetFibroidConcl.gynae.pas"
#include "shared/variants/GetFibroidCount.gynae.pas"
#include "shared/variants/GetFibroidDesc.gynae.pas"
#include "shared/variants/GetLargestFibroid.gynae.pas"
#include "shared/variants/GetOvaryConc.gynae.pas"
#include "shared/variants/GetSingleFibroid.gynae.pas"
#include "shared/variants/GetSingleFibroidCavity.gynae.pas"
#include "shared/variants/GetSingleFibroidDimensions.gynae.pas"
#include "shared/variants/cbFibroidsTypeOnChange.gynae.pas"
#include "shared/variants/cbToggleCheckOnClick.gynae.pas"
#include "shared/variants/cxccbReferralIndicationChange.gynae.pas"
#include "shared/variants/spFibroidCountOnChange.gynae.pas"

// --- Exam-specific ---
#include "gynae/report.pas"
#include "gynae/uiHandlers.pas"
#include "gynae/clinical.pas"

procedure StartScript;
begin
  cbRightAdnexalMass.onClick := 'cbRightAdnexalMassClick';
  cbLeftAdnexalMass.onClick := 'cbLeftAdnexalMassClick';

  cbBladderNormal.onClick := 'cbBladderNormalClick';
  cbBladderAbnormal.onClick := 'cbBladderAbnormalClick';

  cbEFFAbnormal.onClick := 'cbEFFAbnormalClick';
  cbEFFNormal.onClick := 'cbEFFNormalClick';

  cbRightLeadFollicle.onClick := 'cbRightLeadFollicleClick';
  cbLeftLeadFollicle.onClick := 'cbLeftLeadFollicleClick';
  cbRightCorpusLuteum.onClick := 'cbRightCorpusLuteumClick';
  cbLeftCorpusLuteum.onClick := 'cbLeftCorpusLuteumClick';

  cbEndometrium.Properties.OnChange := 'cbEndometriumChange';
  cxccbReferralIndication.Properties.OnChange := 'cxccbReferralIndicationChange';
  //cbIndicatorType2.Properties.OnChange := 'cbIndicatorType2Change';
  cxccbClinicalHistory.Properties.OnChange := 'cxccbClinicalHistoryChange';
  //cbPastHistory2.Properties.OnChange := 'cbPastHistory2Change';
 // cbPastSurgery.Properties.OnChange := 'cbPastSurgeryChange';
  cxcbGynaeSurgery.Properties.OnChange := 'cxcbGynaeSurgeryChange';
  cxcbFamilyHistory.Properties.OnChange := 'cxcbFamilyHistoryChange'
  cbMedication.Properties.OnChange := 'cbMedicationChange';
  tcbMedication.OnChange := 'tcbMedicationChange';
  //cbEndometrialPolyp.onClick := 'cbEndometrialPolypClick';

  ccbROClassification.Properties.OnChange := 'ccbROClassificationOnChnage';
  ccbLOClassification.Properties.OnChange := 'ccbLOClassificationOnChnage';

  cbRightOvaryCystType1.OnChange := 'cbOvaryCystTypeOnChange';
  cbRightOvaryCystType2.OnChange := 'cbOvaryCystTypeOnChange';
  cbRightOvaryCystType3.OnChange := 'cbOvaryCystTypeOnChange';
  cbRightOvaryCystType4.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType1.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType2.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType3.OnChange := 'cbOvaryCystTypeOnChange';
  cbLeftOvaryCystType4.OnChange := 'cbOvaryCystTypeOnChange';

  cbEndometrialLensionYes.Onclick := 'cbToggleCheckOnClick';
  cbEndometrialLensionNo.Onclick := 'cbToggleCheckOnClick';



  cbRightOvaryIdentified.onClick := 'cbRightOvaryIdentifiedClick';
  cbLeftOvaryIdentified.onClick := 'cbLeftOvaryIdentifiedClick';

  cbRetroFlexed.onClick := 'cbRetroFlexedClick';
  cbAntiFlexed.onClick := 'cbAntiFlexedClick';
  cbRightLimitedMobility.onClick := 'cbRightLimitedMobilityClick';
  cbLeftLimitedMobility.onClick := 'cbLeftLimitedMobilityClick';
  cbRightMobile.onClick := 'cbRightMobileClick';
  cbLeftMobile.onClick := 'cbLeftMobileClick';

  cbRightTender.onClick := 'cbRightTenderClick';
  cbLeftTender.onClick := 'cbLeftTenderClick';
  cbRightNonTender.onClick := 'cbRightNonTenderClick';
  cbLeftNonTender.onClick := 'cbLeftNonTenderClick';

  cbUterusMobile.onClick := 'cbUterusMobileClick';
  cbUterusLimitedMobile.onClick := 'cbUterusLimitedMobileClick';
  cbUterusTender.onClick := 'cbUterusTenderClick';
  cbUterusNonTender.onClick := 'cbUterusNonTenderClick';

  seRightFolCount.Properties.OnChange := 'seRightFolCountOnChange';
  seLeftFolCount.Properties.OnChange := 'seLeftFolCountOnChange';

  seRightResidualFolCount.Properties.OnChange := 'seRightResidualFolCountOnChange';

  cbRightOvarianCyst.onClick := 'cbRightOvarianCystClick';
  cbLeftOvarianCyst.onClick := 'cbLeftOvarianCystClick';

  cbROSmoothYes.OnClick := 'cbROSmoothYesOnClick';
  cbROSmoothNo.OnClick := 'cbROSmoothYesOnClick';
  cbROMIYes.OnClick := 'cbToggleCheckOnClick';
  cbROMINo.OnClick := 'cbToggleCheckOnClick';
  cbROPPYes.OnClick := 'cbROPPYesOnClick';
  cbROPPNo.OnClick := 'cbROPPNoOnClick';
  cbROVascularityYes.onClick := 'cbToggleCheckOnClick';
  cbROVascularityNo.onClick := 'cbToggleCheckOnClick';
  ccbROInternalContents.Properties.OnChange := 'ccbROInternalContentsChange';
  cbROSolidElementsNo.OnClick := 'cbROSolidElementsNoOnClick';
  cbROSolidElementsYes.OnClick := 'cbROSolidElementsNoOnClick';
  cbROVSYes.OnClick := 'cbROVSYesOnClick'
  cbROVSNo.OnClick  := 'cbROVSYesOnClick'
  cbROSeptumYes.OnClick := 'cbROSeptumYesOnClick'
  cbROSolidYes.OnClick  :=  'cbROSolidYesOnClick'
  cbROSolidNo.OnClick  :=  'cbROSolidYesOnClick'
  cbROSeptumNo.OnClick := 'cbROSeptumYesOnClick'
  cbROAscitesYes.OnClick := 'cbToggleCheckOnClick';
  cbROAscitesNo.OnClick := 'cbToggleCheckOnClick';

  cbLOSmoothYes.OnClick := 'cbLOSmoothYesOnClick';
  cbLOSmoothNo.OnClick := 'cbLOSmoothYesOnClick';
  cbLOMIYes.OnClick := 'cbToggleCheckOnClick';
  cbLOMINo.OnClick := 'cbToggleCheckOnClick';
  cbLOPPYes.OnClick := 'cbLOPPYesOnClick';
  cbLOPPNo.OnClick := 'cbLOPPNoOnClick';
  cbLOVascularityYes.onClick := 'cbToggleCheckOnClick';
  cbLOVascularityNo.onClick := 'cbToggleCheckOnClick';
  ccbLOInternalContents.Properties.OnChange := 'ccbLOInternalContentsChange';
  cbLOSolidElementsNo.OnClick := 'cbLOSolidElementsNoOnClick';
  cbLOSolidElementsYes.OnClick := 'cbLOSolidElementsNoOnClick';
  cbLOVSYes.OnClick := 'cbLOVSYesOnClick'
  cbLOVSNo.OnClick  := 'cbLOVSYesOnClick'
  cbLOSeptumYes.OnClick := 'cbLOSeptumYesOnClick'
  cbLOSolidYes.OnClick  :=  'cbLOSolidYesOnClick'
  cbLOSolidNo.OnClick  :=  'cbLOSolidYesOnClick'
  cbLOSeptumNo.OnClick := 'cbLOSeptumYesOnClick'
  cbLOAscitesYes.OnClick := 'cbToggleCheckOnClick';
  cbLOAscitesNo.OnClick := 'cbToggleCheckOnClick';

  cbHRTYes.OnClick := 'cbHRTYesOnclick';
  cbHRTNo.OnClick := 'cbToggleCheckOnClick';

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
  cbFibroidsType11.Properties.OnChange := 'cbFibroidsTypeOnChange';
  cbFibroidsType12.Properties.OnChange := 'cbFibroidsTypeOnChange';

  seRightAdnexalMasses.Properties.OnChange := 'seRightAdnexalMassesOnChange';
  seLeftAdnexalMasses.Properties.OnChange := 'seLeftAdnexalMassesOnChange';

  sePolypCount.Properties.OnChange := 'sePolypCountOnChange';
  cbCervicalPolyp.OnClick :='cbCervicalPolypOnClick';

  seRightOvarianCystsCount.Properties.OnChange := 'seRightOvarianCystsCountOnChange';
  seLeftOvarianCystsCount.Properties.OnChange := 'seLeftOvarianCystsCountOnChange';

  seRightCorpusLuteum.Properties.OnChange := 'seRightCorpusLuteumOnChange';
  seRightLeadFollicle.Properties.OnChange := 'seRightLeadFollicleOnChange';

  seLeftCorpusLuteum.Properties.OnChange := 'seLeftCorpusLuteumOnChange';
  seLeftLeadFollicle.Properties.OnChange := 'seLEftLeadFollicleOnChange';

  cbRightKidneyNo.onClick := 'cbRightKidneyNoClick';
  cbLeftKidneyNo.onClick := 'cbLeftKidneyNoClick';
  cbRightKidneyYes.onClick := 'cbRightKidneyYesClick';
  cbLeftKidneyYes.onClick := 'cbLeftKidneyYesClick';

  seEdometriumThickness.Properties.Onchange := 'seEdometriumThicknessOnChange';

  cbCorrectPlacementIUCD.OnClick := 'cbCorrectPlacementIUCDonClick';
  cbCorrectPlacementIUS.OnClick := 'cbCorrectPlacementIUSonClick';
  cbInCorrectPlacementIUCD.OnClick := 'cbInCorrectPlacementIUCDonClick';
  cbInCorrectPlacementIUS.OnClick := 'cbInCorrectPlacementIUSonClick';

  cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';
  cbUterineShape.Properties.OnChange := 'cbUterineShapeOnChange';

  cbAdenomyosisPresent.OnClick := 'cbAdenomyosisPresentOnClick';
  cbAdenomyosisNotPresent.OnClick := 'cbAdenomyosisNotPresentOnClick';

  cbVBShadowingNotPresent.OnClick := 'cbVBShadowingNotPresentOnClick';
  cbVBShadowingPresent.OnClick := 'cbVBShadowingPresentOnClick';

  cbIncVasNotPresent.OnClick := 'cbIncVasNotPresentOnClick';
  cbIncVasPresent.onClick := 'cbIncVasPresentOnClick';

  cbMyometrialCystsPresent.OnClick := 'cbMyometrialCystsPresentOnClick';
  cbMyometrialcystsnotPresent.onClick := 'cbMyometrialCystsNotPresentOnClick';

  cbAscitesPerformed.OnClick := 'cbProceduresPerformedOnClick';
  cbLeftCystAspirationPerf.OnClick := 'cbProceduresPerformedOnClick';
  cbRightCystAspirationPerf.OnClick := 'cbProceduresPerformedOnClick';
  cbTubalLevovistPerformed.OnClick := 'cbProceduresPerformedOnClick';
  cbTubalPerformed.OnClick := 'cbProceduresPerformedOnClick';
  cbSalinePerformed.OnClick := 'cbProceduresPerformedOnClick';

  cbLeftVaginalAccessYes.OnClick := 'cbToggleCheckOnClick';
  cbLeftVaginalAccessNo.OnClick := 'cbToggleCheckOnClick';
  cbRightVaginalAccessYes.OnClick := 'cbToggleCheckOnClick';
  cbRightVaginalAccessNo.OnClick := 'cbToggleCheckOnClick';

  cbLMPUnknown.OnClick := 'cbToggleCheckOnClick';
  cbAmenorrhoea.OnClick := 'cbToggleCheckOnClick';
  cbPostMenopausal.OnClick := 'cbPostMenopausalOnClick';

  cbOligomenorrhoea.OnClick := 'cbToggleCheckOnClick';


  deLMPDate.Properties.onChange := 'deLMPDateOnChange';

  cbRightReanalAbnormalYes.OnClick := 'cbRightReanalAbnormalYesClick'; //'cbToggleCheckOnClick';
  cbRightReanalAbnormalNo.OnClick := 'cbToggleCheckOnClick';
  cbLeftReanalAbnormalYes.OnClick := 'cbLeftReanalAbnormalYesClick'; //'cbToggleCheckOnClick';
  cbLeftReanalAbnormalNo.OnClick := 'cbToggleCheckOnClick';

  cbLeftVaginalNA.OnClick := 'cbToggleCheckOnClick';
  cbRightVaginalNA.OnClick := 'cbToggleCheckOnClick';
  cbHysterectomy.OnClick := 'cbHysterectomyOnClick';
  cbCervixPresentYes.OnClick := 'cbCervixPresentYesOnClick';
  cbCervixPresentNo.OnClick := 'cbCervixPresentNoOnClick';
  cbVaultNormalYes.OnClick := 'cbVaultNormalYesOnClick';
  cbVaultNormalNo.OnClick := 'cbVaultNormalNoOnClick';

  InitializeScreen;

end;

procedure InitializeScreen;
begin
  if (deExamDate.Date < 100) then
    deExamDate.Date := now;
  spFibroidCountOnChange(nil);
  spFibroidCount.Enabled := cbFibroidsVisualised.Checked;
  pcReportBody.Properties.ActivePage := cxtsGeneral;
  seRightAdnexalMassesOnChange(nil);
  seLeftAdnexalMassesOnChange(nil);
  seRightOvarianCystsCountOnChange(nil);
  seLeftOvarianCystsCountOnChange(nil)
    cbUterineShapeOnChange(nil);
  ActiveAdenomyosisControls;
  cbProceduresPerformedOnClick(nil);
end;

StartScript;
