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
#include "shared/obstetric/liquor.pas"
#include "shared/obstetric/reportCommon.pas"

// --- Shared gynae ---
#include "shared/gynae/fibroidUI.pas"
#include "shared/gynae/fibroids.pas"

// --- t3twins variants ---
#include "t3twins/bioPhysicalConc.pas"
#include "t3twins/ductusVenosusWarning.pas"
#include "t3twins/efwPer.pas"

// --- Exam-specific ---
#include "t3twins/report.pas"
#include "t3twins/uiHandlers.pas"
#include "t3twins/clinical.pas"

procedure StartScript;
begin
    // -----------------------------------------------------------------------------//
    InitializeScreen;
   // ccbGestationType.Properties.OnChange := 'ccbGestationTypeChange';
    deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';

    PresentingTwinYes1.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinNo1.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinYes2.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinNo2.OnClick := 'cbToggleCheckOnClick';

    cbMaternalLeft1.OnClick := 'cbToggleCheckOnClick';
    cbMaternalLeft2.OnClick := 'cbToggleCheckOnClick';
    cbMaternalRight1.OnClick := 'cbToggleCheckOnClick';
    cbMaternalRight1.OnClick := 'cbToggleCheckOnClick';

    cbMale1.OnClick := 'cbToggleCheckOnClick';
    cbMale2.OnClick := 'cbToggleCheckOnClick';
    cbFeMale1.OnClick := 'cbToggleCheckOnClick';
    cbFeMale2.OnClick := 'cbToggleCheckOnClick';

    cbLowLyingPlacentaYes1.OnClick := 'cbToggleCheckOnClick';
    cbLowLyingPlacentaNo1.OnClick := 'cbToggleCheckOnClick';
    cbFetalAnatomyNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cbFetalAnatomyAbNormal1.OnClick := 'cbFetalAnatomyNormal1OnClick';
    cxccbReferralIndicators.Properties.OnChange := 'cxccbReferralIndicatorsChange';
    cxccbObstetricHistory.Properties.OnChange := 'cxccbObstetricHistoryChange';

    cbLiqur1.OnClick := 'CalcFetalScore';
    cbFetalBreathing1.OnClick := 'CalcFetalScore';
    cbFetalMovement1.OnClick := 'CalcFetalScore';
    cbFetalTone1.OnClick := 'CalcFetalScore';

    cbLiqur2.OnClick := 'CalcFetalScore';
    cbFetalBreathing2.OnClick := 'CalcFetalScore';
    cbFetalMovement2.OnClick := 'CalcFetalScore';
    cbFetalTone2.OnClick := 'CalcFetalScore';

   { cbLiqur3.OnClick := 'CalcFetalScore';
    cbFetalBreathing3.OnClick := 'CalcFetalScore';
    cbFetalMovement3.OnClick := 'CalcFetalScore';
    cbFetalTone3.OnClick := 'CalcFetalScore';   }

    cbFeatlMovementsYes1.OnClick := 'cbFeatlMovements1Click';
    cbFeatlMovementsNo1.OnClick := 'cbFeatlMovements1Click';  
    
    cbFeatlMovementsYes2.OnClick := 'cbFeatlMovements2Click';
    cbFeatlMovementsNo2.OnClick := 'cbFeatlMovements2Click';

    cbCervixTVS.OnClick := 'cbToggleCheckOnClick';
    cbCervixTA.OnClick := 'cbToggleCheckOnClick';

    cbDVWNormal1.OnClick := 'cbToggleCheckOnClick';
    cbDVWAbNormal1.OnClick := 'cbToggleCheckOnClick';

    //edtAFI1.Properties.Onchange := 'edtAFI1Onchange';
    //edtAFI2.Properties.Onchange := 'edtAFI2Onchange';

    btnGeneratePercentiles1.OnClick := 'btnGeneratePercentiles1OnClick'   
    btnGeneratePercentiles2.OnClick := 'btnGeneratePercentiles2OnClick'
    btnCalGrowthPer1.OnClick := 'btnCalGrowthPer1OnClick';
    btnCalGrowthPer2.OnClick := 'btnCalGrowthPer2OnClick';

    spFibroidCount.Properties.OnChange := 'spFibroidCountOnChange';
    cbFibroidsVisualised.OnClick := 'cbFibroidsVisualisedOnClick';

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
    
     seEstFetalWeight1.Properties.Onchange :=  'btnCalGrowthPer1OnClick';
     seEstFetalWeight2.Properties.Onchange :=  'btnCalGrowthPer2OnClick';

    edtBPD1.Properties.OnChange := 'btnGeneratePercentiles1OnClick';
    edAC1.Properties.OnChange := 'btnGeneratePercentiles1OnClick';
    edHC1.Properties.OnChange := 'btnGeneratePercentiles1OnClick';
    edFL1.Properties.OnChange := 'btnGeneratePercentiles1OnClick';
    edHL1.Properties.OnChange := 'btnGeneratePercentiles1OnClick';
    
     edtBPD2.Properties.OnChange := 'btnGeneratePercentiles2OnClick';
    edAC2.Properties.OnChange := 'btnGeneratePercentiles2OnClick';
    edHC2.Properties.OnChange := 'btnGeneratePercentiles2OnClick';
    edFL2.Properties.OnChange := 'btnGeneratePercentiles2OnClick';
    edHL2.Properties.OnChange := 'btnGeneratePercentiles2OnClick';

end;

procedure InitializeScreen;
begin
  Gwarning := False;
  GPlacentaWarning := FALSE;
  GPresentationWarning := FALSE;
  GCervixWarning := FALSE;
  GUAPIWarning := FALSE;
  GMCAPIWarning := FALSE;
  GAnatomyWarning := FALSE;
  if (deExamDate.Date < 100) then
    deExamDate.Date := Now;
  pgFetusMeasusements.ActivePage := cxtsFetusGeneral1;
  //edtPtNameOnChange(nil);
  //ccbGestationType.ItemIndex := 1;
 // cbGestationTypeChange(nil);
  spFibroidCountOnChange(nil);

end;

StartScript;
