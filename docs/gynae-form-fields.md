# Meeting Notes: Gynae Form Fields and Template Design

## Attendees

- **Sophie** -- Sonographer / clinical lead; primary domain expert specifying field requirements
- **Karl** -- Developer; reviewing an AI-generated form specification, asking clarifying questions, recording decisions

---

## Summary

Karl presented an AI-generated gynae form specification (produced by Claude from existing report exports) and walked through it section by section with Sophie. Sophie provided detailed clinical requirements for each tab and field, specifying what to keep, remove, restructure, and add. The meeting established the definitive tab structure, field types, conditional visibility rules, and clinical logic for the gynae ultrasound reporting template.

---

## 1. Overall Form Structure

- The AI-generated spec captured all complexity across existing forms but was too complex for daily use -- too many tabs and fields
- Agreed principle: **show only what is needed; hide complexity behind conditional sections**
- Standard assessment order (matching report output order):
  1. **Uterus** (including myometrium, adenomyosis, fibroids, congenital abnormalities)
  2. **Endometrium**
  3. **Ovaries** (right then left, plus IOTA/ovarian lesions)
  4. **Endometriosis assessment** (bladder, kidneys, vaginal vault, Pouch of Douglas, retro-cervical region, uterosacral ligaments, bowel)
  5. **Procedures** (saline hysterosonography, tubal patency)

---

## 2. Uterus Tab

### Position
- Drop-down: anteverted, retroverted, axial, anteflexed, retroflexed

### Measurements
- Come in automatically from DICOM -- no manual entry needed
- Volume is automatic

### Size Classification
- **Computed from volume**, not a drop-down
- Different thresholds depending on whether the patient has had children (nulligravida vs. multiparous):
  - Need two lookup tables: one for nulligravida, one for parous women
  - Parity information comes from clinical details / indication
  - If parity is unknown: anything under 120 mL is generally normal, over 120 mL is bulky, around 200 mL is large
- Sophie will provide agreed-upon size thresholds for both groups

### Hysterectomy
- Checkbox: hysterectomy yes/no
- If yes: cervix present yes/no
- If cervix absent: show vaginal vault assessment fields
- If no hysterectomy: do not show cervix-present question

### Congenital Abnormality
- Checkbox: congenital abnormality of the uterus yes/no
- If yes: show a visual grid of approximately 8-10 pictures of uterine structural abnormalities (from a published classification article)
- User selects the picture; the system auto-labels it with the correct classification name and embeds the picture in the report
- This replaces the old "uterine shape" text drop-down -- fixes the problem of different clinicians using different names for the same abnormality
- **Septum**: width and length measurements (check if DICOM can supply these automatically)

### LSCS (Caesarean) Scar
- Moved here from the endometrium section -- it belongs under uterus
- Checkbox: LSCS scar identified yes/no

### Uterus Mobility
- Moved to the Pouch of Douglas section under Endometriosis assessment (that is what determines mobility)

---

## 3. Myometrium (Sub-section of Uterus)

Two pathologies assessed, both using **conditional expand** pattern:

### Adenomyosis
- Checkbox: present yes/no
- If present, expand section with:
  - **Type** (binary choice, radio buttons): diffuse OR focal
    - If focal: sub-option "infiltrating through serosa" yes/no (determines extrinsic vs. intrinsic origin)
  - **Irregular junctional zone**: independent checkbox (can co-occur with either diffuse or focal; only comment when irregular, never comment on regular)
  - **Severity**: mild, moderate, or severe
  - **Associated features** (tick boxes, present if ticked, absent if not):
    - Endometrial buds
    - Endometrial islets
    - Myometrial cysts
    - Venetian blind shadowing
  - Loss of endometrial-myometrial interface is considered equivalent to irregular junctional zone -- not a separate field
  - Prior ablation effects: keep as a checkbox (rarely used, but some clinicians want it)

### Fibroids
- Checkbox: present yes/no
- If present, expand section with:
  - **Count**: how many fibroids (generates a row per fibroid)
  - Per fibroid:
    - **Side**: left, right, fundal (drop-down)
    - **Position**: anterior, posterior, lateral, cervical (drop-down with a blank/none option so it can be left unspecified -- e.g., fundal fibroids often have no further position qualifier)
    - **Type**: intramural, subserosal, submucosal, pedunculated
    - **Dimensions**: three measurements (ideally from DICOM; investigate machine auto-mapping of fibroids)
    - **Cavity distortion**: yes/no checkbox
  - Do NOT include: calcific, suspicious, previous measurements
  - Previous measurements tracking explicitly excluded from scope

---

## 4. Endometrium Tab

### Phase
- Drop-down options (reduced from original list): non-specific, proliferative, late proliferative, early secretory, secretory, menstrual

### Thickness
- Measured in millimetres, comes in automatically from DICOM
- Do NOT include regular/irregular descriptors

### In Sync
- Simple checkbox (Boolean tick) on the endometrium section
- "In sync" means the endometrial phase matches expected ovarian findings:
  - Proliferative endometrium + growing follicle = in sync
  - Secretory endometrium + corpus luteum = in sync
  - Thin/suppressed endometrium + no follicular activity (pill/postmenopausal) = in sync
- Unticked = discordant findings, suggesting dysfunctional bleeding or other pathology
- Replaces the previously proposed "Cycle phase consistency" dropdown on the Comments tab

### Focal Lesion (Endometrial Polyp)
- Checkbox: present yes/no (default: not ticked)
- If present:
  - **Count**: like fibroids, generates a list per polyp
  - **Dimensions**: check if DICOM can supply; otherwise manual entry for one polyp (multiple polyps are extremely rare)
  - **Location**: anterior, posterior, fundal, left lateral, right lateral, cervical (cervical added here to replace the separate cervical polyp field)
  - **Vascular stalk**: checkbox (tick if present; default unticked)
- Cavity shape section removed from endometrium -- belongs under uterine congenital abnormality in the uterus section

### IUD
- Checkbox options: IUD correct, IUD incorrect (incorrectly positioned)
- Use "IUD" terminology, not "IUCD"

### RPOC (Retained Products of Conception)
- Checkbox: present yes/no
- If present:
  - **Dimensions**: measurements
  - **Location**: fundal, anterior, posterior (no lateral option)
  - **Vascularity**: vascular or avascular (binary radio buttons)
  - **Sliding in cavity**: checkbox
  - **Inflammatory response**: checkbox (tick if present)
- Remove: feeder vessel field

### Removed from Endometrium
- LSCS scar (moved to uterus)
- Free typing comments
- Primary/secondary diagnosis fields (keep for now as hidden/optional -- others may want them, but do not surface prominently)

---

## 5. Ovaries Tab

- Right ovary first, then left (standard clinical convention)
- Identical fields for both ovaries

### Status
- Three-state: **identified** / **not identified** / **absent**
  - Identified = seen on scan
  - Not identified = looked but could not see (e.g., bowel gas obscuring)
  - Absent = surgically removed

### Measurements
- Come in automatically

### Appearance
- Drop-down: normal, inactive, postmenopausal, suppressed, polycystic morphology, multifollicular, oligofollicular

### Antral Follicle Count (AFC)
- Per ovary: manual entry
- Total AFC: computed field (sum of left + right)

### Maximum Follicle Diameter
- Manual entry field
- If diameter > 14 mm and <= 30 mm: auto-generate text "including a dominant follicle of [X] mm"
- Removes the need for a separate dominant follicle field

### Corpus Luteum
- Three tick boxes (not mutually exclusive):
  - Corpus luteum
  - Hemorrhagic corpus luteum (with optional measurement field)
  - Resolving corpus luteum
- No measurement for plain corpus luteum
- Do NOT include corpus luteum measurement as a standard field

### Mobility and Tenderness
- Three separate rows of radio buttons:
  - **Mobility**: mobile / reduced mobility / stuck / rigid
  - **Tenderness**: tender / non-tender
  - **Accessibility**: accessible vaginally (checkbox)

### Surface Findings
- Echogenic foci: checkbox
- Scarring: keep as optional (not used by Sophie, but others may use it)

### Para-ovarian Cysts
- Checkbox: yes/no
- If yes: up to three dimension measurements (but allow just one -- make second and third optional)

---

## 6. Ovarian Lesions Tab (renamed from IOTA)

### Common Pathologies (listed first)
- Simple cyst, endometrioma, dermoid, fibroma
- Each is a checkbox with an optional measurement
- Can appear on both ovaries
- Endometriomas: can have more than one, but keep to one for now

### Less Common Pathology (IOTA Classification)
- Classification: unilocular, unilocular solid, multilocular, multilocular solid, solid -- keep as-is
- Cyst wall: smooth yes/no -- keep
- Papillary projections -- keep
- **Remove**: septum fields and solid elements (septum is redundant with multilocular classification; solid elements duplicates papillary projections)
- Internal cyst content: anechoic, low-level, ground glass, hemorrhagic, mixed -- keep
- Vascularity: four-level scale -- no vascularity, minimal, moderate, strong (remove individual vessel fields)

### IOTA Simple Rules
- Keep as a separate sub-tab, unchanged -- it is a direct implementation of a published article

### Other Fields
- Free fluid: yes/no
- Pouch of Douglas depth in mm
- Ascites: yes/no

---

## 7. Endometriosis Assessment Tab

### Bladder
- Nodule: checkbox (tick if present)
- If present:
  - Measurements
  - Location drop-down: left, right, midline
- Only ever one nodule

### Kidneys
- Per kidney (left and right):
  - Visualized: checkbox
  - Obstructed: checkbox

### Vaginal Vault
- Visualized: yes/no
- Thin and regular: yes/no
- Vaginal nodule present: yes/no
  - If yes: measurements
- Stuck to (drop-down, applicable when nodule present): bowel, bowel nodule, uterosacral ligament nodule

### Pouch of Douglas
- Radio buttons (not drop-down -- avoids accidental scroll-wheel changes):
  - No obliteration
  - Partial obliteration (with left/right sub-option)
  - Complete obliteration
  - No longer obliterated, post-surgical
- Remove "freely mobile" option (that is just "no obliteration")
- Uterus mobility fields live here (mobile, limited mobility, fixed; tender, non-tender)

### Retro-cervical Region
- Retro-cervical nodule: yes/no
  - If yes: measurement
- Grows into myometrium: yes/no (indicates focal adenomyosis from extrinsic source)
- Stuck to (multi-select checkboxes, not single drop-down):
  - Left ovary
  - Right ovary
  - Bowel
  - Bowel nodule
  - Bowel fat
- Tender / non-tender: radio buttons
- Likely post-surgical scarring: checkbox (keep -- commonly used)
- **Remove**: hypoechoic areas, counts/dimensions for those areas

### Uterosacral Ligaments (Left and Right)
- Per ligament:
  - Appearance: normal, thickened, mottled
  - Nodule: yes/no with measurements
  - Tender: yes/no
  - Fat stranding: checkbox

### Bowel Nodules
- Bowel nodule present: yes/no
- If yes: count (1, 2, 3 -- generates rows like fibroids)
- Per nodule:
  - Three-dimensional measurements
  - Distance from anus (first nodule)
  - Distance from previous nodule (subsequent nodules)
  - Depth of invasion: muscularis layer, submucosa, or mucosa (drop-down)
  - Stuck to (drop-down): free-lying loop, retro-cervical nodule, ovary (left/right), uterosacral ligament nodule, vaginal vault, none

### Endometriosis Conclusions
- **Computed from ticked fields**, not manually entered
- Options like "no evidence of deep infiltrating endometriosis" or "evidence of DIE" are derived automatically
- Recommendation field: free-text dictation only (not a structured field)

---

## 8. Procedures Tab

### Saline Hysterosonography (SHG)
- Performed: yes/no
- If yes, findings drop-down: normal, endometrial polyp, two endometrial polyps, submucosal fibroid, **synechia** (added)

### Tubal Patency Test
- Performed: yes/no
- Enhancement method: ExEm foam or Dfinity (remove Levovist and saline)
- Per tube (left and right):
  - Patent
  - Patency could not be demonstrated (replaces "blocked")
  - Absent (replaces "not assessed" -- if a tube is absent, it is still assessed; it is just not there)
- Remove: unsuccessful cannulation option
- Remove: tubal patency test with saline (never used)
- Remove: right/left ovarian cyst aspiration, ascites drainage

---

## 9. UI/UX Principles Agreed

- **Conditional sections**: use "present" checkboxes that expand detail sections when ticked -- reduces visual clutter
- **Radio buttons over drop-downs** when there are only a few options (3-4) -- avoids accidental scroll-wheel selection changes
- **Checkboxes for features**: tick = present, unticked = not present (no explicit "not present" option needed)
- **DICOM auto-population**: maximise use of DICOM structured report data to avoid manual entry; Sophie will review what additional measurements can be added to the DICOM export list on the machines
- **Blank/none options**: where a drop-down position may legitimately be unspecified (e.g., fundal fibroid with no anterior/posterior qualifier), include a blank or "none" option
- **Pictures in reports**: investigate whether Delphi/the report template engine supports embedding images (for uterine congenital abnormality classification)

---

## Action Items

| # | Action | Owner |
|---|--------|-------|
| 1 | Provide agreed uterus size thresholds for nulligravida vs. parous patients | Sophie |
| 2 | Provide the article/classification with pictures of uterine congenital abnormalities (~8-10 types) | Sophie |
| 3 | Investigate DICOM structured report codes for: septum measurements, polyp dimensions, fibroid auto-mapping | Karl |
| 4 | Investigate whether Delphi report templates can embed images (for congenital abnormality pictures) | Karl |
| 5 | Review what additional measurements can be added to the ultrasound machine DICOM export list | Sophie |
| 6 | Build revised gynae form template based on these specifications | Karl |
| 7 | Get feedback from other sonographers once a minimal viable version is built | Sophie |
| 8 | Reach consensus with colleagues on terminology for uterus size classifications | Sophie |

---

## Key Decisions

- The form tab previously called "IOTA" is renamed to **"Ovarian Lesions"**; the IOTA Simple Rules remain as a separate sub-section
- Uterus mobility is assessed under **Pouch of Douglas** (endometriosis section), not under the uterus tab
- Cavity shape belongs under **uterine congenital abnormality** (uterus section), not under endometrium
- LSCS scar moved from endometrium to **uterus** section
- Cervical polyp is not a separate entity -- just add "cervical" as a location option for endometrial polyps
- Free-text comments, primary diagnosis, and secondary diagnosis fields are excluded from the initial build (may be added later based on colleague feedback)
- IUD terminology used instead of IUCD
- "Blocked" tube replaced with "patency could not be demonstrated"
- "Not assessed" tube replaced with "absent"
