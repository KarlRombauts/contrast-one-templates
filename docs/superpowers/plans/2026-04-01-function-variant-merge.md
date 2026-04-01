# Function Variant Merge Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Merge shared function variants across obstetric exam scripts based on domain expert review, reducing the `shared/variants/` directory and standardising report output.

**Architecture:** Each task modifies one shared module file to implement the expert-chosen variant, then deletes the now-redundant variant files and updates exam `script.pas` includes. GPP `#include` guards prevent double-inclusion.

**Tech Stack:** Object Pascal (PascalScript), GPP preprocessor, Python test tooling

**Spec:** `docs/superpowers/specs/2026-04-01-function-variant-merge-design.md`

---

### Task 1: Formatting — AddFullStop, AddFullstopToEnd, GetIntegerMeasuredString (Q1, Q2, Q3)

**Files:**
- Modify: `Scripts/shared/utils/formatting.pas:37-63` (AddFullStop + AddFullstopToEnd)
- Modify: `Scripts/shared/utils/formatting.pas:116-142` (GetIntegerMeasuredString)
- Delete: `Scripts/shared/variants/AddFullstopToEnd.earlyT1Singleton_pe12week.pas`
- Delete: `Scripts/shared/variants/GetIntegerMeasuredString.earlyT1Singleton.pas`
- Modify: `Scripts/earlyT1Singleton/script.pas` (remove 2 variant includes)
- Modify: `Scripts/pe12week/script.pas` (remove 1 variant include)

- [ ] **Step 1: Update AddFullStop to use 1 space**

In `Scripts/shared/utils/formatting.pas`, change line 45 from:
```pascal
      result := vt + '.  '
```
to:
```pascal
      result := vt + '. '
```

- [ ] **Step 2: Make AddFullstopToEnd identical to AddFullStop**

In `Scripts/shared/utils/formatting.pas`, replace the entire `AddFullstopToEnd` function (lines 53-63) with:
```pascal
function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '. '
    else
      result := vt;
  end
  else
    result := ''
end;
```

- [ ] **Step 3: Update GetIntegerMeasuredString — remove earlyT1 spaces and " of " prefix**

The current shared version (lines 116-142) is already the correct non-earlyT1 style with `%dx%dx%d` format and no " of " prefix. No change needed — the shared version is already correct.

Verify by reading `Scripts/shared/utils/formatting.pas:116-142` — it should already use `'%dx%dx%d%s'` format strings without spaces.

- [ ] **Step 4: Delete variant files**

```bash
rm "Scripts/shared/variants/AddFullstopToEnd.earlyT1Singleton_pe12week.pas"
rm "Scripts/shared/variants/GetIntegerMeasuredString.earlyT1Singleton.pas"
```

- [ ] **Step 5: Update earlyT1Singleton/script.pas — remove variant includes**

Remove these two lines from `Scripts/earlyT1Singleton/script.pas`:
```
#include "shared/variants/AddFullstopToEnd.earlyT1Singleton_pe12week.pas"
#include "shared/variants/GetIntegerMeasuredString.earlyT1Singleton.pas"
```

- [ ] **Step 6: Update pe12week/script.pas — remove variant include**

Remove this line from `Scripts/pe12week/script.pas`:
```
#include "shared/variants/AddFullstopToEnd.earlyT1Singleton_pe12week.pas"
```

- [ ] **Step 7: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 8: Commit**

```bash
git add Scripts/shared/utils/formatting.pas \
  Scripts/earlyT1Singleton/script.pas \
  Scripts/pe12week/script.pas
git rm Scripts/shared/variants/AddFullstopToEnd.earlyT1Singleton_pe12week.pas \
  Scripts/shared/variants/GetIntegerMeasuredString.earlyT1Singleton.pas
git commit -m "refactor: standardise AddFullStop/AddFullstopToEnd to 1 space, remove earlyT1 formatting variants (Q1-Q3)"
```

---

### Task 2: Clinical History — GetClinicalIndicators, GetObstetricHistory (Q9, Q10)

**Files:**
- Modify: `Scripts/shared/obstetric/clinicalHistory.pas:4-27` (GetClinicalIndicators)
- Modify: `Scripts/shared/obstetric/reportCommon.pas:4-26` (GetObstetricHistory)
- Delete: `Scripts/shared/variants/GetClinicalIndicators.earlyT1Singleton.pas`
- Delete: `Scripts/shared/variants/GetClinicalIndicators.20week.pas`
- Delete: `Scripts/shared/variants/GetClinicalIndicators.pe12week.pas`
- Delete: `Scripts/shared/variants/GetObstetricHistory.20week_t3Singleton.pas`
- Modify: `Scripts/earlyT1Singleton/script.pas` (remove 1 variant include)
- Modify: `Scripts/20week/script.pas` (remove 2 variant includes)
- Modify: `Scripts/pe12week/script.pas` (remove 1 variant include)

**Note:** There are two different checklist control names across exams: `cxccbReferralIndicators` (earlyT1, t3Singleton, t3twins) and `cxccbReferralIndication` (20week, pe12week, gynae). The shared `clinicalHistory.pas` currently uses `cxccbReferralIndicators`. The pe12week variant uses `cxccbReferralIndication`. We need to check which control name each exam actually uses before merging. The correct approach: keep the shared version using `cxccbReferralIndicators` (used by exams that include clinicalHistory.pas — earlyT1, t3Singleton, t3twins). The exams using `cxccbReferralIndication` (20week, pe12week) will continue to use their own variants until their control names are aligned.

**Update:** Since earlyT1 and t3Singleton/t3twins share `cxccbReferralIndicators`, and 20week/pe12week share `cxccbReferralIndication`, we can merge the shared version for the `cxccbReferralIndicators` exams (applying pe12week style logic), and merge the 20week and pe12week variants into one shared variant for the `cxccbReferralIndication` exams.

- [ ] **Step 1: Update shared GetClinicalIndicators to pe12week style logic**

Replace the `GetClinicalIndicators` function in `Scripts/shared/obstetric/clinicalHistory.pas` (lines 4-27) with:
```pascal
function GetClinicalIndicators: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbReferralIndicators.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndicators.States[i] = 1 then
    begin
      if result <> '' then
        result := AddFullStop(result);
      result := result + cxccbReferralIndicators.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := AddFullStop(result);
    result := result + InitCaps(trim(edtReferralIndicator1.Text), False);
  end;
  if result <> '' then
    result := AddFullStop(result);
end;
```

Key changes from current shared version:
- Uses `AddFullStop(result)` as separator instead of hardcoded `'.  '`
- Applies `InitCaps` to "Other" free text
- No trailing `result := result + ' '`

- [ ] **Step 2: Update pe12week variant to use same logic (just different control name)**

Replace the content of `Scripts/shared/variants/GetClinicalIndicators.pe12week.pas` — this variant stays because it uses the `cxccbReferralIndication` control name. But update it to match the standardised logic:
```pascal
#ifndef __SHARED_VARIANTS_GETCLINICALINDICATORS_PE12WEEK
#define __SHARED_VARIANTS_GETCLINICALINDICATORS_PE12WEEK

function GetClinicalIndicators: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbReferralIndication.Properties.Items.Count - 2 do
  begin
    if cxccbReferralIndication.States[i] = 1 then
    begin
      if result <> '' then
        result := AddFullStop(result);
      result := result + cxccbReferralIndication.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := AddFullStop(result);
    result := result + InitCaps(trim(edtReferralIndicator1.Text), False);
  end;
  if result <> '' then
    result := AddFullStop(result);
end;

#endif
```

- [ ] **Step 3: Make 20week use the same pe12week variant**

20week also uses `cxccbReferralIndication`. Update `Scripts/20week/script.pas` to include the pe12week variant instead of its own:

Change:
```
#include "shared/variants/GetClinicalIndicators.20week.pas"
```
to:
```
#include "shared/variants/GetClinicalIndicators.pe12week.pas"
```

- [ ] **Step 4: Update GetObstetricHistory with "Past History:" prefix**

Replace the `GetObstetricHistory` function in `Scripts/shared/obstetric/reportCommon.pas` (lines 4-26) with:
```pascal
function GetObstetricHistory: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cxccbObstetricHistory.Properties.Items.Count - 2 do
  begin
    if cxccbObstetricHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := AddFullStop(result);
      result := result + cxccbObstetricHistory.ShortDescription[i];
    end;
  end;
  if (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := AddFullStop(result);
    result := result + trim(edtOtherPastHistory1.Text);
  end;
  if result <> '' then
    result := 'Past History: ' + AddFullStop(result);
end;
```

Key changes:
- Uses `AddFullStop(result)` as separator instead of hardcoded `'.  '` (consistent with GetClinicalIndicators)
- Prefix changed from `'Past Hx: '` to `'Past History: '`
- All exams now get the prefix

- [ ] **Step 5: Delete variant files**

```bash
rm "Scripts/shared/variants/GetClinicalIndicators.earlyT1Singleton.pas"
rm "Scripts/shared/variants/GetClinicalIndicators.20week.pas"
rm "Scripts/shared/variants/GetObstetricHistory.20week_t3Singleton.pas"
```

Note: Keep `GetClinicalIndicators.pe12week.pas` — it's still needed for exams using `cxccbReferralIndication`.

- [ ] **Step 6: Update exam script.pas includes**

In `Scripts/earlyT1Singleton/script.pas`, remove:
```
#include "shared/variants/GetClinicalIndicators.earlyT1Singleton.pas"
```

In `Scripts/20week/script.pas`, the include was already changed in Step 3. Also remove:
```
#include "shared/variants/GetObstetricHistory.20week_t3Singleton.pas"
```

In `Scripts/t3Singleton/script.pas`, remove:
```
#include "shared/variants/GetObstetricHistory.20week_t3Singleton.pas"
```

- [ ] **Step 7: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 8: Commit**

```bash
git add Scripts/shared/obstetric/clinicalHistory.pas \
  Scripts/shared/obstetric/reportCommon.pas \
  Scripts/shared/variants/GetClinicalIndicators.pe12week.pas \
  Scripts/earlyT1Singleton/script.pas \
  Scripts/20week/script.pas \
  Scripts/t3Singleton/script.pas \
  Scripts/pe12week/script.pas
git rm Scripts/shared/variants/GetClinicalIndicators.earlyT1Singleton.pas \
  Scripts/shared/variants/GetClinicalIndicators.20week.pas \
  Scripts/shared/variants/GetObstetricHistory.20week_t3Singleton.pas
git commit -m "refactor: standardise GetClinicalIndicators and GetObstetricHistory (Q9-Q10)"
```

---

### Task 3: Fibroid functions — GetFibroidCount, getFibroid, GetFibroidString, GetSingleFibroidDimensions, GetCavDistortionCount, spFibroidCountOnChange (Q4, Q5, Q6, Q8, Q24, Q25)

**Files:**
- Modify: `Scripts/shared/gynae/fibroids.pas` (GetFibroidCount, GetSingleFibroidDimensions, GetCavDistortionCount, getFibroid, GetFibroidString)
- Delete: `Scripts/shared/variants/GetFibroidString.earlyT1Singleton.pas`
- Delete: `Scripts/shared/variants/GetFibroidString.20week.pas`
- Delete: `Scripts/shared/variants/GetSingleFibroidDimensions.earlyT1Singleton.pas`
- Delete: `Scripts/shared/variants/GetCavDistortionCount.earlyT1Singleton.pas`
- Delete: `Scripts/shared/variants/getFibroid.pe12week.pas`
- Delete: `Scripts/shared/variants/getFibroid.t3Singleton.pas`
- Delete: `Scripts/shared/variants/getFibroid.t3twins.pas`
- Delete: `Scripts/shared/variants/spFibroidCountOnChange.earlyT1Singleton.pas`
- Modify: `Scripts/earlyT1Singleton/script.pas` (remove 4 variant includes)
- Modify: `Scripts/pe12week/script.pas` (remove 1 variant include)
- Modify: `Scripts/t3Singleton/script.pas` (remove 1 variant include)
- Modify: `Scripts/t3twins/script.pas` (remove 1 variant include)

**Note:** `Scripts/shared/gynae/fibroids.pas` is named "gynae" but is actually the shared fibroid module used by ALL exams (all 6 exam script.pas files include it). It contains the default implementations. Gynae-specific variants like `GetFibroidConcl.gynae.pas` override specific functions for gynae.

- [ ] **Step 1: Update GetFibroidCount to past tense (Q4)**

In `Scripts/shared/gynae/fibroids.pas`, replace lines 4-21:
```pascal
function GetFibroidCount: string;
var
  vNumber: string;
begin
  if spFibroidCount.Value = 0 then
    result := 'No fibroids were'
  else
  begin
    vNumber := GetNumberString(spFibroidCount.Value);
    if spFibroidCount.Value = 1 then
      result := vNumber + ' fibroid was'
    else
    begin
      result := vNumber + ' fibroids were';
    end;
  end;
  result := InitCaps(result, False);
end;
```

Change: `'is'` → `'was'`, `'are'` → `'were'`

- [ ] **Step 2: Uncomment GetCavDistortionCount to check all 10 fibroids (Q24)**

In `Scripts/shared/gynae/fibroids.pas`, replace lines 35-58 with:
```pascal
function GetCavDistortionCount: Integer;
begin
  result := 0;
  if (gbFibroid1.Visible) and (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
    result := Result + 1;
  if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then
    result := Result + 1;
  if (gbFibroid3.Visible) and (cbCavityDistortion3.Checked) and (cbCavityDistortion3.Enabled) then
    result := Result + 1;
  if (gbFibroid4.Visible) and (cbCavityDistortion4.Checked) and (cbCavityDistortion4.Enabled) then
    result := Result + 1;
  if (gbFibroid5.Visible) and (cbCavityDistortion5.Checked) and (cbCavityDistortion5.Enabled) then
    result := Result + 1;
  if (gbFibroid6.Visible) and (cbCavityDistortion6.Checked) and (cbCavityDistortion6.Enabled) then
    result := Result + 1;
  if (gbFibroid7.Visible) and (cbCavityDistortion7.Checked) and (cbCavityDistortion7.Enabled) then
    result := Result + 1;
  if (gbFibroid8.Visible) and (cbCavityDistortion8.Checked) and (cbCavityDistortion8.Enabled) then
    result := Result + 1;
  if (gbFibroid9.Visible) and (cbCavityDistortion9.Checked) and (cbCavityDistortion9.Enabled) then
    result := Result + 1;
  if (gbFibroid10.Visible) and (cbCavityDistortion10.Checked) and (cbCavityDistortion10.Enabled) then
    result := Result + 1;
end;
```

This is the earlyT1 version — simply uncomment lines 40-57 which were commented out.

- [ ] **Step 3: Update GetSingleFibroidDimensions to use integer volume (Q8)**

The current shared version at lines 60-90 already uses `trunc(edtFibroidVolume1.Value)` and `format('%d x %d x %dmm (vol. %dcc)')` — integer volume. No change needed. This is already the correct version per the expert.

Verify: line 68 is `v4 := trunc(edtFibroidVolume1.Value);` and line 77 uses `'%dcc'`.

- [ ] **Step 4: Update getFibroid to pe12week style (Q5)**

In `Scripts/shared/gynae/fibroids.pas`, replace the `getFibroid` function (lines 351-402) with:
```pascal
function getFibroid : String;
var
  i : Integer;
begin
result := '';
  if spFibroidCount.value > 0 then
  begin
    if spFibroidCount.value = 1 then
    begin
      if GetSingleFibroidDimensions <> ''  then
         result := result +  GetSingleFibroidDimensions + GetSingleFibroid + ' fibroid seen.  ';
      if (result <> '')  and (GetSingleCloseOrClear <> '') then
         result := result + 'It is ' +  GetSingleCloseOrClear;
      if result <> '' then
        result :=  'There is a ' + result;
    end
    else if spFibroidCount.value > 1 then
    begin
      for i := 1 to spFibroidCount.value do
      begin
        if result <> '' then
        begin
          if i = spFibroidCount.value then
             result := result + ' and ';
          else
             result := result + ', ';
        end;
        result := result + GetFibroidString(i);
      end;
      if result <> '' then
       result := 'There are fibroids identified: ' + result;
    end;
    if result = '' then
    begin
        GFibroidWarning := TRUE;
        if spFibroidCount.value = 1 then
          result := 'Fibroid';
        else if spFibroidCount.value > 1 then
          result := 'Fibroids';
    end;
  end
  else if cbFibroidsVisualised.checked then
  begin
    GFibroidWarning := TRUE;
    result := 'Fibroid/s';
  end;
  else
    result := '';

  if result <> '' then
    result := #13#10+#13#10 + AddFullSTopToEnd(result);
end;
```

Key changes from the old shared version:
- `'There is a '` has trailing space (pe12week fix)
- `' and '` has spaces on both sides (pe12week fix)
- `', '` has trailing space (pe12week fix)
- Fallback uses `'Fibroid/s'` consistently

- [ ] **Step 5: Update GetFibroidString to pe12week/t3 style — comma before "clear of cervix" (Q6)**

In `Scripts/shared/gynae/fibroids.pas`, in the `GetFibroidString` function (lines 103-177), change the cervix clearance text at line 175 from:
```pascal
      result := result + ', clear of the cervix';
```
This line already has the comma. Verify the current code at line 175 reads `result := result + ', clear of the cervix';` — if so, no change needed.

The shared version in `gynae/fibroids.pas` already uses the pe12week/t3 style (measurements first, comma). The 20week variant at `GetFibroidString.20week.pas` is the one without the comma. So the shared version is already correct.

- [ ] **Step 6: Delete variant files**

```bash
rm "Scripts/shared/variants/GetFibroidString.earlyT1Singleton.pas"
rm "Scripts/shared/variants/GetFibroidString.20week.pas"
rm "Scripts/shared/variants/GetSingleFibroidDimensions.earlyT1Singleton.pas"
rm "Scripts/shared/variants/GetCavDistortionCount.earlyT1Singleton.pas"
rm "Scripts/shared/variants/getFibroid.pe12week.pas"
rm "Scripts/shared/variants/getFibroid.t3Singleton.pas"
rm "Scripts/shared/variants/getFibroid.t3twins.pas"
rm "Scripts/shared/variants/spFibroidCountOnChange.earlyT1Singleton.pas"
```

- [ ] **Step 7: Update exam script.pas includes**

In `Scripts/earlyT1Singleton/script.pas`, remove:
```
#include "shared/variants/GetCavDistortionCount.earlyT1Singleton.pas"
#include "shared/variants/GetFibroidString.earlyT1Singleton.pas"
#include "shared/variants/GetSingleFibroidDimensions.earlyT1Singleton.pas"
#include "shared/variants/spFibroidCountOnChange.earlyT1Singleton.pas"
```

In `Scripts/20week/script.pas`, remove:
```
#include "shared/variants/GetFibroidString.20week.pas"
```

**Note:** 20week currently does not include `getFibroid` as a variant — check if it uses the shared version from `gynae/fibroids.pas`. If so, the updated shared version will apply automatically.

In `Scripts/pe12week/script.pas`, remove:
```
#include "shared/variants/getFibroid.pe12week.pas"
```

In `Scripts/t3Singleton/script.pas`, remove:
```
#include "shared/variants/getFibroid.t3Singleton.pas"
```

In `Scripts/t3twins/script.pas`, remove:
```
#include "shared/variants/getFibroid.t3twins.pas"
```

- [ ] **Step 8: Add spFibroidCountOnChange to shared gynae/fibroidUI.pas**

The `spFibroidCountOnChange` procedure needs to support 10 fibroids for all exams. Check `Scripts/shared/gynae/fibroidUI.pas` for the current version. If it already supports 10 fibroids (matches `spFibroidCountOnChange.earlyT1Singleton.pas`), no change needed. If not, replace it with the earlyT1 version that shows/hides `gbFibroid1` through `gbFibroid10`.

- [ ] **Step 9: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 10: Commit**

```bash
git add Scripts/shared/gynae/fibroids.pas \
  Scripts/shared/gynae/fibroidUI.pas \
  Scripts/earlyT1Singleton/script.pas \
  Scripts/20week/script.pas \
  Scripts/pe12week/script.pas \
  Scripts/t3Singleton/script.pas \
  Scripts/t3twins/script.pas
git rm Scripts/shared/variants/GetFibroidString.earlyT1Singleton.pas \
  Scripts/shared/variants/GetFibroidString.20week.pas \
  Scripts/shared/variants/GetSingleFibroidDimensions.earlyT1Singleton.pas \
  Scripts/shared/variants/GetCavDistortionCount.earlyT1Singleton.pas \
  Scripts/shared/variants/getFibroid.pe12week.pas \
  Scripts/shared/variants/getFibroid.t3Singleton.pas \
  Scripts/shared/variants/getFibroid.t3twins.pas \
  Scripts/shared/variants/spFibroidCountOnChange.earlyT1Singleton.pas
git commit -m "refactor: standardise fibroid functions — past tense, pe12week spacing, all 10 fibroids (Q4-Q6, Q8, Q24-Q25)"
```

---

### Task 4: Ovaries — GetOvary (Q13)

**Files:**
- Modify: `Scripts/shared/obstetric/ovaries.pas:4-11` (replace getOvaryWarning), add new unified GetOvary
- Delete: `Scripts/shared/variants/getOvaryWarning.earlyT1Singleton.pas`
- Modify: `Scripts/earlyT1Singleton/script.pas` (remove variant include)

**Note:** The current shared `ovaries.pas` only has `getOvaryWarning` and `GetOvaryConc`. The `GetOvary` function currently lives only in originals (not yet extracted to shared). earlyT1 includes `ovaries.pas` + the `getOvaryWarning` variant. 20week and pe12week have their GetOvary functions inline in their originals. We need to add the new unified `GetOvary` to the shared module.

- [ ] **Step 1: Update getOvaryWarning in shared ovaries.pas**

The earlyT1 variant version at `getOvaryWarning.earlyT1Singleton.pas` has proper semicolons. Replace the current `getOvaryWarning` in `Scripts/shared/obstetric/ovaries.pas` (lines 4-11) with:
```pascal
Function getOvaryWarning : Boolean;
begin
  result := FALSE;
  if ((cbRightOvaryAbnormal.checked) or (cbLeftOvaryAbnormal.checked)) then
    result := TRUE;
end;
```

- [ ] **Step 2: Add unified GetOvary function to shared ovaries.pas**

Add before the `#endif` at the end of `Scripts/shared/obstetric/ovaries.pas`:
```pascal
Function GetOvary : string;
begin
  result := '';
  if cbRightOvaryIdentified.checked then
  begin
     if cbLeftOvaryIdentified.checked then
       result := result + 'Both ovaries are not identified. ';
     else
       result := result + 'The right ovary is not identified. ';
  end
  else if cbLeftOvaryIdentified.checked then
     result := result + 'The left ovary is not identified. ';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := result + 'Both ovaries appear normal. ';
     else
       result := result + 'The right ovary is normal. ';
  end
  else if cbLeftOvaryNormal.checked then
     result := result + 'The left ovary is normal. ';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal. ';
     else
       result := result + 'The right ovary is abnormal. ';
  end
  else if cbLeftOvaryAbnormal.checked then
     result := result + 'The left ovary is abnormal. ';

  if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries. ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary. ';
  end
  else if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum is visualised in the left ovary. ';

  if result <> '' then
     result := #13#10+#13#10 + '#|#+BOLDOvaries:#/#' + #13#10 + result;
end;
```

Key features per expert's specification:
- Reports "not identified" (earlyT1 feature, retained)
- Reports "Both ovaries appear normal" (changed from "are normal" per expert table)
- Reports abnormal with "The right/left ovary is abnormal." style
- Reports corpus luteum (earlyT1 feature, retained)
- Uses bold "Ovaries:" heading (pe12week style, per expert)
- Uses 1-space after periods (per Q1 decision)

- [ ] **Step 3: Delete variant file**

```bash
rm "Scripts/shared/variants/getOvaryWarning.earlyT1Singleton.pas"
```

- [ ] **Step 4: Update earlyT1Singleton/script.pas**

Remove:
```
#include "shared/variants/getOvaryWarning.earlyT1Singleton.pas"
```

- [ ] **Step 5: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 6: Commit**

```bash
git add Scripts/shared/obstetric/ovaries.pas \
  Scripts/earlyT1Singleton/script.pas
git rm Scripts/shared/variants/getOvaryWarning.earlyT1Singleton.pas
git commit -m "refactor: add unified GetOvary with bold heading, corpus luteum, all states (Q13)"
```

---

### Task 5: Cervix — getCervixDetailed, getCervixConclusion (Q14, Q15)

**Files:**
- Modify: `Scripts/shared/obstetric/cervix.pas:50-105` (getCervixDetailed — replace pe12week style with 20week inline style)
- Modify: `Scripts/shared/obstetric/cervix.pas:33-48` (getCervixConclusion — merge to closest variant with measurement)
- Delete: `Scripts/shared/variants/getCervixDetailed.20week.pas`
- Delete: `Scripts/shared/variants/getCervixConclusion.t3Singleton.pas`
- Delete: `Scripts/shared/variants/getCervixConclusion.t3twins.pas`
- Modify: `Scripts/20week/script.pas` (remove variant include)
- Modify: `Scripts/t3Singleton/script.pas` (remove variant include)
- Modify: `Scripts/t3twins/script.pas` (remove variant include)

- [ ] **Step 1: Update getCervixDetailed to 20week inline style (Q15)**

Replace the `getCervixDetailed` function in `Scripts/shared/obstetric/cervix.pas` (lines 50-105) with the 20week variant (from `getCervixDetailed.20week.pas`). This is the version with measurement inline: `"...long and closed, 30mm on TVS"`.

The 20week variant file content should be copied verbatim into the shared module, replacing the current pe12week-style function. The content is in `Scripts/shared/variants/getCervixDetailed.20week.pas` (already read above).

- [ ] **Step 2: Update getCervixConclusion — add measurement to "Shortened cervix" text (Q14)**

Replace the `getCervixConclusion` function in `Scripts/shared/obstetric/cervix.pas` (lines 33-48) with:
```pascal
 Function getCervixConclusion : String
 var
   vCervicalLength : Real;
 begin
  result := '';
  vCervicalLength := 0.0;
  if ((meCervicalLength.text) <> '') then
  begin
    vCervicalLength := StrToFloatDef(meCervicalLength.text, 0);
    if (cbCervixShortYes.checked = TRUE) then
    begin
      result := 'Shortened cervix';
      if vCervicalLength > 0 then
      begin
        result := result + ' (' + meCervicalLength.text + 'mm';
        if cbCervixTVS.checked then
          result := result + ' on transvaginal ultrasound'
        else if cbCervixTA.checked then
          result := result + ' on transabdominal ultrasound';
        result := result + ')';
      end;
    end;
  end;
  result := AddFullStop(Result);
 end;
```

This merges to the closest existing variant (20week/pe12week "Shortened cervix") but adds measurement and scan method when available, per expert direction. The custom cervical surveillance logic (showing normal cervix in conclusion when cervical surveillance indication is ticked) is deferred to a follow-up task.

- [ ] **Step 3: Delete variant files**

```bash
rm "Scripts/shared/variants/getCervixDetailed.20week.pas"
rm "Scripts/shared/variants/getCervixConclusion.t3Singleton.pas"
rm "Scripts/shared/variants/getCervixConclusion.t3twins.pas"
```

- [ ] **Step 4: Update exam script.pas includes**

In `Scripts/20week/script.pas`, remove:
```
#include "shared/variants/getCervixDetailed.20week.pas"
```

In `Scripts/t3Singleton/script.pas`, remove:
```
#include "shared/variants/getCervixConclusion.t3Singleton.pas"
```

In `Scripts/t3twins/script.pas`, remove:
```
#include "shared/variants/getCervixConclusion.t3twins.pas"
```

- [ ] **Step 5: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 6: Commit**

```bash
git add Scripts/shared/obstetric/cervix.pas \
  Scripts/20week/script.pas \
  Scripts/t3Singleton/script.pas \
  Scripts/t3twins/script.pas
git rm Scripts/shared/variants/getCervixDetailed.20week.pas \
  Scripts/shared/variants/getCervixConclusion.t3Singleton.pas \
  Scripts/shared/variants/getCervixConclusion.t3twins.pas
git commit -m "refactor: standardise cervix functions — inline measurement style, add measurement to conclusion (Q14-Q15)"
```

---

### Task 6: Placenta — GetPlacenta1Measure, getPlacentaBeyond, getPlacentalPosition (Q17, Q18, Q20)

**Files:**
- Modify: `Scripts/shared/obstetric/placenta.pas` (getPlacentaBeyond tense, getPlacentalPosition edge-reaching text)
- Delete: `Scripts/shared/variants/getPlacentaBeyond.20week.pas`
- Delete: `Scripts/shared/variants/getPlacentalPosition.20week.pas`
- Modify: `Scripts/20week/script.pas` (remove 2 variant includes)

**Note:** Q16 (GetPlacenta pe12week adverbial) stays as variant — intentionally different. Q19 (getPlacentaConclusion feature additions) is deferred.

- [ ] **Step 1: Update getPlacentaBeyond to present tense (Q18)**

In `Scripts/shared/obstetric/placenta.pas`, replace the `getPlacentaBeyond` function (lines 57-61) with:
```pascal
 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta is ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
 end;
```

Change: `'Placenta was '` → `'Placenta is '`

- [ ] **Step 2: Update getPlacentalPosition with edge-reaching text (Q20)**

In `Scripts/shared/obstetric/placenta.pas`, replace the `getPlacentalPosition` function (lines 21-55) with:
```pascal
 Function getPlacentalPosition(infetus : integer)  : String
 var
  vControl: TcxComboBox;
  vLowLyingYes, vLowLyingNo : TcxCheckBox;
  vmeInternalOS :TCXMaskEdit;
 begin
  result := '';
  GPlacentaWarning := FALSE;
  vControl := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbPlacentaSite' + intToStr(infetus));
  vLowLyingYes := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbLowLyingPlacentaYes' + intToStr(infetus));
  vLowLyingNo := TwinControl(pgFetusMeasusements.Owner).FindComponent('cbLowLyingPlacentaNo' + intToStr(infetus));
  vmeInternalOS := TwinControl(pgFetusMeasusements.Owner).FindComponent('meInternalOS' + intToStr(infetus));
  if assigned(vControl) then
  begin
    result := trim(vControl.text) ;
    if vLowLyingYes.checked then
    begin
       result := result + ' and low lying. ';
       GPlacentaWarning := TRUE;
       if vmeInternalOS.text <> '' then
        begin
          if (StrToFloatDef(vmeInternalOS.text,0) > 0 ) then
            result := result + 'The leading edge is ' + GetPlacenta1Measure + ' from the internal cervical os. '
          else if (StrToFloatDef(vmeInternalOS.text,0) = 0 ) then
            result := result + 'The inferior edge is reaching the internal cervical os. '
        end;
    end
    else if vLowLyingNo.checked then
    begin
        result := result + ' and not low lying. ';
        GPlacentaWarning := False;
    end;
  end
  result := AddFullStop(Result);
 end;
```

Key changes from the current shared (t3Singleton) version:
- `'Leading edge '` → `'The leading edge is '` (per expert's corrected wording)
- Added `else if = 0` clause: `'The inferior edge is reaching the internal cervical os. '` (per expert's table)
- 1-space after periods (consistent with Q1)

- [ ] **Step 3: Delete variant files**

```bash
rm "Scripts/shared/variants/getPlacentaBeyond.20week.pas"
rm "Scripts/shared/variants/getPlacentalPosition.20week.pas"
```

- [ ] **Step 4: Update 20week/script.pas**

Remove:
```
#include "shared/variants/getPlacentaBeyond.20week.pas"
#include "shared/variants/getPlacentalPosition.20week.pas"
```

Note: 20week needs to include `shared/obstetric/placenta.pas` if it doesn't already. Check `Scripts/20week/script.pas` — it should already include it (confirmed: line 21).

- [ ] **Step 5: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 6: Commit**

```bash
git add Scripts/shared/obstetric/placenta.pas \
  Scripts/20week/script.pas
git rm Scripts/shared/variants/getPlacentaBeyond.20week.pas \
  Scripts/shared/variants/getPlacentalPosition.20week.pas
git commit -m "refactor: standardise placenta functions — present tense, corrected edge-reaching text (Q17-Q18, Q20)"
```

---

### Task 7: Gestational Age — getCompositeDate (Q12)

**Files:**
- Modify: `Scripts/shared/obstetric/eddHandling.pas:171-186` (getCompositeDate)
- Delete: `Scripts/shared/variants/getCompositeDate.20week.pas`
- Modify: `Scripts/20week/script.pas` (remove variant include)

- [ ] **Step 1: Update getCompositeDate to always show "0 days"**

In `Scripts/shared/obstetric/eddHandling.pas`, replace the `getCompositeDate` function (lines 171-186) with:
```pascal
function getCompositeDate : String;
begin
  result := '';
  result := intToStr(seUSSEDDGAWeeks1.value)   +' weeks '
  if seSSEDDGADays1.value >= 0 then
  begin
    if seSSEDDGADays1.value = 1 then
     result := result + intToStr(seSSEDDGADays1.value)   +' day';
    else
     result := result + intToStr(seSSEDDGADays1.value)   +' days';
  end

  result := AddFullstopToEnd(Result);
end
```

Key changes:
- `> 0` → `>= 0` so 0 days is always entered (matches 20week variant)
- Singular/plural logic: `= 1` → `' day'`, else → `' days'` (correct for both variants)
- Removed the separate `else if = 0` clause — the `>= 0` check with `<> 1` handles it

- [ ] **Step 2: Delete variant file**

```bash
rm "Scripts/shared/variants/getCompositeDate.20week.pas"
```

- [ ] **Step 3: Update 20week/script.pas**

Remove:
```
#include "shared/variants/getCompositeDate.20week.pas"
```

- [ ] **Step 4: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 5: Commit**

```bash
git add Scripts/shared/obstetric/eddHandling.pas \
  Scripts/20week/script.pas
git rm Scripts/shared/variants/getCompositeDate.20week.pas
git commit -m "refactor: standardise getCompositeDate to always show 0 days (Q12)"
```

---

### Task 8: UI — cbToggleCheckOnClick, GetPerGraph (Q22, Q23)

**Files:**
- Modify: `Scripts/shared/utils/formUtils.pas:19-36` (cbToggleCheckOnClick — add explicit type casts)
- Modify: `Scripts/shared/obstetric/biometry.pas:121+` (GetPerGraph — no leading space for <3)
- Delete: `Scripts/shared/variants/GetPerGraph.20week.pas`
- Delete: `Scripts/shared/variants/GetPerGraph.pe12week.pas`
- Modify: `Scripts/20week/script.pas` (remove variant include)
- Modify: `Scripts/pe12week/script.pas` (remove variant include)

**Note:** `cbToggleCheckOnClick.gynae.pas` variant stays — gynae is deferred. But we update the shared version to match the gynae style (explicit casts) since it's safer.

- [ ] **Step 1: Update cbToggleCheckOnClick with explicit type casts (Q23)**

In `Scripts/shared/utils/formUtils.pas`, replace lines 19-36 with:
```pascal
procedure cbToggleCheckOnClick(Sender)
var
  i: Integer;
begin
  if TcxCheckBox(Sender).Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (TcxCheckBox(Sender.Parent.Controls[i]).Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          TcxCheckBox(Sender.Parent.Controls[i]).Checked := false;
        end;
      end;
    end;
  end;
end;
```

Change: `Sender.Checked` → `TcxCheckBox(Sender).Checked`, `Controls[i].Checked` → `TcxCheckBox(Controls[i]).Checked`, `Controls[i].Checked := false` → `TcxCheckBox(Controls[i]).Checked := false`

- [ ] **Step 2: Update GetPerGraph — no leading space for <3 (Q22)**

In `Scripts/shared/obstetric/biometry.pas`, the current GetPerGraph (starting at line 121) already uses the 20week/t3 style with no leading space for below-3rd-percentile. Verify:
- Line ~133: `result := 'x[---------|---------]'` (no leading space — correct)
- Line ~156: `result := 'x[---------|---------]'` (no leading space — correct)

If the shared version already matches the 20week/t3 style, no change needed. The pe12week variant (with leading space) will be deleted.

- [ ] **Step 3: Delete variant files**

```bash
rm "Scripts/shared/variants/GetPerGraph.20week.pas"
rm "Scripts/shared/variants/GetPerGraph.pe12week.pas"
```

- [ ] **Step 4: Update exam script.pas includes**

In `Scripts/20week/script.pas`, remove:
```
#include "shared/variants/GetPerGraph.20week.pas"
```

In `Scripts/pe12week/script.pas`, remove:
```
#include "shared/variants/GetPerGraph.pe12week.pas"
```

- [ ] **Step 5: Build and test**

```bash
bash Scripts/tools/build.sh
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 6: Commit**

```bash
git add Scripts/shared/utils/formUtils.pas \
  Scripts/shared/obstetric/biometry.pas \
  Scripts/20week/script.pas \
  Scripts/pe12week/script.pas
git rm Scripts/shared/variants/GetPerGraph.20week.pas \
  Scripts/shared/variants/GetPerGraph.pe12week.pas
git commit -m "refactor: standardise cbToggleCheckOnClick (explicit casts) and GetPerGraph (no leading space <3) (Q22-Q23)"
```

---

### Task 9: Final verification and cleanup

- [ ] **Step 1: Full build of all exams**

```bash
bash Scripts/tools/build.sh
```

Verify all 6 exams build without errors.

- [ ] **Step 2: Run full test suite**

```bash
cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v
```

- [ ] **Step 3: Verify remaining variants are intentional**

List remaining variant files:
```bash
ls Scripts/shared/variants/
```

Confirm each remaining file is either:
- A gynae-specific variant (deferred)
- An intentionally different variant (Q16 GetPlacenta.pe12week, Q21 GetNormalMCAPIRange)
- A variant for a different control name (GetClinicalIndicators.pe12week for `cxccbReferralIndication`)
- A variant not covered by this merge (other functions)

- [ ] **Step 4: Spot-check built output**

Compare a few key functions in the built output to verify the correct variant was applied:
```bash
cd Scripts/tools && python3 funcsplit.py extract AddFullStop ../build/earlyT1Singleton.pas
cd Scripts/tools && python3 funcsplit.py extract AddFullStop ../build/20week.pas
cd Scripts/tools && python3 funcsplit.py extract GetFibroidCount ../build/earlyT1Singleton.pas
cd Scripts/tools && python3 funcsplit.py extract getCompositeDate ../build/earlyT1Singleton.pas
cd Scripts/tools && python3 funcsplit.py extract getCompositeDate ../build/20week.pas
```

Verify:
- AddFullStop uses `'. '` (1 space) in all exams
- GetFibroidCount uses `'was'`/`'were'` (past tense)
- getCompositeDate uses `>= 0` (always shows 0 days)

- [ ] **Step 5: Commit if any fixes were needed**

Only if step 1-4 revealed issues that needed fixing.
