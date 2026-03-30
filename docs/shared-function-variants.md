# Shared Function Variant Analysis

Analysis of all functions shared across 2+ of the 6 exam scripts,
comparing normalized bodies to identify functional differences.

**Normalization applied:** strip trailing whitespace per line, collapse multiple
blank lines to one, strip leading/trailing blank lines. Indentation and case
are preserved (they could be functional in some contexts).

**Functional identity test:** after normalization, if every line matches after
stripping leading whitespace (since Pascal indentation is not significant),
the function is marked as **Functionally Identical**.

## Summary

- **Total shared functions** (in 2+ scripts): 115
- **Functionally identical:** 62
- **With variants:** 53

### Functions With Variants

| Function | # Variants | Exams | Nature of Difference |
|---|---|---|---|
| AddFullStop | 2 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Same structure (15 lines), differs on 1 line(s): |
| AddFullstopToEnd | 3 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=11, B=11, C=11. |
| btnGeneratePercentilesOnClick | 2 | 20week, t3Singleton | Variant A (20week): 304 lines. Variant B (t3Singleton): 357 lines. Diff: 0 line(s) removed, 53 line(s) added. |
| cbFetalAnatomyNormal1OnClick | 3 | 20week, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=15, B=18, C=14. |
| cbFibroidsTypeOnChange | 2 | earlyT1Singleton, gynae | Variant A (earlyT1Singleton): 15 lines. Variant B (gynae): 24 lines. Diff: 5 line(s) removed, 14 line(s) added. |
| cbGestationTypeChange | 2 | 20week, pe12week, t3Singleton | Variant A (20week, pe12week): 4 lines. Variant B (t3Singleton): 72 lines. Diff: 1 line(s) removed, 69 line(s) added. |
| cbToggleCheckOnClick | 2 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Same structure (18 lines), differs on 3 line(s): |
| cbUSSEDDOnChange | 2 | earlyT1Singleton, 20week, pe12week | Variant A (earlyT1Singleton): 5 lines. Variant B (20week, pe12week): 14 lines. Diff: 0 line(s) removed, 9 line(s) added. |
| CheckFormComplete | 6 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and vali... |
| cxccbReferralIndicationChange | 2 | 20week, gynae, pe12week | Variant A (20week, pe12week): 4 lines. Variant B (gynae): 58 lines. Diff: 2 line(s) removed, 56 line(s) added. |
| cxccbReferralIndicatorsChange | 2 | earlyT1Singleton, t3Singleton, t3twins | Same structure (4 lines), differs on 1 line(s): |
| deStatedEDDOnChange | 2 | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Same structure (4 lines), differs on 1 line(s): |
| GetAnatomy | 2 | 20week, pe12week | Variant A (20week): 67 lines. Variant B (pe12week): 40 lines. Diff: 31 line(s) removed, 4 line(s) added. |
| GetBioPhysicalConc | 2 | t3Singleton, t3twins | Variant A (t3Singleton): 12 lines. Variant B (t3twins): 8 lines. Diff: 7 line(s) removed, 3 line(s) added. |
| GetCavDistortionCount | 3 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=24, B=24, C=22. |
| getCervixConclusion | 3 | 20week, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=16, B=33, C=29. |
| getCervixDetailed | 2 | 20week, pe12week | Variant A (20week): 57 lines. Variant B (pe12week): 56 lines. Diff: 8 line(s) removed, 7 line(s) added. |
| GetClinicalHistory | 2 | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Variant A (earlyT1Singleton): 23 lines. Variant B (20week, pe12week, t3Singleton, t3twins): 7 lines. Diff: 17 line(s)... |
| GetClinicalIndicators | 4 | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | 4 distinct variants with line counts: A=24, B=24, C=23, D=24. |
| getCompositeDate | 2 | earlyT1Singleton, 20week, pe12week | Variant A (earlyT1Singleton, pe12week): 16 lines. Variant B (20week): 14 lines. Diff: 7 line(s) removed, 5 line(s) ad... |
| getConclusionWarnings | 3 | 20week, t3Singleton, t3twins | 3 distinct variants with line counts: A=16, B=24, C=10. |
| GetDuctusVenosusWarning | 2 | t3Singleton, t3twins | Variant A (t3Singleton): 6 lines. Variant B (t3twins): 8 lines. Diff: 1 line(s) removed, 3 line(s) added. |
| getEFWPer | 2 | t3Singleton, t3twins | Variant A (t3Singleton): 35 lines. Variant B (t3twins): 45 lines. Diff: 1 line(s) removed, 11 line(s) added. |
| GetEnteredEDD | 2 | earlyT1Singleton, 20week, pe12week | Variant A (earlyT1Singleton, pe12week): 48 lines. Variant B (20week): 8 lines. Diff: 40 line(s) removed, 0 line(s) ad... |
| getFibroid | 4 | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | 4 distinct variants with line counts: A=52, B=52, C=52, D=50. |
| GetFibroidConcl | 2 | earlyT1Singleton, gynae | Variant A (earlyT1Singleton): 53 lines. Variant B (gynae): 58 lines. Diff: 15 line(s) removed, 20 line(s) added. |
| GetFibroidCount | 2 | earlyT1Singleton, gynae | Same structure (18 lines), differs on 2 line(s): |
| GetFibroidDesc | 2 | earlyT1Singleton, gynae | Variant A (earlyT1Singleton): 13 lines. Variant B (gynae): 64 lines. Diff: 3 line(s) removed, 54 line(s) added. |
| GetFibroidString | 3 | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=58, B=75, C=75. |
| getGAFromEnteredEDD | 3 | earlyT1Singleton, 20week, pe12week | 3 distinct variants with line counts: A=81, B=13, C=81. |
| GetGraphXValue | 2 | 20week, pe12week, t3Singleton, t3twins | Same structure (12 lines), differs on 1 line(s): |
| GetIntegerMeasuredString | 2 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Variant A (earlyT1Singleton): 30 lines. Variant B (20week, gynae, pe12week, t3Singleton, t3twins): 27 lines. Diff: 11... |
| GetLargestFibroid | 2 | earlyT1Singleton, gynae | Variant A (earlyT1Singleton): 26 lines. Variant B (gynae): 27 lines. Diff: 0 line(s) removed, 1 line(s) added. |
| GetNormalMCAPIRange | 2 | 20week, t3Singleton, t3twins | Variant A (20week): 25 lines. Variant B (t3Singleton, t3twins): 28 lines. Diff: 19 line(s) removed, 22 line(s) added. |
| GetObstetricHistory | 2 | 20week, pe12week, t3Singleton, t3twins | Variant A (20week, t3Singleton): 25 lines. Variant B (pe12week, t3twins): 23 lines. Diff: 2 line(s) removed, 0 line(s... |
| GetOvary | 3 | earlyT1Singleton, 20week, pe12week | 3 distinct variants with line counts: A=49, B=40, C=20. |
| GetOvaryConc | 2 | gynae, pe12week | Variant A (gynae): 530 lines. Variant B (pe12week): 20 lines. Diff: 524 line(s) removed, 14 line(s) added. |
| getOvaryWarning | 2 | earlyT1Singleton, 20week, pe12week | Variant A (earlyT1Singleton): 6 lines. Variant B (20week, pe12week): 8 lines. Diff: 4 line(s) removed, 6 line(s) added. |
| GetPerGraph | 3 | 20week, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=73, B=73, C=82. |
| GetPlacenta | 2 | 20week, pe12week, t3Singleton | Variant A (20week, t3Singleton): 5 lines. Variant B (pe12week): 6 lines. Diff: 1 line(s) removed, 2 line(s) added. |
| GetPlacenta1Measure | 3 | 20week, t3Singleton, t3twins | 3 distinct variants with line counts: A=14, B=14, C=14. |
| getPlacentaBeyond | 2 | 20week, t3Singleton | Same structure (5 lines), differs on 1 line(s): |
| getPlacentaConclusion | 4 | 20week, pe12week, t3Singleton, t3twins | 4 distinct variants with line counts: A=29, B=4, C=18, D=8. |
| getPlacentalPosition | 2 | 20week, t3Singleton | Variant A (20week): 33 lines. Variant B (t3Singleton): 35 lines. Diff: 0 line(s) removed, 2 line(s) added. |
| getReportHeading | 2 | 20week, pe12week | Same structure (13 lines), differs on 3 line(s): |
| GetSingleFibroid | 2 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Variant A (earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins): 10 lines. Variant B (gynae): 7 lines. Diff: 7 l... |
| GetSingleFibroidCavity | 2 | earlyT1Singleton, gynae | Variant A (earlyT1Singleton): 27 lines. Variant B (gynae): 30 lines. Diff: 2 line(s) removed, 5 line(s) added. |
| GetSingleFibroidDimensions | 3 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=32, B=31, C=46. |
| InitializeScreen | 6 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and vali... |
| ProduceMergeFieldData | 6 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and vali... |
| ProduceMergeOrder | 6 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and vali... |
| spFibroidCountOnChange | 3 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | 3 distinct variants with line counts: A=56, B=60, C=13. |
| StartScript | 6 | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and vali... |

### Functionally Identical Functions

| Function | Exams | Cosmetic Note |
|---|---|---|
| AddToResult | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| btnCalGrowthPer1OnClick | t3Singleton, t3twins | Exact match |
| btnClear1OnClick | 20week, pe12week | Exact match |
| btnPregnancyRedatedOnClick | earlyT1Singleton, pe12week | Exact match |
| btnSelectAll1OnClick | 20week, pe12week | Exact match |
| CalcFetalScore | t3Singleton, t3twins | Exact match |
| cbDateOfConceptionOnChange | earlyT1Singleton, pe12week | Exact match |
| cbEDDPrincipleOnChange | earlyT1Singleton, pe12week | Exact match |
| cbFibroidsVisualisedOnClick | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| cbLMPDateOnChange | earlyT1Singleton, pe12week | Exact match |
| cxccbObstetricHistoryChange | 20week, pe12week, t3Singleton, t3twins | Exact match |
| deIVFEDDOnChange | earlyT1Singleton, pe12week | Exact match |
| deMenstrualEDDOnChange | earlyT1Singleton, pe12week | Exact match |
| deMUFWEddOnChange | earlyT1Singleton, pe12week | Exact match |
| deOvulationEDDOnChange | earlyT1Singleton, pe12week | Exact match |
| getAnatomyChecked | 20week, pe12week | Exact match |
| getAnatomyWarning | 20week, pe12week | Exact match |
| getBiometryPercentiles | 20week, t3Singleton, t3twins | Exact match |
| getCervicalSuture | 20week, pe12week | Exact match |
| getCervix | t3Singleton, t3twins | Exact match |
| getCervixWarning | 20week, pe12week | Exact match |
| GetDaysFromDueDate | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetDaysFromLMPDate | earlyT1Singleton, pe12week | Exact match |
| getEFW | 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetEmbryoTransferCount | earlyT1Singleton, pe12week | Exact match |
| GetFibroidAvg | earlyT1Singleton, gynae | Exact match |
| GetFrozen | earlyT1Singleton, pe12week | Exact match |
| GetFullDateString | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| getFunnelingMembranes | 20week, pe12week, t3Singleton, t3twins | Exact match |
| getFunnellingMembrane | 20week, pe12week | Exact match |
| GetGestDays | 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetGestWeeks | 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetGraphData | 20week, t3Singleton, t3twins | Exact match |
| GetIndefinateArticle | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Indentation differs on 3 line(s) |
| GetLiquor5Centile | 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetLiquor95Centile | 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetMCAPI | t3Singleton, t3twins | Exact match |
| GetMoMRange | 20week, t3Singleton, t3twins | Exact match |
| GetNormalCPRRange | 20week, t3Singleton, t3twins | Exact match |
| GetNormalUAPIRange | 20week, t3Singleton, t3twins | Exact match |
| GetNumberString | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| GetPlacenta1InvertPosition | 20week, t3Singleton | Exact match |
| GetSingleCloseOrClear | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Indentation differs on 4 line(s) |
| GetUAPI | t3Singleton, t3twins | Exact match |
| GetValueSuffix | 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetWeeksFromDueDate | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Exact match |
| GetWeeksFromLMPDate | earlyT1Singleton, pe12week | Exact match |
| IncludeComma | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| InitCaps | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| Max | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| Min | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Exact match |
| PadDecimalPlaces | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Exact match |
| PopulateEDDControls | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Exact match |
| RemoveDecimalPointAtEnd | earlyT1Singleton, pe12week | Exact match |
| SetAbnormalCheckes | 20week, pe12week, t3Singleton, t3twins | Exact match |
| SetAnatomyChecks | 20week, pe12week | Exact match |
| seTransferDayOnChange | earlyT1Singleton, pe12week | Exact match |
| StringReplace | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| StringReplaceAll | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins | Exact match |
| StrToFloatDef | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| StrToIntDef | earlyT1Singleton, 20week, gynae, pe12week, t3Singleton, t3twins | Exact match |
| ToggleCloseToCervixFibroid | pe12week, t3Singleton, t3twins | Exact match |

## Detailed Variant Analysis

### AddFullStop

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, 20week, pe12week, t3Singleton |
| B | gynae, t3twins |

**Summary:** Same structure (15 lines), differs on 1 line(s):
  - Line 9: `result := vt + '.  '` vs `result := vt + '. '`

**Nature:** Differences in: string literals.

**Example output difference:**
- Input: `'Normal anatomy'`
- Variant A output: `'Normal anatomy.  '` (period + 2 spaces)
- Variant B output: `'Normal anatomy. '` (period + 1 space)

<details>
<summary>Variant A (earlyT1Singleton, 20week, pe12week, t3Singleton)</summary>

```pascal
function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '.  '
    else
      result := inStr;
  end
  else
    result := ''
end;
```

</details>

<details>
<summary>Variant B (gynae, t3twins)</summary>

```pascal
function AddFullStop(inStr: String): String;
var
  vt: String;
begin
  vt := Trim(inStr);
  if vt <> '' then
  begin
    if vt[length(vt)] <> '.' then
      result := vt + '. '
    else
      result := inStr;
  end
  else
    result := ''
end;
```

</details>

---

### AddFullstopToEnd

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, pe12week |
| B | 20week, gynae |
| C | t3Singleton, t3twins |

**Summary:** 3 distinct variants with line counts: A=11, B=11, C=11.

Variants A (earlyT1Singleton, pe12week) vs B (20week, gynae) differ on 1 line(s): L9: `vt := inStr;` vs `vt := vt + '  ';`

Variants A (earlyT1Singleton, pe12week) vs C (t3Singleton, t3twins) differ on 2 line(s): L7: `vt := vt + '.  '` vs `vt := vt + '. '`; L9: `vt := inStr;` vs `vt := vt + ' ';`

Variants B (20week, gynae) vs C (t3Singleton, t3twins) differ on 2 line(s): L7: `vt := vt + '.  '` vs `vt := vt + '. '`; L9: `vt := vt + '  ';` vs `vt := vt + ' ';`

Variant A unique strings: ['.  ']

Variant B unique strings: ['  ', '.  ']

Variant C unique strings: [' ', '. ']

<details>
<summary>Variant A (earlyT1Singleton, pe12week)</summary>

```pascal
function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := trim(inStr);
  if vt[length(vt)] <> '.' then
    vt := vt + '.  '
  else
    vt := inStr;
  result := vt;
end;
```

</details>

<details>
<summary>Variant B (20week, gynae)</summary>

```pascal
function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := trim(inStr);
  if vt[length(vt)] <> '.' then
    vt := vt + '.  '
  else
    vt := vt + '  ';
  result := vt;
end;
```

</details>

<details>
<summary>Variant C (t3Singleton, t3twins)</summary>

```pascal
function AddFullstopToEnd(inStr: String): String;
var
  vt: String;
begin
  vt := trim(inStr);
  if vt[length(vt)] <> '.' then
    vt := vt + '. '
  else
    vt := vt + ' ';
  result := vt;
end;
```

</details>

---

### btnGeneratePercentilesOnClick

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week |
| B | t3Singleton |

**Summary:** Variant A (20week): 304 lines. Variant B (t3Singleton): 357 lines. Diff: 0 line(s) removed, 53 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (20week)
+++ Variant B (t3Singleton)
@@ -88,2 +88,55 @@
 
+    { if edtOFD1.text <> '' then
+      begin
+        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtOFD1.text),0);
+      end;
+      if vBiometryValue > 0 then
+      begin
+      vCaption :=  'OFD' +' (' +  vAuthor + ')';
+       if cbOverrideCurrentValues.checked then
+       begin
+          getGraphData(vCaption);
+           if cxGraphData.lines.count > 0 then
+           begin
+                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
+                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
+           end;
+            if (vPercentile < 3) then
+                edtOFDPer1.text := '<3';
+            else if (vPercentile > 97) then
+               edtOFDPer1.text := '>97';
+            else
+              edtOFDPer1.text := intToStr(vPercentile);
+           edtOFDForm1.Text := 'OFD' +', ' +  vAuthor;
+       end;
+       else
+       begin
+          if pos('<',edtOFDPer1.text) then
+            vTempStr := StringReplace(edtOFDPer1.text,'<','')
+          else if pos('>',edtOFDPer1.text) then
+            vTempStr := StringReplace(edtOFDPer1.text,'>','')
+          else
+             vTempStr := edtOFDPer1.text;
+          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
+           begin
+              getGraphData(vCaption);
+              if cxGraphData.lines.count > 0 then
+              begin
... (18 more lines)
```

<details>
<summary>Variant A (20week)</summary>

```pascal
procedure btnGeneratePercentilesOnClick(sender);
var
  vBaseControl: TWinControl;
  vedtBiometry,vedtBiometryPer : TcxMaskEdit;
  vlblLabel: TcxLabel;
  i,inFetus: Integer;
  vBiometry : String;
  vGraphString : String;
  vBiometryPer,vtempString : String;
  vAuthor,vTempStr,vCaption : String;
  vGestWeeks,vGestDays : integer;
  vGeastation,vBiometryValue : Real
  vPercentile : Real
  vDays : Float;
begin
  result := true;
  inFetus := 1;
  vAuthor := 'CHITTY';
  vTempStr := '';
  vDays := 0.0;
  if cbBioPercentile1.text <> '' then
     vAuthor := cbBioPercentile1.text;
  vGestWeeks := getGestWeeks;
  vGestDays := getGestDays;
  vDays := vGestDays / 7;
  vTempString := Format('%.2f',[vGestWeeks + vDays]);
  vGestation := StrtoFloatDef(vTempString,0);
  vBiometryValue := 0.0;
  vGraphString := '';
  // need to calculate for each percentile as they differ in control names.
  //Tried chnaging the control names to follow a unique pattern and including them into group box but that failswhen calculating the prior values.
  // will have to change all the contraols in all the templates and run a DB query to generalise the code. So calculating each seperatly.
  if  vGestation > 0 then
  begin
      if edtBPD1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtBPD1.text),0);
      end;
      vCaption :=  'BPD' +' (' +  vAuthor + ')';
      if vBiometryValue > 0 then
      begin
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
             edtBPDPer1.text := '<3';
           else if (vPercentile > 97) then
              edtBPDPer1.text := '>97';
           else
             edtBPDPer1.text := intToStr(vPercentile);
           edtBPDForm1.Text := 'BPD' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtBPDPer1.text) then
            vTempStr := StringReplace(edtBPDPer1.text,'<','')
          else if pos('>',edtBPDPer1.text) then
            vTempStr := StringReplace(edtBPDPer1.text,'>','')
         else
            vTempStr := edtBPDPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtBPDPer1.text := '<3';
              else if (vPercentile > 97) then
                edtBPDPer1.text := '>97';
              else
                edtBPDPer1.text := intToStr(vPercentile);
              edtBPDForm1.Text := 'BPD' +', ' +  vAuthor;
           end;
       end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr:= '';
       vPercentile := 0;

     if edtHC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtHC1.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'HC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtHCPer1.text := '<3';
           else if (vPercentile > 97) then
               edtHCPer1.text := '>97';
           else
              edtHCPer1.text := intToStr(vPercentile);
           edtHCForm1.Text := 'HC' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtHCPer1.text) then
            vTempStr := StringReplace(edtHCPer1.text,'<','')
          else if pos('>',edtHCPer1.text) then
            vTempStr := StringReplace(edtHCPer1.text,'>','')
          else
            vTempStr := edtHCPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtHCPer1.text := '<3';
              else if (vPercentile > 97) then
                edtHCPer1.text := '>97';
              else
                edtHCPer1.text := intToStr(vPercentile);
              edtHCForm1.Text := 'HC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtAC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtAC1.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'AC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtACPer1.text := '<3';
           else if (vPercentile > 97) then
                edtACPer1.text := '>97';
           else
              edtACPer1.text := intToStr(vPercentile);
           edtACForm1.Text := 'AC' +', ' +  vAuthor;
       end;
       else
       begin
         if pos('<',edtACPer1.text) then
               vTempStr := StringReplace(edtACPer1.text,'<','')
            else if pos('>',edtACPer1.text) then
              vTempStr := StringReplace(edtACPer1.text,'>','')
            else
               vTempStr := edtACPer1.text;

          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtACPer1.text := '<3';
               else if (vPercentile > 97) then
                edtACPer1.text := '>97';
              else
                 edtACPer1.text := intToStr(vPercentile);
              edtACPer1.text := intToStr(vPercentile);
              edtACForm1.Text := 'AC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtHL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtHL1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'HL' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtHLPer1.text := '<3';
           else if (vPercentile > 97) then
                edtHLPer1.text := '>97';
           else
             edtHLPer1.text := intToStr(vPercentile);
            edtHLForm1.Text := 'HL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edtHLPer1.text) then
            vTempStr := StringReplace(edtHLPer1.text,'<','')
          else if pos('>',edtHLPer1.text) then
            vTempStr := StringReplace(edtHLPer1.text,'>','')
         else
            vTempStr := edtHLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtHLPer1.text := '<3';
               else if (vPercentile > 97) then
                edtHLPer1.text := '>97';
              else
               edtHLPer1.text := intToStr(vPercentile);
              edtHLForm1.Text := 'HL' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtFL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtFL1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'FL' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtFLPer1.text := '<3';
           else if (vPercentile > 97) then
                edtFLPer1.text := '>97';
           else
            edtFLPer1.text := intToStr(vPercentile);
           edtFLForm1.Text := 'FL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edtFLPer1.text) then
            vTempStr := StringReplace(edtFLPer1.text,'<','')
          else if pos('>',edtFLPer1.text) then
            vTempStr := StringReplace(edtFLPer1.text,'>','')
         else
            vTempStr := edtFLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtFLPer1.text := '<3';
               else if (vPercentile > 97) then
                edtFLPer1.text := '>97';
              else
                edtFLPer1.text := intToStr(vPercentile);
              edtFLForm1.Text := 'FL' +', ' +  vAuthor;
           end;
       end;
     end;
  end;
  else
  begin
   ShowMessage('Please enter the Gestation age to calculate percentiles.');
  end;
end;
```

</details>

<details>
<summary>Variant B (t3Singleton)</summary>

```pascal
procedure btnGeneratePercentilesOnClick(sender);
var
  vBaseControl: TWinControl;
  vedtBiometry,vedtBiometryPer : TcxMaskEdit;
  vlblLabel: TcxLabel;
  i,inFetus: Integer;
  vBiometry : String;
  vGraphString : String;
  vBiometryPer,vtempString : String;
  vAuthor,vTempStr,vCaption : String;
  vGestWeeks,vGestDays : integer;
  vGeastation,vBiometryValue : Real
  vPercentile : Real
  vDays : Float;
begin
  result := true;
  inFetus := 1;
  vAuthor := 'CHITTY';
  vTempStr := '';
  vDays := 0.0;
  if cbBioPercentile1.text <> '' then
     vAuthor := cbBioPercentile1.text;
  vGestWeeks := getGestWeeks;
  vGestDays := getGestDays;
  vDays := vGestDays / 7;
  vTempString := Format('%.2f',[vGestWeeks + vDays]);
  vGestation := StrtoFloatDef(vTempString,0);
  vBiometryValue := 0.0;
  vGraphString := '';
  // need to calculate for each percentile as they differ in control names.
  //Tried chnaging the control names to follow a unique pattern and including them into group box but that failswhen calculating the prior values.
  // will have to change all the contraols in all the templates and run a DB query to generalise the code. So calculating each seperatly.
  if  vGestation > 0 then
  begin
      if edtBPD1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtBPD1.text),0);
      end;
      vCaption :=  'BPD' +' (' +  vAuthor + ')';
      if vBiometryValue > 0 then
      begin
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
             edtBPDPer1.text := '<3';
           else if (vPercentile > 97) then
              edtBPDPer1.text := '>97';
           else
             edtBPDPer1.text := intToStr(vPercentile);
           edtBPDForm1.Text := 'BPD' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtBPDPer1.text) then
            vTempStr := StringReplace(edtBPDPer1.text,'<','')
          else if pos('>',edtBPDPer1.text) then
            vTempStr := StringReplace(edtBPDPer1.text,'>','')
         else
            vTempStr := edtBPDPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtBPDPer1.text := '<3';
              else if (vPercentile > 97) then
                edtBPDPer1.text := '>97';
              else
                edtBPDPer1.text := intToStr(vPercentile);
              edtBPDForm1.Text := 'BPD' +', ' +  vAuthor;
           end;
       end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr:= '';
       vPercentile := 0;

    { if edtOFD1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtOFD1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'OFD' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
            if (vPercentile < 3) then
                edtOFDPer1.text := '<3';
            else if (vPercentile > 97) then
               edtOFDPer1.text := '>97';
            else
              edtOFDPer1.text := intToStr(vPercentile);
           edtOFDForm1.Text := 'OFD' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtOFDPer1.text) then
            vTempStr := StringReplace(edtOFDPer1.text,'<','')
          else if pos('>',edtOFDPer1.text) then
            vTempStr := StringReplace(edtOFDPer1.text,'>','')
          else
             vTempStr := edtOFDPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                   vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtOFDPer1.text := '<3';
              else if (vPercentile > 97) then
               edtOFDPer1.text := '>97';
              else
                 edtOFDPer1.text := intToStr(vPercentile);
              edtOFDForm1.Text := 'OFD' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
     end;  }
     if edtHC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtHC1.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'HC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtHCPer1.text := '<3';
           else if (vPercentile > 97) then
               edtHCPer1.text := '>97';
           else
              edtHCPer1.text := intToStr(vPercentile);
           edtHCForm1.Text := 'HC' +', ' +  vAuthor;
       end;
       else
       begin
          if pos('<',edtHCPer1.text) then
            vTempStr := StringReplace(edtHCPer1.text,'<','')
          else if pos('>',edtHCPer1.text) then
            vTempStr := StringReplace(edtHCPer1.text,'>','')
          else
            vTempStr := edtHCPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtHCPer1.text := '<3';
              else if (vPercentile > 97) then
                edtHCPer1.text := '>97';
              else
                edtHCPer1.text := intToStr(vPercentile);
              edtHCForm1.Text := 'HC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtAC1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtAC1.text),0);
      end;
     if vBiometryValue > 0 then
     begin
      vCaption :=  'AC' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtACPer1.text := '<3';
           else if (vPercentile > 97) then
                edtACPer1.text := '>97';
           else
              edtACPer1.text := intToStr(vPercentile);
           edtACForm1.Text := 'AC' +', ' +  vAuthor;
       end;
       else
       begin
         if pos('<',edtACPer1.text) then
               vTempStr := StringReplace(edtACPer1.text,'<','')
            else if pos('>',edtACPer1.text) then
              vTempStr := StringReplace(edtACPer1.text,'>','')
            else
               vTempStr := edtACPer1.text;

          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtACPer1.text := '<3';
               else if (vPercentile > 97) then
                edtACPer1.text := '>97';
              else
                 edtACPer1.text := intToStr(vPercentile);
              edtACPer1.text := intToStr(vPercentile);
              edtACForm1.Text := 'AC' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtHL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtHL1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'HL' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtHLPer1.text := '<3';
           else if (vPercentile > 97) then
                edtHLPer1.text := '>97';
           else
             edtHLPer1.text := intToStr(vPercentile);
            edtHLForm1.Text := 'HL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edtHLPer1.text) then
            vTempStr := StringReplace(edtHLPer1.text,'<','')
          else if pos('>',edtHLPer1.text) then
            vTempStr := StringReplace(edtHLPer1.text,'>','')
         else
            vTempStr := edtHLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtHLPer1.text := '<3';
               else if (vPercentile > 97) then
                edtHLPer1.text := '>97';
              else
               edtHLPer1.text := intToStr(vPercentile);
              edtHLForm1.Text := 'HL' +', ' +  vAuthor;
           end;
       end;
       vBiometryValue := 0.0;
       vCaption := '';
       vTempStr := '';
       vPercentile := 0;
      end;
      if edtFL1.text <> '' then
      begin
        vBiometryValue :=  StrToFloatDef(padDecimalPlaces(edtFL1.text),0);
      end;
      if vBiometryValue > 0 then
      begin
      vCaption :=  'FL' +' (' +  vAuthor + ')';
       if cbOverrideCurrentValues.checked then
       begin
          getGraphData(vCaption);
           if cxGraphData.lines.count > 0 then
           begin
                vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
           end;
           if (vPercentile < 3) then
                edtFLPer1.text := '<3';
           else if (vPercentile > 97) then
                edtFLPer1.text := '>97';
           else
            edtFLPer1.text := intToStr(vPercentile);
           edtFLForm1.Text := 'FL' +', ' +  vAuthor;
       end;
       else
       begin
           if pos('<',edtFLPer1.text) then
            vTempStr := StringReplace(edtFLPer1.text,'<','')
          else if pos('>',edtFLPer1.text) then
            vTempStr := StringReplace(edtFLPer1.text,'>','')
         else
            vTempStr := edtFLPer1.text;
          if (vTempStr = '') or (StrToInt(vTempStr) =  0) then
           begin
              getGraphData(vCaption);
              if cxGraphData.lines.count > 0 then
              begin
                  vGraphString := StringReplaceAll(cxGraphData.lines.text,''#$D#$A'','');
                  vPercentile := Round(GetGraphPercentile(vGraphString,vGestation,vBiometryValue)*100)
              end;
              if (vPercentile < 3) then
                edtFLPer1.text := '<3';
               else if (vPercentile > 97) then
                edtFLPer1.text := '>97';
              else
                edtFLPer1.text := intToStr(vPercentile);
              edtFLForm1.Text := 'FL' +', ' +  vAuthor;
           end;
       end;
     end;
  end;
  else
  begin
   ShowMessage('Please enter the Gestation age to calculate percentiles.');
  end;
end;
```

</details>

---

### cbFetalAnatomyNormal1OnClick

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | 20week |
| B | pe12week |
| C | t3Singleton, t3twins |

**Summary:** 3 distinct variants with line counts: A=15, B=18, C=14.

<details>
<summary>Variant A (20week)</summary>

```pascal
procedure cbFetalAnatomyNormal1OnClick(sender);
var
  vgb: TcxGroupBox;
  vChecked: TcxCheckBox;
  i: Integer;
begin
  cbToggleCheckOnClick(Sender);
  vgb := TWinControl(pgFetusMeasusements.Owner).FindComponent('cxgbAbnormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  vChecked := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalAnatomyAbNormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  if assigned(vgb) then
  begin
    SetAbnormalCheckes(vgb, vChecked.Checked);
  end;
  btnSelectAll1OnClick(sender);
end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
procedure cbFetalAnatomyNormal1OnClick(sender);
var
  vgb: TcxGroupBox;
  vChecked: TcxCheckBox;
  i: Integer;
begin
  cbToggleCheckOnClick(Sender);
  vgb := TWinControl(pgFetusMeasusements.Owner).FindComponent('cxgbAbnormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  vChecked := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalAnatomyAbNormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  if assigned(vgb) then
  begin
    SetAbnormalCheckes(vgb, vChecked.Checked);
  end;
  if (cbFetalAnatomyNormal1.checked) or (cbFetalAnatomyAbNormal1.checked) then
     btnSelectAll1OnClick(sender);
  else
    btnClear1OnClick(sender)
end;
```

</details>

<details>
<summary>Variant C (t3Singleton, t3twins)</summary>

```pascal
procedure cbFetalAnatomyNormal1OnClick(sender);
var
  vgb: TcxGroupBox;
  vChecked: TcxCheckBox;
  i: Integer;
begin
  cbToggleCheckOnClick(Sender);
  vgb := TWinControl(pgFetusMeasusements.Owner).FindComponent('cxgbAbnormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  vChecked := TWinControl(pgFetusMeasusements.Owner).FindComponent('cbFetalAnatomyAbNormal' + copy(Sender.Name, length(Sender.name), length(sender.name)));
  if assigned(vgb) then
  begin
    SetAbnormalCheckes(vgb, vChecked.Checked);
  end;
end;
```

</details>

---

### cbFibroidsTypeOnChange

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | gynae |

**Summary:** Variant A (earlyT1Singleton): 15 lines. Variant B (gynae): 24 lines. Diff: 5 line(s) removed, 14 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (gynae)
@@ -3,3 +3,3 @@
   vControlIdx: Integer;
-  vCheckBox: TWinControl;
+  vCheckBox, vProjection: TWinControl;
 begin
@@ -8,7 +8,16 @@
   begin
-    {  vCheckBox := TWinControl(Sender).Owner.FindComponent('cbCavityDistortion' + intToStr(vControlIdx));
-      if assigned(vCheckBox) then
+    vCheckBox := TWinControl(Sender).Owner.FindComponent('cbCavityDistortion' + intToStr(vControlIdx));
+    vProjection:= TWinControl(Sender).Owner.FindComponent('cbProjection' + intToStr(vControlIdx));
+    if assigned(vCheckBox) then
+    begin
+      TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 0;
+      if (TcxComboBox(Sender).ItemIndex = 2) then
       begin
-        TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 0;
-      end;  }
+        TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 2;
+        TcxCheckBox(vCheckBox).caption := 'Cavity projection';
+      end;
+      else
+        TcxCheckBox(vCheckBox).caption := 'Cavity distortion'
+    end;
+    TcxComboBox(vProjection).visible := TcxComboBox(Sender).ItemIndex = 2
   end;
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
procedure cbFibroidsTypeOnChange(Sender)
var
  vControlIdx: Integer;
  vCheckBox: TWinControl;
begin
  vControlIdx := Sender.Tag;
  if vControlIdx > 0 then
  begin
    {  vCheckBox := TWinControl(Sender).Owner.FindComponent('cbCavityDistortion' + intToStr(vControlIdx));
      if assigned(vCheckBox) then
      begin
        TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 0;
      end;  }
  end;
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

```pascal
procedure cbFibroidsTypeOnChange(Sender)
var
  vControlIdx: Integer;
  vCheckBox, vProjection: TWinControl;
begin
  vControlIdx := Sender.Tag;
  if vControlIdx > 0 then
  begin
    vCheckBox := TWinControl(Sender).Owner.FindComponent('cbCavityDistortion' + intToStr(vControlIdx));
    vProjection:= TWinControl(Sender).Owner.FindComponent('cbProjection' + intToStr(vControlIdx));
    if assigned(vCheckBox) then
    begin
      TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 0;
      if (TcxComboBox(Sender).ItemIndex = 2) then
      begin
        TcxCheckBox(vCheckBox).Enabled := TcxComboBox(Sender).ItemIndex = 2;
        TcxCheckBox(vCheckBox).caption := 'Cavity projection';
      end;
      else
        TcxCheckBox(vCheckBox).caption := 'Cavity distortion'
    end;
    TcxComboBox(vProjection).visible := TcxComboBox(Sender).ItemIndex = 2
  end;
end;
```

</details>

---

### cbGestationTypeChange

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week, pe12week |
| B | t3Singleton |

**Summary:** Variant A (20week, pe12week): 4 lines. Variant B (t3Singleton): 72 lines. Diff: 1 line(s) removed, 69 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic.

**Example output difference:**
```diff
--- Variant A (20week, pe12week)
+++ Variant B (t3Singleton)
@@ -2,3 +2,71 @@
 begin
-  cbGestationType.ItemIndex := 1;
+  rglr1.Visible := cbGestationType.ItemIndex > 1;
+  rgsi1.Visible := cbGestationType.ItemIndex > 1;
+  cxtsFetus2.TabVisible := False;
+  tsWellBeing2.TabVisible := False;
+  cxtsFetus3.TabVisible := False;
+   tsWellBeing3.TabVisible := False;
+
+  case cbGestationType.ItemIndex of
+    2,3,4: begin
+             cxtsFetus2.TabVisible := True;
+             tsWellBeing2.TabVisible := True;
+           end;
+    5: begin
+         cxtsFetus2.TabVisible := True;
+         cxtsFetus3.TabVisible := True;
+         tsWellBeing2.TabVisible := True;
+         tsWellBeing3.TabVisible := True;
+       end;
+  end;
+  if cbGestationType.ItemIndex < 2 then
+    cxGroupBox3.Height := 1
+  else
+    cxGroupBox3.Height := 27;
+
+  lblAmnioticIndex1.Enabled := (cbGestationType.ItemIndex > 0);
+  edtAFI1.Enabled := (cbGestationType.ItemIndex > 0);
+  lblAmnioticMeasure1.Enabled := (cbGestationType.ItemIndex >0 );
+  lblAmnioticVerticlePocket1.Enabled := (cbGestationType.ItemIndex > 0);
+  edtDeepestPocket1.Enabled := (cbGestationType.ItemIndex > 0);
+  lblAmnioticVerticleMeasure1.Enabled := (cbGestationType.ItemIndex > 0);
+
+  lblAmnioticIndex2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
+  edtAFI2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
+  lblAmnioticMeasure2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
+  lblAmnioticVerticlePocket2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
... (35 more lines)
```

<details>
<summary>Variant A (20week, pe12week)</summary>

```pascal
procedure cbGestationTypeChange(Sender);
begin
  cbGestationType.ItemIndex := 1;
end;
```

</details>

<details>
<summary>Variant B (t3Singleton)</summary>

```pascal
procedure cbGestationTypeChange(Sender);
begin
  rglr1.Visible := cbGestationType.ItemIndex > 1;
  rgsi1.Visible := cbGestationType.ItemIndex > 1;
  cxtsFetus2.TabVisible := False;
  tsWellBeing2.TabVisible := False;
  cxtsFetus3.TabVisible := False;
   tsWellBeing3.TabVisible := False;

  case cbGestationType.ItemIndex of
    2,3,4: begin
             cxtsFetus2.TabVisible := True;
             tsWellBeing2.TabVisible := True;
           end;
    5: begin
         cxtsFetus2.TabVisible := True;
         cxtsFetus3.TabVisible := True;
         tsWellBeing2.TabVisible := True;
         tsWellBeing3.TabVisible := True;
       end;
  end;
  if cbGestationType.ItemIndex < 2 then
    cxGroupBox3.Height := 1
  else
    cxGroupBox3.Height := 27;

  lblAmnioticIndex1.Enabled := (cbGestationType.ItemIndex > 0);
  edtAFI1.Enabled := (cbGestationType.ItemIndex > 0);
  lblAmnioticMeasure1.Enabled := (cbGestationType.ItemIndex >0 );
  lblAmnioticVerticlePocket1.Enabled := (cbGestationType.ItemIndex > 0);
  edtDeepestPocket1.Enabled := (cbGestationType.ItemIndex > 0);
  lblAmnioticVerticleMeasure1.Enabled := (cbGestationType.ItemIndex > 0);

  lblAmnioticIndex2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  edtAFI2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  lblAmnioticMeasure2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  lblAmnioticVerticlePocket2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  edtDeepestPocket2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));
  lblAmnioticVerticleMeasure2.Enabled := ((cbGestationType.ItemIndex > 1) and (cbGestationType.ItemIndex <> 4));

  lblAmnioticIndex3.Enabled := (cbGestationType.ItemIndex > 4);
  edtAFI3.Enabled := (cbGestationType.ItemIndex > 4);
  lblAmnioticMeasure3.Enabled := (cbGestationType.ItemIndex > 4);
  lblAmnioticVerticlePocket3.Enabled := (cbGestationType.ItemIndex > 4);
  edtDeepestPocket3.Enabled := (cbGestationType.ItemIndex> 4);
  lblAmnioticVerticleMeasure3.Enabled := (cbGestationType.ItemIndex > 4);

  lblPresentingTwin1.visible := (cbGestationType.ItemIndex > 1);
  presentingTwinYes1.visible := (cbGestationType.ItemIndex > 1);
  presentingTwinNo1.visible := (cbGestationType.ItemIndex > 1);

  case cbGestationType.ItemIndex of
    2,3: begin
          lblAmnioticIndex1.Enabled := False;
          edtAFI1.Enabled := False;
          lblAmnioticMeasure1.Enabled := False;
          lblAmnioticIndex2.Enabled := False;
          edtAFI2.Enabled := False;
          lblAmnioticMeasure2.Enabled := False;
          edtDeepestPocket2.style.borderColor := clRed;
          edtDeepestPocket2.Style.BorderStyle := 2;
          edtDeepestPocket1.Style.borderColor := clRed;
          edtDeepestPocket1.Style.BorderStyle := 2;
         end;
  end;
  case cbGestationType.ItemIndex of
    1,4: begin
           edtAFI1Onchange(nil);
           edtAFI2Onchange(nil);
         end;
  end;
end;
```

</details>

---

### cbToggleCheckOnClick

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins |
| B | gynae |

**Summary:** Same structure (18 lines), differs on 3 line(s):
  - Line 5: `if Sender.Checked then` vs `if TcxCheckBox(Sender).Checked then`
  - Line 11: `if (Sender.Parent.Controls[i].Checked) and (Sender.Parent.Controls[i] <> Sender) then` vs `if (TcxCheckBox(Sender.Parent.Controls[i]).Checked) and (Sender.Parent.Controls[i] <> Sender) then`
  - Line 13: `Sender.Parent.Controls[i].Checked := false;` vs `TcxCheckBox(Sender.Parent.Controls[i]).Checked := false;`

**Nature:** Differences in: function calls.

<details>
<summary>Variant A (earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins)</summary>

```pascal
procedure cbToggleCheckOnClick(Sender)
var
  i: Integer;
begin
  if Sender.Checked then
  begin
    for i := 0 to TWinControl(Sender.Parent).ControlCount - 1 do
    begin
      if (Sender.Parent.Controls[i] is TcxCheckBox) then
      begin
        if (Sender.Parent.Controls[i].Checked) and (Sender.Parent.Controls[i] <> Sender) then
        begin
          Sender.Parent.Controls[i].Checked := false;
        end;
      end;
    end;
  end;
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

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

</details>

---

### cbUSSEDDOnChange

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week, pe12week |

**Summary:** Variant A (earlyT1Singleton): 5 lines. Variant B (20week, pe12week): 14 lines. Diff: 0 line(s) removed, 9 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (20week, pe12week)
@@ -4,2 +4,11 @@
 begin
+  seUSSEDDGAWeeks1.Value := 0;
+  seSSEDDGADays1.Value := 0;
+  if (deExamDate.Date > 100) and (deUSSEDD1.Date > 100) then
+  begin
+    vWeeks := GetWeeksFromDueDate(deUSSEDD1.Date, deExamDate.Date);
+    vDays := GetDaysFromDueDate(deUSSEDD1.Date, deExamDate.Date);
+    seUSSEDDGAWeeks1.Value := vWeeks;
+    seSSEDDGADays1.Value := vDays;
+  end;
 end;
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
procedure cbUSSEDDOnChange(Sender);
var
  vWeeks, vDays: Integer;
begin
end;
```

</details>

<details>
<summary>Variant B (20week, pe12week)</summary>

```pascal
procedure cbUSSEDDOnChange(Sender);
var
  vWeeks, vDays: Integer;
begin
  seUSSEDDGAWeeks1.Value := 0;
  seSSEDDGADays1.Value := 0;
  if (deExamDate.Date > 100) and (deUSSEDD1.Date > 100) then
  begin
    vWeeks := GetWeeksFromDueDate(deUSSEDD1.Date, deExamDate.Date);
    vDays := GetDaysFromDueDate(deUSSEDD1.Date, deExamDate.Date);
    seUSSEDDGAWeeks1.Value := vWeeks;
    seSSEDDGADays1.Value := vDays;
  end;
end;
```

</details>

---

### CheckFormComplete

**Variant count:** 6

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | gynae |
| D | pe12week |
| E | t3Singleton |
| F | t3twins |

**Summary:** Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and validation logic. Line counts: earlyT1Singleton=18, 20week=53, gynae=45, pe12week=50, t3Singleton=52, t3twins=17.

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function CheckFormComplete: Boolean;
var
  vTempStr : String;
begin
  if ((cxtsFetus1.TabVisible)and (StrToFloatDef(edtEmbroSize1.text, 0) < 0.1) and (cbEmbryo1Visualised1.Checked)) then
  begin
    ShowMessage('You must enter a CRL measurement if the embryo is visualised');
    result := false;
  end
  else
  if (pcEDDPrinciple.Properties.ActivePage = tsIVFEDD) and ((seTransferDay.Value < 1) or (seNumberTransferred.Value < 1)) and (cbEDDPrinciple.ItemIndex > 4) then
  begin
    ShowMessage('Embryo Transfer Day and Number Transferred should both be > 0');
    result := False;
  end
  else
    result := True;
end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
function CheckFormComplete: Boolean;
begin
    result := true;

    if GetClinicalIndicators = '' then
    begin
      ShowMessage('Please enter indication');
      result := False;
    end;
    if GetAneuploidyRisk = '' then
    begin
      ShowMessage('Please enter Aneuploidy Risk');
      result := False;
    end;
    if deUSSEDD1.date <= 0 then
    begin
      ShowMessage('Please enter USS EDD');
      result := False;
    end;
    if not getAnatomyChecked then
    begin
      ShowMessage('Please tick Normal/Abnormal for anatomy');
      result := False;
    end;
     if not getAnatomyNormalViews then
    begin
      ShowMessage('Please tick view options for Anatomy');
      result := False;
    end;
     if cbPlacentaSite1.text = '' then
    begin
      ShowMessage('Please enter placental site');
      result := False;
    end;
     if not((cbLowLyingPlacentaYes1.checked) or (cbLowLyingPlacentaNo1.Checked)) then
    begin
      ShowMessage('Please enter yes/no for lowlying placenta');
      result := False;
    end;
    if meCervicalLength.text <> '' then
    begin
        if not(StrToFloatDef(meCervicalLength.text,0)>0) then
        begin
          ShowMessage('Please enter cervix');
          result := False;
        end;
     end
     else if meCervicalLength.text = '' then
     begin
          ShowMessage('Please enter cervix');
          result := False;
     end;
end;
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
function CheckFormComplete: Boolean;
begin
  if (seCycleMaxDays.Enabled) and (seCycleMaxDays.Value <> 1) and (seCycleMinDays.Value > seCycleMaxDays.Value) then
  begin
    ShowMessage('Please correct the number of days in the cycle before proceeding.');
    result := False;
  end
  else if (cbUterineShape.Enabled) and (cbUterineShape.ItemIndex < 1) then
  begin
    ShowMessage('Please Select a Uterine Shape before proceeding.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (seEdometriumThickness.value <= 0) and (not(cbHysterectomy.checked)) then
  begin
    ShowMessage('Please endometrium thickness before proceeding.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHysterectomy.checked) and (not(cbCervixPresentYes.checked or cbCervixPresentNo.checked)) then
  begin
    ShowMessage('Please check ''Yes/No'' for cervix present.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHysterectomy.checked) and (not(cbVaultNormalYes.checked or cbVaultNormalNo.checked)) then
  begin
    ShowMessage('Please check ''Yes/No'' for Vault Normal.');
    pcReportBody.Properties.ActivePage := cxtsGeneral;
    result := False;
  end
  else if (cbHRTYes.enabled) and (cbHRTYes.checked) and (trim(tcbMedication.Text) = '') then
   begin
    showmessage('Specify HRT type in Medication');
    result := False;
  end
  else if (Trim(reDiagnosisComments.Lines.Text) = '') then
  begin
    ShowMessage('Please Complete the Diagnosis Comments before proceeding.');
    pcReportBody.Properties.ActivePage := tsCommentsAndDiagnosis;
    result := False;
  end
  else
    result := true;
end;
```

</details>

<details>
<summary>Variant D (pe12week)</summary>

```pascal
function CheckFormComplete: Boolean;
begin
    result := true;
    if GetClinicalIndicators = '' then
    begin
      ShowMessage('Please enter indication');
      result := False;
    end;
    if deUSSEDD1.date <=0 then
    begin
      ShowMessage('Please enter USS EDD');
      result := False;
    end;
    if not getAnatomyChecked then
    begin
      ShowMessage('Please tick Normal/Abnormal for anatomy');
      result := False;
    end;
     if cbPlacentaSite1.text = '' then
    begin
      ShowMessage('Please enter placental site');
      result := False;
    end;
    if meCervicalLength.text <> '' then
    begin
        if not(StrToFloatDef(meCervicalLength.text,0)>0) then
        begin
          ShowMessage('Please enter cervix');
          result := False;
        end;
     end
     else if meCervicalLength.text = '' then
     begin
          ShowMessage('Please enter cervix');
          result := False;
     end;
     if edNucTransMeasurement1.text <> '' then
    begin
        if not(StrToFloatDef(edNucTransMeasurement1.text,0)>0) then
        begin
          ShowMessage('Please enter NT');
          result := False;
        end;
     end
     else if edNucTransMeasurement1.text = '' then
     begin
          ShowMessage('Please enter NT');
          result := False;
     end;
end;
```

</details>

<details>
<summary>Variant E (t3Singleton)</summary>

```pascal
function CheckFormComplete: Boolean;
begin
  GLiquorWarning := FALSE;
     if  ((cbFetalWellLiqor1.ItemIndex = 0) or (cbFetalWellLiqor1.ItemIndex = 3)) then
     begin
           GLiquorWarning := False;
     end;
    else if (cbFetalWellLiqor1.ItemIndex = 1) then
    begin
       GLiquorWarning := True;
    end;
    else if (cbFetalWellLiqor1.ItemIndex = 2) then
    begin
       GLiquorWarning := True;
    end;
    result := true;
    if trim(GetClinicalIndicators) = '' then
    begin
       ShowMessage('Please enter indication')
       result := False;
    end;
    if cbPresentation1.text = '' then
    begin
       ShowMessage('Please enter presentation')
       result := False;
    end;
    if cbPlacentaSite1.text = '' then
    begin
       ShowMessage('Please enter placental site')
       result := False;
    end;
    if not((cbLowLyingPlacentaYes1.checked) or (cbLowLyingPlacentaNo1.checked)) then
    begin
       ShowMessage('Please select yes/no for lowlying placenta')
       result := False;
    end;
    if edtMidCerArtPI1.text <> '' then
    begin
        if not(StrToFloatDef(edtMidCerArtPI1.text,0) > 0) then
        begin
          ShowMessage('Please enter MCA PI')
           result := False;
        end;
        else
           result := True;
    end;
     if not((cbFeatlMovementsYes1.checked) or (cbFeatlMovementsNo1.checked)) then
     begin
        ShowMessage('Please enter Biophysical well-being');
        result := False;
     end;
end;
```

</details>

<details>
<summary>Variant F (t3twins)</summary>

```pascal
function CheckFormComplete: Boolean;
begin
  GLiquorWarning := FALSE;
     if  ((cbFetalWellLiqor1.ItemIndex = 0) or (cbFetalWellLiqor1.ItemIndex = 3)) then
     begin
           GLiquorWarning := False;
     end;
    else if (cbFetalWellLiqor1.ItemIndex = 1) then
    begin
       GLiquorWarning := True;
    end;
    else if (cbFetalWellLiqor1.ItemIndex = 2) then
    begin
       GLiquorWarning := True;
    end;
    result := true;
end;
```

</details>

---

### cxccbReferralIndicationChange

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week, pe12week |
| B | gynae |

**Summary:** Variant A (20week, pe12week): 4 lines. Variant B (gynae): 58 lines. Diff: 2 line(s) removed, 56 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic.

**Example output difference:**
```diff
--- Variant A (20week, pe12week)
+++ Variant B (gynae)
@@ -1,4 +1,58 @@
-procedure cxccbReferralIndicationChange(Sender);
+procedure cxccbReferralIndicationChange(Sender)
 begin
-  edtReferralIndicator1.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
+  edtPresentComplaintOther.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
+   if not (cbRightOvaryIdentified.Checked) then
+   begin
+    if (cxccbReferralIndication.States[1] = 1) then
+    begin
+      cbRightVaginalAccessYes.Enabled := False;
+      cbRightVaginalAccessNo.Enabled := False;
+      cbRightVaginalNA.Enabled := False;
+      gbRightVaginalAccess.Enabled := False;
+    end;
+  end
+  else
+  begin
+    if (cxccbReferralIndication.States[1] = 1) then
+    begin
+      cbRightVaginalAccessYes.Enabled := True;
+      cbRightVaginalAccessNo.Enabled := True;
+      cbRightVaginalNA.Enabled := True;
+      gbRightVaginalAccess.Enabled := True;
+    end
+    else
+     begin
+      cbRightVaginalAccessYes.Enabled := False;
+      cbRightVaginalAccessNo.Enabled := False;
+      cbRightVaginalNA.Enabled := False;
+      gbRightVaginalAccess.Enabled := False;
+    end;
+  end;
+  if (not cbLeftOvaryIdentified.Checked) then
+  begin
+    if (cxccbReferralIndication.States[1] = 1) then
+    begin
+      cbLeftVaginalAccessYes.Enabled := False;
... (23 more lines)
```

<details>
<summary>Variant A (20week, pe12week)</summary>

```pascal
procedure cxccbReferralIndicationChange(Sender);
begin
  edtReferralIndicator1.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

```pascal
procedure cxccbReferralIndicationChange(Sender)
begin
  edtPresentComplaintOther.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
   if not (cbRightOvaryIdentified.Checked) then
   begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
  end
  else
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbRightVaginalAccessYes.Enabled := True;
      cbRightVaginalAccessNo.Enabled := True;
      cbRightVaginalNA.Enabled := True;
      gbRightVaginalAccess.Enabled := True;
    end
    else
     begin
      cbRightVaginalAccessYes.Enabled := False;
      cbRightVaginalAccessNo.Enabled := False;
      cbRightVaginalNA.Enabled := False;
      gbRightVaginalAccess.Enabled := False;
    end;
  end;
  if (not cbLeftOvaryIdentified.Checked) then
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end;
  end
  else
  begin
    if (cxccbReferralIndication.States[1] = 1) then
    begin
      cbLeftVaginalAccessYes.Enabled := True;
      cbLeftVaginalAccessNo.Enabled := True;
      cbLeftVaginalNA.Enabled := True;
      gbLeftVaginalAccess.Enabled := True;
    end;
    else
    begin
      cbLeftVaginalAccessYes.Enabled := False;
      cbLeftVaginalAccessNo.Enabled := False;
      cbLeftVaginalNA.Enabled := False;
      gbLeftVaginalAccess.Enabled := False;
    end;
  end;
end;
```

</details>

---

### cxccbReferralIndicatorsChange

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | t3Singleton, t3twins |

**Summary:** Same structure (4 lines), differs on 1 line(s):
  - Line 3: `edtPresentComplaintOther.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);` vs `edtReferralIndicator1.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);`

**Nature:** Differences in: UI control names.

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
procedure cxccbReferralIndicatorsChange(Sender);
begin
  edtPresentComplaintOther.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);
end;
```

</details>

<details>
<summary>Variant B (t3Singleton, t3twins)</summary>

```pascal
procedure cxccbReferralIndicatorsChange(Sender);
begin
  edtReferralIndicator1.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);
end;
```

</details>

---

### deStatedEDDOnChange

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, pe12week |
| B | 20week, t3Singleton, t3twins |

**Summary:** Same structure (4 lines), differs on 1 line(s):
  - Line 3: `PopulateEDDControls(deStatedEDD, seStatedEDDGestAgeWeeks, seStatedEDDGestAgeDays);` vs `PopulateEDDControls(deStatedEDD, seEDDCalGAWeeks, seEDDCalGADays);`

<details>
<summary>Variant A (earlyT1Singleton, pe12week)</summary>

```pascal
procedure deStatedEDDOnChange(Sender);
begin
  PopulateEDDControls(deStatedEDD, seStatedEDDGestAgeWeeks, seStatedEDDGestAgeDays);
end;
```

</details>

<details>
<summary>Variant B (20week, t3Singleton, t3twins)</summary>

```pascal
procedure deStatedEDDOnChange(Sender);
begin
  PopulateEDDControls(deStatedEDD, seEDDCalGAWeeks, seEDDCalGADays);
end;
```

</details>

---

### GetAnatomy

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week |
| B | pe12week |

**Summary:** Variant A (20week): 67 lines. Variant B (pe12week): 40 lines. Diff: 31 line(s) removed, 4 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (20week)
+++ Variant B (pe12week)
@@ -26,31 +26,5 @@
    begin
-     if cbEarlyGestation1.checked then
-     begin
-       result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
-     end;
-     else if cxccbReferralIndication.states[0] = 1 then
-     begin
-        if cbPoorView.checked then
-          result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
-        else if cbAverageViews.Checked then
-          result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
-        else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
-          result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
-     end
-     else if (cxccbReferralIndication.states[1] = 1) then
-        result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
-     else if  (cxccbReferralIndication.states[2] = 1) or (cxccbReferralIndication.states[3] = 1) or (cxccbReferralIndication.states[4] = 1) then
-     begin
-         if cxccbReferralIndication.states[0] = 1 then
-         begin
-            if cbPoorView.checked then
-              result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
-            else if cbAverageViews.Checked then
-              result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
-            else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
-              result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
-         end;
-         else if (cxccbReferralIndication.states[1] = 1) then
-            result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
-     end;
+      result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine appear to be developing normally for the current gestation.  ';
+      if (StrtoFloatDef(edNucTransMeasurement1.text,0) > 0) and (StrtoFloatDef(edNucTransMeasurement1.text,0) <= 3.4) then
+        result := result + 'The nuchal translucency is within the normal range.  ';
    end
@@ -58,4 +32,3 @@
    begin
-     Result := 'Abnormality. '+ #13#10+#13+#10;
... (3 more lines)
```

<details>
<summary>Variant A (20week)</summary>

```pascal
 function GetAnatomy : String
 var
   vDifficultExam : String;
   v1 : Integer;
 begin
   result := '';
   vDifficultExam := '';
   if (cbLargeBMI1.Checked) or (cbEarlyGestation1.Checked) or (cbAwkFetalPos1.Checked) then
   begin
    v1 := 0;
    if cbLargeBMI1.Checked then
    begin
      vDifficultExam := vDifficultExam + 'maternal habitus';
      inc(v1);
    end;
    if cbAwkFetalPos1.Checked then
    begin
      if v1 > 0 then
        vDifficultExam := vDifficultExam + ' and';
      vDifficultExam := vDifficultExam + 'fetal position';
    end;
    if vDifficultExam <> '' then
      vDifficultExam := 'Views were more challenging due to '+ AddFullstop(vDifficultExam);
  end;
   if cbFetalAnatomyNormal1.checked then
   begin
     if cbEarlyGestation1.checked then
     begin
       result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     end;
     else if cxccbReferralIndication.states[0] = 1 then
     begin
        if cbPoorView.checked then
          result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
        else if cbAverageViews.Checked then
          result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
        else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
          result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
     end
     else if (cxccbReferralIndication.states[1] = 1) then
        result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     else if  (cxccbReferralIndication.states[2] = 1) or (cxccbReferralIndication.states[3] = 1) or (cxccbReferralIndication.states[4] = 1) then
     begin
         if cxccbReferralIndication.states[0] = 1 then
         begin
            if cbPoorView.checked then
              result :=  result + 'Suboptimal but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
            else if cbAverageViews.Checked then
              result := result + 'Average but adequate views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  '
            else if (cbGoodViews.Checked) or (cbVeryGoodViews.Checked) then
              result := result + 'Detailed views of the head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
         end;
         else if (cxccbReferralIndication.states[1] = 1) then
            result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine are developing normally for the current gestation.  ';
     end;
   end
   else if cbFetalAnatomyAbNormal1.checked then
   begin
     Result := 'Abnormality. '+ #13#10+#13+#10;
     Result := result + 'Detailed views of the remaining anatomy including head, brain, face, spine, chest, heart, diaphragm, abdominal wall, cord insertion, stomach, kidneys, bladder and limbs were obtained with no evidence of abnormality seen.  ';
   end;
   if result <> '' then
     if vDifficultExam <> '' then
       result := vDifficultExam + result;
   if result = '' then
     result := '##';
 end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
 function GetAnatomy : String
 var
   vDifficultExam : String;
   v1 : Integer;
 begin
   result := '';
   vDifficultExam := '';
   if (cbLargeBMI1.Checked) or (cbEarlyGestation1.Checked) or (cbAwkFetalPos1.Checked) then
   begin
    v1 := 0;
    if cbLargeBMI1.Checked then
    begin
      vDifficultExam := vDifficultExam + 'maternal habitus';
      inc(v1);
    end;
    if cbAwkFetalPos1.Checked then
    begin
      if v1 > 0 then
        vDifficultExam := vDifficultExam + ' and';
      vDifficultExam := vDifficultExam + 'fetal position';
    end;
    if vDifficultExam <> '' then
      vDifficultExam := 'Views were more challenging due to '+ AddFullstop(vDifficultExam);
  end;
   if cbFetalAnatomyNormal1.checked then
   begin
      result := result + 'Detail is limited by the early gestation.  The skull, brain, heart, diaphragm, arms, hands, fingers, stomach, kidneys, bladder, cord insertion, three vessel cord, legs, feet and spine appear to be developing normally for the current gestation.  ';
      if (StrtoFloatDef(edNucTransMeasurement1.text,0) > 0) and (StrtoFloatDef(edNucTransMeasurement1.text,0) <= 3.4) then
        result := result + 'The nuchal translucency is within the normal range.  ';
   end
   else if cbFetalAnatomyAbNormal1.checked then
   begin
     Result := 'Abnormality.  ';
   end;
   if result <> '' then
     if vDifficultExam <> '' then
       result := vDifficultExam + result;
   if result = '' then
     result := '##';
 end;
```

</details>

---

### GetBioPhysicalConc

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | t3Singleton |
| B | t3twins |

**Summary:** Variant A (t3Singleton): 12 lines. Variant B (t3twins): 8 lines. Diff: 7 line(s) removed, 3 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (t3Singleton)
+++ Variant B (t3twins)
@@ -3,10 +3,6 @@
  result := '';
-  if cbFeatlMovementsYes1.checked then
-  begin
-    result := 'Biophysically well';
-  end
+  if (cbFeatlMovementsYes1.checked) and (cbFeatlMovementsYes2.checked)then
+      result := result + 'Both twins are biophysically well.';
   else
-  begin
-      result := '##';
-   end;
+      result := result + 'Dictate biophysical well being';
  end;
```

<details>
<summary>Variant A (t3Singleton)</summary>

```pascal
  Function GetBioPhysicalConc: String
 begin
 result := '';
  if cbFeatlMovementsYes1.checked then
  begin
    result := 'Biophysically well';
  end
  else
  begin
      result := '##';
   end;
 end;
```

</details>

<details>
<summary>Variant B (t3twins)</summary>

```pascal
  Function GetBioPhysicalConc: String
 begin
 result := '';
  if (cbFeatlMovementsYes1.checked) and (cbFeatlMovementsYes2.checked)then
      result := result + 'Both twins are biophysically well.';
  else
      result := result + 'Dictate biophysical well being';
 end;
```

</details>

---

### GetCavDistortionCount

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week, pe12week, t3Singleton, t3twins |
| C | gynae |

**Summary:** 3 distinct variants with line counts: A=24, B=24, C=22.

Variants A (earlyT1Singleton) vs B (20week, pe12week, t3Singleton, t3twins) differ on 2 line(s): L6: `if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then` vs `{if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then`; L23: `result := Result + 1;` vs `result := Result + 1;}`

Variant C unique strings: ['cbCavityDistortion', 'cbFibroidsType']

<details>
<summary>Variant A (earlyT1Singleton)</summary>

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

</details>

<details>
<summary>Variant B (20week, pe12week, t3Singleton, t3twins)</summary>

```pascal
function GetCavDistortionCount: Integer;
begin
  result := 0;
  if (gbFibroid1.Visible) and (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
    result := Result + 1;
  {if (gbFibroid2.Visible) and (cbCavityDistortion2.Checked) and (cbCavityDistortion2.Enabled) then
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
    result := Result + 1;}
end;
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
function GetCavDistortionCount(var isValidDist: Booelan): Integer;
var
  vControl: TcxCheckBox;
  vCombo: TcxComboBox;
  i: Integer;
begin
  result := 0;
  isValidDist := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if ((assigned(vControl)) and (TcxCheckBox(vControl).Enabled)) or ((assigned(vCombo)) and (TcxComboBox(vCombo).Enabled)) then
    begin
      isValidDist := True;
      if (TcxCheckBox(vControl).Checked) and not(TcxComboBox(vCombo).ItemIndex = 2) then
      begin
        result := Result + 1;
      end;
    end;
  end;
end;
```

</details>

---

### getCervixConclusion

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | 20week, pe12week |
| B | t3Singleton |
| C | t3twins |

**Summary:** 3 distinct variants with line counts: A=16, B=33, C=29.

Variants have substantially different structure/length, indicating different logic or scope of functionality.

Variant A unique strings: ['Shortened cervix']

Variant B unique strings: [' on transabdominal ultrasound', ' on transvaginal ultrasound', '(', ')', 'Long and closed cervix ']

Variant C unique strings: [' on transabdominal ultrasound', ' on transvaginal ultrasound', '(', ')', 'Long and closed cervix ']

<details>
<summary>Variant A (20week, pe12week)</summary>

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
      end
  end;
  result := AddFullStop(Result);
 end;
```

</details>

<details>
<summary>Variant B (t3Singleton)</summary>

```pascal
 Function getCervixConclusion : String
 var
   vCervicalLength : Real;
 begin
  result := '';
  if (vCervicalLength > 0) and (vCervicalLength < 25) then
  begin
    GCervixWarning := True;
  end
  {vCervicalLength := 0.0;
  GCervixWarning := FALSE;
  if (meCervicalLength.text) <> '' then
  begin
      vCervicalLength := StrToFloatDef(meCervicalLength.text, 0);
      if ((vCervicalLength > 25)) then
      begin
         result := 'Long and closed cervix ';
         GCervixWarning := False;
      end
      else if (vCervicalLength > 0) and (vCervicalLength < 25) then
      begin
         result := 'Shortened cervix ';
         GCervixWarning := True;
      end
      result := result + '('+ meCervicalLength.text + 'mm'
      if cbCervixTVS.checked then
        result := result + ' on transvaginal ultrasound'
      else if cbCervixTA.checked then
        result := result + ' on transabdominal ultrasound'
      result := result + ')';
  end;
  result := AddFullStop(Result);  }
 end;
```

</details>

<details>
<summary>Variant C (t3twins)</summary>

```pascal
 Function getCervixConclusion : String
 var
   vCervicalLength : Real;
 begin
  result := '';
  vCervicalLength := 0.0;
  GCervixWarning := FALSE;
  if (meCervicalLength.text) <> '' then
  begin
      vCervicalLength := StrToFloatDef(meCervicalLength.text, 0);
      if ((vCervicalLength > 25)) then
      begin
         result := 'Long and closed cervix ';
         GCervixWarning := False;
      end
      else if (vCervicalLength > 0) and (vCervicalLength < 25) then
      begin
         result := 'Shortened cervix ';
         GCervixWarning := True;
      end
      result := result + '('+ meCervicalLength.text + 'mm'
      if cbCervixTVS.checked then
        result := result + ' on transvaginal ultrasound'
      else if cbCervixTA.checked then
        result := result + ' on transabdominal ultrasound'
      result := result + ')';
  end;
  result := AddFullStop(Result);
 end;
```

</details>

---

### getCervixDetailed

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week |
| B | pe12week |

**Summary:** Variant A (20week): 57 lines. Variant B (pe12week): 56 lines. Diff: 8 line(s) removed, 7 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (20week)
+++ Variant B (pe12week)
@@ -19,9 +19,2 @@
           end
-          if (vCervicalLength > 0) then
-          begin
-             if (cbCervixShortYes.checked = TRUE) then
-                result := result + ', '+ meCervicalLength.text + 'mm'
-             else
-                result := result + ', '+ meCervicalLength.text + 'mm';
-          end;
           if cbCervixTVS.checked then
@@ -31,3 +24,9 @@
            result :=AddFullStop(result);
-
+          if (vCervicalLength > 0) then
+          begin
+             if (cbCervixShortYes.checked = TRUE) then
+                result := result + 'The closed length of cervix is '+ meCervicalLength.text + 'mm'
+             else
+                result := result + 'The closed length of cervix is '+ meCervicalLength.text + 'mm';
+          end;
             result := AddFullStop(Result);
```

<details>
<summary>Variant A (20week)</summary>

```pascal
 Function getCervixDetailed : String
 var
   vCervicalLength : Integer;
 begin
  result := '';
  vCervicalLength := 0;
  if ((meCervicalLength.text) <> '')  or (getFunnellingMembrane <> '') or (getCervicalSuture <> '') or (cbCervixShortYes.checked) then
  begin
      vCervicalLength := StrToInt(meCervicalLength.text);
      if  vCervicalLength > 0 then
      begin
          if ((vCervicalLength > 25) or (cbCervixShortNo.checked)) then
          begin
             result := 'The cervix is long and closed';
          end
          else if ((vCervicalLength > 0) and (vCervicalLength < 25)) or (cbCervixShortYes.checked = TRUE) then
          begin
             result := 'The cervix is shortened';
          end
          if (vCervicalLength > 0) then
          begin
             if (cbCervixShortYes.checked = TRUE) then
                result := result + ', '+ meCervicalLength.text + 'mm'
             else
                result := result + ', '+ meCervicalLength.text + 'mm';
          end;
          if cbCervixTVS.checked then
            result := result + ' on transvaginal ultrasound.  '
          else if cbCervixTA.checked then
            result := result + ' on transabdominal ultrasound.  '
           result :=AddFullStop(result);

            result := AddFullStop(Result);
          result :=  #13#10  + '#|#+UNDE#|#+BOLDCervix:#/#'+ #13#10  +  result +getFunnellingMembrane;
     end;
     else
     begin
        if (cbCervixShortYes.checked = TRUE) then
          result := #13#10  + '#|#+UNDE#|#+BOLDCervix:#/#'+ #13#10  + 'The cervix is shortened.  ' +getFunnellingMembrane;
        else if (cbCervixShortNo.checked = TRUE) then
          result := result +  'Cervix:' + #09#09 + 'long and closed  ';
        else
          result := result +  'Cervix:' + #09#09 + '##'
     end;
  end;
  else
  begin
    if (cbCervixShortYes.checked = TRUE) then
      result := result + 'Cervix:' + #09#09 + 'short.  ';
    else if (cbCervixShortNo.checked = TRUE) then
      result := result +  'Cervix:' + #09#09 + 'long and closed.  ';
    else
      result := result +  'Cervix:' + #09#09 + '##'
  end;
  result := #13#10  + result;
  result := result + getCervicalSuture;
 end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
 Function getCervixDetailed : String
 var
   vCervicalLength : Integer;
 begin
  result := '';
  vCervicalLength := 0;
  if ((meCervicalLength.text) <> '')  or (getFunnellingMembrane <> '') or (getCervicalSuture <> '') or (cbCervixShortYes.checked) then
  begin
      vCervicalLength := StrToInt(meCervicalLength.text);
      if  vCervicalLength > 0 then
      begin
          if ((vCervicalLength > 25) or (cbCervixShortNo.checked)) then
          begin
             result := 'The cervix is long and closed';
          end
          else if ((vCervicalLength > 0) and (vCervicalLength < 25)) or (cbCervixShortYes.checked = TRUE) then
          begin
             result := 'The cervix is shortened';
          end
          if cbCervixTVS.checked then
            result := result + ' on transvaginal ultrasound.  '
          else if cbCervixTA.checked then
            result := result + ' on transabdominal ultrasound.  '
           result :=AddFullStop(result);
          if (vCervicalLength > 0) then
          begin
             if (cbCervixShortYes.checked = TRUE) then
                result := result + 'The closed length of cervix is '+ meCervicalLength.text + 'mm'
             else
                result := result + 'The closed length of cervix is '+ meCervicalLength.text + 'mm';
          end;
            result := AddFullStop(Result);
          result :=  #13#10  + '#|#+UNDE#|#+BOLDCervix:#/#'+ #13#10  +  result +getFunnellingMembrane;
     end;
     else
     begin
        if (cbCervixShortYes.checked = TRUE) then
          result := #13#10  + '#|#+UNDE#|#+BOLDCervix:#/#'+ #13#10  + 'The cervix is shortened.  ' +getFunnellingMembrane;
        else if (cbCervixShortNo.checked = TRUE) then
          result := result +  'Cervix:' + #09#09 + 'long and closed  ';
        else
          result := result +  'Cervix:' + #09#09 + '##'
     end;
  end;
  else
  begin
    if (cbCervixShortYes.checked = TRUE) then
      result := result + 'Cervix:' + #09#09 + 'short.  ';
    else if (cbCervixShortNo.checked = TRUE) then
      result := result +  'Cervix:' + #09#09 + 'long and closed.  ';
    else
      result := result +  'Cervix:' + #09#09 + '##'
  end;
  result := #13#10  + result;
  result := result + getCervicalSuture;
 end;
```

</details>

---

### GetClinicalHistory

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week, pe12week, t3Singleton, t3twins |

**Summary:** Variant A (earlyT1Singleton): 23 lines. Variant B (20week, pe12week, t3Singleton, t3twins): 7 lines. Diff: 17 line(s) removed, 1 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (20week, pe12week, t3Singleton, t3twins)
@@ -5,19 +5,3 @@
   result := '';
-  for i := 0 to cbClinicalHistory.Properties.Items.Count - 2 do
-  begin
-    if cbClinicalHistory.States[i] = 1 then
-    begin
-      if result <> '' then
-        result := result + '.  ';
-      result := result + cbClinicalHistory.ShortDescription[i];
-    end;
-  end;
-  if (cbClinicalHistory.States[cbClinicalHistory.Properties.Items.Count-1] = 1) then
-  begin
-    if result <> '' then
-      result := result + '.  ';
-    result := result + trim(edtClicnicalHistory.Text);
-  end;
-  if result <> '' then
-    result := AddFullstopToEnd(result);
+
 end;
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetClinicalHistory: String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to cbClinicalHistory.Properties.Items.Count - 2 do
  begin
    if cbClinicalHistory.States[i] = 1 then
    begin
      if result <> '' then
        result := result + '.  ';
      result := result + cbClinicalHistory.ShortDescription[i];
    end;
  end;
  if (cbClinicalHistory.States[cbClinicalHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtClicnicalHistory.Text);
  end;
  if result <> '' then
    result := AddFullstopToEnd(result);
end;
```

</details>

<details>
<summary>Variant B (20week, pe12week, t3Singleton, t3twins)</summary>

```pascal
function GetClinicalHistory: String;
var
  i: Integer;
begin
  result := '';

end;
```

</details>

---

### GetClinicalIndicators

**Variant count:** 4

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | pe12week |
| D | t3Singleton, t3twins |

**Summary:** 4 distinct variants with line counts: A=24, B=24, C=23, D=24.

Variants A (earlyT1Singleton) vs D (t3Singleton, t3twins) differ on 3 line(s): L19: `result := result + trim(edtPresentComplaintOther.Text);` vs `result := result + trim(edtReferralIndicator1.Text);`; L22: `result := AddFullstopToEnd(result);` vs `result := AddFullStop(result);`; L23: `//result := result + ' ';` vs `result := result + ' ';`

Variants B (20week) vs D (t3Singleton, t3twins) differ on 5 line(s): L6: `for i := 0 to cxccbReferralIndication.Properties.Items.Count - 2 do` vs `for i := 0 to cxccbReferralIndicators.Properties.Items.Count - 2 do`; L8: `if cxccbReferralIndication.States[i] = 1 then` vs `if cxccbReferralIndicators.States[i] = 1 then`; L12: `result := result + cxccbReferralIndication.ShortDescription[i];` vs `result := result + cxccbReferralIndicators.ShortDescription[i];`; L15: `if (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1) then` vs `if (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1) then`; L23: `//result := result + ' ';` vs `result := result + ' ';`

Variant A unique strings: [' ', '.  ']

Variant B unique strings: [' ', '.  ']

Variant D unique strings: [' ', '.  ']

<details>
<summary>Variant A (earlyT1Singleton)</summary>

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
        result := result + '.  ';
      result := result + cxccbReferralIndicators.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtPresentComplaintOther.Text);
  end;
  if result <> '' then
    result := AddFullstopToEnd(result);
  //result := result + ' ';
end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
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
        result := result + '.  ';
      result := result + cxccbReferralIndication.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtReferralIndicator1.Text);
  end;
  if result <> '' then
    result := AddFullStop(result);
  //result := result + ' ';
end;
```

</details>

<details>
<summary>Variant C (pe12week)</summary>

```pascal
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
    result := result + InItCaps(trim(edtReferralIndicator1.Text),False);
  end;
  if result <> '' then
    result := AddFullStop(result);
end;
```

</details>

<details>
<summary>Variant D (t3Singleton, t3twins)</summary>

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
        result := result + '.  ';
      result := result + cxccbReferralIndicators.ShortDescription[i];
    end;
  end;
  if (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtReferralIndicator1.Text);
  end;
  if result <> '' then
    result := AddFullStop(result);
  result := result + ' ';
end;
```

</details>

---

### getCompositeDate

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, pe12week |
| B | 20week |

**Summary:** Variant A (earlyT1Singleton, pe12week): 16 lines. Variant B (20week): 14 lines. Diff: 7 line(s) removed, 5 line(s) added.

**Nature:** Changed lines involve: assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton, pe12week)
+++ Variant B (20week)
@@ -1,2 +1,2 @@
-function getCompositeDate : String;
+ function getCompositeDate : String;
 begin
@@ -4,11 +4,9 @@
   result := intToStr(seUSSEDDGAWeeks1.value)   +' weeks '
-  if seSSEDDGADays1.value > 0 then
+  if seSSEDDGADays1.value >= 0 then
   begin
-    if seSSEDDGADays1.value > 1 then
+    if seSSEDDGADays1.value = 1 then
+     result := result + intToStr(seSSEDDGADays1.value)   +' day';
+    else
      result := result + intToStr(seSSEDDGADays1.value)   +' days';
-    else
-     result := result + intToStr(seSSEDDGADays1.value)   +' day';
   end
-  else if seSSEDDGADays1.value = 0 then
-      result := result + intToStr(seSSEDDGADays1.value)   +' days';
 
```

<details>
<summary>Variant A (earlyT1Singleton, pe12week)</summary>

```pascal
function getCompositeDate : String;
begin
  result := '';
  result := intToStr(seUSSEDDGAWeeks1.value)   +' weeks '
  if seSSEDDGADays1.value > 0 then
  begin
    if seSSEDDGADays1.value > 1 then
     result := result + intToStr(seSSEDDGADays1.value)   +' days';
    else
     result := result + intToStr(seSSEDDGADays1.value)   +' day';
  end
  else if seSSEDDGADays1.value = 0 then
      result := result + intToStr(seSSEDDGADays1.value)   +' days';

  result := AddFullstopToEnd(Result);
end
```

</details>

<details>
<summary>Variant B (20week)</summary>

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

</details>

---

### getConclusionWarnings

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | 20week |
| B | t3Singleton |
| C | t3twins |

**Summary:** 3 distinct variants with line counts: A=16, B=24, C=10.

Variants have substantially different structure/length, indicating different logic or scope of functionality.

Variant A unique strings: ['Dictate Cervix.  ', 'Dictate MCI.  ', 'Dictate NIPS.  ', 'Dictate Ovaries.  ']

Variant B unique strings: ['Fibroid as described.  ', 'Fibroid/s as described.  ', 'Fibroids as described.  ']

<details>
<summary>Variant A (20week)</summary>

```pascal
Function getConclusionWarnings : String
begin
result := '';
  if (getAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) then
     result := result + 'Dictate WELL-BEING.  '
  if (getNIPSWarning = TRUE) then
     result := result + 'Dictate NIPS.  '
  if (getCordInsertionWarning = TRUE) then
     result := result + 'Dictate MCI.  '
  if (getOvaryWarning = TRUE)  then
     result := result + 'Dictate Ovaries.  '
   if (getCervixWarning = TRUE)  then
     result := result + 'Dictate Cervix.  '
end;
```

</details>

<details>
<summary>Variant B (t3Singleton)</summary>

```pascal
Function getConclusionWarnings : String
begin
result := '';
  if (GAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GPlacentaWarning = TRUE) then
     result := result + getPlacentaConclusion;
  if getAssessPlacentalSite <> '' then
     result := result + getAssessPlacentalSite ;
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE)or (GetDuctusVenosusWarning = TRUE) or (cbFeatlMovementsNo1.checked) then
     result := result + 'Dictate WELL-BEING.  '
  if cbFibroidsVisualised.checked then
  begin
   if (spFibroidCount.value > 0) then
   begin
     if spFibroidCount.value = 1 then
      result := result + 'Fibroid as described.  ';
     else
      result := result + 'Fibroids as described.  ';
   end
   else
      result := result + 'Fibroid/s as described.  ';
  end;
end;
```

</details>

<details>
<summary>Variant C (t3twins)</summary>

```pascal
Function getConclusionWarnings : String
begin
result := '';
  if (GAnatomyWarning = TRUE) then
     result := result + 'Dictate ANATOMY.  '
  if (GPlacentaWarning = TRUE) then
     result := result + getPlacentaConclusion;
  if (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) then
     result := result + 'Dictate WELL-BEING.  '
end;
```

</details>

---

### GetDuctusVenosusWarning

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | t3Singleton |
| B | t3twins |

**Summary:** Variant A (t3Singleton): 6 lines. Variant B (t3twins): 8 lines. Diff: 1 line(s) removed, 3 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic.

**Example output difference:**
```diff
--- Variant A (t3Singleton)
+++ Variant B (t3twins)
@@ -1,2 +1,2 @@
- function GetDuctusVenosusWarning: Boolean;
+function GetDuctusVenosusWarning: Boolean;
 begin
@@ -5,2 +5,4 @@
     result := True;
+if cbDVWAbNormal2.checked then
+    result := True;
 end;
```

<details>
<summary>Variant A (t3Singleton)</summary>

```pascal
 function GetDuctusVenosusWarning: Boolean;
begin
result := False;
if cbDVWAbNormal1.checked then
    result := True;
end;
```

</details>

<details>
<summary>Variant B (t3twins)</summary>

```pascal
function GetDuctusVenosusWarning: Boolean;
begin
result := False;
if cbDVWAbNormal1.checked then
    result := True;
if cbDVWAbNormal2.checked then
    result := True;
end;
```

</details>

---

### getEFWPer

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | t3Singleton |
| B | t3twins |

**Summary:** Variant A (t3Singleton): 35 lines. Variant B (t3twins): 45 lines. Diff: 1 line(s) removed, 11 line(s) added.

**Nature:** Changed lines involve: assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (t3Singleton)
+++ Variant B (t3twins)
@@ -1,2 +1,2 @@
- function getEFWPer(inString : String) : String
+ function getEFWPer(inString : String; infetus :integer) : String
  var
@@ -30,2 +30,4 @@
    end;
+   if infetus = 1 then
+   begin
    if (trim(seWeightPercentile1.text) = '<3') then
@@ -34,2 +36,10 @@
     result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile1.text,0));
+   end;
+   if infetus = 2 then
+   begin
+   if (trim(seWeightPercentile2.text) = '<3') then
+    result := result + GetValueSuffix(3)
+   else
+    result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile2.text,0));
+   end;
  end;
```

<details>
<summary>Variant A (t3Singleton)</summary>

```pascal
 function getEFWPer(inString : String) : String
 var
   vCentile : integer;
   vtempStr : String;
 begin
 result := '';
   if inString <> '' then
   begin
      if (pos('<',inString) > 0) then
      begin
        vtempStr := StringReplaceAll(inString,' ','');
        if (vtempStr = '<3') then
        begin
            result := result +' below 3';
        end
      end
      else if (pos('>',inString) > 0) then
      begin
         vtempStr := StringReplaceAll(inString,' ','');
         if (vtempStr = '>97') then
         begin
            result := result +' above 97';
         end
      end
      else
      begin
        vCentile := round(StrToFloatDef(inString,0));
        result := IntToStr(vCentile);
      end;
   end;
   if (trim(seWeightPercentile1.text) = '<3') then
    result := result + GetValueSuffix(3)
   else
    result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile1.text,0));
 end;
```

</details>

<details>
<summary>Variant B (t3twins)</summary>

```pascal
 function getEFWPer(inString : String; infetus :integer) : String
 var
   vCentile : integer;
   vtempStr : String;
 begin
 result := '';
   if inString <> '' then
   begin
      if (pos('<',inString) > 0) then
      begin
        vtempStr := StringReplaceAll(inString,' ','');
        if (vtempStr = '<3') then
        begin
            result := result +' below 3';
        end
      end
      else if (pos('>',inString) > 0) then
      begin
         vtempStr := StringReplaceAll(inString,' ','');
         if (vtempStr = '>97') then
         begin
            result := result +' above 97';
         end
      end
      else
      begin
        vCentile := round(StrToFloatDef(inString,0));
        result := IntToStr(vCentile);
      end;
   end;
   if infetus = 1 then
   begin
   if (trim(seWeightPercentile1.text) = '<3') then
    result := result + GetValueSuffix(3)
   else
    result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile1.text,0));
   end;
   if infetus = 2 then
   begin
   if (trim(seWeightPercentile2.text) = '<3') then
    result := result + GetValueSuffix(3)
   else
    result := result + GetValueSuffix(StrToFloatDef(seWeightPercentile2.text,0));
   end;
 end;
```

</details>

---

### GetEnteredEDD

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, pe12week |
| B | 20week |

**Summary:** Variant A (earlyT1Singleton, pe12week): 48 lines. Variant B (20week): 8 lines. Diff: 40 line(s) removed, 0 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton, pe12week)
+++ Variant B (20week)
@@ -3,15 +3,2 @@
 result := '';
-  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
-  begin
-    result := 'No Dates. ';
-  end
-  else  }
-  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
-  begin
-    if deMenstrualEDD.Date > 0 then
-      result := FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date);
-  end
-  else
-  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
-  begin
     if (deStatedEDD.Date > 0) then
@@ -20,29 +7,2 @@
     end
-  end
-  else
-  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
-  begin
-    if (deMUFWEdd.Date > 0) then
-      Result := FormatDateTime('dd/mm/yyyy', deMUFWEdd.Date);
-  end
-  else
-  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
-  begin
-    if (deOvulationEDD.Date > 0) then
-    begin
-      if (deOvulationEDD.Date > 0) then
-        result := FormatDateTime('dd/mm/yyyy', deOvulationEDD.Date);
-    end
-  end
-  else // Assisted
-  begin
-    if (deIVFEDD.Date > 0) then
-    begin
... (8 more lines)
```

<details>
<summary>Variant A (earlyT1Singleton, pe12week)</summary>

```pascal
function GetEnteredEDD :String
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'No Dates. ';
  end
  else  }
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
      result := FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deStatedEDD.Date);
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := FormatDateTime('dd/mm/yyyy', deMUFWEdd.Date);
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := FormatDateTime('dd/mm/yyyy', deOvulationEDD.Date);
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deIVFEDD.Date);
    end;
  end;
  if not(cbPregnancyRedatedYes.checked) then
  begin
     result := '#|#+BOLD' + result + '#/#'
  end
end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
function GetEnteredEDD :String
Begin
result := '';
    if (deStatedEDD.Date > 0) then
    begin
      Result := FormatDateTime('dd/mm/yyyy', deStatedEDD.Date);
    end
end;
```

</details>

---

### getFibroid

**Variant count:** 4

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, 20week |
| B | pe12week |
| C | t3Singleton |
| D | t3twins |

**Summary:** 4 distinct variants with line counts: A=52, B=52, C=52, D=50.

Variants A (earlyT1Singleton, 20week) vs B (pe12week) differ on 3 line(s): L15: `result :=  'There is a' + result;` vs `result :=  'There is a ' + result;`; L24: `result := result + ' and';` vs `result := result + ' and ';`; L26: `result := result + ',';` vs `result := result + ', ';`

Variants A (earlyT1Singleton, 20week) vs C (t3Singleton) differ on 2 line(s): L24: `result := result + ' and';` vs `result := result + ' and ';`; L26: `result := result + ',';` vs `result := result + ', ';`

Variants B (pe12week) vs C (t3Singleton) differ on 1 line(s): L15: `result :=  'There is a ' + result;` vs `result :=  'There is a' + result;`

Variant A unique strings: [' and', ',', 'Fibroid/s', 'There is a']

Variant B unique strings: [' and ', ', ', 'Fibroid/s', 'There is a ']

Variant C unique strings: [' and ', ', ', 'Fibroid/s', 'There is a']

Variant D unique strings: [' and ', ', ', 'There is a ']

<details>
<summary>Variant A (earlyT1Singleton, 20week)</summary>

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
        result :=  'There is a' + result;
    end
    else if spFibroidCount.value > 1 then
    begin
      for i := 1 to spFibroidCount.value do
      begin
        if result <> '' then
        begin
          if i = spFibroidCount.value then
             result := result + ' and';
          else
             result := result + ',';
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

</details>

<details>
<summary>Variant B (pe12week)</summary>

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

</details>

<details>
<summary>Variant C (t3Singleton)</summary>

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
        result :=  'There is a' + result;
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

</details>

<details>
<summary>Variant D (t3twins)</summary>

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
      result := result +  GetSingleFibroidDimensions + GetSingleFibroid + ' fibroid seen.  ';
      if GetSingleCloseOrClear <> '' then
         result := result + 'It is ' +  GetSingleCloseOrClear;
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
    result := 'Fibroid';
  end;
  else
    result := '';

  if result <> '' then
    result := #13#10+#13#10 + AddFullSTopToEnd(result);
end;
```

</details>

---

### GetFibroidConcl

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | gynae |

**Summary:** Variant A (earlyT1Singleton): 53 lines. Variant B (gynae): 58 lines. Diff: 15 line(s) removed, 20 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (gynae)
@@ -1,2 +1,5 @@
 function GetFibroidConcl: string;
+var
+  vLargest, vSmallest, vTemp, i: Integer;
+  vBool: Boolean;
 begin
@@ -19,7 +22,5 @@
         end;
-        result := result + Format('Multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
-        if GetHasDistortion then
-          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
-        else
-          result := result + ', all clear of cervix.';
+        result := result + Format(', containing multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
+        if GetCavDistortionCount(vBool) > 0 then
+          result := result + ' with associated cavity distortion';
       end
@@ -34,7 +35,5 @@
           vSmallest := vTemp;
-       result := result + Format('Two fibroids of %dmm and %dmm visualised',[vSmallest, vLargest]);
-        if GetHasDistortion then
-          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
-        else
-          result := result +', both clear of cervix.';
+        result := result + Format(', containing two fibroids of %dmm and %dmm', [vSmallest, vLargest]);
+        if GetCavDistortionCount(vBool) > 0 then
+          result := result + ' with associated cavity distortion';
       end;
@@ -43,9 +42,15 @@
     begin
-      result := result + Format(' A single %s fibroid of %dmm was visualised', [cbFibroidsType1.text, GetFibroidAvg(1)]);
-      if (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
+      result := result + Format(', containing a single %s fibroid of %dmm', [cbFibroidsType1.text, GetFibroidAvg(1)]);
+      if ((cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled)) or (cbFibroidsType1.ItemIndex = 2) then
       begin
-        result := result + ' with associated cavity distortion.';
+        if (cbCavityDistortion1.Enabled) then
+          result := result + ' with associated cavity distortion';
... (11 more lines)
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetFibroidConcl: string;
begin
  result := '';
  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    if (spFibroidCount.Value > 1) then
    begin
      if (spFibroidCount.Value > 2) then
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        for i := 2 to spFibroidCount.Value do
        begin
          vTemp := GetFibroidAvg(i);
          if vTemp > vLargest then
            vLargest := vTemp;
          if vTemp < vSmallest then
            vSmallest := vTemp;
        end;
        result := result + Format('Multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
        if GetHasDistortion then
          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
        else
          result := result + ', all clear of cervix.';
      end
      else
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        vTemp := GetFibroidAvg(2);
        if vTemp > vLargest then
          vLargest := vTemp;
        if vTemp < vSmallest then
          vSmallest := vTemp;
       result := result + Format('Two fibroids of %dmm and %dmm visualised',[vSmallest, vLargest]);
        if GetHasDistortion then
          result := result + '. The position of the fibroids in relation to the cervix should be reviewed in the third trimester.';
        else
          result := result +', both clear of cervix.';
      end;
    end
    else
    begin
      result := result + Format(' A single %s fibroid of %dmm was visualised', [cbFibroidsType1.text, GetFibroidAvg(1)]);
      if (cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled) then
      begin
        result := result + ' with associated cavity distortion.';
      end;
      else
        result := result + '.';
    end;
  end;
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

```pascal
function GetFibroidConcl: string;
var
  vLargest, vSmallest, vTemp, i: Integer;
  vBool: Boolean;
begin
  result := '';
  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    if (spFibroidCount.Value > 1) then
    begin
      if (spFibroidCount.Value > 2) then
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        for i := 2 to spFibroidCount.Value do
        begin
          vTemp := GetFibroidAvg(i);
          if vTemp > vLargest then
            vLargest := vTemp;
          if vTemp < vSmallest then
            vSmallest := vTemp;
        end;
        result := result + Format(', containing multiple fibroids ranging from %dmm to %dmm', [vSmallest, vLargest]);
        if GetCavDistortionCount(vBool) > 0 then
          result := result + ' with associated cavity distortion';
      end
      else
      begin
        vLargest := GetFibroidAvg(1);
        vSmallest := GetFibroidAvg(1);
        vTemp := GetFibroidAvg(2);
        if vTemp > vLargest then
          vLargest := vTemp;
        if vTemp < vSmallest then
          vSmallest := vTemp;
        result := result + Format(', containing two fibroids of %dmm and %dmm', [vSmallest, vLargest]);
        if GetCavDistortionCount(vBool) > 0 then
          result := result + ' with associated cavity distortion';
      end;
    end
    else
    begin
      result := result + Format(', containing a single %s fibroid of %dmm', [cbFibroidsType1.text, GetFibroidAvg(1)]);
      if ((cbCavityDistortion1.Checked) and (cbCavityDistortion1.Enabled)) or (cbFibroidsType1.ItemIndex = 2) then
      begin
        if (cbCavityDistortion1.Enabled) then
          result := result + ' with associated cavity distortion';
      end
      else
      begin
        if (cbCavityDistortion1.Enabled) then
        begin
          result := result + ' with no associated cavity distortion';
        end;
      end;
    end;
  end;
end;
```

</details>

---

### GetFibroidCount

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | gynae |

**Summary:** Same structure (18 lines), differs on 2 line(s):
  - Line 11: `result := vNumber + ' fibroid is'` vs `result := vNumber + ' fibroid was'`
  - Line 14: `result := vNumber + ' fibroids are';` vs `result := vNumber + ' fibroids were';`

**Nature:** Differences in: string literals.

<details>
<summary>Variant A (earlyT1Singleton)</summary>

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
      result := vNumber + ' fibroid is'
    else
    begin
      result := vNumber + ' fibroids are';
    end;
  end;
  result := InitCaps(result, False);
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

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

</details>

---

### GetFibroidDesc

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | gynae |

**Summary:** Variant A (earlyT1Singleton): 13 lines. Variant B (gynae): 64 lines. Diff: 3 line(s) removed, 54 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (gynae)
@@ -4,2 +4,4 @@
   v4: Double;
+  vParentGroup: TcxGroupBox;
+  vFibPosition, vFibType: string;
 begin
@@ -8,6 +10,55 @@
   begin
-    result := GetFibroidString(inFibroid);
+    vParentGroup := nil;
+    for i := 0 to tsFibroids.ControlCount - 1 do
+    begin
+      if (tsFibroids.Controls[i].Name = ('gbFibroid' + intToStr(inFibroid))) then
+      begin
+        vParentGroup := tsFibroids.Controls[i];
+        break;
+      end;
+    end;
+    if assigned(vParentGroup) then
+    begin
+      vFibPosition := '';
+      vFibType := '';
+      v1 := 0;
+      v2 := 0;
+      v3 := 0;
+      v4 := 0;
+      for i := 0 to vParentGroup.ControlCount - 1 do
+      begin
+        if vParentGroup.Controls[i].Name = ('cbFibroidsLeftRight' + intToStr(inFibroid)) then
+        begin
+          result := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
+        end
+        else if vParentGroup.Controls[i].Name = ('edtFibroidLength' + intToStr(inFibroid)) then
+        begin
+          v1 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
+        end
+        else if vParentGroup.Controls[i].Name = ('edtFibroidWidth' + intToStr(inFibroid)) then
+        begin
+          v2 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
... (26 more lines)
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetFibroidDesc(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  if inFibroid <= spFibroidCount.Value then
  begin
    result := GetFibroidString(inFibroid);
  end;
  if trim(result) <> '' then
    result := InitCaps(result, False);
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

```pascal
function GetFibroidDesc(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
  vParentGroup: TcxGroupBox;
  vFibPosition, vFibType: string;
begin
  result := '';
  if inFibroid <= spFibroidCount.Value then
  begin
    vParentGroup := nil;
    for i := 0 to tsFibroids.ControlCount - 1 do
    begin
      if (tsFibroids.Controls[i].Name = ('gbFibroid' + intToStr(inFibroid))) then
      begin
        vParentGroup := tsFibroids.Controls[i];
        break;
      end;
    end;
    if assigned(vParentGroup) then
    begin
      vFibPosition := '';
      vFibType := '';
      v1 := 0;
      v2 := 0;
      v3 := 0;
      v4 := 0;
      for i := 0 to vParentGroup.ControlCount - 1 do
      begin
        if vParentGroup.Controls[i].Name = ('cbFibroidsLeftRight' + intToStr(inFibroid)) then
        begin
          result := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidLength' + intToStr(inFibroid)) then
        begin
          v1 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidWidth' + intToStr(inFibroid)) then
        begin
          v2 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroiddepth' + intToStr(inFibroid)) then
        begin
          v3 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value);
        end
        else if vParentGroup.Controls[i].Name = ('edtFibroidVolume' + intToStr(inFibroid)) then
        begin
          v4 := trunc(TcxSpinEdit(vParentGroup.Controls[i]).Value * 10) / 10;
        end
        else if vParentGroup.Controls[i].Name = ('cbFibriodPosition' + intToStr(inFibroid)) then
        begin
          vFibPosition := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
        else if vParentGroup.Controls[i].Name = ('cbFibroidsType' + intToStr(inFibroid)) then
        begin
          vFibType := Trim(TcxComboBox(vParentGroup.Controls[i]).Text);
        end
      end;
      if result <> '' then
        result := result + ' ';
      result := InitCaps(result + Format('%s %s %s', [vFibPosition, vFibType, GetIntegerMeasuredString(v1, v2, v3, v4, 'mm')]), False);
    end;
  end;
end;
```

</details>

---

### GetFibroidString

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | pe12week, t3Singleton, t3twins |

**Summary:** 3 distinct variants with line counts: A=58, B=75, C=75.

Variants have substantially different structure/length, indicating different logic or scope of functionality.

Variant A unique strings: [' %d x %d x %dmm', ' %d x %d x %dmm (vol. %3.1f cc)', ' %d x %dmm', ' %dmm', ', clear of the cervix']

Variant B unique strings: [' %d x %d x %dmm', ' %d x %d x %dmm (vol. %dcc)', ' %d x %dmm', ' %dmm', ' clear of the cervix']

Variant C unique strings: [' fibroid', '%d x %d x %dmm', '%d x %d x %dmm (vol. %dcc)', '%d x %dmm', '%dmm']

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetFibroidString(inFibroid: Integer): string;
var
  v1, v2, v3: Integer;
  v4: Double;
  vl, vw, vd, vv: TcxSpinEdit;
  vp, vt, vlr: TcxComboBox;
  vCheck: TcxCheckBox;
begin
  result := '';
  vv := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(inFibroid));
  vl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidLength' + intToStr(inFibroid));
  vw := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidWidth' + intToStr(inFibroid));
  vd := TWinControl(tsFibroids.Owner).FindComponent('edtFibroiddepth' + intToStr(inFibroid));
  vp := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(inFibroid));
  vt := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(inFibroid));
  vlr := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(inFibroid));
  vCheck := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
  if vlr.Text <> '' then
    result := vlr.Text + ' ';
  v1 := trunc(vl.Value);
  v2 := trunc(vw.Value);
  v3 := trunc(vd.Value);
  v4 := trunc(vv.Value * 10) / 10;
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + vp.Text + ' ' + vt.Text + format(' %d x %d x %dmm (vol. %3.1f cc)', [v1, v2, v3, v4]);
        end
        else
          result := result + vp.Text + ' ' + vt.Text + format(' %d x %d x %dmm', [v1, v2, v3]);
      end
      else
        result := result + vp.Text + ' ' + vt.Text + format(' %d x %dmm', [v1, v2]);
    end
    else
      result := result + vp.Text + ' ' + vt.Text + format(' %dmm', [v1]);
  end;
  if vCheck.Checked then
  begin
    vv := TWinControl(tsFibroids.Owner).FindComponent('seCloseToCrevix' + intToStr(inFibroid));
    if vv.value > 0 then
    begin
        result := result + Format(' within %d mm of the cervix',[trunc(vv.value)]);
    end
    else
      result := result + ' and is close to the cervix';
  end;
  {else
  begin
    if GetCavDistortionCount > 0 then
      result := result + ', clear of the cervix';
  end; }
end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
function GetFibroidString (inFibroid: Integer): string;
var
  v1, v2, v3,v4: Integer;
  vl, vw, vd, vv: TcxSpinEdit;
  vp, vt, vlr: TcxComboBox;
  vCheck: TcxCheckBox;
begin
  result := '';
  vv := TWinControl(gbFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(inFibroid));
  vl := TWinControl(gbFibroids.Owner).FindComponent('edtFibroidLength' + intToStr(inFibroid));
  vw := TWinControl(gbFibroids.Owner).FindComponent('edtFibroidWidth' + intToStr(inFibroid));
  vd := TWinControl(gbFibroids.Owner).FindComponent('edtFibroiddepth' + intToStr(inFibroid));
  vp := TWinControl(gbFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(inFibroid));
  vt := TWinControl(gbFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(inFibroid));
  vlr := TWinControl(gbFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(inFibroid));
  vCheck := TWinControl(gbFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
  v1 := trunc(vl.Value);
  v2 := trunc(vw.Value);
  v3 := trunc(vd.Value);
  v4 := trunc(vv.Value)
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result  + format(' %d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]) + ' ' ;
            if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
        else
        begin
          result := result  + format(' %d x %d x %dmm', [v1, v2, v3]) + ' ' ;
           if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
      end
      else
      begin
        result := result + format(' %d x %dmm', [v1, v2]) + ' ' ;
         if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
      end;
    end
    else
    begin
      result := result + format(' %dmm', [v1])+ ' ' ;
       if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
       result := result + vp.Text + ' ' + vt.Text;
    end;
    if result <> '' then
      result := result + ' fibroid'
  end;
  if vCheck.Checked then
  begin
    vv := TWinControl(gbFibroids.Owner).FindComponent('seCloseToCrevix' + intToStr(inFibroid));
    if vv.value > 0 then
    begin
        result := result + Format(' within %d mm of the cervix',[trunc(vv.value)]);
    end
    else
      result := result + ' and is close to the cervix';
  end;
  else
  begin
    if GetCavDistortionCount > 0 then
      result := result + ' clear of the cervix';
  end;
end;
```

</details>

<details>
<summary>Variant C (pe12week, t3Singleton, t3twins)</summary>

```pascal
function GetFibroidString (inFibroid: Integer): string;
var
  v1, v2, v3,v4: Integer;
  vl, vw, vd, vv: TcxSpinEdit;
  vp, vt, vlr: TcxComboBox;
  vCheck: TcxCheckBox;
begin
  result := '';
  vv := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(inFibroid));
  vl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidLength' + intToStr(inFibroid));
  vw := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidWidth' + intToStr(inFibroid));
  vd := TWinControl(tsFibroids.Owner).FindComponent('edtFibroiddepth' + intToStr(inFibroid));
  vp := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(inFibroid));
  vt := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(inFibroid));
  vlr := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(inFibroid));
  vCheck := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(inFibroid));
  v1 := trunc(vl.Value);
  v2 := trunc(vw.Value);
  v3 := trunc(vd.Value);
  v4 := trunc(vv.Value)
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result  + format('%d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]) + ' ' ;
            if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
        else
        begin
          result := result  + format('%d x %d x %dmm', [v1, v2, v3]) + ' ' ;
           if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
        end
      end
      else
      begin
        result := result + format('%d x %dmm', [v1, v2]) + ' ' ;
         if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
          result := result + vp.Text + ' ' + vt.Text;
      end;
    end
    else
    begin
      result := result + format('%dmm', [v1])+ ' ' ;
       if vlr.Text <> '' then
                 result := result + Lowercase(vlr.Text) + ' ';
       result := result + vp.Text + ' ' + vt.Text;
    end;
    if result <> '' then
      result := result + ' fibroid'
  end;
  if vCheck.Checked then
  begin
    vv := TWinControl(tsFibroids.Owner).FindComponent('seCloseToCrevix' + intToStr(inFibroid));
    if vv.value > 0 then
    begin
        result := result + Format(' within %d mm of the cervix',[trunc(vv.value)]);
    end
    else
      result := result + ' and is close to the cervix';
  end;
  else
  begin
    if GetCavDistortionCount > 0 then
      result := result + ', clear of the cervix';
  end;
end;
```

</details>

---

### getGAFromEnteredEDD

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | pe12week |

**Summary:** 3 distinct variants with line counts: A=81, B=13, C=81.

Variants A (earlyT1Singleton) vs C (pe12week) differ on 1 line(s): L71: `Result := Trim(IntToStr(seIVFGAWeeks.Value)) + ' weeks ' ;` vs `Result := IntToStr(seIVFGAWeeks.Value) + ' weeks ';`

Variant A unique strings: ['LMP Unknown. ']

Variant C unique strings: ['LMP Unknown. ']

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
Function getGAFromEnteredEDD :String;
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'LMP Unknown. ';
  end
  else}
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
    begin
      result := Trim(IntToStr(seEDDCalGAWeeks.Value)) + ' weeks ';
      if seEDDCalGADays.Value >= 0 then
      begin
         if seEDDCalGADays.Value = 1 then
          result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' day';
         else
           result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' days';
      end;
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := Trim(IntToStr(seStatedEDDGestAgeWeeks.Value)) + ' weeks ';
      if seStatedEDDGestAgeDays.Value >= 0 then
      begin
         if seStatedEDDGestAgeDays.Value = 1 then
          result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' day';
         else
           result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := Trim(IntToStr(seMUFWGestAgeWeeks.Value)) + ' weeks ';
    if seMUFWGestAgeDays.Value >= 0 then
    begin
       if seMUFWGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' days';
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := Trim(IntToStr(spOvualtionGestAgeWeeks.Value)) + ' weeks ';
      if spOvualtionGestAgeDays.Value >= 0 then
      begin
       if spOvualtionGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := Trim(IntToStr(seIVFGAWeeks.Value)) + ' weeks ' ;
      if seIVFGADays.Value >= 0 then
      begin
       if seIVFGADays.Value = 1 then
        result := result + Trim(IntToStr(seIVFGADays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seIVFGADays.Value)) + ' days';
      end;
    end;
  end;
end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
Function getGAFromEnteredEDD :String;
Begin
result := '';
  result := Trim(IntToStr(seEDDCalGAWeeks.Value)) + ' weeks ';
  if seEDDCalGADays.Value >= 0 then
  begin
     if seEDDCalGADays.Value = 1 then
      result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' day';
     else
       result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' days';
  end;

end;
```

</details>

<details>
<summary>Variant C (pe12week)</summary>

```pascal
Function getGAFromEnteredEDD :String;
Begin
result := '';
  {if cbEDDPrinciple.ItemIndex = 0 then // No Dates
  begin
    result := 'LMP Unknown. ';
  end
  else}
  if cbEDDPrinciple.ItemIndex = 2 then // Menstrual EDD
  begin
    if deMenstrualEDD.Date > 0 then
    begin
      result := Trim(IntToStr(seEDDCalGAWeeks.Value)) + ' weeks ';
      if seEDDCalGADays.Value >= 0 then
      begin
         if seEDDCalGADays.Value = 1 then
          result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' day';
         else
           result := result + Trim(IntToStr(seEDDCalGADays.Value)) + ' days';
      end;
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 0 then // Stated EDD
  begin
    if (deStatedEDD.Date > 0) then
    begin
      Result := Trim(IntToStr(seStatedEDDGestAgeWeeks.Value)) + ' weeks ';
      if seStatedEDDGestAgeDays.Value >= 0 then
      begin
         if seStatedEDDGestAgeDays.Value = 1 then
          result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' day';
         else
           result := result + Trim(IntToStr(seStatedEDDGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else
  if cbEDDPrinciple.ItemIndex = 3 then // Previously established EDD
  begin
    if (deMUFWEdd.Date > 0) then
      Result := Trim(IntToStr(seMUFWGestAgeWeeks.Value)) + ' weeks ';
    if seMUFWGestAgeDays.Value >= 0 then
    begin
       if seMUFWGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seMUFWGestAgeDays.Value)) + ' days';
    end;
  end
  else
  if cbEDDPrinciple.ItemIndex = 4 then // Timed Ovulation
  begin
    if (deOvulationEDD.Date > 0) then
    begin
      if (deOvulationEDD.Date > 0) then
        result := Trim(IntToStr(spOvualtionGestAgeWeeks.Value)) + ' weeks ';
      if spOvualtionGestAgeDays.Value >= 0 then
      begin
       if spOvualtionGestAgeDays.Value = 1 then
        result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(spOvualtionGestAgeDays.Value)) + ' days';
      end;
    end
  end
  else // Assisted
  begin
    if (deIVFEDD.Date > 0) then
    begin
      Result := IntToStr(seIVFGAWeeks.Value) + ' weeks ';
      if seIVFGADays.Value >= 0 then
      begin
       if seIVFGADays.Value = 1 then
        result := result + Trim(IntToStr(seIVFGADays.Value)) + ' day';
       else
         result := result + Trim(IntToStr(seIVFGADays.Value)) + ' days';
      end;
    end;
  end;
end;
```

</details>

---

### GetGraphXValue

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week, t3Singleton |
| B | pe12week, t3twins |

**Summary:** Same structure (12 lines), differs on 1 line(s):
  - Line 8: `if (pos('EDTBPD', vUpper) > 0) or (pos('EDTOFD', vUpper) > 0) or (pos('EDTHC', vUpper) > 0) or (pos('EDTAC', vUpper) > 0) or (pos('EDTHL', vUpper) > 0) or (pos('EDTFL', vUpper) > 0) or (pos('SEESTFETAL', vUpper) > 0) or (pos('EDTAFI', vUpper) > 0) or(pos('EDTCEREBCPR', vUpper) > 0) or(pos('EDTMIDCERARTPI', vUpper) > 0) or (pos('EDTUMBILICALARTPI', vUpper) > 0) then` vs `if (pos('EDTBPD', vUpper) > 0) or (pos('EDTOFD', vUpper) > 0) or (pos('EDHC', vUpper) > 0) or (pos('EDAC', vUpper) > 0) or (pos('EDHL', vUpper) > 0) or (pos('EDFL', vUpper) > 0) or (pos('SEESTFETAL', vUpper) > 0) or (pos('EDTAFI', vUpper) > 0) or(pos('EDTCEREBCPR', vUpper) > 0) or(pos('EDTMIDCERARTPI', vUpper) > 0) or (pos('EDTUMBILICALARTPI', vUpper) > 0) then`

**Nature:** Differences in: string literals.

<details>
<summary>Variant A (20week, t3Singleton)</summary>

```pascal
 function GetGraphXValue(inControl: String): Real;
var
  vUpper: String;
begin
  result := 0;
  vUpper := UpperCase(inControl);
 // GetOriginalDating('');
  if (pos('EDTBPD', vUpper) > 0) or (pos('EDTOFD', vUpper) > 0) or (pos('EDTHC', vUpper) > 0) or (pos('EDTAC', vUpper) > 0) or (pos('EDTHL', vUpper) > 0) or (pos('EDTFL', vUpper) > 0) or (pos('SEESTFETAL', vUpper) > 0) or (pos('EDTAFI', vUpper) > 0) or(pos('EDTCEREBCPR', vUpper) > 0) or(pos('EDTMIDCERARTPI', vUpper) > 0) or (pos('EDTUMBILICALARTPI', vUpper) > 0) then
  begin
    result := GetGestWeeks + (GetGestDays / 7);
  end;
end;
```

</details>

<details>
<summary>Variant B (pe12week, t3twins)</summary>

```pascal
 function GetGraphXValue(inControl: String): Real;
var
  vUpper: String;
begin
  result := 0;
  vUpper := UpperCase(inControl);
 // GetOriginalDating('');
  if (pos('EDTBPD', vUpper) > 0) or (pos('EDTOFD', vUpper) > 0) or (pos('EDHC', vUpper) > 0) or (pos('EDAC', vUpper) > 0) or (pos('EDHL', vUpper) > 0) or (pos('EDFL', vUpper) > 0) or (pos('SEESTFETAL', vUpper) > 0) or (pos('EDTAFI', vUpper) > 0) or(pos('EDTCEREBCPR', vUpper) > 0) or(pos('EDTMIDCERARTPI', vUpper) > 0) or (pos('EDTUMBILICALARTPI', vUpper) > 0) then
  begin
    result := GetGestWeeks + (GetGestDays / 7);
  end;
end;
```

</details>

---

### GetIntegerMeasuredString

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week, gynae, pe12week, t3Singleton, t3twins |

**Summary:** Variant A (earlyT1Singleton): 30 lines. Variant B (20week, gynae, pe12week, t3Singleton, t3twins): 27 lines. Diff: 11 line(s) removed, 8 line(s) added.

**Nature:** Changed lines involve: assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (20week, gynae, pe12week, t3Singleton, t3twins)
@@ -11,20 +11,17 @@
           if trunc(v4) = v4 then
-            result := Format('%d x %d x %d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
+            result := Format('%dx%dx%d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
+          else
+            result := Format('%dx%dx%d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
+        end
         else
-          result := Format('%d x %d x %d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
+          result := Format('%dx%dx%d%s', [v1, v2, v3, inType]);
       end
       else
-        result := Format('%d x %d x %d%s', [v1, v2, v3, inType]);
+        result := Format('%dx%d%s', [v1, v2, inType]);
     end
     else
-      result := Format('%d x %d%s', [v1, v2, inType]);
+      result := Format('%d%s', [v1, inType]);
   end
   else
-    result := Format('%d%s', [v1, inType]);
-end
-else
-  result := '';
-if result <> '' then
-  result := ' of '+ result;
-
+    result := '';
 end;
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetIntegerMeasuredString(v1, v2, v3: Integer; v4: Double; inType: string): string;
begin
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          if trunc(v4) = v4 then
            result := Format('%d x %d x %d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
        else
          result := Format('%d x %d x %d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
      end
      else
        result := Format('%d x %d x %d%s', [v1, v2, v3, inType]);
    end
    else
      result := Format('%d x %d%s', [v1, v2, inType]);
  end
  else
    result := Format('%d%s', [v1, inType]);
end
else
  result := '';
if result <> '' then
  result := ' of '+ result;

end;
```

</details>

<details>
<summary>Variant B (20week, gynae, pe12week, t3Singleton, t3twins)</summary>

```pascal
function GetIntegerMeasuredString(v1, v2, v3: Integer; v4: Double; inType: string): string;
begin
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          if trunc(v4) = v4 then
            result := Format('%dx%dx%d%s (vol %d cc)', [v1, v2, v3, inType, trunc(v4)]);
          else
            result := Format('%dx%dx%d%s (vol %2.1f cc)', [v1, v2, v3, inType, v4]);
        end
        else
          result := Format('%dx%dx%d%s', [v1, v2, v3, inType]);
      end
      else
        result := Format('%dx%d%s', [v1, v2, inType]);
    end
    else
      result := Format('%d%s', [v1, inType]);
  end
  else
    result := '';
end;
```

</details>

---

### GetLargestFibroid

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | gynae |

**Summary:** Variant A (earlyT1Singleton): 26 lines. Variant B (gynae): 27 lines. Diff: 0 line(s) removed, 1 line(s) added.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (gynae)
@@ -4,2 +4,3 @@
   vControl2: TcxCheckBox;
+  i: Integer;
 begin
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetLargestFibroid(var isDistored: Boolean): Real;
var
  vControl: TcxSpinEdit;
  vControl2: TcxCheckBox;
begin
  result := 0.0;
  isDistored := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(i + 1));
    if (assigned(vControl)) and (TcxSpinEdit(vControl).Value > result) then
    begin
      result := TcxSpinEdit(vControl).Value;
      vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      if assigned(vControl2) then
      begin
        if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
          isDistored := True
        else
          isDistored := False;
      end
      else
        result := False;
    end;
  end;
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

```pascal
function GetLargestFibroid(var isDistored: Boolean): Real;
var
  vControl: TcxSpinEdit;
  vControl2: TcxCheckBox;
  i: Integer;
begin
  result := 0.0;
  isDistored := False;
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl := TWinControl(tsFibroids.Owner).FindComponent('edtFibroidVolume' + intToStr(i + 1));
    if (assigned(vControl)) and (TcxSpinEdit(vControl).Value > result) then
    begin
      result := TcxSpinEdit(vControl).Value;
      vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
      if assigned(vControl2) then
      begin
        if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
          isDistored := True
        else
          isDistored := False;
      end
      else
        result := False;
    end;
  end;
end;
```

</details>

---

### GetNormalMCAPIRange

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week |
| B | t3Singleton, t3twins |

**Summary:** Variant A (20week): 25 lines. Variant B (t3Singleton, t3twins): 28 lines. Diff: 19 line(s) removed, 22 line(s) added.

**Nature:** Changed lines involve: assignments.

**Example output difference:**
```diff
--- Variant A (20week)
+++ Variant B (t3Singleton, t3twins)
@@ -4,21 +4,24 @@
   case inWeeks of
-    21: result := 1.18;
-    22: result := 1.25;
-    23: result := 1.32;
-    24: result := 1.38;
-    25: result := 1.44;
-    26: result := 1.50;
-    27: result := 1.55;
-    28: result := 1.58;
-    29: result := 1.61;
-    30: result := 1.62;
-    31: result := 1.62;
-    32: result := 1.61;
-    33: result := 1.58;
-    34: result := 1.53;
-    35: result := 1.47;
-    36: result := 1.39;
-    37: result := 1.30;
-    38: result := 1.20;
-    39: result := 1.10;
+    20: result := 1.227;
+    21: result := 1.278;
+    22: result := 1.330;
+    23: result := 1.381;
+    24: result := 1.430;
+    25: result := 1.476;
+    26: result := 1.517;
+    27: result := 1.553;
+    28: result := 1.580;
+    29: result := 1.599;
+    30: result := 1.607;
+    31: result := 1.603;
+    32: result := 1.586;
+    33: result := 1.555;
+    34: result := 1.511;
+    35: result := 1.453;
+    36: result := 1.382;
... (6 more lines)
```

<details>
<summary>Variant A (20week)</summary>

```pascal
function GetNormalMCAPIRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    21: result := 1.18;
    22: result := 1.25;
    23: result := 1.32;
    24: result := 1.38;
    25: result := 1.44;
    26: result := 1.50;
    27: result := 1.55;
    28: result := 1.58;
    29: result := 1.61;
    30: result := 1.62;
    31: result := 1.62;
    32: result := 1.61;
    33: result := 1.58;
    34: result := 1.53;
    35: result := 1.47;
    36: result := 1.39;
    37: result := 1.30;
    38: result := 1.20;
    39: result := 1.10;
  end;
end;
```

</details>

<details>
<summary>Variant B (t3Singleton, t3twins)</summary>

```pascal
function GetNormalMCAPIRange(inWeeks: Integer): Real;
begin
  result := 0.0;
  case inWeeks of
    20: result := 1.227;
    21: result := 1.278;
    22: result := 1.330;
    23: result := 1.381;
    24: result := 1.430;
    25: result := 1.476;
    26: result := 1.517;
    27: result := 1.553;
    28: result := 1.580;
    29: result := 1.599;
    30: result := 1.607;
    31: result := 1.603;
    32: result := 1.586;
    33: result := 1.555;
    34: result := 1.511;
    35: result := 1.453;
    36: result := 1.382;
    37: result := 1.300;
    38: result := 1.208;
    39: result := 1.108;
    40: result := 1.002;
    41: result := 0.894;
  end;
end;
```

</details>

---

### GetObstetricHistory

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week, t3Singleton |
| B | pe12week, t3twins |

**Summary:** Variant A (20week, t3Singleton): 25 lines. Variant B (pe12week, t3twins): 23 lines. Diff: 2 line(s) removed, 0 line(s) added.

**Nature:** Changed lines involve: assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (20week, t3Singleton)
+++ Variant B (pe12week, t3twins)
@@ -21,4 +21,2 @@
   if result <> '' then
-     result := 'Past Hx: ' + result;
-  if result <> '' then
     result := AddFullStop(result);
```

<details>
<summary>Variant A (20week, t3Singleton)</summary>

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
        result := result + '.  ';
      result := result + cxccbObstetricHistory.ShortDescription[i];
    end;
  end;
  if (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtOtherPastHistory1.Text);
  end;
  if result <> '' then
     result := 'Past Hx: ' + result;
  if result <> '' then
    result := AddFullStop(result);
end;
```

</details>

<details>
<summary>Variant B (pe12week, t3twins)</summary>

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
        result := result + '.  ';
      result := result + cxccbObstetricHistory.ShortDescription[i];
    end;
  end;
  if (cxccbObstetricHistory.States[cxccbObstetricHistory.Properties.Items.Count-1] = 1) then
  begin
    if result <> '' then
      result := result + '.  ';
    result := result + trim(edtOtherPastHistory1.Text);
  end;
  if result <> '' then
    result := AddFullStop(result);
end;
```

</details>

---

### GetOvary

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | pe12week |

**Summary:** 3 distinct variants with line counts: A=49, B=40, C=20.

Variants have substantially different structure/length, indicating different logic or scope of functionality.

Variant A unique strings: ['A corpus luteum is visualised in both ovaries.  ', 'A corpus luteum is visualised in the left ovary.  ', 'A corpus luteum is visualised in the right ovary.  ', 'Both ovaries are normal.  ', 'Both ovaries are not identified.  ']

Variant B unique strings: ['A corpus luteum is visualised in both ovaries.  ', 'A corpus luteum is visualised in the right ovary.  ', 'A corpus luteum s visualised in the left ovary.  ', 'The left ovary is abnormal.  ', 'The left ovary is normal.  ']

Variant C unique strings: ['#|#+BOLDOvaries:#/#', 'Abnormal left ovary.  ', 'Abnormal right ovary.  ']

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
Function GetOvary : string;
var
  tempString;
begin
  result := '';
  if cbRightOvaryIdentified.checked then
  begin
     if cbLeftOvaryIdentified.checked then
       result := result + 'Both ovaries are not identified.  ';
     else
       result := result + 'The right ovary is not identified.  ';
  end
  else  if cbLeftOvaryIdentified.checked then
     result := result + 'The left ovary is not identified.  ';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := result + 'Both ovaries are normal.  ';
     else
       result := result + 'The right ovary is normal.  ';
  end
  else  if cbLeftOvaryNormal.checked then
     result := result + 'The left ovary is normal.  ';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal.  ';
     else
       result := result + 'The right ovary is abnormal.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'The left ovary is abnormal.  ';

  if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries.  ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary.  ';
  end
  else  if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum is visualised in the left ovary.  ' ;

     if result <> '' then
     result := #13#10 + #13#10 + result ;

end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
 Function GetOvary : string;
var
  tempString;
begin
  result := '';

  if cbRightOvaryNormal.checked then
  begin
     if cbLeftOvaryNormal.checked then
       result := '';
     else
       result := result + 'The right ovary is normal.  ';
  end
  else  if cbLeftOvaryNormal.checked then
     result := result + 'The left ovary is normal.  ';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal.  ';
     else
       result := result + 'The right ovary is abnormal.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'The left ovary is abnormal.  ';

 { if cbRightOvaryCL.checked then
  begin
     if cbLeftOvaryCL.checked then
       result := result + 'A corpus luteum is visualised in both ovaries.  ';
     else
       result := result + 'A corpus luteum is visualised in the right ovary.  ';
  end
  else  if cbLeftOvaryCL.checked then
     result := result + 'A corpus luteum s visualised in the left ovary.  ' ; }

     if result <> '' then
     result := #13#10+#13#10 + result ;

end;
```

</details>

<details>
<summary>Variant C (pe12week)</summary>

```pascal
 Function GetOvary : string;
var
  tempString;
begin
  result := '';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Both ovaries are abnormal.  ';
     else
       result := result + 'Abnormal right ovary.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'Abnormal left ovary.  ';

     if result <> '' then
     result := #13#10+#13#10 + '#|#+BOLDOvaries:#/#' + #13#10 + result ;

end;
```

</details>

---

### GetOvaryConc

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | gynae |
| B | pe12week |

**Summary:** Variant A (gynae): 530 lines. Variant B (pe12week): 20 lines. Diff: 524 line(s) removed, 14 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (gynae)
+++ Variant B (pe12week)
@@ -1,530 +1,20 @@
-function GetOvaryConc: string;
-var
-  vCystList: TStringList;
-  i: Integer;
-  vCystControl: TAdvTreeComboBox;
-  vCystStr: String;
-  vTotalAntralFollicles : Integer;
-  vRightEndometriomaCount, vLeftEndometrimoCount : integer;
+ Function GetOvaryConc : string;
 begin
   result := '';
-  vTotalAntralFollicles := 0;
 
-    if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
-    begin
-       if (cbRightOvaryIdentified.Checked) and (cbLeftOvaryIdentified.Checked) then
-       begin
-        {if not((cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) then
-        begin
-          if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
-            result := result + 'Normal ovaries.  '
-          else
-            result := result + 'Normal right ovary.  '
-        end
-        else
-          if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
-            result := result + 'Normal left ovary.  ' }
-       end
-       {else if (cbRightOvaryIdentified.Checked) then
-         if not((cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) then
-           result := result + ' Normal right ovary.  '
-       else if (cbLeftOvaryIdentified.Checked) then
-        if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
-         result := result + ' Normal left ovary.  '}
+  if cbRightOvaryAbnormal.checked then
+  begin
+     if cbLeftOvaryAbnormal.checked then
... (507 more lines)
```

<details>
<summary>Variant A (gynae)</summary>

```pascal
function GetOvaryConc: string;
var
  vCystList: TStringList;
  i: Integer;
  vCystControl: TAdvTreeComboBox;
  vCystStr: String;
  vTotalAntralFollicles : Integer;
  vRightEndometriomaCount, vLeftEndometrimoCount : integer;
begin
  result := '';
  vTotalAntralFollicles := 0;

    if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
    begin
       if (cbRightOvaryIdentified.Checked) and (cbLeftOvaryIdentified.Checked) then
       begin
        {if not((cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) then
        begin
          if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
            result := result + 'Normal ovaries.  '
          else
            result := result + 'Normal right ovary.  '
        end
        else
          if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
            result := result + 'Normal left ovary.  ' }
       end
       {else if (cbRightOvaryIdentified.Checked) then
         if not((cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) then
           result := result + ' Normal right ovary.  '
       else if (cbLeftOvaryIdentified.Checked) then
        if not((cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
         result := result + ' Normal left ovary.  '}

      // if(cbIndicatorType.ItemIndex > 0 ) and (cbIndicatorType.ItemIndex < 3)then
      if(cxccbReferralIndication.States[1] = 1) or
          (cxccbReferralIndication.States[2] = 1) then
       begin
        if (cbRightOvaryIdentified.Checked) and (seRightFolCount.visible) then
             vTotalAntralFollicles := vTotalAntralFollicles + seRightFolCount.Value;
        if (cbLeftOvaryIdentified.Checked) and (seRightFolCount.visible) then
            vTotalAntralFollicles := vTotalAntralFollicles +  seLeftFolCount.Value ;
       end
       //-----------------Post Menopausal --------------------------//
         if (cbPostMenopausal.checked) then
         begin
           if (seRightResidualFolCount.visible) and  (seRightResidualFolCount.enabled) and (seRightResidualFolCount.value > 0) then
           begin
              if (seleftResidualFolCount.visible) and  (seleftResidualFolCount.enabled) and (seLeftResidualFolCount.value > 0) then
                 result := result + 'Residual follicles identified in both the ovaries.  ';
              else
                 result := result + 'Residual follicles identified in the right ovary.  ';
           end
           else if (seleftResidualFolCount.visible) and  (seleftResidualFolCount.enabled) and (seLeftResidualFolCount.value > 0) then
               result := result + 'Residual follicles identified in the left ovary.  ';
         end;

      //-----------------Antral Follicle evaluation --------------------------//

      if(cxccbReferralIndication.States[1] = 1) or
          (cxccbReferralIndication.States[2] = 1) then
      begin
          if (not(cbPostMenopausal.checked)) and ((vTotalAntralFollicles = 0)) then
          begin
           {if  ((seRightLeadFollicle.Value) + (seLeftLeadFollicle.Value) = 0) then
             result := result + ' This indicates a high risk of poor response to controlled ovarian stimulation. '
           else }
           result := result + 'No antral follicles were visualised.  This may indicate a high risk of poor response to controlled ovarian stimulation. '
         end;
      end;

      if(cxccbReferralIndication.States[1] = 1) or
          (cxccbReferralIndication.States[2] = 1) then
      begin
      vTotalAntralFollicles := 0;
        if (cbRightOvaryIdentified.Checked) and (seRightFolCount.visible) then
             vTotalAntralFollicles := vTotalAntralFollicles + seRightFolCount.Value;
        if (cbLeftOvaryIdentified.Checked) and (seLeftFolCount.visible) then
            vTotalAntralFollicles := vTotalAntralFollicles +  seLeftFolCount.Value ;

        if (vTotalAntralFollicles > 0) and (vTotalAntralFollicles <= 8) then
          result := result + 'The total antral follicular count (AFC) is '+ getAntralNumberString(vTotalAntralFollicles) +'.   A total AFC less than 8 may be associated with a suboptimal response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 19)  then
          result := result + 'The total antral follicular count (AFC) is '+ getAntralNumberString(vTotalAntralFollicles) +'.  A total AFC greater than 19 may pose a risk of excess response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else  if ((vTotalAntralFollicles > 8) and (vTotalAntralFollicles <= 19)) then
          result :=  result + 'The total antral follicular count (AFC) is '+ getAntralNumberString(vTotalAntralFollicles) +'. This indicates an expected normal response to controlled ovarian stimulation (Martins et al, UOG 2014).   ';
       { if (vTotalAntralFollicles > 0) and (vTotalAntralFollicles < 5) then
          result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is very low (0-4 follicles).   This indicates a high risk of poor response to controlled ovarian stimulation, (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 4) and (vTotalAntralFollicles < 9) then
          result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is low (5-8 follicles). This indicates a high risk of poor response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 8) and (vTotalAntralFollicles < 20) then
          result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is normal (9-19 follicles). This indicates an expected normal response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
        else if (vTotalAntralFollicles > 19) then
        begin
           result := result + getFollicleString;
           if((cbRightPCO.Checked) and (cbLeftPCO.Checked)) then
           begin
            if result[length(result)] = '.' then
               result[length(result)] :='';
            result := result + ' and excessive ovarian response to controlled ovarian stimulation (Martins et al, UOG 2014).  ';
           end
           else
           begin
            if (((seRightFolCount.Value > 8) and (seRightFolCount.Value < 20)) and
               ((seLeftFolCount.Value > 8) and (seLeftFolCount.Value < 20)))  then
               result := result + 'In the context of assisted reproduction however, the total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is high (>19 follicles). This indicates a high risk of excessive ovarian response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
            else
               result := result + 'The total antral follicular count of '+ IntToStr(vTotalAntralFollicles) +' is high (>19 follicles). This indicates a high risk of excessive ovarian response to controlled ovarian stimulation (Martins et al, UOG 2014).  '
           end;
        end;}
      end
      else
      begin
        if not(cbPostMenopausal.checked) then
        result := result + getFollicleString;
      end;
  end
  //----------------------------leading follicles ----------------------------//
       if (cbRightOvaryIdentified.Checked) and (seRightLeadFollicle.Value = 1) then
       begin
          if (cbLeftOvaryIdentified.Checked) and (seLeftLeadFollicle.Value = 1) then
             result := result + 'Single lead follicle in both ovaries.  '
          else
             result := result + 'Single lead follicle in the right ovary.  '
       end
       else
       begin
           if (cbleftOvaryIdentified.Checked)and (seLeftLeadFollicle.Value = 1) then
           begin
               result := result + 'Single lead follicle in left ovary.  '
           end;
       end
       if (cbRightOvaryIdentified.Checked)and ((seRightLeadFollicle.Value)+ (seRightFolCount.Value)= 0) then
       begin
          if (cbLeftOvaryIdentified.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0) then
          begin
            if ((not(cbRightCorpusLuteum.Checked)) and (not(cbLeftCorpusLuteum.Checked ))) then
              result := result + 'Both ovaries were inactive.  '
            else if not(cbRightCorpusLuteum.Checked) then
              result := result + 'Inactive right ovary.  '
            else if not(cbLeftCorpusLuteum.Checked) then
              result := result + 'Inactive left ovary.  '
          end;
          else
          begin
           if not(cbRightCorpusLuteum.Checked) then
            result := result + 'Inactive right ovary.  '
          end

       end
       else
       begin
          if (cbLeftOvaryIdentified.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0) then
          begin
            if not(cbLeftCorpusLuteum.Checked ) then
              result := result + 'Inactive left ovary.  '
          end;
       end;

      if ((cbRightOvaryIdentified.Checked) and (seRightLeadFollicle.Value > 1)) then
      begin
        if ((cbLeftOvaryIdentified.Checked) and (seLeftLeadFollicle.Value > 1)) then
           result := result + 'Leading follicles in both ovaries.  ';
        else
           result := result + 'Leading follicles in the right ovary.  ';
      end
      else
      begin
       if (cbLeftOvaryIdentified.Checked) and (seLeftLeadFollicle.Value > 1)  then
           result := result + 'Leading follicles in the left ovary.  ';
      end

      //---------------- Corpus Letunum --------------------//
      if cbRightCorpusLuteum.Checked then
      begin
        if cbLeftCorpusLuteum.Checked then
        begin
          result := result + 'Evidence of ovulation in both ovaries. ';
          {if ((cbRightCorpusLuteum.Checked) and ((seRightLeadFollicle.Value) + (seRightFolCount.Value) = 0)) then
          begin
             if ((cbLeftCorpusLuteum.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0)) then
                 result := result + 'No antral follicles in the both ovaries.  '
             else
                 result := result + 'No antral follicles in the right ovary.  ';
          end
          else if ((cbLeftCorpusLuteum.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0)) then
             result := result + 'No antral follicles in the left ovary.  '; }
        end
        else
        begin
          result := result + 'Evidence of ovulation in the right ovary. ';
          {if ((cbRightCorpusLuteum.Checked) and ((seRightLeadFollicle.Value) + (seRightFolCount.Value) = 0)) then
          begin
            result := result + 'No antral follicles in the right ovary.  ';
          end;}
        end;
      end
      else
      begin
        if cbLeftCorpusLuteum.Checked then
        begin
          result := result + 'Evidence of ovulation in the left ovary. ';
          { if ((cbLeftCorpusLuteum.Checked) and ((seLeftLeadFollicle.Value) + (seLeftFolCount.Value) = 0)) then
             result := result + 'No antral follicles in the left ovary.  ';}
        end;
      end;

  //---------------ovarian cysts --------------------------//

  if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0) then
  begin
    vCystList := TStringList.Create;
    try
      vCystStr := '';
      for i := 1 to Trunc(seRightOvarianCystsCount.Value) do
      begin
        vCystControl := TAdvTreeComboBox(tsOvaries.Owner).FindComponent('cbRightOvaryCystType' + intToStr(i));
        if assigned(vCystControl) then
        begin
         if (not(vCystControl.selection = 12)) then
         begin
          if vCystList.IndexOf(trim(vCystControl.Text)) < 0 then
          begin
            vCystList.Add(Trim(vCystControl.Text));
            if ((i > 1) and (i=Trunc(seRightOvarianCystsCount.Value))) then
            begin
               if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
               begin
                if vCystStr <> '' then

                  vCystStr := vCystStr + ' and ';
               end;
            end;
            else if((i > 1) and (i<>Trunc(seRightOvarianCystsCount.Value))) then
            begin
              if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then

               vCystStr := vCystStr + ', '
            end;
            if pos('CYST', Uppercase(vCystControl.Text)) > 0 then
            begin
              if (vCystControl.selection = 3) then
                vCystStr := vCystStr + 'Haemorrhagic follicular cyst';
              else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + ' cyst';
              else
              begin
                vCystStr := vCystStr + InitCaps(Trim(copy(vCystControl.Text,1,pos('CYST', Uppercase(vCystControl.Text))-1)), (i > 1));
                vCystStr := vCystStr +' cyst';
              end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
               if not(pos('Haemorrhagic', vCystStr) > 0) then
               begin
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + ' cyst';
               end;
            end;
            else
            begin
              if (not(Trim(vCystControl.Text) = 'Endometrioma')) and (not(Trim(vCystControl.Text) = 'Dermoid plug' )) then
              begin
                vCystStr := vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1)) + ' cyst';
              end;
              else
              begin
                vCystStr :=  vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1));
              end;
            end
          end;
          else if (vCystList.IndexOf(trim(vCystControl.Text)) >= 0 ) then
          begin
            if (vCystControl.selection = 3) then
            begin
                if (pos(UpperCase('Haemorrhagic follicular cyst'),UpperCase(vCystStr)) > 0) then
                  if not(pos(UpperCase('Haemorrhagic follicular cysts'), UpperCase(vCystStr)) > 0) then
                  begin
                    vCystStr :=StringReplace(UpperCase(vCystStr),UpperCase('Haemorrhagic follicular cyst'),UpperCase('Haemorrhagic follicular cysts'))
                    vCystStr := InitCaps(Lowercase(vCystStr), False);
                  end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
              if (pos(UpperCase('Haemorrhagic'), UpperCase(vCystStr)) > 0) then
              begin
                if not(pos(UpperCase('Haemorrhagic cysts'), UpperCase(vCystStr)) > 0) then
                begin
                  vCystStr := StringReplace(uppercase(vCystStr),upperCase('Haemorrhagic cyst'),UpperCase('Haemorrhagic cysts'))
                  vCystStr := InitCaps(Lowercase(vCystStr), False);
                end;
              end;
            end;
           else if not((trim(vCystControl.Text) = 'Endometrioma') or (trim(vCystControl.Text) = 'Dermoid plug' )) then
           begin
              if not((pos('cysts', vCystStr)) > 0) then
                vCystStr  := StringReplace(uppercase(vCystStr),uppercase(trim(vCystControl.Text)+ ' cyst'),uppercase(trim(vCystControl.Text)+ ' cysts')) ;
              vCystStr := InitCaps(Lowercase(vCystStr),False);
           end;
           else if (trim(vCystControl.Text) = 'Endometrioma') then
            vCystList.Add(Trim(vCystControl.Text));
          end;
        end;
       end;
      end;
      vRightEndometriomaCount := 0;

      if vCystList.Count > 0 then
      begin
       for i := 0 to vCystList.Count-1 do
       begin
           if (vCystList[i] = 'Endometrioma') then
             vRightEndometriomaCount :=vRightEndometriomaCount + 1;

       end;
       if vRightEndometriomaCount > 1 then

        begin
          vCystStr  := StringReplace(UpperCase(vCystStr),UpperCase('Endometrioma'),InitCaps(getNumberString(vRightEndometriomaCount),false) + ' endometriomas') ;
          vCystStr := InitCaps(Lowercase(vCystStr), False);
        end;
        vCystStr := vCystStr + ' identified in the right ovary.  '
      end;
      if vCystStr <> '' then
      begin
        if not(pos(' and ',vCystStr)> 0) then
        begin
          if (pos(', ',vCystStr)> 0) then
            vCystStr := StringReplace(vCystStr, ', ', ' and ');
        end;
      end;
      if vCystStr <> '' then
        result := result + vCystStr;
      if (pos('fat only cyst',result)> 0) then
         result :=  StringReplace(result , 'fat only cyst', 'dermoid cyst');
      if (pos('Fat only cyst',result)> 0) then
          result :=  StringReplace(result , 'Fat only cyst', 'Dermoid cyst');
    finally
      if assigned(vCystList) then
        vCystList.Free;

    end;
    vRightEndometriomaCount := 0;
  end;
  if (cbleftOvarianCyst.Checked) and (seleftOvarianCystsCount.Value > 0) then
  begin
    vCystList := TStringList.Create;
    try
      vCystStr := '';
      for i := 1 to Trunc(seleftOvarianCystsCount.Value) do
      begin
        vCystControl := TAdvTreeComboBox(tsOvaries.Owner).FindComponent('cbleftOvaryCystType' + intToStr(i));
        if assigned(vCystControl) then
        begin
         if (not(vCystControl.selection = 12)) then
         begin
          if vCystList.IndexOf(trim(vCystControl.Text)) < 0 then
          begin
            vCystList.Add(Trim(vCystControl.Text));
            if ((i > 1) and (i=Trunc(seleftOvarianCystsCount.Value))) then
            begin
              if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
                vCystStr := vCystStr + ' and ';
            end;
            else if((i > 1) and (i<>Trunc(seleftOvarianCystsCount.Value))) then
            begin
             if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
               vCystStr := vCystStr + ', '
            end;
            if pos('CYST', Uppercase(vCystControl.Text)) > 0 then
            begin
              if (vCystControl.selection = 3) then
                vCystStr := vCystStr + 'Haemorrhagic follicular cyst';
              else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + 'cyst';
              else
              begin
                vCystStr := vCystStr + InitCaps(Trim(copy(vCystControl.Text,1,pos('CYST', Uppercase(vCystControl.Text))-1)), (i > 1));
                vCystStr := vCystStr +' cyst';
              end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
               if not(pos('Haemorrhagic', vCystStr) > 0) then
               begin
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1)) + ' cyst';
               end;
            end;
            else
            begin
              if (not(Trim(vCystControl.Text) = 'Endometrioma')) and (not(Trim(vCystControl.Text) = 'Dermoid plug' )) then
              begin
                vCystStr := vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1)) + ' cyst';
              end;
              else
              begin
                vCystStr :=  vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1));
              end;
            end
          end;
          else if (vCystList.IndexOf(trim(vCystControl.Text)) >= 0 ) then
          begin
            if (vCystControl.selection = 3) then
            begin
                if (pos(UpperCase('Haemorrhagic follicular cyst'),UpperCase(vCystStr)) > 0) then
                  if not(pos(UpperCase('Haemorrhagic follicular cysts'), UpperCase(vCystStr)) > 0) then
                  begin
                    vCystStr :=StringReplace(UpperCase(vCystStr),UpperCase('Haemorrhagic follicular cyst'),UpperCase('Haemorrhagic follicular cysts'))
                    vCystStr := InitCaps(Lowercase(vCystStr), False);
                  end;
            end;
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
              if (pos(UpperCase('Haemorrhagic'), UpperCase(vCystStr)) > 0) then
              begin
                if not(pos(UpperCase('Haemorrhagic cysts'), UpperCase(vCystStr)) > 0) then
                begin
                  vCystStr := StringReplace(uppercase(vCystStr),upperCase('Haemorrhagic cyst'),UpperCase('Haemorrhagic cysts'))
                  vCystStr := InitCaps(Lowercase(vCystStr), False);
                end;
              end;
            end;
           else if not((trim(vCystControl.Text) = 'Endometrioma') or (trim(vCystControl.Text) = 'Dermoid plug' )) then
           begin
              if not((pos('cysts', vCystStr)) > 0) then
                vCystStr  := StringReplace(uppercase(vCystStr),uppercase(trim(vCystControl.Text)+ ' cyst'),uppercase(trim(vCystControl.Text)+ ' cysts')) ;
              vCystStr := InitCaps(Lowercase(vCystStr),False);
           end;
           else if (trim(vCystControl.Text) = 'Endometrioma') then
            vCystList.Add(Trim(vCystControl.Text));
          end;
        end;
       end;
      end;
      vLeftEndometriomaCount := 0;
      if vCystList.Count > 0 then
      begin
       for i := 0 to vCystList.Count-1 do
       begin
           if (vCystList[i] = 'Endometrioma') then
             vLeftEndometriomaCount :=vLeftEndometriomaCount + 1;
       end;
       if vLeftEndometriomaCount > 1 then
        begin
          vCystStr  := StringReplace(uppercase(vCystStr),uppercase('Endometrioma'),InitCaps(getNumberString(vLeftEndometriomaCount),false) + ' endometriomas') ;
           vCystStr := InitCaps(Lowercase(vCystStr), False);
        end;
        vCystStr := vCystStr + ' identified in the left ovary.  '
      end;
      if vCystStr <> '' then
      begin
        if not(pos(' and ',vCystStr)> 0) then
        begin
          if (pos(', ',vCystStr)> 0) then
            vCystStr := StringReplace(vCystStr, ', ', ' and ');
        end;
      end;
      if vCystStr <> '' then
        result := result + vCystStr;
       if (pos('fat only cyst',result)> 0) then
         result :=  StringReplace(result , 'fat only cyst', 'dermoid cyst');
      if (pos('Fat only cyst',result)> 0) then
          result :=  StringReplace(result , 'Fat only cyst', 'Dermoid cyst');
    finally
      vCystList.Free;
    end;
  end;
  {if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0) then
  begin
    vCystList := TStringList.Create;
    try
      vCystStr := '';
      for i := 1 to Trunc(seLeftOvarianCystsCount.Value) do
      begin
        vCystControl := TAdvTreeComboBox(tsOvaries.Owner).FindComponent('cbLeftOvaryCystType' + intToStr(i));
        if assigned(vCystControl) then
        begin
          if vCystList.IndexOf(trim(vCystControl.Text)) < 0 then
          begin
            vCystList.Add(Trim(vCystControl.Text));
            if i > 1 then
              if not((vCystControl.selection > 3) and (vCystControl.selection < 7) and (pos('Haemorrhagic', vCystStr) > 0)) then
                vCystStr := vCystStr + ' and ';
            if pos('CYST', Uppercase(vCystControl.Text)) > 0 then
            begin
              if (vCystControl.selection = 3) then
                vCystStr := vCystStr + 'Haemorrhagic follicular';
              else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
                vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1));
              else
                vCystStr := vCystStr + InitCaps(Trim(copy(vCystControl.Text,1,pos('CYST', Uppercase(vCystControl.Text))-1)), (i > 1));
            end
            else  if ((vCystControl.selection > 3) and (vCystControl.selection < 7)) then
            begin
               if not(pos('Haemorrhagic', vCystStr) > 0) then
                  vCystStr := vCystStr + InitCaps('Haemorrhagic',(i > 1));
            end;
            else
              vCystStr := vCystStr + InitCaps(Trim(vCystControl.Text), (i > 1));
          end;
        end;
      end;
      if vCystList.Count > 0 then
      begin
         if not((vCystStr = 'Endometrioma') or (vCystStr = 'Dermoid plug' )) then
        begin
            vCystStr := vCystStr + ' cyst'
        end;
        if (vCystList.Count > 1) or (seLeftOvarianCystsCount.Value > 1) then
          vCystStr := vCystStr + 's';
        vCystStr := vCystStr + ' identified in the left ovary.  '
      end;
      if vCystStr <> '' then
        result := result + vCystStr;
    finally
      vCystList.Free;
    end;
  end; }
  if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
    begin
       if (cbRightOvaryIdentified.Checked) and (not(cbLeftOvaryIdentified.Checked)) then
         result := result + 'Left ovary not identified.  ';
       if (cbLeftOvaryIdentified.Checked) and (not(cbRightOvaryIdentified.Checked)) then
         result := result + 'Right ovary not identified.  ';
    end;
  if (pos('Other  - go to IOTA',result) > 0 )then
  begin
    result := stringReplace(result , 'Other  - go to IOTA', 'Other')
  end;

end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
 Function GetOvaryConc : string;
begin
  result := '';

  if cbRightOvaryAbnormal.checked then
  begin
     if cbLeftOvaryAbnormal.checked then
       result := result + 'Abnormal ovaries.  ';
     else
       result := result + 'Abnormal right ovary.  ';
  end
  else  if cbLeftOvaryAbnormal.checked then
     result := result + 'Abnormal left ovary.  ';

  if getCervixConclusion <> '' then
    result := result +  getCervixConclusion;

    result := result + getAnatomyConc;
    result := result + getFibroidConc;
end;
```

</details>

---

### getOvaryWarning

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week, pe12week |

**Summary:** Variant A (earlyT1Singleton): 6 lines. Variant B (20week, pe12week): 8 lines. Diff: 4 line(s) removed, 6 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (20week, pe12week)
@@ -1,6 +1,8 @@
-Function getOvaryWarning : Boolean;
+function getOvaryWarning : Boolean
 begin
-  result := FALSE;
-  if ((cbRightOvaryAbnormal.checked) or (cbLeftOvaryAbnormal.checked)) then
-    result := TRUE;
+result := FALSE;
+if (cbLeftOvaryAbNormal.checked) or (cbRightOvaryAbNormal.checked) then
+begin
+   result := TRUE;
+ end;
 end;
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
Function getOvaryWarning : Boolean;
begin
  result := FALSE;
  if ((cbRightOvaryAbnormal.checked) or (cbLeftOvaryAbnormal.checked)) then
    result := TRUE;
end;
```

</details>

<details>
<summary>Variant B (20week, pe12week)</summary>

```pascal
function getOvaryWarning : Boolean
begin
result := FALSE;
if (cbLeftOvaryAbNormal.checked) or (cbRightOvaryAbNormal.checked) then
begin
   result := TRUE;
 end;
end;
```

</details>

---

### GetPerGraph

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | 20week |
| B | pe12week |
| C | t3Singleton, t3twins |

**Summary:** 3 distinct variants with line counts: A=73, B=73, C=82.

Variants A (20week) vs B (pe12week) differ on 2 line(s): L13: `result := 'x[---------|---------]'` vs `result := ' x[---------|---------]'`; L30: `result := 'x[---------|---------]'` vs `result := ' x[---------|---------]'`

Variant A unique strings: ['x[---------|---------]']

Variant B unique strings: [' x[---------|---------]']

Variant C unique strings: [' above 97%', ' below 3%', '#|#+CREDx#/#', '%', 'x']

<details>
<summary>Variant A (20week)</summary>

```pascal
function GetPerGraph(sender : TcxMaskEdit; inShowValue: Boolean): String;
var
  i,inValue: Integer;
  vtempStr : String;
begin
  result := '';
  vtempStr := '';
  if (pos('<',sender.Text) > 0) then
  begin
    vtempStr := StringReplaceAll(sender.Text,' ','');
    if (vtempStr = '<3') then
    begin
      result := 'x[---------|---------]'
    end
  end
  else if (pos('>',sender.Text) > 0) then
  begin
     vtempStr := StringReplaceAll(sender.Text,' ','');
     if (vtempStr = '>97') then
     begin
      result := ' [---------|---------]x';
     end
  end;
  else
  begin
    inValue := StrToFloatDef(sender.Text, 0)
    if inValue > 0 then
    begin
      if inValue < 3 then
        result := 'x[---------|---------]'
      else if inValue < 10 then
        result := ' [x--------|---------]'
      else if inValue < 15 then
        result := ' [-x-------|---------]'
      else if inValue < 20 then
        result := ' [--x------|---------]'
      else if inValue < 25 then
        result := ' [---x-----|---------]'
      else if inValue < 30 then
        result := ' [----x----|---------]'
      else if inValue < 35 then
        result := ' [-----x---|---------]'
      else if inValue < 40 then
        result := ' [------x--|---------]'
      else if inValue < 45 then
        result := ' [-------x-|---------]'
      else if inValue < 50 then
        result := ' [--------x|---------]'
      else if inValue = 50 then
       result := ' [---------x---------]'
      else if inValue > 97 then
        result := ' [---------|---------]x'
      else if inValue > 90 then
        result := ' [---------|--------x]'
      else if inValue > 85 then
        result := ' [---------|-------x-]'
      else if inValue > 80 then
        result := ' [---------|------x--]'
      else if inValue > 75 then
        result := ' [---------|-----x---]'
      else if inValue > 70 then
        result := ' [---------|----x----]'
      else if inValue > 65 then
        result := ' [---------|---x-----]'
      else if inValue > 60 then
        result := ' [---------|--x------]'
      else if inValue > 55 then
        result := ' [---------|-x-------]'
      else if inValue > 50 then
        result := ' [---------|x--------]'
    end;
  end;
end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
function GetPerGraph(sender : TcxMaskEdit; inShowValue: Boolean): String;
var
  i,inValue: Integer;
  vtempStr : String;
begin
  result := '';
  vtempStr := '';
  if (pos('<',sender.Text) > 0) then
  begin
    vtempStr := StringReplaceAll(sender.Text,' ','');
    if (vtempStr = '<3') then
    begin
      result := ' x[---------|---------]'
    end
  end
  else if (pos('>',sender.Text) > 0) then
  begin
     vtempStr := StringReplaceAll(sender.Text,' ','');
     if (vtempStr = '>97') then
     begin
      result := ' [---------|---------]x';
     end
  end;
  else
  begin
    inValue := StrToFloatDef(sender.Text, 0)
    if inValue > 0 then
    begin
      if inValue < 3 then
        result := ' x[---------|---------]'
      else if inValue < 10 then
        result := ' [x--------|---------]'
      else if inValue < 15 then
        result := ' [-x-------|---------]'
      else if inValue < 20 then
        result := ' [--x------|---------]'
      else if inValue < 25 then
        result := ' [---x-----|---------]'
      else if inValue < 30 then
        result := ' [----x----|---------]'
      else if inValue < 35 then
        result := ' [-----x---|---------]'
      else if inValue < 40 then
        result := ' [------x--|---------]'
      else if inValue < 45 then
        result := ' [-------x-|---------]'
      else if inValue < 50 then
        result := ' [--------x|---------]'
      else if inValue = 50 then
       result := ' [---------x---------]'
      else if inValue > 97 then
        result := ' [---------|---------]x'
      else if inValue > 90 then
        result := ' [---------|--------x]'
      else if inValue > 85 then
        result := ' [---------|-------x-]'
      else if inValue > 80 then
        result := ' [---------|------x--]'
      else if inValue > 75 then
        result := ' [---------|-----x---]'
      else if inValue > 70 then
        result := ' [---------|----x----]'
      else if inValue > 65 then
        result := ' [---------|---x-----]'
      else if inValue > 60 then
        result := ' [---------|--x------]'
      else if inValue > 55 then
        result := ' [---------|-x-------]'
      else if inValue > 50 then
        result := ' [---------|x--------]'
    end;
  end;
end;
```

</details>

<details>
<summary>Variant C (t3Singleton, t3twins)</summary>

```pascal
function GetPerGraph(sender : TcxMaskEdit; inShowValue: Boolean): String;
var
  i,inValue: Integer;
  vtempStr : String;
begin
  result := '';
  vtempStr := '';
  if (pos('<',sender.Text) > 0) then
  begin
    vtempStr := StringReplaceAll(sender.Text,' ','');
    if (vtempStr = '<3') then
    begin
      result := 'x[---------|---------]'
      //if inShowValue then
      //  result := result +' below 3%';
      //result := StringReplace(result,'x','#|#+CREDx#/#');
    end
  end
  else if (pos('>',sender.Text) > 0) then
  begin
     vtempStr := StringReplaceAll(sender.Text,' ','');
     if (vtempStr = '>97') then
     begin
      result := ' [---------|---------]x'
     // if inShowValue then
      //  result := result +' above 97%';
      //result := StringReplace(result,'x','#|#+CREDx#/#');
     end
  end;
  else
  begin
    inValue := StrToFloatDef(sender.Text, 0)
    if inValue > 0 then
    begin
      if inValue < 3 then
        result := 'x[---------|---------]'
      else if inValue < 10 then
        result := ' [x--------|---------]'
      else if inValue < 15 then
        result := ' [-x-------|---------]'
      else if inValue < 20 then
        result := ' [--x------|---------]'
      else if inValue < 25 then
        result := ' [---x-----|---------]'
      else if inValue < 30 then
        result := ' [----x----|---------]'
      else if inValue < 35 then
        result := ' [-----x---|---------]'
      else if inValue < 40 then
        result := ' [------x--|---------]'
      else if inValue < 45 then
        result := ' [-------x-|---------]'
      else if inValue < 50 then
        result := ' [--------x|---------]'
      else if inValue = 50 then
       result := ' [---------x---------]'
      else if inValue > 97 then
        result := ' [---------|---------]x'
      else if inValue > 90 then
        result := ' [---------|--------x]'
      else if inValue > 85 then
        result := ' [---------|-------x-]'
      else if inValue > 80 then
        result := ' [---------|------x--]'
      else if inValue > 75 then
        result := ' [---------|-----x---]'
      else if inValue > 70 then
        result := ' [---------|----x----]'
      else if inValue > 65 then
        result := ' [---------|---x-----]'
      else if inValue > 60 then
        result := ' [---------|--x------]'
      else if inValue > 55 then
        result := ' [---------|-x-------]'
      else if inValue > 50 then
        result := ' [---------|x--------]'
      //result := StringReplace(result,'x','#|#+CREDx#/#');
      //if inShowValue then
       // result := result +' '+ IntToStr(round(invalue))+'%';
    end;
  end;
end;
```

</details>

---

### GetPlacenta

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week, t3Singleton |
| B | pe12week |

**Summary:** Variant A (20week, t3Singleton): 5 lines. Variant B (pe12week): 6 lines. Diff: 1 line(s) removed, 2 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (20week, t3Singleton)
+++ Variant B (pe12week)
@@ -3,3 +3,4 @@
 result := '';
-  result := result + lowercase(trim(cbPlacentaSite1.text));
+ if cbPlacentaSite1.text <> '' then
+  result := result + lowercase(trim(cbPlacentaSite1.text)) + 'ly';
 end;
```

<details>
<summary>Variant A (20week, t3Singleton)</summary>

```pascal
function GetPlacenta: String;
begin
result := '';
  result := result + lowercase(trim(cbPlacentaSite1.text));
end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
function GetPlacenta: String;
begin
result := '';
 if cbPlacentaSite1.text <> '' then
  result := result + lowercase(trim(cbPlacentaSite1.text)) + 'ly';
end;
```

</details>

---

### GetPlacenta1Measure

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | 20week |
| B | t3Singleton |
| C | t3twins |

**Summary:** 3 distinct variants with line counts: A=14, B=14, C=14.

Variants A (20week) vs B (t3Singleton) differ on 1 line(s): L5: `result := sePlacentaExtendsBy1.text` vs `result := (sePlacentaExtendsBy1.text)`

Variants A (20week) vs C (t3twins) differ on 2 line(s): L3: `if sePlacentaExtendsBy1.text <> '' then` vs `if sePlacentaExtendsBy1.Value > 0 then`; L5: `result := sePlacentaExtendsBy1.text` vs `result := IntToStr(sePlacentaExtendsBy1.Value)`

Variants B (t3Singleton) vs C (t3twins) differ on 2 line(s): L3: `if sePlacentaExtendsBy1.text <> '' then` vs `if sePlacentaExtendsBy1.Value > 0 then`; L5: `result := (sePlacentaExtendsBy1.text)` vs `result := IntToStr(sePlacentaExtendsBy1.Value)`

Variant A unique strings: ['']

Variant B unique strings: ['']

<details>
<summary>Variant A (20week)</summary>

```pascal
function GetPlacenta1Measure: String;
begin
  if sePlacentaExtendsBy1.text <> '' then
  begin
    result := sePlacentaExtendsBy1.text
  end
  else
  begin
    if strToFloatDef(meInternalOS1.Text, 0) > 0 then
      result := meInternalOS1.Text + 'mm from'
    else
      result := 'at'
  end;
end;
```

</details>

<details>
<summary>Variant B (t3Singleton)</summary>

```pascal
function GetPlacenta1Measure: String;
begin
  if sePlacentaExtendsBy1.text <> '' then
  begin
    result := (sePlacentaExtendsBy1.text)
  end
  else
  begin
    if strToFloatDef(meInternalOS1.Text, 0) > 0 then
      result := meInternalOS1.Text + 'mm from'
    else
      result := 'at'
  end;
end;
```

</details>

<details>
<summary>Variant C (t3twins)</summary>

```pascal
function GetPlacenta1Measure: String;
begin
  if sePlacentaExtendsBy1.Value > 0 then
  begin
    result := IntToStr(sePlacentaExtendsBy1.Value)
  end
  else
  begin
    if strToFloatDef(meInternalOS1.Text, 0) > 0 then
      result := meInternalOS1.Text + 'mm from'
    else
      result := 'at'
  end;
end;
```

</details>

---

### getPlacentaBeyond

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week |
| B | t3Singleton |

**Summary:** Same structure (5 lines), differs on 1 line(s):
  - Line 4: `result := result + 'Placenta is ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';` vs `result := result + 'Placenta was ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';`

**Nature:** Differences in: string literals.

<details>
<summary>Variant A (20week)</summary>

```pascal
 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta is ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
 end;
```

</details>

<details>
<summary>Variant B (t3Singleton)</summary>

```pascal
 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta was ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
 end;
```

</details>

---

### getPlacentaConclusion

**Variant count:** 4

| Variant | Exams |
|---|---|
| A | 20week |
| B | pe12week |
| C | t3Singleton |
| D | t3twins |

**Summary:** 4 distinct variants with line counts: A=29, B=4, C=18, D=8.

Variants have substantially different structure/length, indicating different logic or scope of functionality.

Variant A unique strings: [' from the internal cervical os.  ', ' placenta', ' succenturiate lobe identified.  ', ', ', 'Low lying ']

Variant C unique strings: [' from the internal cervical os.  ', ' placenta', ' with the inferior edge reaching the internal cervical os.  ', ', ', 'Low lying ']

Variant D unique strings: ['Low lying placenta. Review of placental site at 32 weeks is indicated']

<details>
<summary>Variant A (20week)</summary>

```pascal
 Function getPlacentaConclusion : String
 begin
 result := '';
    if cbLowLyingPlacentaYes1.checked then
    begin
       result := result + 'Low lying placenta. Review of placental site at 32 weeks is indicated.';
      {result := result + GetPlacenta + ' placenta';
        if (StrToFloatDef(meInternalOS1.text,0) > 0 ) then
            result := result+', ' + GetPlacenta1Measure + ' from the internal cervical os.  '}
    end;
    if result <> '' then
      result := AddFullStop(result);
   if cbVasaPraeviaYes1.checked then
     result := result + 'Vasa praevia identified.  ';
   else if cbVasaPraeviaNo1.checked then
     result := result + 'No evidence of vasa praevia.  ';
   if cbSuccenturiateLobeYes1.checked then
   begin
     if (cbLowLyingYes11.enabled) and (cbLowLyingYes11.checked) then
     begin
        if (cbSuccentPos1.Enabled) and (cbSuccentPos1.text <> '') then
          result := result + 'Low lying ' + lowercase(cbSuccentPos1.text) + ' succenturiate lobe identified.  '
        else
          result := result + 'Low lying succenturiate lobe identified.  ';
     end
     else
        result := result + 'Succenturiate lobe identified.  ';
   end;
 end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
 Function getPlacentaConclusion : String
 begin
 result := '';
 end;
```

</details>

<details>
<summary>Variant C (t3Singleton)</summary>

```pascal
 Function getPlacentaConclusion : String
 begin
 result := '';
    if cbLowLyingPlacentaYes1.checked then
    begin
       result := result + 'Low lying ';
       result := result + GetPlacenta + ' placenta';
       if meInternalOS1.text <> '' then
       begin
        if (StrToFloatDef(meInternalOS1.text,0) > 0 ) then
            result := result+', ' + GetPlacenta1Measure + ' from the internal cervical os.  '
        else if (StrToFloatDef(meInternalOS1.text,0) = 0 ) then
            result := result + ' with the inferior edge reaching the internal cervical os.  '
       end;
    end;
    if result <> '' then
      result := AddFullStop(result);
 end;
```

</details>

<details>
<summary>Variant D (t3twins)</summary>

```pascal
 Function getPlacentaConclusion : String
 begin
 result := '';
    if (cbLowLyingPlacentaYes1.checked)or (cbLowLyingPlacentaYes2.checked) then
    begin
       result := result + 'Low lying placenta. Review of placental site at 32 weeks is indicated';
    end;
 end;
```

</details>

---

### getPlacentalPosition

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week |
| B | t3Singleton |

**Summary:** Variant A (20week): 33 lines. Variant B (t3Singleton): 35 lines. Diff: 0 line(s) removed, 2 line(s) added.

**Nature:** Changed lines involve: assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (20week)
+++ Variant B (t3Singleton)
@@ -23,2 +23,4 @@
             result := result + 'Leading edge ' + GetPlacenta1Measure + ' the internal cervical os.  '
+          else if (StrToFloatDef(vmeInternalOS.text,0) = 0 ) then
+            result := result + 'The inferior edge reaching the internal cervical os.  '
         end;
```

<details>
<summary>Variant A (20week)</summary>

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
       result := result + ' and low lying.  ';
       GPlacentaWarning := TRUE;
       if vmeInternalOS.text <> '' then
        begin
          if (StrToFloatDef(vmeInternalOS.text,0) > 0 ) then
            result := result + 'Leading edge ' + GetPlacenta1Measure + ' the internal cervical os.  '
        end;
    end
    else if vLowLyingNo.checked then
    begin
        result := result + ' and not low lying.  ';
        GPlacentaWarning := False;
    end;
  end
  result := AddFullStop(Result);
 end;
```

</details>

<details>
<summary>Variant B (t3Singleton)</summary>

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
       result := result + ' and low lying.  ';
       GPlacentaWarning := TRUE;
       if vmeInternalOS.text <> '' then
        begin
          if (StrToFloatDef(vmeInternalOS.text,0) > 0 ) then
            result := result + 'Leading edge ' + GetPlacenta1Measure + ' the internal cervical os.  '
          else if (StrToFloatDef(vmeInternalOS.text,0) = 0 ) then
            result := result + 'The inferior edge reaching the internal cervical os.  '
        end;
    end
    else if vLowLyingNo.checked then
    begin
        result := result + ' and not low lying.  ';
        GPlacentaWarning := False;
    end;
  end
  result := AddFullStop(Result);
 end;
```

</details>

---

### getReportHeading

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | 20week |
| B | pe12week |

**Summary:** Same structure (13 lines), differs on 3 line(s):
  - Line 4: `if (cxccbReferralIndication.states[2] = 1) then` vs `if (cxccbReferralIndication.states[5] = 1) then`
  - Line 6: `if (cxccbReferralIndication.states[0] = 1) then` vs `if (cxccbReferralIndication.states[8] = 1) then`
  - Line 11: `if (cxccbReferralIndication.states[3] = 1) then` vs `if (cxccbReferralIndication.states[6] = 1) then`

**Nature:** Differences in: numeric values.

<details>
<summary>Variant A (20week)</summary>

```pascal
 function getReportHeading : String
 begin
   result := '';
   if (cxccbReferralIndication.states[2] = 1) then
   begin
     if (cxccbReferralIndication.states[0] = 1) then
        result := 'Second Trimester Ultrasound and Aminiocentesis'
     else if (cxccbReferralIndication.states[1] = 1) then
         result := 'Early Second Trimester Ultrasound and Aminiocentesis'
   end
   if (cxccbReferralIndication.states[3] = 1) then
       result := 'Second Trimester Ultrasound Report'
 end;
```

</details>

<details>
<summary>Variant B (pe12week)</summary>

```pascal
 function getReportHeading : String
 begin
   result := '';
   if (cxccbReferralIndication.states[5] = 1) then
   begin
     if (cxccbReferralIndication.states[8] = 1) then
        result := 'Second Trimester Ultrasound and Aminiocentesis'
     else if (cxccbReferralIndication.states[1] = 1) then
         result := 'Early Second Trimester Ultrasound and Aminiocentesis'
   end
   if (cxccbReferralIndication.states[6] = 1) then
       result := 'Second Trimester Ultrasound Report'
 end;
```

</details>

---

### GetSingleFibroid

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins |
| B | gynae |

**Summary:** Variant A (earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins): 10 lines. Variant B (gynae): 7 lines. Diff: 7 line(s) removed, 4 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins)
+++ Variant B (gynae)
@@ -2,9 +2,6 @@
 begin
-result := '';
-  result := cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
-  if cbFibroidsLeftRight1.ItemIndex > 0 then
-    result := InitCaps(cbFibroidsLeftRight1.Text, True) + ' ' + result;
-
-  if result <> '' then
-    result := ' ' + result;
+  result := '';
+  if cbFibroidsLeftRight1.Text <> '' then
+    result := InitCaps(cbFibroidsLeftRight1.Text, true) + ' ';
+  result := result + cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
 end;
```

<details>
<summary>Variant A (earlyT1Singleton, 20week, pe12week, t3Singleton, t3twins)</summary>

```pascal
function GetSingleFibroid: string;
begin
result := '';
  result := cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
  if cbFibroidsLeftRight1.ItemIndex > 0 then
    result := InitCaps(cbFibroidsLeftRight1.Text, True) + ' ' + result;

  if result <> '' then
    result := ' ' + result;
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

```pascal
function GetSingleFibroid: string;
begin
  result := '';
  if cbFibroidsLeftRight1.Text <> '' then
    result := InitCaps(cbFibroidsLeftRight1.Text, true) + ' ';
  result := result + cbFibriodPosition1.Text + ' ' + cbFibroidsType1.Text;
end;
```

</details>

---

### GetSingleFibroidCavity

**Variant count:** 2

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | gynae |

**Summary:** Variant A (earlyT1Singleton): 27 lines. Variant B (gynae): 30 lines. Diff: 2 line(s) removed, 5 line(s) added.

**Nature:** Changed lines involve: UI control references, assignments, conditional logic, string literals.

**Example output difference:**
```diff
--- Variant A (earlyT1Singleton)
+++ Variant B (gynae)
@@ -3,3 +3,5 @@
   vControl2: TWinControl;
+  vCombo: TcxComboBox;
   v1, v2, v3: TcxComboBox;
+  i: Integer;
 begin
@@ -9,5 +11,6 @@
     vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
+    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
     if assigned(vControl2) then
     begin
-      if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
+      if ((TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled)) and (vCombo.ItemIndex <> 2) then
       begin
@@ -17,3 +20,3 @@
         if (assigned(v1)) and (TcxComboBox(v1).text <> '') then
-          result := result + Trim(TcxComboBox(v1).text) + ' ';
+          result := result + InitCaps(Trim(TcxComboBox(v1).text), true) + ' ';
         if (assigned(v2)) and (TcxComboBox(v2).text <> '') then
```

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetSingleFibroidCavity: string;
var
  vControl2: TWinControl;
  v1, v2, v3: TcxComboBox;
begin
  result := '';
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if (TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled) then
      begin
        v1 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
        v2 := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
        v3 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if (assigned(v1)) and (TcxComboBox(v1).text <> '') then
          result := result + Trim(TcxComboBox(v1).text) + ' ';
        if (assigned(v2)) and (TcxComboBox(v2).text <> '') then
          result := result + Trim(TcxComboBox(v2).text) + ' ';
        if (assigned(v3)) and (TcxComboBox(v3).text <> '') then
          result := result + Trim(TcxComboBox(v3).text) + ' ';
        break;
      end;
    end;
  end;
end;
```

</details>

<details>
<summary>Variant B (gynae)</summary>

```pascal
function GetSingleFibroidCavity: string;
var
  vControl2: TWinControl;
  vCombo: TcxComboBox;
  v1, v2, v3: TcxComboBox;
  i: Integer;
begin
  result := '';
  for i := 0 to spFibroidCount.Value - 1 do
  begin
    vControl2 := TWinControl(tsFibroids.Owner).FindComponent('cbCavityDistortion' + intToStr(i + 1));
    vCombo := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
    if assigned(vControl2) then
    begin
      if ((TcxCheckBox(vControl2).Checked) and (TcxCheckBox(vControl2).Enabled)) and (vCombo.ItemIndex <> 2) then
      begin
        v1 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsLeftRight' + intToStr(i + 1));
        v2 := TWinControl(tsFibroids.Owner).FindComponent('cbFibriodPosition' + intToStr(i + 1));
        v3 := TWinControl(tsFibroids.Owner).FindComponent('cbFibroidsType' + intToStr(i + 1));
        if (assigned(v1)) and (TcxComboBox(v1).text <> '') then
          result := result + InitCaps(Trim(TcxComboBox(v1).text), true) + ' ';
        if (assigned(v2)) and (TcxComboBox(v2).text <> '') then
          result := result + Trim(TcxComboBox(v2).text) + ' ';
        if (assigned(v3)) and (TcxComboBox(v3).text <> '') then
          result := result + Trim(TcxComboBox(v3).text) + ' ';
        break;
      end;
    end;
  end;
end;
```

</details>

---

### GetSingleFibroidDimensions

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week, pe12week, t3Singleton, t3twins |
| C | gynae |

**Summary:** 3 distinct variants with line counts: A=32, B=31, C=46.

Variants have substantially different structure/length, indicating different logic or scope of functionality.

Variant A unique strings: ['%d x %d x %dmm', '%d x %d x %dmm (vol. %3.1f cc)', '%d x %dmm', '%dmm']

Variant B unique strings: ['%d x %d x %dmm', '%d x %d x %dmm (vol. %dcc)', '%d x %dmm', '%dmm']

Variant C unique strings: [' and measured ', ' appeared to project ', ' was visualised', ' with associated cavity distortion', '. There was no associated distortion of the endometrial cavity contour']

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
function GetSingleFibroidDimensions: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value * 10) / 10;
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + format('%d x %d x %dmm (vol. %3.1f cc)', [v1, v2, v3, v4]);
        end
        else
          result := result + format('%d x %d x %dmm', [v1, v2, v3]);
      end
      else
        result := result + format('%d x %dmm', [v1, v2]);
    end
    else
      result := result + format('%dmm', [v1]);
  end;
  if result <> '' then
    result := ' ' + result;
end;
```

</details>

<details>
<summary>Variant B (20week, pe12week, t3Singleton, t3twins)</summary>

```pascal
 function GetSingleFibroidDimensions: string;
var
  v1, v2, v3,v4: Integer;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value);
  if v1 > 0 then
  begin
    if v2 > 0 then
    begin
      if v3 > 0 then
      begin
        if v4 > 0 then
        begin
          result := result + format('%d x %d x %dmm (vol. %dcc)', [v1, v2, v3, v4]);
        end
        else
          result := result + format('%d x %d x %dmm', [v1, v2, v3]);
      end
      else
        result := result + format('%d x %dmm', [v1, v2]);
    end
    else
      result := result + format('%dmm', [v1]);
  end;
  if result <> '' then
    result := ' ' + result;
end;
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
function GetSingleFibroidDimensions: string;
var
  v1, v2, v3: Integer;
  v4: Double;
begin
  result := '';
  v1 := trunc(edtFibroidLength1.Value);
  v2 := trunc(edtFibroidWidth1.Value);
  v3 := trunc(edtFibroiddepth1.Value);
  v4 := trunc(edtFibroidVolume1.Value * 10) / 10;
   if (not(cbCavityDistortion1.Caption = 'Cavity projection')) or
      ((cbCavityDistortion1.Caption = 'Cavity projection') and not(cbCavityDistortion1.checked))then
     result := result + 'was visualised';
  if (GetIntegerMeasuredString(v1, v2, v3, v4, 'mm') <> '') and not((cbFibroidsType1.ItemIndex = 2))then
  begin
   result := result + ' and measured ';
   result :=  result + GetIntegerMeasuredString(v1, v2, v3, v4, 'mm');
  end;
  else if (GetIntegerMeasuredString(v1, v2, v3, v4, 'mm') <> '') and ((cbFibroidsType1.ItemIndex = 2))then
  begin
   result := result + 'measuring ';
   result :=  result + GetIntegerMeasuredString(v1, v2, v3, v4, 'mm');
  end;
  if (cbCavityDistortion1.Enabled) and  (cbCavityDistortion1.Caption = 'Cavity distortion') and (cbFibroidsType1.ItemIndex = 0)then
  begin
    if (cbCavityDistortion1.Checked) then
      result := result + ' with associated cavity distortion'
    else
      result := result + '. There was no associated distortion of the endometrial cavity contour';
  end
  else if (cbCavityDistortion1.Enabled) and  (cbCavityDistortion1.Caption = 'Cavity projection') and (cbFibroidsType1.ItemIndex = 2)then
  begin
      if (cbCavityDistortion1.Checked) then
      begin
         result :=  result + ' was visualised';
         result := result + ' appeared to project '
         if cbProjection1.text <> '' then
         begin
          result := result + cbProjection1.text + ' ';
         end
         result := result + 'into the cavity';
      end
  end;
  else
    result := result + '';
end;
```

</details>

---

### InitializeScreen

**Variant count:** 6

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | gynae |
| D | pe12week |
| E | t3Singleton |
| F | t3twins |

**Summary:** Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and validation logic. Line counts: earlyT1Singleton=23, 20week=21, gynae=15, pe12week=25, t3Singleton=18, t3twins=18.

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant D (pe12week)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant E (t3Singleton)</summary>

```pascal
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
  cbGestationType.ItemIndex := 1;
  cbGestationTypeChange(nil);
  spFibroidCountOnChange(nil);

end;
```

</details>

<details>
<summary>Variant F (t3twins)</summary>

```pascal
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
```

</details>

---

### ProduceMergeFieldData

**Variant count:** 6

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | gynae |
| D | pe12week |
| E | t3Singleton |
| F | t3twins |

**Summary:** Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and validation logic. Line counts: earlyT1Singleton=101, 20week=87, gynae=135, pe12week=142, t3Singleton=135, t3twins=266.

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Clear;
  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetClinicalHistory +'''');

  //--------------------No Dates--------------------------
   if cbEDDPrinciple.ItemIndex = 1 then // No Dates
   begin
       lbMergeDataMergeFields.Items.Add('Nodates=''');
       lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''');
       lbMergeDataMergeFields.Items.Add('Expected_Gestation=''');
   end;
   else
   begin
      lbMergeDataMergeFields.Items.Add('Nodates=''');
      if not(cbPregnancyRedatedYes.checked) then
      begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''#|#+BOLDExpected EDD:#/#''');
      end
      else
      begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''Expected EDD:''');
      end
      lbMergeDataMergeFields.Items.Add('Expected_Gestation='''#13#10 + 'Expected Gestation:''');
   end;
 // ------------------Other EDD-----------------------------
  if GetEnteredEDD <> '' then
     lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');
  else
     lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

   if (deMenstrualEDD.Date > 0) then
     lbMergeDataMergeFields.Items.Add('EDD_from_LMP='''+  FormatDateTime('dd/mm/yyyy', deMenstrualEDD.Date)   +'''');
  else
     lbMergeDataMergeFields.Items.Add('EDD_from_LMP=''');

  //-----------------  Entered EDD ----------//
  lbMergeDataMergeFields.Items.Add('GA_from_Entered_EDD='''+  getGAFromEnteredEDD   +'''');

   //----------------- Composite US  EDD ----------//
  lbMergeDataMergeFields.Items.Add('Composite_Ultrasound_Age='''+  intToStr(seUSSEDDGAWeeks1.value)   +' weeks''');
  if seSSEDDGADays1.value >= 0 then
  begin
    if seSSEDDGADays1.value = 1 then
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' day''');
    else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' days''');
  end
  else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD=''');
  //------------------Average US EDD ---------------------//
  if cbPregnancyRedatedYes.checked then
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''#|#+BOLDUltrasound EDD:#/#''');
  end
  else
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''Ultrasound EDD:''');
  end
  if (deUSSEDD1.Date > 0) then
  begin
     if cbPregnancyRedatedYes.checked then
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age=''#|#+BOLD'+  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'#/#''');
     else
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age='''#9 +  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'''');
  end
  else
    ShowMessage('Please Enter USS EDD');

  //----------------------Findings ----------------------//

    lbMergeDataMergeFields.Items.Add('Findings='''+ GetFindings +'''');

  //----------------------Biometry------------------------//
    lbMergeDataMergeFields.Items.Add('Crown_Rump_Length='''+ edtEmbroSize1.text +'mm''');
    lbMergeDataMergeFields.Items.Add('Gestational_Sac_Diameter='''+ edtSacAvg1.text +'mm''');
    if cbYolkSacYes1.checked then
    begin
      if strToFloatdef(edtYolkSacSize1.text,0) > 0 then
         lbMergeDataMergeFields.Items.Add('Yolk_Sac=''seen''');
    end
    else if cbYolkSacNo1.checked then
    begin
       lbMergeDataMergeFields.Items.Add('Yolk_Sac=''not seen''');
    end;
    else
       lbMergeDataMergeFields.Items.Add('Yolk_Sac=''##''');

    lbMergeDataMergeFields.Items.Add('Fetal_Heart_Rate='''+ getFetalHeartRate +'''');
    lbMergeDataMergeFields.Items.Add('HeartRateLabel='''+ getHeartRateLabel+'''');
    lbMergeDataMergeFields.Items.Add('Ovaries='''+ getOvary +'''');

    lbMergeDataMergeFields.Items.Add('PregnancyComplication='''+ getPregnancyComplication +'''');
    lbMergeDataMergeFields.Items.Add('PerigestationalHaemorrhage='''+ getPerigestationalHaemorrhage +'''');
    lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');
    lbMergeDataMergeFields.Items.Add('Conclusion='''+ getConclusion +'''');
    lbMergeDataMergeFields.Items.Add('NIPSConclusion='''+ getNIPSConclusion +'''');
     lbMergeDataMergeFields.Items.Add('NIPS='''+ getNIPSString +'''');

end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
procedure ProduceMergeFieldData;
var
  v1: String;
begin
  GAnatomyWarning := False;
  GFibroidWarning := False;
    // ---------------Gestation Details--------------------------------- //
  lbMergeDataMergeFields.Items.Clear;
  if GetEnteredEDD <> '' then
     lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');
  else
     lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

   //-----------------  Entered EDD ----------//
  lbMergeDataMergeFields.Items.Add('GA_from_Entered_EDD='''+  getGAFromEnteredEDD   +'''');

   //----------------- Composite US  EDD ----------//
  lbMergeDataMergeFields.Items.Add('Composite_Ultrasound_Age='''+  intToStr(seUSSEDDGAWeeks1.value)   +' weeks''');
  if seSSEDDGADays1.value >= 0 then
  begin
    if seSSEDDGADays1.value = 1 then
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' day''');
    else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' days''');
  end
  else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD=''');

  lbMergeDataMergeFields.Items.Add('BPD1='''+  PadDecimalPlaces(edtBPD1.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD1=''' +  PadDecimalPlaces(edtOFD1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC1='''   + PadDecimalPlaces(edtHC1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC1='''  +  PadDecimalPlaces(edtAC1.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL1='''  +  PadDecimalPlaces(edtFL1.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL1='''  +  PadDecimalPlaces(edtHL1.Text)     +'cm''');

    lbMergeDataMergeFields.Items.Add('BPDPer1='''+   GetPerGraph(edtBPDPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer1=''' +  GetPerGraph(edtOFDPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer1='''   +  GetPerGraph(edtHCPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer1='''  +   GetPerGraph(edtACPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer1='''  +  GetPerGraph(edtFLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer1='''  +  GetPerGraph(edtHLPer1, True)     +'''');

  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetObstetricHistory +'''');
  lbMergeDataMergeFields.Items.Add('AneuploidyRisk=''' +   GetAneuploidyRisk    +'''');

   if (cbLowLyingPlacentaNo1.checked) and (not (getPlacentalChecks)) then
     lbMergeDataMergeFields.Items.Add('Placenta=''' +   getPlacentaString    +'''');
   else
     lbMergeDataMergeFields.Items.Add('Placenta=''''');

   if (cbLowLyingPlacentaYes1.checked) or (getPlacentalChecks) then
    lbMergeDataMergeFields.Items.Add('LowLyingPlacenta=''' +   getLowLyingPlacentaString    +'''');
   else
    lbMergeDataMergeFields.Items.Add('LowLyingPlacenta=''''');

  if (sePlacentaExtendsBy1.text <> '') then
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentaBeyond(1) +'''');
  else
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentalPosition(1) +'''');

    lbMergeDataMergeFields.Items.Add('PlacentalSite='''+ GetPlacentalSite +'''');

    lbMergeDataMergeFields.Items.Add('Ovary='''+ getOvary +'''');
    lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervixDetailed + '''');
  {if not(cbPatientInformedYes.checked) and (not((cbConsistentNIPTYes1.checked) or (cbConsistentNIPTNo1.checked))) then
    lbMergeDataMergeFields.Items.Add('Gender=''')
  else }
  if getGender <> '' then
  begin
    lbMergeDataMergeFields.Items.Add('Gender='''+ getGender + '''');
  end
  else
     lbMergeDataMergeFields.Items.Add('Gender=''');
  lbMergeDataMergeFields.Items.Add('Anatomy='''+ getAnatomy + '''');
  lbMergeDataMergeFields.Items.Add('ReportHeading='''+ getReportHeading + '''');

     lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
     lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

     lbMergeDataMergeFields.Items.Add('AnatomyConclusion='''+ getAnatomyConclusion + '''');

     lbMergeDataMergeFields.Items.Add('AbnormalConclusion='''+ getAbnormalConclusion + '''');
end;
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
procedure ProduceMergeFieldData;
begin
  lbMergeDataMergeFields.Items.Clear;
  // ---------------Header Merge Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('ExaminationDate="' + FormatDateTime('dd mmm yyyy', deExamDate.Date) + '"');
  lbMergeDataMergeFields.Items.Add('ReferalIndications="' + GetReferalIndications + '"');
  lbMergeDataMergeFields.Items.Add('Menses="' + GetMenses + '"');
  lbMergeDataMergeFields.Items.Add('GynaecologicalHistory="' + GetGynaecologicalHistory + '"');
  lbMergeDataMergeFields.Items.Add('GynaecologicalSurgery="' + GetGynaecologicalSurgery + '"');
  lbMergeDataMergeFields.Items.Add('FamilyHistory="' + GetFamilyHistory + '"');
  lbMergeDataMergeFields.Items.Add('LMPString="' + GetLMPString + '"');
  lbMergeDataMergeFields.Items.Add('Cycledays="' + GetCycledaysString + '"');
  lbMergeDataMergeFields.Items.Add('StartCycleDay="' + IntToStr(spStartDay.value) + '"');
  lbMergeDataMergeFields.Items.Add('EndCycleDay="' + GetEndCycleDays + '"');
  lbMergeDataMergeFields.Items.Add('Medication="' + GetMedication + '"');

  // ---------------Report Main Merge Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('UterusType="' + GetUterusType + '"');
  lbMergeDataMergeFields.Items.Add('UterusMeasurement="' + GetUterusMeasurement + '"');
  lbMergeDataMergeFields.Items.Add('EndometriumSize="' + GetEndometriumSize + '"'); //
  lbMergeDataMergeFields.Items.Add('EndometriumType="' + getEndometriumType + '"');
  if sePolypCount.value = 1 then
     lbMergeDataMergeFields.Items.Add('EndometrialPolyp="' + GetEndometrialPolyp + '"');
  else if sePolypCount > 1 then
     lbMergeDataMergeFields.Items.Add('EndometrialPolyp="' + GetMultipleEndometrialPolypString + '"');
  lbMergeDataMergeFields.Items.Add('EndometrialLesion="' + getEndometrialLesion + '"');
  lbMergeDataMergeFields.Items.Add('IUCDPlacement="' + GetIUCDPlacement(false) + '"');
  lbMergeDataMergeFields.Items.Add('UterusAppearance="' + GetUterusAppearance + '"');
 { lbMergeDataMergeFields.Items.Add('CervicalLength="' + intToStr(seCervicalLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('UterineCavityLength="' + intToStr(seUterineCavityLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('RightUterineCavityLength="' + intToStr(seRightUterineCavityLength.Value) + '"'); }
  lbMergeDataMergeFields.Items.Add('SeptumLength="' + GetSeptumLengthString + '"');
  lbMergeDataMergeFields.Items.Add('CervixAppearance="' + GetCervixAppearance + '"');
  //lbMergeDataMergeFields.Items.Add('RightCervixMeasurement="' + intToStr(spRightCerivalLength.Value) + '"');
  lbMergeDataMergeFields.Items.Add('AdenomysisType="' + GetIncVasAndVenBlind + '"');
  lbMergeDataMergeFields.Items.Add('AnteriorAPMeasure="' + intToStr(spAPAnterior.Value) + '"');
  lbMergeDataMergeFields.Items.Add('PosteriorAPMeasure="' + intToStr(spAPPosterior.Value) + '"');
  lbMergeDataMergeFields.Items.Add('HysterectomyString="' + GetHysterectomyString + '"');
  lbMergeDataMergeFields.Items.Add('GetBulkyUterus="' + GetGetBulkyUterus + '"');
  lbMergeDataMergeFields.Items.Add('LargerMyometrium="' + GetLargerMyometrium + '"');

  // ---------------Fibroids Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('SingleFibroidDimensions="' + GetSingleFibroidDimensions + '"');
  lbMergeDataMergeFields.Items.Add('SingleFibroid="' + GetSingleFibroid + '"');

  lbMergeDataMergeFields.Items.Add('FibroidCount="' + GetFibroidCount + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid1="' + GetFibroidDesc(1) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid2="' + GetFibroidDesc(2) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid3="' + GetFibroidDesc(3) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid4="' + GetFibroidDesc(4) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid5="' + GetFibroidDesc(5) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid6="' + GetFibroidDesc(6) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid7="' + GetFibroidDesc(7) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid8="' + GetFibroidDesc(8) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid9="' + GetFibroidDesc(9) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid10="' + GetFibroidDesc(10) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid11="' + GetFibroidDesc(11) + '"');
  lbMergeDataMergeFields.Items.Add('Fibroid12="' + GetFibroidDesc(12) + '"');
  lbMergeDataMergeFields.Items.Add('SingleFibroidCavity="' + GetSingleFibroidCavity + '"');
  lbMergeDataMergeFields.Items.Add('CavityProjection="' + GetCavProjectionString + '"');

  // ---------------Ovary Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('OvaryOverview="' + GetOvaryOverview + '"');

  lbMergeDataMergeFields.Items.Add('NeitherOvaryIdentified="' + GetNeitherOvaryIdentifiedString + '"');
  lbMergeDataMergeFields.Items.Add('RightOvary="' + GetRightOvary + '"');
  lbMergeDataMergeFields.Items.Add('RightOvaryAppearance="' + GetRightOvaryAppearance + '"');
  lbMergeDataMergeFields.Items.Add('RightOvaryCystDesc="' + GetRightOvaryCyst + '"');

  lbMergeDataMergeFields.Items.Add('LeftOvary="' + GetLeftOvary + '"');
  lbMergeDataMergeFields.Items.Add('LeftOvaryAppearance="' + GetLeftOvaryAppearance + '"');
  lbMergeDataMergeFields.Items.Add('LeftOvaryCystDesc="' + GetLeftOvaryCyst + '"');

  if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1) then
  begin
    lbMergeDataMergeFields.Items.Add('NumberOfCysts="' + Format('%s cysts were visualised in this ovary:',[InitCaps(getNumberString(seRightOvarianCystsCount.Value), False)]) + '"');
  end;
  if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1) then
  begin
    lbMergeDataMergeFields.Items.Add('NumberOfCystsL="' + Format('%s cysts were visualised in this ovary:',[InitCaps(getNumberString(seLeftOvarianCystsCount.Value), False)]) + '"');
  end;

   //----------------------IOTA RIGHT OVARY-------------------------------//
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAClassification="' + GetOvaryIOTAClassification('right') + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTACystWall="' + GetRightOvaryIOTACystWall + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAInternalContents="' + GetRightOvaryIOTAInternalContents + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTASolidElements="' + GetRightOvaryIOTASolidElements + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAVascularity="' + GetRightOvaryIOTAVascularity + '"');
   {lbMergeDataMergeFields.Items.Add('RightOvaryIOTAFreeFluid="' + GetRightOvaryIOTAFreeFluid + '"');}
   lbMergeDataMergeFields.Items.Add('RightOvaryAscites="' + GetRightOvaryIOTAAscites + '"');
   lbMergeDataMergeFields.Items.Add('RightOvaryIOTAAppearance="' + GetRightOvaryIOTAAppearance + '"');
   {lbMergeDataMergeFields.Items.Add('RightOvaryIOTASeptum="' + GetRightOvaryIOTASeptum + '"');}

   //----------------------IOTA Left OVARY-------------------------------//
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAClassification="' + GetOvaryIOTAClassification('left') + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTACystWall="' + GetLeftOvaryIOTACystWall + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAInternalContents="' + GetLeftOvaryIOTAInternalContents + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTASolidElements="' + GetLeftOvaryIOTASolidElements + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAVascularity="' + GetLeftOvaryIOTAVascularity + '"');
   {lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAFreeFluid="' + GetLeftOvaryIOTAFreeFluid + '"');}
   lbMergeDataMergeFields.Items.Add('LeftOvaryAscites="' + GetLeftOvaryIOTAAscites + '"');
   lbMergeDataMergeFields.Items.Add('LeftOvaryIOTAAppearance="' + GetLeftOvaryIOTAAppearance + '"');
   {lbMergeDataMergeFields.Items.Add('LeftOvaryIOTASeptum="' + GetLeftOvaryIOTASeptum + '"');}

  // ---------------Pelvis Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('Adnexal="' + GetAdnexalDesc + '"');
  lbMergeDataMergeFields.Items.Add('PODMeasurement="' + IntToStr(Trunc(sePODDepth.Value)) + '"');
  if (cbBladderNormal.Checked) then
    lbMergeDataMergeFields.Items.Add('BladderAppearance="normal"')
  else
    lbMergeDataMergeFields.Items.Add('BladderAppearance="abnormal"');
  lbMergeDataMergeFields.Items.Add('KidneyAppearance="' + GetKidneyAppearance + '"');

  lbMergeDataMergeFields.Items.Add('AsceticDrainageAmout="' + FloatToStr(seAscitesDrainage.Value) + '"');
  lbMergeDataMergeFields.Items.Add('LeftDrainageAmount="' + FloatToStr(seLeftOvarianCystAspiration.Value) + '"');
  lbMergeDataMergeFields.Items.Add('RightDrainageAmount="' + FloatToStr(seRightOvarianCystAspiration.Value) + '"');

  // ---------------Conclusion Fields--------------------------------- //
  lbMergeDataMergeFields.Items.Add('UterusConclusion="' + GetUterusConclusion + '"');
  lbMergeDataMergeFields.Items.Add('EndometriumConc="' + GetEndometriumConc + '"');
  lbMergeDataMergeFields.Items.Add('PolpConc="' + GetPolpConc + '"');
    lbMergeDataMergeFields.Items.Add('CervicalPolypConc="' + GetCervicalPolypConc + '"');
  lbMergeDataMergeFields.Items.Add('OvaryConc="' + GetOvaryConc + '"');
  lbMergeDataMergeFields.Items.Add('AdnexalConc="' + GetAdnexalConc + '"');
  lbMergeDataMergeFields.Items.Add('ProcedureConc="' + GetProcedureConc + '"');
   if ((cbRightOvarianCyst.checked) and ((cbRightOvaryCystType1.enabled and cbRightOvaryCystType1.selection = 12) or
     (cbRightOvaryCystType2.enabled and cbRightOvaryCystType2.selection = 12) or
     (cbRightOvaryCystType3.enabled and cbRightOvaryCystType3.selection = 12))) or
     ((cbLeftOvaryCystType1.enabled and cbLeftOvaryCystType1.selection = 12) or
     (cbLeftOvaryCystType2.enabled and cbLeftOvaryCystType2.selection = 12) or
     (cbLeftOvaryCystType3.enabled and cbLeftOvaryCystType3.selection = 12))then
      lbMergeDataMergeFields.Items.Add('IOTAConc="' + GetIOTAConc + '"');
   else
     lbMergeDataMergeFields.Items.Add('IOTAConc=''');
end;
```

</details>

<details>
<summary>Variant D (pe12week)</summary>

```pascal
procedure ProduceMergeFieldData;
var
  v1: String;
begin
  GAnatomyWarning := False;
  GFibroidWarning := False;
    // ---------------Gestation Details--------------------------------- //
  lbMergeDataMergeFields.Items.Clear;
  if not(cbPregnancyRedatedYes.checked) then
  begin
    lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''#|#+BOLDExpected EDD:#/#''');
  end
  else
  begin
        lbMergeDataMergeFields.Items.Add('EXPECTEDEDDCAPTION=''Expected EDD:''');
  end
  if GetEnteredEDD <> '' then
     lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  GetEnteredEDD   +'''');
  else
     lbMergeDataMergeFields.Items.Add('Entered_EDD=''');

   //-----------------  Entered EDD ----------//
  lbMergeDataMergeFields.Items.Add('GA_from_Entered_EDD='''+  getGAFromEnteredEDD   +'''');

   //----------------- Composite US  EDD ----------//
  lbMergeDataMergeFields.Items.Add('Composite_Ultrasound_Age='''+  intToStr(seUSSEDDGAWeeks1.value)   +' weeks ''');
  if seSSEDDGADays1.value > 0 then
  begin
    if seSSEDDGADays1.value > 1 then
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' days''');
    else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seSSEDDGADays1.value)   +' day''');
  end
  else
     lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD=''');

   //------------------Average US EDD ---------------------//
  if cbPregnancyRedatedYes.checked then
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''#|#+BOLDUltrasound EDD:#/#''');
  end
  else
  begin
    lbMergeDataMergeFields.Items.Add('USSEDDCAPTION=''Ultrasound EDD:''');
  end

  if (deUSSEDD1.Date > 0) then
  begin
   if cbPregnancyRedatedYes.checked then
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age=''#|#+BOLD'+  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'#/#''');
     else
      lbMergeDataMergeFields.Items.Add('EDD_from_average_ultrasound_age='''#9 +  FormatDateTime('dd/mm/yyyy', deUSSEDD1.Date)   +'''');
  end;

  lbMergeDataMergeFields.Items.Add('BPD_T1mm='''+  getBPD   +'mm''');
  lbMergeDataMergeFields.Items.Add('Crown_Rump_Length='''+ getCRL +'mm''');

  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ClinicalHistory='''+ GetObstetricHistory +'''');

  if (edNucTransMeasurement1.text <> '') then
  begin
     if StrToFloatDef(edNucTransMeasurement1.text,0.0) > 0 then
       lbMergeDataMergeFields.Items.Add('NT='''+ edNucTransMeasurement1.text +'''');
     else
       lbMergeDataMergeFields.Items.Add('NT=''##''');
  end;

  lbMergeDataMergeFields.Items.Add('Placenta='''+ GetPlacenta +'''');
  lbMergeDataMergeFields.Items.Add('NasalBone='''+ GetNasalBone +'''');

  lbMergeDataMergeFields.Items.Add('Ovaries='''+ getOvary +'''');
  lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervixDetailed + '''');

  lbMergeDataMergeFields.Items.Add('liquor='''+ inItCaps(cbAmnioticFluid1.text,True) + '''');

  lbMergeDataMergeFields.Items.Add('Anatomy='''+ getAnatomy + '''');
  lbMergeDataMergeFields.Items.Add('ReportHeading='''+ getReportHeading + '''');

     //lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
     //lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

     //------------------------------PE Screen -------------------------------------//
    if edtHeight.text <> '' then
    begin
      if StrToFloatDef(edtHeight.text,0.0) > 0 then
        lbMergeDataMergeFields.Items.Add('height='''+ RemoveDecimalPointAtEnd(edtHeight.text) + '''');
      else
         lbMergeDataMergeFields.Items.Add('height=''##''');
    end;
    else
       lbMergeDataMergeFields.Items.Add('height=''##''');

    if edtWeight.text <> '' then
    begin
      if StrToFloatDef(edtWeight.text,0.0) > 0 then
        lbMergeDataMergeFields.Items.Add('weight='''+ edtWeight.text + '''');
      else
         lbMergeDataMergeFields.Items.Add('weight=''##''');
    end;
    else
       lbMergeDataMergeFields.Items.Add('weight=''##''');

   if cbOrigin.text <> '' then
    lbMergeDataMergeFields.Items.Add('racialOrigin='''+ cbOrigin.text + '''');
   else
     lbMergeDataMergeFields.Items.Add('racialOrigin=''##''');

   if cbConceptionMethod.text <> '' then
    lbMergeDataMergeFields.Items.Add('Conception Method='''+ cbConceptionMethod.text + '''');
   else
     lbMergeDataMergeFields.Items.Add('Conception Method=''##''');

   {if getOvaryConc <> '' then }
    lbMergeDataMergeFields.Items.Add('OvaryConc='''+ getOvaryConc + '''');
   {else
    lbMergeDataMergeFields.Items.Add('OvaryConc=''');}

   if cbSmokingYes.checked then
    lbMergeDataMergeFields.Items.Add('smoker=''Yes''');
   else if cbSmokingNo.checked then
     lbMergeDataMergeFields.Items.Add('smoker=''No''');
   else
     lbMergeDataMergeFields.Items.Add('smoker=''##''');

   if cbPEYes.checked then
    lbMergeDataMergeFields.Items.Add('MotherPE=''Yes''');
   else if cbPENo.checked then
     lbMergeDataMergeFields.Items.Add('MotherPE=''No''');
   else
     lbMergeDataMergeFields.Items.Add('MotherPE=''##''');

   lbMergeDataMergeFields.Items.Add('MedicalHistory='''+ getMedicalHistory + '''');
   lbMergeDataMergeFields.Items.Add('PEObstetricHistory='''+ getPEObstetricHistory + '''');
   lbMergeDataMergeFields.Items.Add('BioPhysicalMeasurements='''+ getBioPhysicalMeasurements + '''');
   lbMergeDataMergeFields.Items.Add('BioChemistry='''+ getBioChemistry + '''');
   lbMergeDataMergeFields.Items.Add('conclusion='''+ getConclusion + '''');
  // lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');

end;
```

</details>

<details>
<summary>Variant E (t3Singleton)</summary>

```pascal
procedure ProduceMergeFieldData;
var
  v1: String;
begin
  GAnatomyWarning := False;
  GFibroidWarning := False;
    // ---------------Gestation Details--------------------------------- //
  lbMergeDataMergeFields.Items.Clear;
  lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  dateTimeTostr(deStatedEDD.Date)   +'''');
  lbMergeDataMergeFields.Items.Add('GA_Entered_EDD='''+  intToStr(seEDDCalGAWeeks.value)   +' weeks''');
  if seEDDCalGADays.value >= 0 then
  begin
    if seEDDCalGADays.value = 1 then
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' day''');
  else
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' days''');
  end
  else
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD=''');

  lbMergeDataMergeFields.Items.Add('BPD1='''+  PadDecimalPlaces(edtBPD1.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD1=''' +  PadDecimalPlaces(edtOFD1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC1='''   + PadDecimalPlaces(edtHC1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC1='''  +  PadDecimalPlaces(edtAC1.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL1='''  +  PadDecimalPlaces(edtFL1.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL1='''  +  PadDecimalPlaces(edtHL1.Text)     +'cm''');

  lbMergeDataMergeFields.Items.Add('BPDPer1='''+   GetPerGraph(edtBPDPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer1=''' +  GetPerGraph(edtOFDPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer1='''   +  GetPerGraph(edtHCPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer1='''  +   GetPerGraph(edtACPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer1='''  +  GetPerGraph(edtFLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer1='''  +  GetPerGraph(edtHLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('EFW1='''+ getEFW(1)+'''');
  lbMergeDataMergeFields.Items.Add('EFWPer1='''+ getEFWPer(seWeightPercentile1.text) +'''');
  if Trim(cbPresentation1.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('Presentation1='''  +   getPresentationDetail  +'''');
  else
    lbMergeDataMergeFields.Items.Add('Presentation1=''##''');

  if Trim(cbPresentation1.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1='''  +   inItCaps(getPresentation,true)  +'''');
  else
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1=''##''');

  if edtAFI1.text <> '' then
   if strToFloatdef(edtAFI1.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('AFI1='''  +   edtAFI1.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('AFI1=''##''');
  else
    lbMergeDataMergeFields.Items.Add('AFI1=''##''');
  if edtUmbilicalArtSD1.text <> '' then
     if strToFloatdef(edtUmbilicalArtSD1.text,0) > 0 then
       lbMergeDataMergeFields.Items.Add('UASD1='''  +   edtUmbilicalArtSD1.text  +'''');
     else
        lbMergeDataMergeFields.Items.Add('UASD1=''##''');
  else
     lbMergeDataMergeFields.Items.Add('UASD1=''##''');
  if edtUmbilicalArtPI1.text  <> '' then
   if strToFloatdef(edtUmbilicalArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('UAPI1='''  +   PrefixZerodecimal(edtUmbilicalArtPI1.text)   +'''');
      lbMergeDataMergeFields.Items.Add('UAPIRange='''  +   getUAPI  +'''');
   end
   else
   begin
      lbMergeDataMergeFields.Items.Add('UAPI1=''##''');
      lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
   end
  else
  begin
     lbMergeDataMergeFields.Items.Add('UAPI1=''##''');
     lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
  end;
  if edtMidCerArtPI1.text  <> '' then
   if strToFloatdef(edtMidCerArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('MCAPI1='''  +   PrefixZerodecimal(edtMidCerArtPI1.text)   +'''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange='''  +   getMCAPI  +'''');
   end;
   else
   begin
      lbMergeDataMergeFields.Items.Add('MCAPI1=''##''');
       lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
   end;
  else
  begin
     lbMergeDataMergeFields.Items.Add('MCAPI1=''##''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
  end;

  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ObstetricHistory='''+ GetObstetricHistory +'''');
  if (sePlacentaExtendsBy1.text <> '') then
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentaBeyond(1) +'''');
  else
    lbMergeDataMergeFields.Items.Add('Placenta1='''+ GetPlacentalPosition(1) +'''');

  if seBiophysicalScore1.enabled then
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1='''+ intToStr(seBiophysicalScore1.value) +'''');
  else
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1=''0''');

  if cbFetalAnatomyNormal1.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy1=''normal''');
     GAnatomyWarning := False;
  end
  else if cbFetalAnatomyAbNormal1.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy1=''#|#+BOLDABNORMAL#/#''');
     GAnatomyWarning := TRUE;
   end;
  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervix + '''');

  lbMergeDataMergeFields.Items.Add('liquorLevel1='''+ inItCaps(cbFetalWellLiqor1.text,True) + '''');

  if cbFeatlMovementsYes1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''limb and breathing movements present''');
  else if cbFeatlMovementsNo1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''#|#+BOLDABNORMAL#/#''');
  else
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''##''');

    lbMergeDataMergeFields.Items.Add('BiophysicalConc='''+ getBiophysicalConc + '''');

     lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
     lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

  lbMergeDataMergeFields.Items.Add('DuctusVenosus='''+ getDuctusVenosus + '''');
  lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

end;
```

</details>

<details>
<summary>Variant F (t3twins)</summary>

```pascal
procedure ProduceMergeFieldData;
var
  v1: String;
begin
  GAnatomyWarning := False;
  GFibroidWarning := False;
    // ---------------Gestation Details--------------------------------- //
  lbMergeDataMergeFields.Items.Clear;
  lbMergeDataMergeFields.Items.Add('Entered_EDD='''+  dateTimeTostr(deStatedEDD.Date)   +'''');
  lbMergeDataMergeFields.Items.Add('GA_Entered_EDD='''+  intToStr(seEDDCalGAWeeks.value)   +' weeks''');
  if seEDDCalGADays.value > 1 then
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' days''');
  else if seEDDCalGADays.value = 1 then
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' day''');
  else
   lbMergeDataMergeFields.Items.Add('Gestational_Age_by_EDD='''+  intToStr(seEDDCalGADays.value)   +' days''');
  lbMergeDataMergeFields.Items.Add('BPD1='''+  PadDecimalPlaces(edtBPD1.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD1=''' +  PadDecimalPlaces(edtOFD1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC1='''   + PadDecimalPlaces(edHC1.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC1='''  +  PadDecimalPlaces(edAC1.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL1='''  +  PadDecimalPlaces(edFL1.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL1='''  +  PadDecimalPlaces(edHL1.Text)     +'cm''');

  lbMergeDataMergeFields.Items.Add('BPDPer1='''+   GetPerGraph(edtBPDPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer1=''' +  GetPerGraph(edtOFDPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer1='''   +  GetPerGraph(edHCPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer1='''  +   GetPerGraph(edACPer1, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer1='''  +  GetPerGraph(edFLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer1='''  +  GetPerGraph(edHLPer1, True)     +'''');
  lbMergeDataMergeFields.Items.Add('EFW1='''+ getEFW(1)+'''');
  lbMergeDataMergeFields.Items.Add('EFWPer1='''+ getEFWPer(seWeightPercentile1.text,1) +'''');

  lbMergeDataMergeFields.Items.Add('BPD2='''+  PadDecimalPlaces(edtBPD2.text)   +'cm''');
  lbMergeDataMergeFields.Items.Add('OFD2=''' +  PadDecimalPlaces(edtOFD2.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('HC2='''   + PadDecimalPlaces(edHC2.text)  +'cm''');
  lbMergeDataMergeFields.Items.Add('AC2='''  +  PadDecimalPlaces(edAC2.text)    +'cm''');
  lbMergeDataMergeFields.Items.Add('FL2='''  +  PadDecimalPlaces(edFL2.text)    +'cm''');

  lbMergeDataMergeFields.Items.Add('HL2='''  +  PadDecimalPlaces(edHL2.Text)     +'cm''');

  lbMergeDataMergeFields.Items.Add('BPDPer2='''+   GetPerGraph(edtBPDPer2, True)    +'''');
  lbMergeDataMergeFields.Items.Add('OFDPer2=''' +  GetPerGraph(edtOFDPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HCPer2='''   +  GetPerGraph(edHCPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('ACPer2='''  +   GetPerGraph(edACPer2, True)    +'''');
  lbMergeDataMergeFields.Items.Add('FLPer2='''  +  GetPerGraph(edFLPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('HLPer2='''  +  GetPerGraph(edHLPer2, True)     +'''');
  lbMergeDataMergeFields.Items.Add('EFW2='''+ getEFW(2)+'''');
  lbMergeDataMergeFields.Items.Add('EFWPer2='''+ getEFWPer(seWeightPercentile2.text,2) +'''');

  if Trim(cbPresentation1.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('Presentation1='''  +   getPresentationDetail1  + '.''');
  else
    lbMergeDataMergeFields.Items.Add('Presentation1=''##''');
  if Trim(cbPresentation2.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('Presentation2='''  +   getPresentationDetail2  + '.''');
  else
    lbMergeDataMergeFields.Items.Add('Presentation2=''##''');

  if Trim(cbPresentation1.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1='''   +  (lowercase(getPresentationDetail1))  +'''');
  else
    lbMergeDataMergeFields.Items.Add('PresentationConclusion1=''##''');
  if Trim(cbPresentation2.Text) <> '' then
    lbMergeDataMergeFields.Items.Add('PresentationConclusion2='''  +  (lowercase(getPresentationDetail2))  +'''');
  else
    lbMergeDataMergeFields.Items.Add('PresentationConclusion2=''##''');

  {if edtAFI1.text <> '' then
   if strToFloatdef(edtAFI1.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('AFI1='''  +   edtAFI1.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('AFI1=''##''');
  else
    lbMergeDataMergeFields.Items.Add('AFI1=''##'''); }

  if edtDeepestPocket1.text <> '' then
   if strToFloatdef(edtDeepestPocket1.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('DVP1='''  +   edtDeepestPocket1.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('DVP1=''##''');
  else
    lbMergeDataMergeFields.Items.Add('DVP1=''##''');

  if edtDeepestPocket2.text <> '' then
   if strToFloatdef(edtDeepestPocket2.text,0) > 0 then
     lbMergeDataMergeFields.Items.Add('DVP2='''  +   edtDeepestPocket2.text  +'''');
   else
     lbMergeDataMergeFields.Items.Add('DVP2=''##''');
  else
    lbMergeDataMergeFields.Items.Add('DVP2=''##''');

  if edtUmbilicalArtSD1.text <> '' then
     if strToFloatdef(edtUmbilicalArtSD1.text,0) > 0 then
       lbMergeDataMergeFields.Items.Add('UASD1='''  +   edtUmbilicalArtSD1.text  +'''');
     else
        lbMergeDataMergeFields.Items.Add('UASD1=''##''');
  else
     lbMergeDataMergeFields.Items.Add('UASD1=''##''');

  if edtUmbilicalArtSD2.text <> '' then
     if strToFloatdef(edtUmbilicalArtSD2.text,0) > 0 then
       lbMergeDataMergeFields.Items.Add('UASD2='''  +   edtUmbilicalArtSD2.text  +'''');
     else
        lbMergeDataMergeFields.Items.Add('UASD2=''##''');
  else
     lbMergeDataMergeFields.Items.Add('UASD2=''##''');

  if edtUmbilicalArtPI1.text  <> '' then
   if strToFloatdef(edtUmbilicalArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('UAPI1='''  +   edtUmbilicalArtPI1.text   +'''');
      lbMergeDataMergeFields.Items.Add('UAPIRange='''  +   getUAPI  +'''');
   end
   else
   begin
      lbMergeDataMergeFields.Items.Add('UAPI1=''##''');
      lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
   end
  else
  begin
     lbMergeDataMergeFields.Items.Add('UAPI1=''##''');
     lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
  end;
  if edtMidCerArtPI1.text  <> '' then
   if strToFloatdef(edtMidCerArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('MCAPI1='''  +   edtMidCerArtPI1.text   +'''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange='''  +   getMCAPI  +'''');
   end;
   else
   begin
      lbMergeDataMergeFields.Items.Add('MCAPI1=''##''');
       lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
   end;
  else
  begin
     lbMergeDataMergeFields.Items.Add('MCAPI1=''##''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
  end;
  if edtUmbilicalArtPI2.text  <> '' then
   if strToFloatdef(edtUmbilicalArtPI2.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('UAPI2='''  +   edtUmbilicalArtPI2.text   +'''');
      lbMergeDataMergeFields.Items.Add('UAPIRange='''  +   getUAPI  +'''');
   end
   else
   begin
      lbMergeDataMergeFields.Items.Add('UAPI2=''##''');
      lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
   end
  else
  begin
     lbMergeDataMergeFields.Items.Add('UAPI2=''##''');
     lbMergeDataMergeFields.Items.Add('UAPIRange=''''');
  end;
  if edtMidCerArtPI2.text  <> '' then
   if strToFloatdef(edtMidCerArtPI1.text ,0) > 0 then
   begin
     lbMergeDataMergeFields.Items.Add('MCAPI2='''  +   edtMidCerArtPI2.text   +'''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange='''  +   getMCAPI  +'''');
   end;
   else
   begin
      lbMergeDataMergeFields.Items.Add('MCAPI2=''##''');
       lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
   end;
  else
  begin
     lbMergeDataMergeFields.Items.Add('MCAPI2=''##''');
     lbMergeDataMergeFields.Items.Add('MCAPIRange=''''')
  end;

  lbMergeDataMergeFields.Items.Add('GestationDetails='''+ GetgestationDetails +'''');
  lbMergeDataMergeFields.Items.Add('ReferralIndication='''+ GetClinicalIndicators +'''');
  lbMergeDataMergeFields.Items.Add('ObstetricHistory='''+ GetObstetricHistory +'''');
  lbMergeDataMergeFields.Items.Add('Features1='''+ GetFeatures(1) +'''');
  lbMergeDataMergeFields.Items.Add('Features2='''+ GetFeatures(2) +'''');
  lbMergeDataMergeFields.Items.Add('GestationType='''+ GetgestationDetails +'''');

  if (ccbGestationType.States[0]= 1) then
      begin
       if (sePlacentaExtendsBy1.Value > 0) then
            lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'The placenta for twin 1 is ' + GetPlacenta1Beyond +'''');
       else
            lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'The placenta for twin 1 is ' + GetPlacenta1Position +'''');
       if (sePlacentaExtendsBy2.Value > 0) then
            lbMergeDataMergeFields.Items.Add('Placenta2='''+ 'The placenta for twin 2 is ' + GetPlacenta2Beyond +'''');
       else
            lbMergeDataMergeFields.Items.Add('Placenta2='''+ 'The placenta for twin 2 is ' + GetPlacenta2Position +'''');
      end
  else
  begin
  if (sePlacentaExtendsBy1.Value > 0) then
      begin
        lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'There is a single placenta. The placenta is ' + GetPlacenta1Beyond +'''');
        lbMergeDataMergeFields.Items.Add('Placenta2='''+ '''');
      end
  else
      begin
        lbMergeDataMergeFields.Items.Add('Placenta1='''+ 'There is a single placenta. The placenta is ' + GetPlacenta1Position +'''');
        lbMergeDataMergeFields.Items.Add('Placenta2='''+ '''');
      end
  end

  if seBiophysicalScore1.enabled then
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1='''+ intToStr(seBiophysicalScore1.value) +'''');
  else
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore1=''0''');
   if seBiophysicalScore2.enabled then
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore2='''+ intToStr(seBiophysicalScore2.value) +'''');
  else
     lbMergeDataMergeFields.Items.Add('BioPhysicalScore2=''0''');

  if cbFetalAnatomyNormal1.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy1=''normal''');
     GAnatomyWarning := False;
  end
  else if cbFetalAnatomyAbNormal1.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy1=''#|#+BOLDABNORMAL#/#''');
     GAnatomyWarning := TRUE;
   end;
  if cbFetalAnatomyNormal2.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy2=''normal''');
     GAnatomyWarning := False;
  end
  else if cbFetalAnatomyAbNormal2.checked then
  begin
     lbMergeDataMergeFields.Items.Add('anatomy2=''#|#+BOLDABNORMAL#/#''');
     GAnatomyWarning := TRUE;
   end;
  lbMergeDataMergeFields.Items.Add('cervix='''+ getCervix + '''');

  lbMergeDataMergeFields.Items.Add('liquorLevel1='''+ inItCaps(cbFetalWellLiqor1.text,True) + '''');
  lbMergeDataMergeFields.Items.Add('liquorLevel2='''+ inItCaps(cbFetalWellLiqor2.text,True) + '''');

  if cbFeatlMovementsYes1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''(limb and breathing movements present)''');
  else if cbFeatlMovementsNo1.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''#|#+BOLDABNORMAL#/#''');
  else
    lbMergeDataMergeFields.Items.Add('BioPhysical1=''##''');

  if cbFeatlMovementsYes2.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical2=''(limb and breathing movements present)''');
  else if cbFeatlMovementsNo2.checked then
    lbMergeDataMergeFields.Items.Add('BioPhysical2=''#|#+BOLDABNORMAL#/#''');
  else
    lbMergeDataMergeFields.Items.Add('BioPhysical2=''##''');

  lbMergeDataMergeFields.Items.Add('BioPhysicalConclusion=''' + GetBioPhysicalconc +'''');

  lbMergeDataMergeFields.Items.Add('ConclusionWarnings='''+ getConclusionWarnings + '''');
  lbMergeDataMergeFields.Items.Add('CervixConclusion='''+ getCervixConclusion + '''');

  lbMergeDataMergeFields.Items.Add('MCAPSV1='''+ getMCAPSV1 + '''');
  lbMergeDataMergeFields.Items.Add('MCAPSV2='''+ getMCAPSV2 + '''');

  lbMergeDataMergeFields.Items.Add('DuctusVenosus1='''+ getDuctusVenosus1 + '''');
  lbMergeDataMergeFields.Items.Add('DuctusVenosus2='''+ getDuctusVenosus2 + '''');
  lbMergeDataMergeFields.Items.Add('Fibroid='''+ getFibroid +'''');

end;
```

</details>

---

### ProduceMergeOrder

**Variant count:** 6

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | gynae |
| D | pe12week |
| E | t3Singleton |
| F | t3twins |

**Summary:** Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and validation logic. Line counts: earlyT1Singleton=11, 20week=23, gynae=331, pe12week=57, t3Singleton=26, t3twins=29.

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
procedure ProduceMergeOrder;
begin
  lbMergeDataMergeOrder.Items.Clear;
  if ((getFindingsWarning) or (getOvaryWarning)) or (getPregnancyRedated) then
    lbMergeDataMergeOrder.Items.Add('WARNING');
  if cxccbReferralIndicators.States[2] = 1 then
    lbMergeDataMergeOrder.Items.Add('EARLY_NIPS');
  else
    lbMergeDataMergeOrder.Items.Add('EARLY_ALL');

end;
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
procedure ProduceMergeOrder;
var
  vHeading : Boolean;
begin
  vHeading := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
  {if (getNIPSWarning = TRUE) or (getAnatomyWarning = TRUE) or (getCervixWarning = TRUE) or (getPlacentalWarning = TRUE) or (getOvaryWarning = TRUE) or (getCordInsertionWarning = TRUE) or (GFibroidWarning = TRUE) then//(GPlacentaWarning = TRUE) or (GPresentationWarning = TRUE) or (GCervixWarning = TRUE) or (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) or (GAnatomyWarning = TRUE) or (getFunnelingMembranes = TRUE) then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end; }
  if cxccbReferralIndication.States[2] then
    lbMergeDataMergeOrder.Items.Add('AMNIOCENTESIS')
  else if cxccbReferralIndication.States[3] then
     lbMergeDataMergeOrder.Items.Add('ACCESS_CERVICAL_LENGTH')
  else if cxccbReferralIndication.States[0] then
    lbMergeDataMergeOrder.Items.Add('ROUTINE_MORPHOLOGY_SCAN')
  else if cxccbReferralIndication.States[1] then
    lbMergeDataMergeOrder.Items.Add('EARLY_ANATOMY_REVIEW')
  else
       lbMergeDataMergeOrder.Items.Add('ROUTINE_MORPHOLOGY_SCAN');
end;
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
procedure ProduceMergeOrder;
var
  i: Integer;
  vValidDist: Boolean;
begin
  lbMergeDataMergeOrder.Items.Clear;

   //insert Patient Demographics
  lbMergeDataMergeOrder.Items.Add('PatientDemographics');
  //lbMergeDataMergeOrder.Items.Add('<BR>');
  //lbMergeDataMergeOrder.Items.Add('<BR>');

  lbMergeDataMergeOrder.Items.Add('ReportHeading');
if (deLMPDate.Date > 10) or (cbPostMenopausal.checked) or (cbAmenorrhoea.checked) or(cbLMPUnknown.checked) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LMP');
    lbMergeDataMergeOrder.Items.Add('CycleDays');
  end
  else
  begin
    if spStartDay.Value > 0 then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('CycleDays');
    end;
  end;
  lbMergeDataMergeOrder.Items.Add('<BR>');
  if cbPerformedTransAbdom.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('TransAbdom');
  end;

  if cbHysterectomy.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Hysterectomy');
  end;
else
  begin
    if Trim(cbUterus.Text <> '') then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('ReportMain');
    end;
  end;
  if cbLUSCSscar.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LUSCSscar');
  end;

  if cbUterineShape.ItemIndex > 0 then
  begin
    if cbUterineShape.ItemIndex < 3 then
    begin
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('NormalUterusShape');
    end
    else if (cbUterineShape.ItemIndex < 5) then
    begin
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('SeptateUterus');
    end
    else if (cbUterineShape.ItemIndex = 6) then
    begin
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
  //    lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('DidelphysisUterus');
    end;
    else if  (cbUterineShape.ItemIndex = 7)  then
    begin
       lbMergeDataMergeOrder.Items.Add('leftUniCornuate');
    end
    else if (cbUterineShape.ItemIndex = 8)  then
    begin
      lbMergeDataMergeOrder.Items.Add('RightUniCornuate');
    end;
  end;

  if cbAdenomyosisPresent.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Adenomysis');
    if (spAPAnterior.Value > 0) or (spAPPosterior.Value > 0) then
      lbMergeDataMergeOrder.Items.Add('AdenomysisAPMeasure');
    if cbLossEMInterface.Checked then
      lbMergeDataMergeOrder.Items.Add('EMInterfaceLoss');
  end;

  if (cbFibroidsVisualised.Checked) and (spFibroidCount.Value > 0) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    if spFibroidCount.Value > 1 then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('FibroidsExists');
      for i := 1 to spFibroidCount.Value do
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('Fibroid' + IntToStr(i));
      end;

      if GetCavDistortionCount(vValidDist) = 0 then
      begin
        if (vValidDist) and (not (GetCavProjectionCount(vValidDist) > 0)) then
        begin
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('NoFibroidCavityDistortion');
        end;
      end
      else if GetCavDistortionCount(vValidDist) = 1 then
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('FibroidCavityDistortion');
      end
      else
      begin
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('<BR>');
        lbMergeDataMergeOrder.Items.Add('MultipleCavityDistortion');
      end;
      if GetCavProjectionCount(vValidDist) > 0 then
      begin
        if GetCavDistortionCount(vValidDist) = 0 then
        begin
          lbMergeDataMergeOrder.Items.Add('<BR>');
          lbMergeDataMergeOrder.Items.Add('<BR>');
        end;
        lbMergeDataMergeOrder.Items.Add('CavityProjection');
      end;
    end
    else
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('SingleFibroid');
    end;
  end;

  // if (cbRightOvaryIdentified.Checked) or (cbLeftOvaryIdentified.Checked) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');

    //  if (cbRightOvaryIdentified.Checked) then
    begin
      lbMergeDataMergeOrder.Items.Add('RightOvary');
       if not((cbRightOvarianCyst.Checked)) then
           lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');
       if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 1) then
           lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');
      if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0) then
      begin
        if (seRightOvarianCystsCount.Value = 2) and (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
        end
        else
        if (seRightOvarianCystsCount.Value = 3) and ((cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType2.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3');
        end
        else
        if (seRightOvarianCystsCount.Value = 4) and ((cbRightOvaryCystType1.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType1.Selection <> cbRightOvaryCystType3.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType2.Selection) or (cbRightOvaryCystType3.Selection <> cbRightOvaryCystType4.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayout');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3');
          lbMergeDataMergeOrder.Items.Add('MultiCysts4');
        end
        else
          lbMergeDataMergeOrder.Items.Add('RightOvaryCyst');
      end;
      if (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value = 1) then
      lbMergeDataMergeOrder.Items.Add('RightOvaryAppear');
    end;
      if not((cbRightOoporectomy.Checked) and (cbLeftOoporectomy.checked)) then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('LeftOvary');
      if not(cbLeftOvarianCyst.Checked) then
           lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
       if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 1) then
           lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
      if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0) then
      begin
        if (seLeftOvarianCystsCount.Value = 2) and (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
        end
        else
        if (seLeftOvarianCystsCount.Value = 3) and ((cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType2.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3L');
        end
        else
        if (seLeftOvarianCystsCount.Value = 4) and ((cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType1.Selection <> cbLeftOvaryCystType3.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType2.Selection) or (cbLeftOvaryCystType3.Selection <> cbLeftOvaryCystType4.Selection)) then
        begin
          lbMergeDataMergeOrder.Items.Add('MultiCystLayoutL');
          lbMergeDataMergeOrder.Items.Add('MultiCysts3L');
          lbMergeDataMergeOrder.Items.Add('MultiCysts4L');
        end
        else
          lbMergeDataMergeOrder.Items.Add('LeftOvaryCyst');
      end;
      if (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value = 1) then
        lbMergeDataMergeOrder.Items.Add('LeftOvaryAppear');
    end;
  end;

  if (cbRightOvarianCyst.checked) and ((cbRightOvaryCystType1.enabled and cbRightOvaryCystType1.selection = 12) or
     (cbRightOvaryCystType2.enabled and cbRightOvaryCystType2.selection = 12) or
     (cbRightOvaryCystType3.enabled and cbRightOvaryCystType3.selection = 12)) then
  begin
     lbMergeDataMergeOrder.Items.Add('<BR>');
     lbMergeDataMergeOrder.Items.Add('IOTARightOvary');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;

  if (cbLeftOvaryCystType1.enabled and cbLeftOvaryCystType1.selection = 12) or
     (cbLeftOvaryCystType2.enabled and cbLeftOvaryCystType2.selection = 12) or
     (cbLeftOvaryCystType3.enabled and cbLeftOvaryCystType3.selection = 12) then
  begin
     lbMergeDataMergeOrder.Items.Add('<BR>');
     lbMergeDataMergeOrder.Items.Add('IOTALeftOvary');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;

  if ((cbRightAdnexalMass.Checked) and (seRightAdnexalMasses.Value > 0)) or ((cbLeftAdnexalMass.Checked) and (seLeftAdnexalMasses.Value > 0)) then
  begin
    //  lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('YesAdnexal');
  end
  else
  begin
     if not((cbRightOvaryIdentified.Checked) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) and
        not((cbLeftOvaryIdentified.Checked) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
     begin
      //  lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('<BR>');
      lbMergeDataMergeOrder.Items.Add('NoAdnexalMasses');
     end
  end;

  if cbPerformedTransAbdom.Checked then
  begin
    //   lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('NoTendernessTrans');
  end;

  if cbEFFNormal.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('FreeFluidPresent');
  end
  else
  begin
    if ((cbRightOvaryIdentified.Checked) and (cbRightOvarianCyst.Checked) and (seRightOvarianCystsCount.Value > 0)) or
       ((cbLeftOvaryIdentified.Checked) and (cbLeftOvarianCyst.Checked) and (seLeftOvarianCystsCount.Value > 0)) then
    begin
      lbMergeDataMergeOrder.Items.Add('<BR>');
    end;
    lbMergeDataMergeOrder.Items.Add('NoExcessFreeFluid');
  end;
  if (cbBladderNormal.Checked) or (cbBladderAbnormal.Checked) then
  begin
  //  lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Bladder');
  end;
 { if cbRightKidneyYes.Checked or cbLeftKidneyYes.Checked then
  begin
    //lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('KidneyAppearance');
  end;}
  if cbSalinePerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    if cbSalinehysterograph.ItemIndex = 1 then
      lbMergeDataMergeOrder.Items.Add('SalineProc1')
    else if cbSalinehysterograph.ItemIndex = 2 then
      lbMergeDataMergeOrder.Items.Add('SalineProc2')
    else if cbSalinehysterograph.ItemIndex = 3 then
      lbMergeDataMergeOrder.Items.Add('SalineProc4')
    else if cbSalinehysterograph.ItemIndex = 4 then
      lbMergeDataMergeOrder.Items.Add('SalineProc3')
  end;
  if cbTubalPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Agitated' + IntToStr(cbTubalPatencyTestSaline.ItemIndex));
  end;
  if cbTubalLevovistPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Levovist' + IntToStr(cbTubalPatencyTestLevovist.ItemIndex));
  end;
  if cbRightCystAspirationPerf.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('RightDrainage');
  end;
  if cbLeftCystAspirationPerf.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('LeftDrainage');
  end;
  if cbAscitesPerformed.Checked then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('Ascites');
  end;
  lbMergeDataMergeOrder.Items.Add('<BR>');
  lbMergeDataMergeOrder.Items.Add('<BR>');
  lbMergeDataMergeOrder.Items.Add('Conclusion');
end;
```

</details>

<details>
<summary>Variant D (pe12week)</summary>

```pascal
procedure ProduceMergeOrder;
var
  vHeading : Boolean;
  PEPerformedYes : Boolean;
begin
  vHeading := False;
  PEPerformedYes := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
  {if ((getAnatomyWarning = TRUE) or (getCervixWarning = TRUE) or  (getOvaryWarning = TRUE ) or (GFibroidWarning = TRUE))then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;}
  if ((cbPEDoneYes.checked = True) or (cxccbReferralIndication.States[7] = 1)) then
    PEPerformedYes := TRUE;
   if PEPerformedYes then
   begin
     if ((cxccbReferralIndication.States[1] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('VCGSPreEclampsia')
      else if ((cxccbReferralIndication.States[5] = 1) and PEPerformedYes )then
        lbMergeDataMergeOrder.Items.Add('NTOnlyPEScreening')
      else if ((cxccbReferralIndication.States[6] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('AneuploidyDeclinedPEScreening')
      else if ((cxccbReferralIndication.States[2] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('NIPSPEScreening')
      else if ((cxccbReferralIndication.States[3] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('NIPSPendingPEScreening')
      else if ((cxccbReferralIndication.States[0] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('NormalNIPSPEScreening')
      else if ((cxccbReferralIndication.States[4] = 1) and PEPerformedYes) then
        lbMergeDataMergeOrder.Items.Add('IncreasedNIPSPEScreening')
      else if ((cxccbReferralIndication.States[8] = 1) and PEPerformedYes)  then
        lbMergeDataMergeOrder.Items.Add('DefaultPEScreening')
     else
        lbMergeDataMergeOrder.Items.Add('DefaultPEScreening');
    end;
   else
   begin
      if cxccbReferralIndication.States[1] = 1 then
        lbMergeDataMergeOrder.Items.Add('MSS+VCGS')
      else if cxccbReferralIndication.States[5] = 1 then
        lbMergeDataMergeOrder.Items.Add('NTOnly')
      else if cxccbReferralIndication.States[6] = 1 then
        lbMergeDataMergeOrder.Items.Add('AneuploidyDeclined')
      else if cxccbReferralIndication.States[2] = 1 then
        lbMergeDataMergeOrder.Items.Add('NIPS')
      else if cxccbReferralIndication.States[3] = 1 then
        lbMergeDataMergeOrder.Items.Add('NIPSPending')
      else if cxccbReferralIndication.States[0] = 1 then
        lbMergeDataMergeOrder.Items.Add('NormalNIPS')
      else if cxccbReferralIndication.States[4] = 1 then
        lbMergeDataMergeOrder.Items.Add('IncreasedNIPS')
     else
       lbMergeDataMergeOrder.Items.Add('Default')
    end;
end;
```

</details>

<details>
<summary>Variant E (t3Singleton)</summary>

```pascal
procedure ProduceMergeOrder;
var
  vHeading : Boolean;
begin
  vHeading := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
 { if (GPlacentaWarning = TRUE) or (GPresentationWarning = TRUE) or (GCervixWarning = TRUE) or (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) or (GAnatomyWarning = TRUE) or ( GFibroidWarning = TRUE)or (getFunnelingMembranes = TRUE) or (GetDuctusVenosusWarning = TRUE)then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end; }
  if cxccbReferralIndicators.States[7] = 1 then
  begin
       lbMergeDataMergeOrder.Items.Add('T3_ACCESSCERVICALLENGTH');
  end;
  else
     lbMergeDataMergeOrder.Items.Add('T3_ALL');

  if (seEstFetalWeight1.value > 0) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('GraphImages');
  end;
end;
```

</details>

<details>
<summary>Variant F (t3twins)</summary>

```pascal
procedure ProduceMergeOrder;
var
  vHeading : Boolean;
begin
  vHeading := False;
  CheckFormComplete;
  lbMergeDataMergeOrder.Items.Clear;
  {if (GPlacentaWarning = TRUE) or (GPresentationWarning = TRUE) or (GCervixWarning = TRUE) or (GUAPIWarning = TRUE) or (GMCAPIWarning = TRUE) or (GAnatomyWarning = TRUE) or ( GFibroidWarning = TRUE)or (getFunnelingMembranes = TRUE) or (GetDuctusVenosusWarning = TRUE)then
  begin
     lbMergeDataMergeOrder.Items.Add('Warning');
     lbMergeDataMergeOrder.Items.Add('<BR>');
  end;
  if (meCervicalLength.text <> '') then
  begin
     if StrToFloatDef(meCervicalLength.text,0)> 0 then
       lbMergeDataMergeOrder.Items.Add('T3_ACCESSCERVICALLENGTH');
     else
     lbMergeDataMergeOrder.Items.Add('T3_ALL');
  end;
  else}
  lbMergeDataMergeOrder.Items.Add('T3_ALL');

  if (seEstFetalWeight1.value > 0) then
  begin
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('<BR>');
    lbMergeDataMergeOrder.Items.Add('GraphImages');
  end;
end;
```

</details>

---

### spFibroidCountOnChange

**Variant count:** 3

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week, pe12week, t3Singleton, t3twins |
| C | gynae |

**Summary:** 3 distinct variants with line counts: A=56, B=60, C=13.

Variants have substantially different structure/length, indicating different logic or scope of functionality.

Variant C unique strings: ['gbFibroid']

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
procedure spFibroidCountOnChange(Sender)
begin
  gbFibroid1.Visible := False;
  gbFibroid2.Visible := False;
  gbFibroid3.Visible := False;
  gbFibroid4.Visible := False;
  gbFibroid5.Visible := False;
  gbFibroid6.Visible := False;
  gbFibroid7.Visible := False;
  gbFibroid8.Visible := False;
  gbFibroid9.Visible := False;
  gbFibroid10.Visible := False;
  if cbFibroidsVisualised.Checked then
  begin
    if spFibroidCount.Value > 0 then
    begin
      gbFibroid1.Visible := True;
      if spFibroidCount.Value > 1 then
      begin
        gbFibroid2.Visible := True;
        if spFibroidCount.Value > 2 then
        begin
          gbFibroid3.Visible := True;
          if spFibroidCount.Value > 3 then
          begin
            gbFibroid4.Visible := True;
            if spFibroidCount.Value > 4 then
            begin
              gbFibroid5.Visible := True;
              if spFibroidCount.Value > 5 then
              begin
                gbFibroid6.Visible := True;
                if spFibroidCount.Value > 6 then
                begin
                  gbFibroid7.Visible := True;
                  if spFibroidCount.Value > 7 then
                  begin
                    gbFibroid8.Visible := True;
                    if spFibroidCount.Value > 8 then
                    begin
                      gbFibroid9.Visible := True;
                      if spFibroidCount.Value > 9 then
                      begin
                        gbFibroid10.Visible := True;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;
```

</details>

<details>
<summary>Variant B (20week, pe12week, t3Singleton, t3twins)</summary>

```pascal
procedure spFibroidCountOnChange(Sender)
begin
  gbFibroid1.Visible := False;
  gbFibroid2.Visible := False;
  gbFibroid3.Visible := False;
  gbFibroid4.Visible := False;
  gbFibroid5.Visible := False;
  gbFibroid6.Visible := False;
  gbFibroid7.Visible := False;
  gbFibroid8.Visible := False;
  gbFibroid9.Visible := False;
  gbFibroid10.Visible := False;
  if spFibroidCount.Value > 0 then
  begin
     cbFibroidsVisualised.Checked := true;
  end;
  if cbFibroidsVisualised.Checked then
  begin
    if spFibroidCount.Value > 0 then
    begin
      gbFibroid1.Visible := True;
      if spFibroidCount.Value > 1 then
      begin
        gbFibroid2.Visible := True;
        if spFibroidCount.Value > 2 then
        begin
          gbFibroid3.Visible := True;
          if spFibroidCount.Value > 3 then
          begin
            gbFibroid4.Visible := True;
            if spFibroidCount.Value > 4 then
            begin
              gbFibroid5.Visible := True;
              if spFibroidCount.Value > 5 then
              begin
                gbFibroid6.Visible := True;
                if spFibroidCount.Value > 6 then
                begin
                  gbFibroid7.Visible := True;
                  if spFibroidCount.Value > 7 then
                  begin
                    gbFibroid8.Visible := True;
                    if spFibroidCount.Value > 8 then
                    begin
                      gbFibroid9.Visible := True;
                      if spFibroidCount.Value > 9 then
                      begin
                        gbFibroid10.Visible := True;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
procedure spFibroidCountOnChange(Sender)
var
  v1: TcxGroupBox;
begin
  for i := 1 to 12 do
  begin
    v1 := TWinControl(tsFibroids.Owner).FindComponent('gbFibroid' + intToStr(i));
    if assigned(v1) then
    begin
      v1.Visible := (i <= spFibroidCount.Value);
    end;
  end;
end;
```

</details>

---

### StartScript

**Variant count:** 6

| Variant | Exams |
|---|---|
| A | earlyT1Singleton |
| B | 20week |
| C | gynae |
| D | pe12week |
| E | t3Singleton |
| F | t3twins |

**Summary:** Inherently exam-specific: each exam has its own version referencing exam-specific UI controls, merge fields, and validation logic. Line counts: earlyT1Singleton=61, 20week=74, gynae=206, pe12week=73, t3Singleton=72, t3twins=94.

<details>
<summary>Variant A (earlyT1Singleton)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant B (20week)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant C (gynae)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant D (pe12week)</summary>

```pascal
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
```

</details>

<details>
<summary>Variant E (t3Singleton)</summary>

```pascal
procedure StartScript;
begin
    // -----------------------------------------------------------------------------//
    InitializeScreen;
    cbGestationType.Properties.OnChange := 'cbGestationTypeChange';
    deStatedEDD.Properties.OnChange := 'deStatedEDDOnChange';
    PresentingTwinYes1.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinNo1.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinYes2.OnClick := 'cbToggleCheckOnClick';
    PresentingTwinNo2.OnClick := 'cbToggleCheckOnClick';
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

    cbLiqur3.OnClick := 'CalcFetalScore';
    cbFetalBreathing3.OnClick := 'CalcFetalScore';
    cbFetalMovement3.OnClick := 'CalcFetalScore';
    cbFetalTone3.OnClick := 'CalcFetalScore';

    cbFeatlMovementsYes1.OnClick := 'cbFeatlMovementsClick';
    cbFeatlMovementsNo1.OnClick := 'cbFeatlMovementsClick';

    cbCervixTVS.OnClick := 'cbToggleCheckOnClick';
    cbCervixTA.OnClick := 'cbToggleCheckOnClick';

    cbDVWNormal1.OnClick := 'cbToggleCheckOnClick';
    cbDVWAbNormal1.OnClick := 'cbToggleCheckOnClick';

    edtAFI1.Properties.Onchange := 'edtAFI1Onchange';
    edtAFI2.Properties.Onchange := 'edtAFI2Onchange';

    btnGeneratePercentiles.OnClick := 'btnGeneratePercentilesOnClick'
    btnCalGrowthPer1.OnClick := 'btnCalGrowthPer1OnClick';

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

    edtBPD1.Properties.OnChange := 'getBiometryPercentiles';
    edtAC1.Properties.OnChange := 'getBiometryPercentiles';
    edtHC1.Properties.OnChange := 'getBiometryPercentiles';
    edtFL1.Properties.OnChange := 'getBiometryPercentiles';
    edtHL1.Properties.OnChange := 'getBiometryPercentiles';
    edtMidCerArtPI1.OnExit := 'edtMidCerArtPI1Exit' ;
    edtAFI1.OnExit := 'edtAFI1Exit';

end;
```

</details>

<details>
<summary>Variant F (t3twins)</summary>

```pascal
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
```

</details>

---
