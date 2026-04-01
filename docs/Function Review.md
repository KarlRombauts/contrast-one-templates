# Function Review

# Function Variant Review for Domain Expert

We are consolidating six ultrasound exam scripts into shared modules. Some functions appear in multiple exams with slightly different implementations. We need your help to determine whether these differences are intentional (different exams genuinely need different behaviour) or accidental (copy-paste drift that should be standardised).

For each question below, please tick the option you think is correct, or write in an alternative.

## Exams Referenced

| Short Name | Full Name |
| --- | --- |
| earlyT1 | Early T1 Singleton |
| 20week | 20 Week Scan |
| pe12week | PE 12 Week |
| t3Singleton | T3 Singleton |
| t3twins | T3 Twins |
| gynae | Gynaecology |

## Summary of Questions

| # | Function | Area | Nature of Difference |
| --- | --- | --- | --- |
| Q1 | AddFullStop | Text formatting | Period followed by 2 spaces vs 1 space |
| Q2 | AddFullstopToEnd | Text formatting | Three variants of spacing and “already has period” handling |
| Q3 | GetIntegerMeasuredString | Measurement formatting | Spaces in dimensions and extra ” of ” prefix |
| Q4 | GetFibroidCount | Fibroid reporting | “fibroid **is**” vs “fibroid **was**” (present vs past tense) |
| Q5 | getFibroid | Fibroid reporting | Missing space after “There is a”, comma/and spacing |
| Q6 | GetFibroidString | Fibroid reporting | Dimension-first vs description-first ordering; volume format; cervix clearance text |
| Q7 | GetFibroidConcl | Fibroid conclusions | Obstetric cervix review text vs gynae cavity distortion text |
| Q8 | GetSingleFibroidDimensions | Fibroid dimensions | Volume as decimal vs integer; gynae adds cavity/projection language |
| Q9 | GetClinicalIndicators | Clinical indications | Separator style (period+2 spaces vs AddFullStop); trailing space |
| Q10 | GetObstetricHistory | Clinical history | “Past Hx:” prefix present vs absent |
| Q11 | GetClinicalHistory | Clinical history | Full implementation vs empty function |
| Q12 | getCompositeDate | Gestational age text | Singular/plural day logic reversed; handling of 0 days |
| Q13 | GetOvary | Ovary report text | Different scope: corpus luteum, normal ovaries, formatting |
| Q14 | getCervixConclusion | Cervix conclusions | Simple “Shortened cervix” vs detailed length + scan method |
| Q15 | getCervixDetailed | Cervix detail text | Where the measurement text appears in the sentence |
| Q16 | GetPlacenta | Placenta text | Adds “ly” suffix in pe12week |
| Q17 | GetPlacenta1Measure | Placenta measurement | Text vs Value property; parentheses |
| Q18 | getPlacentaBeyond | Placenta text | “Placenta **is**” vs “Placenta **was**” |
| Q19 | getPlacentaConclusion | Placenta conclusions | Very different scope across 4 exams |
| Q20 | getPlacentalPosition | Placenta position | Extra clause for edge reaching the os |
| Q21 | GetNormalMCAPIRange | Doppler reference values | Different MCA PI threshold values and range |
| Q22 | GetPerGraph | Percentile graph | Leading space before “x” for below-3rd-percentile |
| Q23 | cbToggleCheckOnClick | UI behaviour | Explicit type cast vs implicit |
| Q24 | GetCavDistortionCount | Fibroid/cavity | Counts only fibroid 1 vs all 10; gynae uses different signature |
| Q25 | spFibroidCountOnChange | Fibroid UI | Different number of fibroids supported (10, 5, or 1) |

---

## Text Formatting

---

### Q1. AddFullStop

**What it does:** When building report text, this function takes a string and ensures it ends with a period (full stop) followed by trailing spaces, so the next sentence is properly separated.

**Where it’s used:** All 6 exams, in many places where report sentences are assembled.

**The difference:** After adding the period, some exams append 2 spaces and others append 1 space.

**Example output:**

| Input | earlyT1, 20week, pe12week, t3Singleton | gynae, t3twins |
| --- | --- | --- |
| `"Normal anatomy"` | `"Normal anatomy.  "` (period + 2 spaces) | `"Normal anatomy. "` (period + 1 space) |
| `"Already ended."` | `"Already ended."` (unchanged) | `"Already ended."` (unchanged) |

**Question for reviewer:** The final report text will be word-processed, so extra spaces may or may not matter. Should we standardise?

- [ ]  Option A: Use 2 spaces after a period everywhere (earlyT1/20week/pe12week/t3Singleton style)
- [x]  Option B: Use 1 space after a period everywhere (gynae/t3twins style)
- [ ]  Option C: Keep separate – the difference is intentional
- [ ]  Other: _______________

---

### Q2. AddFullstopToEnd

**What it does:** Similar to AddFullStop, but with slightly different behaviour around what happens when the string already ends with a period. Used when finalising a line of report text.

**Where it’s used:** All 6 exams.

**The difference:** There are three variants that differ in two ways:
1. How many spaces after the added period (1 vs 2)
2. What happens when the string already ends with a period

| Behaviour | Variant A (earlyT1, pe12week) | Variant B (20week, gynae) | Variant C (t3Singleton, t3twins) |
| --- | --- | --- | --- |
| Spaces after added period | 2 | 2 | 1 |
| If already ends with “.” | Returns original input unchanged | Adds 2 trailing spaces | Adds 1 trailing space |

**Example output:**

| Input | Variant A (earlyT1, pe12week) | Variant B (20week, gynae) | Variant C (t3Singleton, t3twins) |
| --- | --- | --- | --- |
| `"Normal"` | `"Normal.  "` | `"Normal.  "` | `"Normal. "` |
| `"Already ended."` | `"Already ended."` | `"Already ended.  "` | `"Already ended. "` |

**Question for reviewer:** Variants B and C ensure consistent trailing spaces even when the text already has a period. Variant A preserves the original (which might not have trailing spaces). Which is correct?

- [ ]  Option A: Use Variant A (earlyT1/pe12week) – if it already has a period, leave it alone
- [ ]  Option B: Use Variant B (20week/gynae) – always ensure 2 trailing spaces for sentence separation
- [ ]  Option C: Use Variant C (t3Singleton/t3twins) – always ensure 1 trailing space
- [x]  Other: Make this the same as AddFullStop (with adding a single space to after a fullstop even if there is one)

---

### Q3. GetIntegerMeasuredString

**What it does:** Formats a set of measurements (length, width, depth, volume) into a readable string like “30x20x15mm (vol 4.5 cc)”. Used for fibroids and other measured structures.

**Where it’s used:** All 6 exams (gynae uses it extensively for fibroid descriptions).

**The difference:** Two main differences:

1. **Spacing in dimensions:** earlyT1 uses spaces around the “x” (`30 x 20 x 15mm`) while all other exams use no spaces (`30x20x15mm`)
2. **Prefix text:** earlyT1 adds `" of "` before the measurement string (e.g., `" of 30 x 20 x 15mm"`); other exams do not

**Example output:**

| Measurements (L/W/D/Vol) | earlyT1 | All other exams |
| --- | --- | --- |
| 30, 20, 15, 4.5 | `" of 30 x 20 x 15mm (vol 4.5 cc)"` | `"30x20x15mm (vol 4.5 cc)"` |
| 30, 20, 15, 0 | `" of 30 x 20 x 15mm"` | `"30x20x15mm"` |
| 30, 20, 0, 0 | `" of 30 x 20mm"` | `"30x20mm"` |
| 30, 0, 0, 0 | `" of 30mm"` | `"30mm"` |

**Question for reviewer:** Which format do you prefer in the report text?

- [ ]  Option A: With spaces and ” of ” prefix (earlyT1 style): `" of 30 x 20 x 15mm"`
- [x]  Option B: Without spaces, no prefix (all other exams): `"30x20x15mm"`
- [ ]  Option C: With spaces but no ” of ” prefix: `"30 x 20 x 15mm"`
- [ ]  Other: _______________

---

## Fibroid Reporting

---

### Q4. GetFibroidCount

**What it does:** Generates text describing how many fibroids were identified, e.g., “One fibroid is…” or “Two fibroids are…”. Used when building the fibroid section of the report.

**Where it’s used:** earlyT1 and gynae.

**The difference:** earlyT1 uses present tense (“is/are”) while gynae uses past tense (“was/were”).

**Example output:**

| Fibroid count | earlyT1 | gynae |
| --- | --- | --- |
| 0 | “No fibroids were” | “No fibroids were” |
| 1 | “One fibroid **is**” | “One fibroid **was**” |
| 3 | “Three fibroids **are**” | “Three fibroids **were**” |

Note: both use “were” for zero fibroids – only the non-zero cases differ.

**Question for reviewer:** Early pregnancy scans describe findings in the present (“there is a fibroid”). Gynae scans describe findings in the past (“a fibroid was visualised”). Is this tense difference intentional?

- [ ]  Option A: Use present tense for all exams (“is/are”)
- [x]  Option B: Use past tense for all exams (“was/were”)
- [ ]  Option C: Keep separate – obstetric exams use present tense, gynae uses past tense
- [ ]  Other: _______________

---

### Q5. getFibroid

**What it does:** Builds the complete fibroid description paragraph for the report. Handles single fibroids, multiple fibroids, and the case where fibroids are noted but not yet detailed.

**Where it’s used:** earlyT1, 20week, pe12week, t3Singleton, t3twins (5 obstetric exams).

**The difference:** Several small spacing/punctuation inconsistencies across 4 variants:

| Detail | earlyT1 + 20week | pe12week | t3Singleton | t3twins |
| --- | --- | --- | --- | --- |
| Single fibroid intro | `"There is a"` (no space before dimensions) | `"There is a "` (space before dimensions) | `"There is a"` (no space) | `"There is a "` (space) |
| Multi-fibroid separator (and) | `" and"` | `" and "` | `" and "` | `" and "` |
| Multi-fibroid separator (comma) | `","` | `", "` | `", "` | `", "` |
| Fallback when no detail entered | `"Fibroid/s"` | `"Fibroid/s"` | `"Fibroid/s"` | `"Fibroid"` |
| Null checks on dimensions | yes | yes | yes | **no** – always builds text |

**Example output (single fibroid, 30mm anterior subserosal):**

| Exam | Output |
| --- | --- |
| earlyT1/20week | `"There is a 30mm anterior subserosal fibroid seen."` (note: “a” runs into the dimension) |
| pe12week | `"There is a 30mm anterior subserosal fibroid seen."` (proper space after “a”) |

**Example output (2 fibroids):**

| Exam | Output |
| --- | --- |
| earlyT1/20week | `"There are fibroids identified: [fib1] and[fib2]"` (no space before second fibroid) |
| pe12week/t3Singleton/t3twins | `"There are fibroids identified: [fib1] and [fib2]"` (proper space) |

**Question for reviewer:** The pe12week version with proper spacing looks like the intended version. The missing spaces in earlyT1/20week and missing null checks in t3twins look like copy-paste drift. Do you agree?

- [x]  Option A: Use pe12week version (proper spaces, null checks) for all exams
- [ ]  Option B: Keep separate – the differences are intentional
- [ ]  Other: _______________

---

### Q6. GetFibroidString

**What it does:** Builds the text description of a single fibroid, including its measurements, position, type, and relationship to the cervix. For example: “30 x 20 x 15mm anterior subserosal fibroid within 5 mm of the cervix”.

**Where it’s used:** earlyT1, 20week, pe12week, t3Singleton, t3twins.

**The difference:** Three variants with two key structural differences:

1. **Word order:** earlyT1 puts the description first (`"left anterior subserosal 30x20mm"`), while 20week/pe12week/t3 put measurements first (`"30x20mm left anterior subserosal fibroid"`)
2. **Cervix clearance:** earlyT1 has commented-out “clear of cervix” text; 20week includes it; pe12week/t3 include a comma variant

| Detail | earlyT1 | 20week | pe12week, t3Singleton, t3twins |
| --- | --- | --- | --- |
| Order | Description then dimensions | Dimensions then description | Dimensions then description |
| Volume format | `%3.1f cc` (decimal, e.g. “4.5 cc”) | `%dcc` (integer, e.g. “4cc”) | `%dcc` (integer, e.g. “4cc”) |
| Left/right casing | As entered | Lowercase | Lowercase |
| Cervix clearance text | Commented out | `" clear of the cervix"` | `", clear of the cervix"` |
| Appends ” fibroid” | No (done elsewhere) | Yes | Yes |

**Example output (single 30x20x15mm left anterior subserosal fibroid, not close to cervix, 2 total fibroids so clearance applies):**

| Exam | Output |
| --- | --- |
| earlyT1 | `"Left anterior subserosal 30 x 20 x 15mm"` |
| 20week | `" 30 x 20 x 15mm left anterior subserosal fibroid clear of the cervix"` |
| pe12week/t3 | `"30 x 20 x 15mm left anterior subserosal fibroid, clear of the cervix"` |

**Question for reviewer:** Should the report say “clear of the cervix” or “, clear of the cervix” (with comma)? And should the word order be measurements-first or description-first?

- [ ]  Option A: Use 20week style (measurements first, “clear of the cervix” without comma)
- [x]  Option B: Use pe12week/t3 style (measurements first, “, clear of the cervix” with comma)
- [ ]  Option C: Use earlyT1 style (description first, no cervix clearance text)
- [ ]  Option D: Keep separate – the differences are intentional
- [ ]  Other: _______________

---

### Q7. GetFibroidConcl

**What it does:** Generates the fibroid summary for the conclusion section of the report. Describes the number, size range, and whether there is cavity distortion.

**Where it’s used:** earlyT1 and gynae only.

**The difference:** These two exams have fundamentally different clinical contexts, which leads to different report language:

| Detail | earlyT1 (obstetric) | gynae |
| --- | --- | --- |
| Multiple fibroids intro | `"Multiple fibroids ranging from..."` | `", containing multiple fibroids ranging from..."` |
| Distortion present | `"The position of the fibroids in relation to the cervix should be reviewed in the third trimester."` | `"with associated cavity distortion"` |
| No distortion | `"all clear of cervix."` | (no text added) |
| Single fibroid, no distortion | Just a period | `"with no associated cavity distortion"` |

**Example output (3 fibroids, sizes 15-40mm, distortion present):**

| Exam | Output |
| --- | --- |
| earlyT1 | `"Multiple fibroids ranging from 15mm to 40mm. The position of the fibroids in relation to the cervix should be reviewed in the third trimester."` |
| gynae | `", containing multiple fibroids ranging from 15mm to 40mm with associated cavity distortion"` |

**Question for reviewer:** These differences look intentional – obstetric care is concerned about the cervix in pregnancy, while gynae focuses on cavity distortion. Please confirm.

- [ ]  Option A: Keep separate – obstetric exams need the cervix review text, gynae needs the cavity distortion text
- [ ]  Option B: Standardise to one version (specify which: _______________)
- [x]  Other: Early T1 should use the same conclusion as the other obstetric scans. The gynae one will be redone when we make the gynae

---

### Q8. GetSingleFibroidDimensions

**What it does:** Formats the measurements of a single fibroid (the first one entered). For example: “30 x 20 x 15mm (vol. 4.5 cc)”.

**Where it’s used:** earlyT1, 20week, pe12week, t3Singleton, t3twins, and gynae.

**The difference:** Three variants:

| Detail | earlyT1 | 20week/pe12week/t3Singleton/t3twins | gynae |
| --- | --- | --- | --- |
| Volume data type | Decimal (`%3.1f cc`) | Integer (`%dcc`) | Decimal (via GetIntegerMeasuredString) |
| Extra text | None | None | Adds “was visualised”, “and measured”, cavity distortion/projection language |
| Purpose | Just dimensions | Just dimensions | Full sentence fragment about the fibroid |

**Example output (30x20x15mm, vol 4.5cc, subserosal, cavity distortion checked):**

| Exam | Output |
| --- | --- |
| earlyT1 | `" 30 x 20 x 15mm (vol. 4.5 cc)"` |
| 20week/pe12week/t3 | `" 30 x 20 x 15mm (vol. 4cc)"` (note: volume truncated to integer) |
| gynae | `"was visualised and measured 30x20x15mm (vol 4.5 cc) with associated cavity distortion"` |

**Question for reviewer:** Two things to decide:

1. Should volume be shown as a decimal (4.5 cc) or rounded to an integer (4 cc)?
2. The gynae version builds a complete sentence fragment rather than just dimensions. Is that intentionally different?
- [ ]  Option A: Use decimal volume everywhere (4.5 cc) – the integer truncation in 20week/pe12week/t3 is a bug
- [x]  Option B: Use integer volume everywhere (4 cc) – the decimal is unnecessary precision
- [ ]  Option C: The gynae sentence-building is intentionally different from obstetric exams; keep separate
- [ ]  Other: Gynae one will be remade when we make that template

---

### Q24. GetCavDistortionCount

**What it does:** Counts how many fibroids have associated cavity distortion. This number is used to decide whether to mention cavity distortion in the report.

**Where it’s used:** All 6 exams.

**The difference:** Three variants with a significant logic difference:

| Detail | earlyT1 | 20week/pe12week/t3Singleton/t3twins | gynae |
| --- | --- | --- | --- |
| Fibroids checked | All 10 (fibroid 1 through 10) | **Only fibroid 1** (fibroids 2-10 commented out) | All (via loop based on count) |
| Also checks fibroid type | No | No | Yes (excludes type index 2) |
| Function signature | `GetCavDistortionCount: Integer` | `GetCavDistortionCount: Integer` | `GetCavDistortionCount(var isValidDist: Boolean): Integer` |

This means that in 20week, pe12week, t3Singleton, and t3twins, if a patient has 3 fibroids and fibroids 2 and 3 cause cavity distortion (but fibroid 1 does not), the count will be **0** instead of 2.

**Question for reviewer:** The 20week/pe12week/t3 versions only check the first fibroid. Was the code for fibroids 2-10 deliberately commented out (perhaps because those exams only support 1 fibroid on the form), or is this a bug?

- [ ]  Option A: The commented-out code is correct – those exams only support 1 fibroid entry, so checking more would be pointless
- [ ]  Option B: This is a bug – restore the loop to check all fibroids
- [ ]  Option C: Use the gynae loop-based approach for all exams (it also checks fibroid type)
- [ ]  Other: make earlyT1 and the others minus gynae the same (all 10) gynae will be remade

---

### Q25. spFibroidCountOnChange

**What it does:** When the sonographer changes the fibroid count on the form, this function shows or hides the appropriate number of fibroid data-entry panels.

**Where it’s used:** All 6 exams.

**The difference:** The exams support different maximum numbers of fibroids:

| Exam(s) | Max fibroids | Panels shown/hidden |
| --- | --- | --- |
| earlyT1, gynae | 10 | gbFibroid1 through gbFibroid10 |
| 20week, pe12week, t3Singleton | 5 | gbFibroid1 through gbFibroid5 |
| t3twins | 1 | gbFibroid1 only |

**Question for reviewer:** Is the maximum number of fibroids intentionally different per exam type? For instance, are later pregnancy scans expected to have fewer fibroids recorded because the focus is different?

- [ ]  Option A: Keep different maximums – the form layouts differ per exam
- [x]  Option B: Standardise to 10 for all exams
- [ ]  Option C: Standardise to 5 for all exams
- [ ]  Other: _______________

---

## Clinical History and Indications

---

### Q9. GetClinicalIndicators

**What it does:** Collects the selected referral indications (reason for the scan) from a checklist on the form and builds them into a text string for the report. For example: “Routine 20-week scan. Previous caesarean section.”

**Where it’s used:** earlyT1, 20week, pe12week, t3Singleton, t3twins (5 exams).

**The difference:** Four variants with three types of difference:

| Detail | earlyT1 | 20week | pe12week | t3Singleton/t3twins |
| --- | --- | --- | --- | --- |
| Separator between items | `".  "` (period + 2 spaces) | `".  "` (period + 2 spaces) | `AddFullStop(result)` (uses the function from Q1) | `".  "` (period + 2 spaces) |
| “Other” text field name | `edtPresentComplaintOther` | `edtReferralIndicator1` | `edtReferralIndicator1` | `edtReferralIndicator1` |
| Final formatting | `AddFullstopToEnd` | `AddFullStop` | `AddFullStop` | `AddFullStop` |
| Trailing space after result | No (commented out) | No (commented out) | No | Yes (active code) |
| “Other” text capitalisation | As entered | As entered | `InitCaps` (auto-capitalise) | As entered |

**Example output (two indications selected + “Other” typed as “query placenta praevia”):**

| Exam | Output |
| --- | --- |
| earlyT1 | `"Routine scan.  Previous caesarean section.  query placenta praevia.  "` |
| 20week | `"Routine scan.  Previous caesarean section.  query placenta praevia.  "` |
| pe12week | `"Routine scan. Previous caesarean section. Query placenta praevia. "` (note: auto-capitalised, 1-space separation via AddFullStop) |
| t3Singleton/t3twins | `"Routine scan.  Previous caesarean section.  query placenta praevia.  "` (with trailing space) |

**Question for reviewer:** pe12week auto-capitalises the “Other” free-text and uses AddFullStop for separation (which may give 1 space or 2 depending on Q1). The other exams use a hardcoded `".  "` separator. Which approach is preferred?

- [x]  Option A: Use pe12week style (AddFullStop for separation, auto-capitalise “Other” text)
- [ ]  Option B: Use earlyT1/20week/t3 style (hardcoded “.” separator, no auto-capitalisation)
- [ ]  Option C: Use a hybrid (auto-capitalise “Other” but use consistent separator)
- [ ]  Other:

---

### Q10. GetObstetricHistory

**What it does:** Collects the patient’s past obstetric history from a checklist (e.g., “Previous caesarean section”, “Previous miscarriage”) and builds it into a text string.

**Where it’s used:** 20week, pe12week, t3Singleton, t3twins.

**The difference:** Two variants:

| Detail | 20week, t3Singleton | pe12week, t3twins |
| --- | --- | --- |
| Prefix | `"Past Hx: "` prepended to the result | No prefix |

**Example output (history items: “Previous caesarean section”, “Gestational diabetes”):**

| Exam | Output |
| --- | --- |
| 20week/t3Singleton | `"Past Hx: Previous caesarean section.  Gestational diabetes."` |
| pe12week/t3twins | `"Previous caesarean section.  Gestational diabetes."` |

**Question for reviewer:** The “Past Hx:” prefix labels the section explicitly. Is this prefix needed, or is the context already clear from where it appears in the report?

- [ ]  Option A: Always include the “Past Hx:” prefix
- [ ]  Option B: Never include the prefix – the report template already labels this section
- [ ]  Option C: Keep separate – some exams need the prefix and others don’t
- [x]  Other: Always include a “Past History:” prefix

---

### Q11. GetClinicalHistory

**What it does:** Collects clinical history items from a checklist and builds text for the report. Conceptually similar to GetObstetricHistory but uses a different checklist on the form.

**Where it’s used:** earlyT1, 20week, pe12week, t3Singleton, t3twins.

**The difference:** earlyT1 has a full working implementation. All other exams have an **empty function** (the function exists but does nothing – the body is just `result := '';`).

| Exam | Behaviour |
| --- | --- |
| earlyT1 | Iterates through `cbClinicalHistory` checklist, joins selected items with `".  "`, appends free-text from `edtClicnicalHistory` if the “Other” option is checked |
| 20week, pe12week, t3Singleton, t3twins | Returns empty string (function body is blank) |

**Question for reviewer:** Is the empty function in the other 4 exams intentional (those exams don’t use a clinical history checklist – they use obstetric history instead), or was the implementation accidentally removed?

- [ ]  Option A: Intentional – only earlyT1 uses a clinical history checklist; the other exams use GetObstetricHistory instead
- [ ]  Option B: Bug – the implementation should be present in all exams
- [x]  Other: Unclear at this point

---

## Gestational Age and Dating

---

### Q12. getCompositeDate

**What it does:** Formats the gestational age as text, e.g., “20 weeks 3 days” or “12 weeks 0 days”. Used when displaying the ultrasound-derived gestational age on the report.

**Where it’s used:** earlyT1, pe12week, 20week.

**The difference:** The logic for handling singular/plural “day” vs “days” is reversed between the two variants, and they handle 0 days differently:

| Scenario | Variant A (earlyT1, pe12week) | Variant B (20week) |
| --- | --- | --- |
| 3 days | `"3 days"` (days > 1, so plural) | `"3 days"` (days != 1, so plural) |
| 1 day | `"1 day"` (days = 1, so singular) | `"1 day"` (days = 1, so singular) |
| 0 days | `"0 days"` (special case: days = 0) | `"0 days"` (days >= 0 and != 1, so plural) |
| Days not entered | Nothing appended | `"0 days"` (0 >= 0 is true) |

The key difference is in the boundary conditions:
- Variant A: shows “0 days” only when days is exactly 0. If days is negative or unset, nothing is appended.
- Variant B: uses `>= 0` so it always enters the days block, even for 0.

Both produce the same output for typical inputs (1+ days). The difference only matters for edge cases.

**Question for reviewer:** Should “0 days” always be shown (e.g., “20 weeks 0 days”) or omitted when days is 0?

- [x]  Option A: Always show “0 days” – “20 weeks 0 days” is clearer
- [ ]  Option B: Omit when 0 – “20 weeks” is sufficient
- [ ]  Option C: The current behaviour is fine for each exam; keep separate
- [ ]  Other: _______________

---

## Ovaries

---

### Q13. GetOvary

**What it does:** Generates the ovary findings text for the body of the report. Describes whether ovaries were identified, normal, abnormal, or if a corpus luteum was seen.

**Where it’s used:** earlyT1, 20week, pe12week (3 exams).

**The difference:** Three variants with significantly different scope:

| Feature | earlyT1 | pe12week | 20week |
| --- | --- | --- | --- |
| Reports “not identified” | Yes | No | No |
| Reports “normal” | Yes (“Both ovaries are normal”) | No | Yes, but returns empty if both are normal |
| Reports “abnormal” | Yes | Yes | Yes |
| Corpus luteum | Yes (“A corpus luteum is visualised in the right/left/both ovaries”) | No | No (commented out – note typo: “s visualised”) |
| Abnormal text style | “The right ovary is abnormal.” | “Abnormal right ovary.” | “The right ovary is abnormal.” |
| Formatting prefix | `#13#10 + #13#10` (blank line) | `#13#10+#13#10 + '#|#+BOLDOvaries:#/#' + #13#10` (bold heading) | `#13#10+#13#10` (blank line) |

**Example output (right ovary normal, left ovary abnormal):**

| Exam | Output |
| --- | --- |
| earlyT1 | `"The right ovary is normal.  The left ovary is abnormal.  "` |
| 20week | `"The right ovary is normal.  The left ovary is abnormal.  "` |
| pe12week | `"Abnormal left ovary.  "` (under bold “Ovaries:” heading; normal ovary not mentioned) |

**Question for reviewer:** Each exam reports ovaries at different levels of detail. Is this intentional?

- earlyT1 is a comprehensive early pregnancy ovary check (corpus luteum matters for confirming pregnancy location)
- 20week drops corpus luteum reporting (makes sense – less relevant at 20 weeks)
- pe12week only reports abnormalities (makes sense – it’s a focused screening exam)
- [ ]  Option A: Keep separate – the level of detail is appropriate for each exam type
- [ ]  Option B: Standardise to earlyT1 version (most comprehensive)
- [ ]  Option C: Standardise to a simpler version
- [x]  Other: See table

| Feature | Ideal functionality |
| --- | --- |
| Reports “not identified” | Yes |
| Reports “normal” | Yes (“Both ovaries appear normal”) |
| Reports “abnormal” | Yes |
| Corpus luteum | Yes (“A corpus luteum is visualised in the right/left/both ovaries”) |
| Abnormal text style | “The right ovary is abnormal.” |
| Formatting prefix | `#13#10+#13#10 + '#|#+BOLDOvaries:#/#' + #13#10`
(bold heading) |

---

## Cervix

---

### Q14. getCervixConclusion

**What it does:** Generates the cervix-related text for the conclusion section of the report. A shortened cervix (under 25mm) is clinically significant and may need to be flagged.

**Where it’s used:** 20week, pe12week, t3Singleton, t3twins.

**The difference:** Three variants with very different levels of detail:

| Detail | Variant A (20week, pe12week) | Variant B (t3Singleton) | Variant C (t3twins) |
| --- | --- | --- | --- |
| Reports length | No | No (code is commented out) | Yes |
| Reports scan method (TVS/TA) | No | No (commented out) | Yes |
| Normal cervix text | Nothing | Nothing (commented out) | “Long and closed cervix” |
| Short cervix text | “Shortened cervix” | Nothing active (uses GCervixWarning flag only) | “Shortened cervix” |
| Sets warning flag | No | Yes (GCervixWarning) | Yes (GCervixWarning) |
| Includes measurement | No | No | Yes, with format: `"(25mm on transvaginal ultrasound)"` |

**Example output (cervix length 22mm, measured transvaginally):**

| Exam | Output |
| --- | --- |
| 20week/pe12week | `"Shortened cervix."` |
| t3Singleton | `""` (empty – active code only sets warning flag; detailed text is commented out) |
| t3twins | `"Shortened cervix (22mm on transvaginal ultrasound)."` |

**Question for reviewer:** The t3twins version is the most informative (includes measurement and method). The t3Singleton version appears to have had its detailed text commented out, leaving only the warning flag. Should all exams that report cervix in the conclusion include the measurement and scan method?

- [ ]  Option A: Use t3twins version for all exams (includes measurement and scan method)
- [ ]  Option B: Use 20week/pe12week version (just “Shortened cervix”, simple)
- [ ]  Option C: The t3Singleton commented-out code should be uncommented (it was probably disabled temporarily)
- [ ]  Option D: Keep separate – different exams need different detail levels
- [x]  Other: normally when the cervix is shortened, that's the only time that it is put in the conclusion. So it might then say shortened cervix, but it should then also probably say the length of that cervix if it is shortened. That's really for the 20 week scan. Maybe that option should exist for the 30 semester scan and for the T3 twins, but if we then don't fill it out, it shouldn't put anything in the conclusion because we often don't measure the cervix. And then there is an exceptional situation where we also want a normal measurement of the cervix in the conclusion. And that is if the indication is ticked to be cervical surveillance because sometimes women come to have their cervix assessed particularly. And then it's important to also put in the conclusion if the measurement is normal, that it just say cervix is long and closed measuring and then the measurement of the cervix in the conclusion. That's the only time a normal cervix needs to go in the conclusion.

---

### Q15. getCervixDetailed

**What it does:** Generates the detailed cervix description for the body of the report (not the conclusion). Includes cervix length, whether it is long/closed or shortened, scan method, and funnelling/suture information.

**Where it’s used:** 20week and pe12week.

**The difference:** The key difference is where the measurement appears in the text:

| Detail | 20week | pe12week |
| --- | --- | --- |
| Measurement placement | Inline: `"The cervix is long and closed, 30mm on transvaginal ultrasound."` | After scan method: `"The cervix is long and closed on transvaginal ultrasound. The closed length of cervix is 30mm."` |

**Example output (cervix 30mm, not short, TVS):**

| Exam | Output |
| --- | --- |
| 20week | `"The cervix is long and closed, 30mm on transvaginal ultrasound."` |
| pe12week | `"The cervix is long and closed on transvaginal ultrasound. The closed length of cervix is 30mm."` |

**Example output (cervix 20mm, short, TVS):**

| Exam | Output |
| --- | --- |
| 20week | `"The cervix is shortened, 20mm on transvaginal ultrasound."` |
| pe12week | `"The cervix is shortened on transvaginal ultrasound. The closed length of cervix is 20mm."` |

**Question for reviewer:** Which sentence structure is preferred for the cervix measurement?

- [x]  Option A: Use 20week style – measurement inline: `"...long and closed, 30mm on TVS"`
- [ ]  Option B: Use pe12week style – measurement in separate sentence: `"...long and closed on TVS. The closed length of cervix is 30mm."`
- [ ]  Option C: Keep separate – the difference is intentional
- [ ]  Other: _______________

---

## Placenta

---

### Q16. GetPlacenta

**What it does:** Returns the placental site (e.g., “anterior”, “posterior”) in lowercase for inclusion in the report text.

**Where it’s used:** 20week, pe12week, t3Singleton.

**The difference:** pe12week appends “ly” to the placental site text, turning it into an adverb.

| Input (cbPlacentaSite1) | 20week/t3Singleton | pe12week |
| --- | --- | --- |
| “Anterior” | `"anterior"` | `"anteriorly"` |
| “Posterior” | `"posterior"` | `"posteriorly"` |
| “” (empty) | `""` | `""` (has null check) |

This suggests pe12week uses the result in a different sentence structure (e.g., “The placenta is situated **anteriorly**” vs “**anterior** placenta”).

**Question for reviewer:** Is the “ly” suffix in pe12week intentional because the report template uses it in a different sentence structure?

- [x]  Option A: Keep separate – pe12week uses it adverbially in its report template
- [ ]  Option B: Standardise without “ly” – the report templates should be updated to use the same phrasing
- [ ]  Other: _______________

---

### Q17. GetPlacenta1Measure

**What it does:** Gets the measurement of how far the placenta extends beyond or from the internal cervical os. Used in low-lying placenta descriptions.

**Where it’s used:** 20week, t3Singleton, t3twins.

**The difference:** Small variations in how the value is read from the form control:

| Detail | 20week | t3Singleton | t3twins |
| --- | --- | --- | --- |
| Check method | `sePlacentaExtendsBy1.text <> ''` | `sePlacentaExtendsBy1.text <> ''` | `sePlacentaExtendsBy1.Value > 0` |
| Value access | `sePlacentaExtendsBy1.text` | `(sePlacentaExtendsBy1.text)` (extra parentheses) | `IntToStr(sePlacentaExtendsBy1.Value)` |

The t3twins version uses `.Value` (numeric) instead of `.text` (string), and checks `> 0` instead of `<> ''`. This means t3twins will skip the value if it is 0, while the other versions would show “0”.

**Question for reviewer:** If the extends-by value is 0, should it be shown (meaning the edge is right at the os) or treated as not entered?

- [ ]  Option A: Use `.Value > 0` check (t3twins) – a value of 0 means “not entered”, show the fallback text instead
- [x]  Option B: Use `.text <> ''` check (20week/t3Singleton) – a value of 0 is meaningful and should be shown
- [ ]  Other:

---

### Q18. getPlacentaBeyond

**What it does:** Generates the text describing a placenta that extends beyond the internal cervical os, e.g., “Placenta is anterior, extending inferiorly 15 mm beyond the internal cervical os.”

**Where it’s used:** 20week and t3Singleton.

**The difference:** Tense – “is” vs “was”:

| Exam | Output |
| --- | --- |
| 20week | `"Placenta **is** anterior, extending..."` |
| t3Singleton | `"Placenta **was** anterior, extending..."` |

**Question for reviewer:** Same question as Q4 (fibroid tense). Is “was” used in T3 because findings are being described retrospectively at a later scan?

- [x]  Option A: Use present tense (“is”) for all exams
- [ ]  Option B: Use past tense (“was”) for all exams
- [ ]  Option C: Keep separate – tense should match the exam’s reporting convention
- [ ]  Other: _______________

---

### Q19. getPlacentaConclusion

**What it does:** Generates the placenta-related text for the conclusion section of the report.

**Where it’s used:** 20week, pe12week, t3Singleton, t3twins.

**The difference:** Four variants with very different levels of detail:

| Feature | 20week | t3twins | t3Singleton | pe12week |
| --- | --- | --- | --- | --- |
| Low-lying text | `"Low lying placenta. Review of placental site at 32 weeks is indicated."` | `"Low lying placenta. Review of placental site at 32 weeks is indicated"` | Low lying + site + measurement from os | Nothing |
| Vasa praevia | Yes | No | No | No |
| Succenturiate lobe | Yes | No | No | No |
| Edge reaching os | No | No | Yes (`"with the inferior edge reaching the internal cervical os"`) | No |

**Example output (low-lying placenta, anterior, 5mm from os):**

| Exam | Output |
| --- | --- |
| 20week | `"Low lying placenta. Review of placental site at 32 weeks is indicated."` (measurement in commented-out code) |
| pe12week | `""` (empty) |
| t3Singleton | `"Low lying anterior placenta, 5 from the internal cervical os."` |
| t3twins | `"Low lying placenta. Review of placental site at 32 weeks is indicated"` |

**Question for reviewer:** The 20week version has the most features (vasa praevia, succenturiate lobe) but its measurement code is commented out. The t3Singleton version includes the measurement. pe12week does nothing. Are these differences all intentional?

- [ ]  Option A: Keep separate – each exam needs different placenta conclusion detail
- [ ]  Option B: The pe12week empty function is a bug – it should have an implementation
- [ ]  Option C: The 20week commented-out measurement should be restored
- [x]  Other: see table

| Feature | 20 Week | t3twins/t3Singleton | pe12week |
| --- | --- | --- | --- |
| Low-lying text | Low lying placenta. Review of placental site at 32 weeks is indicated. | Low lying anterior placenta, 5 from the internal cervical os. | No |
| Vasa praevia | Yes | Yes | No |
| Succenturiate lobe | Yes | Yes | No |
| Edge reaching os | Yes (with the inferior edge reaching the internal cervical os) | Yes (with the inferior edge reaching the internal cervical os) | No |

---

### Q20. getPlacentalPosition

**What it does:** Describes the placental position in the body of the report, including whether it is low-lying and the distance from the internal cervical os.

**Where it’s used:** 20week and t3Singleton.

**The difference:** t3Singleton has an extra clause for when the measurement is exactly 0 (the placental edge is right at the os):

| Measurement from os | 20week | t3Singleton |
| --- | --- | --- |
| > 0 (e.g. 5mm) | `"Leading edge 5mm the internal cervical os."` | `"Leading edge 5mm the internal cervical os."` |
| = 0 | No extra text | `"The inferior edge reaching the internal cervical os."` |

**Question for reviewer:** When the placental edge is exactly at the internal os (0mm away), should the report say “The inferior edge reaching the internal cervical os” or just omit the measurement detail?

- [ ]  Option A: Add the “edge reaching the os” text for all exams (t3Singleton style)
- [ ]  Option B: Omit the text when measurement is 0 (20week style)
- [ ]  Option C: Keep separate
- [x]  Other: See table

| Measurement from os | t3Singleton |
| --- | --- |
| > 0 (e.g. 5mm) | `"The leading edge is 5mm from the internal cervical os."` |
| = 0 | `"The inferior edge is reaching the internal cervical os."` |

---

## Doppler / Vascular

---

### Q21. GetNormalMCAPIRange

**What it does:** Returns the normal reference value for the Middle Cerebral Artery Pulsatility Index (MCA PI) at a given gestational week. These are looked up from a table and used to determine whether a measured Doppler value is normal or abnormal. An abnormal MCA PI can indicate fetal anaemia.

**Where it’s used:** 20week, t3Singleton, t3twins.

**The difference:** The two variants use different reference values and cover different gestational ranges:

| Gestational Week | 20week values | t3Singleton/t3twins values |
| --- | --- | --- |
| 20 | not covered | 1.227 |
| 21 | 1.18 | 1.278 |
| 22 | 1.25 | 1.330 |
| 23 | 1.32 | 1.381 |
| 24 | 1.38 | 1.430 |
| 25 | 1.44 | 1.476 |
| 26 | 1.50 | 1.517 |
| 27 | 1.55 | 1.553 |
| 28 | 1.58 | 1.580 |
| 29 | 1.61 | 1.599 |
| 30 | 1.62 | 1.607 |
| 31 | 1.62 | 1.603 |
| 32 | 1.61 | 1.586 |
| 33 | 1.58 | 1.555 |
| 34 | 1.53 | 1.511 |
| 35 | 1.47 | 1.453 |
| 36 | 1.39 | 1.382 |
| 37 | 1.30 | 1.300 |
| 38 | 1.20 | 1.208 |
| 39 | 1.10 | 1.108 |
| 40 | not covered | 1.002 |
| 41 | not covered | 0.894 |

The t3Singleton/t3twins values are generally slightly higher (more precise – 3 decimal places vs 2) and cover weeks 20-41 instead of 21-39.

**Question for reviewer:** These appear to be from different published reference charts. The T3 values look like they may be from a more recent or more precise source. Which reference values should be used?

- [ ]  Option A: Use the t3Singleton/t3twins values for all exams (more precise, wider range)
- [ ]  Option B: Use the 20week values for all exams
- [ ]  Option C: Keep separate – different gestational periods should use different reference charts
- [ ]  Option D: These should both be updated to a specific published reference (specify: _______________)
- [x]  Other: unclear for now. Likely t3 scan is the correct data, but sofie will confirm this

---

## Percentile Graphs and Biometry

---

### Q22. GetPerGraph

**What it does:** Generates a text-based visual graph showing where a measurement percentile falls. It produces output like `" [---x-----|---------]"` to show the percentile position on a scale from <3rd to >97th. This appears on the printed report.

**Where it’s used:** 20week, pe12week, t3Singleton, t3twins.

**The difference:** When the percentile is below the 3rd centile, the graph starts differently:

| Percentile | 20week, t3Singleton/t3twins | pe12week |
| --- | --- | --- |
| < 3 or “<3” | `"x[---------|---------]"` (no leading space) | `" x[---------|---------]"` (leading space) |
| All other values | `" [---x-----|---------]"` (leading space) | `" [---x-----|---------]"` (leading space) |

This means in 20week/t3, the “x” for below-3rd-percentile is one character to the left compared to all other values, which may look misaligned on the printed report. In pe12week, all values line up consistently.

**Question for reviewer:** Should the below-3rd-percentile “x” have a leading space to align with the rest of the graph?

- [ ]  Option A: Add the leading space (pe12week style) – the graph should align consistently
- [ ]  Option B: No leading space (20week/t3 style) – the “x” outside the brackets is intentional
- [x]  Other: no leading space for less than 3, but do have a leading space for all other values. Exactly like how the 20-week T3 Singleton and T3 twins currently functions. Sophie to investigate whether or not it should be under the third percentile or under the fifth percentile that brings the X below the bar.

---

## UI Behaviour

---

### Q23. cbToggleCheckOnClick

**What it does:** When a checkbox is clicked, this function unchecks all other checkboxes in the same group – essentially making a group of checkboxes behave like radio buttons (only one can be selected at a time). For example, “Normal” and “Abnormal” checkboxes for anatomy.

**Where it’s used:** All 6 exams.

**The difference:** gynae uses explicit type casts (`TcxCheckBox(Sender).Checked`) while all other exams use implicit property access (`Sender.Checked`).

Both versions do the same thing. The gynae version is more “defensive” – it explicitly tells the code what type of control it’s working with, which can prevent errors if the function were ever called with a non-checkbox control.

**Question for reviewer:** This is a purely technical difference with no clinical impact. Both behave identically. We plan to use the explicit type-cast version (gynae style) as it is safer.

- [x]  Option A: Agreed – use the gynae version with explicit type casts
- [ ]  Option B: Prefer the simpler version without explicit casts
- [ ]  Other: _______________

---

## Notes for Reviewer

- **“##”** in the output text is a placeholder that signals the sonographer needs to dictate something manually.
- **`#13#10`** represents a line break in the report.
- **`#|#+BOLD...#/#`** is a formatting code that makes text bold in the final report.
- Questions about **tense** (is/was, are/were) come up repeatedly. If there’s a general rule (e.g., “obstetric exams use present tense, gynae uses past tense”), please note it and we’ll apply it consistently.
- Questions about **spacing** (1 space vs 2 spaces after a period) also recur. If there’s a house style, please note it once and we’ll apply it everywhere.

Thank you for your time reviewing these. Your answers will help us build a single, consistent codebase that produces correct reports for all exam types.

Just dictate really clearly.