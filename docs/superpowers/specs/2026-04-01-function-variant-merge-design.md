# Function Variant Merge Design

Merge shared function variants across obstetric exam scripts based on domain expert review. Gynae-specific variants are deferred until the gynae template is remade.

## Approach

Module-by-module: update each shared module file, delete resolved variant files, update exam `script.pas` includes. Build and test after each module.

## Module 1: `shared/utils/formatting.pas` (Q1, Q2, Q3)

| Function | Change |
|----------|--------|
| `AddFullStop` | Change `'.  '` to `'. '` (1 space after period) |
| `AddFullstopToEnd` | Make identical to `AddFullStop` — same logic, same output. Eventually callers can be migrated to `AddFullStop` and this function removed. |
| `GetIntegerMeasuredString` | Use non-earlyT1 version: no spaces around "x", no " of " prefix |

**Variants to delete:** `AddFullstopToEnd.earlyT1Singleton_pe12week.pas`, `GetIntegerMeasuredString.earlyT1Singleton.pas`

**Exam includes to update:** earlyT1Singleton (remove GetIntegerMeasuredString variant, remove AddFullstopToEnd variant), pe12week (remove AddFullstopToEnd variant)

## Module 2: `shared/obstetric/clinicalHistory.pas` (Q9, Q10)

| Function | Change |
|----------|--------|
| `GetClinicalIndicators` | Use pe12week style: `AddFullStop` for separator between items, `InitCaps` on "Other" free text |
| `GetObstetricHistory` | Always include `"Past History: "` prefix (changed from `"Past Hx: "`) |

**Variants to delete:** `GetClinicalIndicators.earlyT1Singleton.pas`, `GetClinicalIndicators.20week.pas`, `GetClinicalIndicators.pe12week.pas`, `GetObstetricHistory.20week_t3Singleton.pas`

**Exam includes to update:** earlyT1Singleton (remove GetClinicalIndicators variant), 20week (remove GetClinicalIndicators and GetObstetricHistory variants), pe12week (remove GetClinicalIndicators variant), t3Singleton (remove GetObstetricHistory variant if present)

## Module 3: Obstetric fibroids (Q4, Q5, Q6, Q8, Q24, Q25)

Create or update a shared obstetric fibroids module. These functions currently live across variant files and exam-specific code.

| Function | Change |
|----------|--------|
| `GetFibroidCount` | Past tense "was/were" for all obstetric exams |
| `getFibroid` | pe12week version: proper space after "There is a ", proper " and " and ", " separators, null checks, "Fibroid/s" fallback |
| `GetFibroidString` | pe12week/t3 style: measurements first, lowercase left/right, integer volume `%dcc`, `", clear of the cervix"` with comma, appends " fibroid" |
| `GetSingleFibroidDimensions` | Integer volume `%dcc` for obstetric exams (gynae deferred) |
| `GetCavDistortionCount` | Check all 10 fibroids (earlyT1 style loop), no gynae-style signature |
| `spFibroidCountOnChange` | Support 10 fibroids for all obstetric exams |

**Variants to delete:** `GetFibroidString.earlyT1Singleton.pas`, `GetFibroidString.20week.pas`, `GetSingleFibroidDimensions.earlyT1Singleton.pas`, `GetCavDistortionCount.earlyT1Singleton.pas`, `getFibroid.pe12week.pas`, `getFibroid.t3Singleton.pas`, `getFibroid.t3twins.pas`, `spFibroidCountOnChange.earlyT1Singleton.pas`

**Note:** Q7 GetFibroidConcl is partially deferred. earlyT1 should align with other obstetric scans — investigate what the other obs exams use and align. Gynae's GetFibroidConcl is deferred.

## Module 4: `shared/obstetric/ovaries.pas` (Q13)

| Function | Change |
|----------|--------|
| `GetOvary` | New unified version per expert's specification |

Expert-specified behaviour:
- Reports "not identified": Yes
- Reports "normal": Yes ("Both ovaries appear normal")
- Reports "abnormal": Yes ("The right/left ovary is abnormal.")
- Corpus luteum: Yes ("A corpus luteum is visualised in the right/left/both ovaries")
- Formatting prefix: `#13#10+#13#10 + '#|#+BOLDOvaries:#/#' + #13#10` (bold heading)

## Module 5: `shared/obstetric/cervix.pas` (Q14, Q15)

| Function | Change |
|----------|--------|
| `getCervixDetailed` | 20week style: measurement inline `"...long and closed, 30mm on transvaginal ultrasound."` |
| `getCervixConclusion` | Merge to closest variant: 20week/pe12week style for "Shortened cervix" with measurement. Custom cervical surveillance logic (normal cervix in conclusion when indication is cervical surveillance) captured as follow-up. |

**Variants to delete:** `getCervixDetailed.20week.pas`, `getCervixConclusion.t3Singleton.pas`, `getCervixConclusion.t3twins.pas`

## Module 6: `shared/obstetric/placenta.pas` (Q16, Q17, Q18, Q19, Q20)

| Function | Change |
|----------|--------|
| `GetPlacenta` | Keep pe12week as variant (adverbial "anteriorly" is intentional). Merge 20week and t3Singleton to shared. |
| `GetPlacenta1Measure` | Use `.text <> ''` check and `.text` value access for all |
| `getPlacentaBeyond` | Present tense: `"Placenta is..."` for all |
| `getPlacentaConclusion` | Merge to closest per exam type. Follow-up: add vasa praevia + succenturiate lobe to t3, add "edge reaching os" to 20week. |
| `getPlacentalPosition` | t3Singleton style with corrected wording: `"The leading edge is Xmm from the internal cervical os."` for >0, `"The inferior edge is reaching the internal cervical os."` for =0 |

**Variants to delete:** `getPlacentaBeyond.20week.pas`, `getPlacentalPosition.20week.pas`

## Module 7: `shared/obstetric/gestationalAge.pas` (Q12)

| Function | Change |
|----------|--------|
| `getCompositeDate` | Always show "0 days" — use `>= 0` check so 0 days is always displayed |

**Variants to delete:** `getCompositeDate.20week.pas`

## Module 8: `shared/obstetric/uiCommon.pas` (Q22, Q23)

| Function | Change |
|----------|--------|
| `GetPerGraph` | 20week/t3 style: no leading space for below-3rd-percentile `x` |
| `cbToggleCheckOnClick` | Explicit type cast: `TcxCheckBox(Sender).Checked` |

**Variants to delete:** `GetPerGraph.20week.pas`, `GetPerGraph.pe12week.pas`

## Deferred Items

| Item | Reason | Action |
|------|--------|--------|
| Q7 GetFibroidConcl (gynae) | Gynae template will be remade | No action |
| Q11 GetClinicalHistory | Expert said "unclear" | No action |
| Q16 GetPlacenta (pe12week) | Intentionally different (adverbial form) | Stays as variant |
| Q21 GetNormalMCAPIRange | Waiting on Sofie's confirmation | Stays as variant |
| Q14 cervical surveillance logic | New custom logic needed | Follow-up task |
| Q19 placenta conclusion features | Add vasa praevia/succenturiate to t3, edge reaching os to 20week | Follow-up task |
| All gynae-only variants | Deferred until gynae template remake | No action |

## Verification

After each module:
1. Run `bash Scripts/tools/build.sh` to verify all exams build
2. Run `cd Scripts/tools && .venv/bin/python3 -m pytest tests/ -v` to verify tests pass
3. Spot-check built output for affected exams
