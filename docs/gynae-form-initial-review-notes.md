# Gynae Form Initial Review Notes

Notes from Sofie's review of the gynaeV2 form.

---

## Scan Type (Details Section)

- Add tick boxes for: **transabdominal ultrasound**, **transvaginal ultrasound**, **pain with ultrasound probe insertion**
- Pain option only applies alongside transvaginal (for pelvic floor issues)
- Add an **incomplete report** tick box -- if ticked, conclusion states "this needs to be dictated" (for complex cases not fully captured by the form)

## Indications / Symptoms

Current gynaeV2 referral indications: Pelvic pain, Abnormal bleeding, Postmenopausal bleeding, Fertility assessment, Ovarian cyst follow-up, Endometriosis assessment, Fibroid assessment, IUD check, RPOC assessment, Pre-operative assessment, Post-operative assessment, Other.

- **Add**: dysmenorrhea, dyspareunia, dyschezia (specific forms of pelvic pain)
- **Remove**: pre-operative assessment, post-operative assessment
- **Keep everything else** as-is
- Pelvic pain (general) is only used when pain is constant/non-specific; the specific subtypes are preferred
- IUD presence is independent of indication (e.g. endometriosis patients may have an IUD but aren't there for IUD check)
- **Postmenopausal** indication could trigger a simplified form (no endometriosis fields, etc.)

## Medication (Change to Multi-Select)

Current gynaeV2 medication (single-select): OCP, Progesterone only pill, Implanon, Progesterone (Provera), IUD (copper), IUS (Mirena), Clomiphene citrate, Metformin, HRT cyclical (sequential), HRT continuous, HRT vaginal oestrogen, HRT oestrogen patch, HRT oestrogen and progesterone patch, HRT - Tibolone (Livial), Tamoxifen, GnRH agonist (Zoladex), GnRH antagonist, Letrozole, FSH injection, Other.

- **Change to multi-select** (patients take combinations)
- **Keep**: OCP, progesterone only pill, Implanon, IUS (Mirena), tamoxifen, GnRH agonist (Zoladex)
- **Collapse** all HRT subtypes into a single **"HRT"** entry
- **Replace** clomiphene citrate, metformin, and letrozole with a single **"ovarian stimulation"** entry
- **Remove**: IUD (copper) (rare -- use "other"), GnRH antagonist, FSH injection
- **Remove**: Progesterone (Provera)
- **Keep "Other"**

## Surgical History (Change to Multi-Select)

Current gynaeV2 surgical history (single-select): Hysterectomy, Laparoscopy, Laparotomy, Hysteroscopy, Oophorectomy, Salpingectomy, Myomectomy, Endometrial ablation, Caesarean section, Other.

- **Change to multi-select** (patients can have multiple surgeries)
- **Keep**: hysterectomy, oophorectomy, salpingectomy, endometrial ablation, myomectomy, caesarean section
- **Change** "Laparoscopy" to **"Laparoscopy for endometriosis"**
  - When selected, show additional fields: **how many** laparoscopies and **year of last one**
  - e.g. "7 laparoscopies, last one in 2021"
- **Remove**: laparotomy, hysteroscopy

## Ovaries

- If ovary status is **absent / not identified** --> hide all detail fields for that ovary (expand on "seen")
- Common pathologies: simple cyst, endometrioma, dermoid, fibroma -- left and right sides
  - All measured in **3 dimensions** (currently only 1D in gynaeV2, needs changing)
  - **Endometrioma only** can be multiple --> need a count, each with separate 3D measurements
  - Simple cyst, dermoid, fibroma = single checkbox + 3D measurement each
- **Free fluid**: remove from ovary section entirely, move to Pouch of Douglas

## Pouch of Douglas

- Simple **tick box**: free fluid present yes/no
- Ascites belongs with the IOTA section, not here

## Tab Structure (Major Restructure)

Current gynaeV2 tabs: Details (top-level) > pcReportBody subtabs: Uterus, Endometrium, Ovaries, Ovarian Lesions, Endometriosis, Procedures, Comments and Diagnosis.

- **Remove** the two-level nesting (Details always visible on top, subtabs below)
- Bring all subtabs up to the **same level** as Details
- Layout: Details | Uterus | Endometrium | Ovaries | Ovarian Lesions | Endometriosis | Procedures
- **Remove** the Comments and Diagnosis tab entirely (just a free text block)
- Saves vertical space and prevents scrolling errors (scroll wheel doesn't work in these forms)

### Ovarian Lesions Subtabs

Current: Common Pathologies | IOTA Right | IOTA Left | IOTA Simple Rules.

- **Common Pathologies**: stays, left/right fields as now
- **Rename** "IOTA Right" and "IOTA Left" to **"More Complex Pathology"** -- keep as two tabs (duplicate fields for each side, like common pathology)
- **IOTA Simple Rules**: stays as separate tab
- All remain under parent "Ovarian Lesions" tab

### Endometriosis Section

Current subtabs: Bladder, Kidneys, Vaginal Vault, Pouch of Douglas, Retro-cervical, Uterosacral Ligaments, Bowel.

- **Remove subtabs** -- single page instead
- Each location becomes a **subheading** with a tick box
- Tick box **expands to show detail** fields if checked (e.g. nodule dimensions, location)
- Kidneys section already has visualised + obstructed checkboxes per side -- keep that structure

## Procedures Tab

Current: Saline Hysterosonography and Tubal Patency Test. Not discussed in the review -- **stays as-is**.
