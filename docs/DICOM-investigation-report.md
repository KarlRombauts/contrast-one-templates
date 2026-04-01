# DICOM Investigation Report: Gynae Form Fields Meeting

**Date:** 1 April 2026
**Reference:** meeting-recordings/transcripts/form-fields-meeting-NOTES.md
**Covers:** Action Item #3 (Karl) — Investigate DICOM structured report codes for septum measurements, polyp dimensions, and fibroid auto-mapping
**Also relevant to:** Action Item #5 (Sophie) — Review what additional measurements can be added to the ultrasound machine DICOM export list

---

## Background

The form-fields meeting identified several places where DICOM Structured Report (SR) data could potentially auto-populate fields, reducing manual entry. This report investigates each one against the DICOM standard (Supplement 26 / PS3.16) and practical ultrasound machine capabilities.

---

## 1. Already Working via DICOM — No Action Required

These measurements are covered by well-established DICOM SR codes and are already auto-populated in Contrast One's existing templates:

| Measurement | LOINC Code | DICOM Context Group | Status |
|---|---|---|---|
| Uterus length | 11842-2 | CID 12011 (Pelvis & Uterus) | Working |
| Uterus height | 11859-6 | CID 12011 | Working |
| Uterus width | 11865-3 | CID 12011 | Working |
| Uterus volume | 33192-6 | CID 12011 | Working (computed) |
| Endometrium thickness | 12145-9 | CID 12011 | Working |
| Cervical length | 11961-0 | CID 12011 | Working |
| Right ovary length/width/height | 11841-4 / 11830-7 / 11858-8 | CID 12010 | Working |
| Left ovary length/width/height | 11840-6 / 11829-9 / 11857-0 | CID 12010 | Working |
| Right ovary volume | 12165-7 | CID 12010 | Working |
| Left ovary volume | 12164-0 | CID 12010 | Working |

**No changes needed for these. Sophie does not need to add them to the machine export list.**

---

## 2. Uterine Septum Measurements

**Meeting question:** "Check if DICOM can supply septum width and length automatically" (Section 2, Congenital Abnormality)

### Finding: No standard DICOM SR code exists

- The DICOM standard defines CID 12011 (Pelvis & Uterus) with only three codes: cervix length (11961-0), endometrium thickness (12145-9), and internal os distance (DCM 131530).
- There are **no LOINC or DICOM codes** for uterine septum width or septum length.
- Uterine septum measurements are typically made on 3D rendered volumes (coronal plane reconstruction), not from standard 2D caliper measurements that machines export via DICOM SR.
- The ASRM classification defines a septum as indentation depth >15 mm with angle <90°, but these are diagnostic criteria, not DICOM-exportable measurements.

### Recommendation

**Manual entry required.** Add two numeric fields to the congenital abnormality sub-section:
- Septum width (mm)
- Septum length (mm)

These will always be hand-measured on 3D reconstructions and cannot be auto-populated from DICOM. No action needed from Sophie on the machine export list for this.

---

## 3. Endometrial Polyp Dimensions

**Meeting question:** "Check if DICOM can supply polyp dimensions" (Section 4, Focal Lesion)

### Finding: No standard DICOM SR code exists

- There is no LOINC code or DICOM context group entry for endometrial polyp measurements.
- CID 12011 covers only three measurements (cervix length, endometrium thickness, internal os distance) — none relate to focal endometrial lesions.
- Polyps are typically measured ad-hoc using generic calipers on the ultrasound machine. These generic caliper measurements are **not** exported via DICOM SR — only measurements linked to a specific SR template code are transmitted.

### Recommendation

**Manual entry required.** Add dimension fields (up to 3 measurements per polyp) as specified in the meeting notes. Since multiple polyps are extremely rare, a single set of dimensions with an optional second polyp is sufficient.

### Workaround possibility

Some machines (notably GE Voluson with ViewPoint) allow the sonographer to label a generic measurement with a custom code. If Sophie configures a custom measurement label on the machine (e.g., "Polyp Length"), it *could* be exported as a site-defined DICOM SR code. However, this requires:
1. Machine-side configuration of a custom measurement preset
2. Contrast One to recognise the custom code in its mappings.csv

This is low priority given that polyps are a single quick measurement.

---

## 4. Fibroid Dimensions and Auto-Mapping

**Meeting question:** "Investigate machine auto-mapping of fibroids; dimensions ideally from DICOM" (Section 3, Fibroids)

### Finding: Partially possible, with significant limitations

#### What the DICOM standard provides

- There are **no LOINC or DICOM standard codes specifically for fibroid/leiomyoma dimensions**.
- The standard fibroid count code in your system (99704-0) is already a custom/site-defined code, not a DICOM standard one.
- DICOM SR was designed primarily for fetal biometry and standard GYN measurements, not for variable-count lesion mapping.

#### What ultrasound machines actually do

**GE Voluson (Expert 22 and newer):**
- Can map fibroids in 3D and classify them by FIGO type
- Can illustrate fibroid positions relative to the endometrium
- However, this is primarily a **visualisation feature** within the machine's own reporting software (ViewPoint), not a DICOM SR export
- Individual fibroid measurements (length × width × height) can be made with generic calipers, but there is no standard way to export "Fibroid 1 = 35×28×30 mm, Fibroid 2 = 22×18×20 mm" as structured DICOM data with per-lesion identity

**Samsung HERA / Other manufacturers:**
- Similar generic caliper measurements available
- No standardised DICOM SR fibroid mapping protocol

#### The core problem

DICOM SR was designed for **singleton measurements** (one BPD, one HC, one endometrium thickness). Fibroids require **variable-count, per-lesion data** (fibroid #1 has location + type + 3 dimensions, fibroid #2 has a different set, etc.). The DICOM SR architecture does not natively support this pattern for GYN lesions.

### Recommendation

**Manual entry required for fibroid details** (location, type, cavity distortion). This matches the meeting specification.

**For dimensions specifically**, there are two options:

1. **Manual entry (recommended for now):** Three measurement fields per fibroid row. Reliable, no machine dependency.

2. **Future enhancement — custom DICOM mapping:** If Sophie can configure the machine to label fibroid measurements with sequenced custom codes (e.g., "Fibroid1-L", "Fibroid1-W", "Fibroid1-H"), Contrast One could map these via custom entries in mappings.csv. This would require:
   - Sophie to set up measurement presets on the machine (per-fibroid labels)
   - Karl to add corresponding custom codes to mappings.csv
   - Agreement on a maximum fibroid count (meeting specified a count field generating rows)
   - This is machine-specific and fragile — not recommended as a first implementation

---

## 5. Additional Measurements to Discuss with Sophie (Action Item #5)

The DICOM standard includes several measurement codes that your system does **not** currently map but which could be useful for the gynae form:

### Potentially useful for the gynae template

| LOINC Code | Measurement | Relevance |
|---|---|---|
| DCM 131530 | Internal os distance | Relevant for IUD position assessment |
| 33069-6 | Nuchal translucency | Not GYN — but missing from early pregnancy templates |
| 11850-5 | Gestational sac diameter | Not GYN — but missing from early pregnancy templates |

### Already covered by existing mappings but worth verifying on machine export

Sophie should confirm the following are enabled on the machine's DICOM SR export configuration:
- Endometrium thickness (12145-9) — needed for the gynae form
- Cervical length (11961-0) — needed for endometriosis assessment
- Ovary dimensions and volumes — needed for ovary tab
- Uterus dimensions and volume — needed for size classification logic

---

## 6. Summary Table

| Meeting Item | DICOM Standard Code? | Auto-populate? | Action |
|---|---|---|---|
| Uterus measurements | Yes (multiple LOINC) | Yes — already working | None |
| Uterus volume | Yes (33192-6) | Yes — already working | None |
| Endometrium thickness | Yes (12145-9) | Yes — already working | None |
| Ovary measurements | Yes (multiple LOINC) | Yes — already working | None |
| Cervical length | Yes (11961-0) | Yes — already working | None |
| Septum width/length | **No** | **No** — manual entry | Add manual fields |
| Polyp dimensions | **No** | **No** — manual entry | Add manual fields |
| Fibroid dimensions | **No** | **No** — manual entry | Add manual fields |
| Fibroid location/type | **No** | **No** — manual entry | Add manual fields |
| Fibroid auto-mapping | **No standard** | **No** — machine-specific | Manual entry; revisit later |

---

## 7. Recommendations

1. **Build the gynae form with manual entry** for septum, polyp, and fibroid measurements. There is no DICOM shortcut for these.

2. **Verify machine export configuration** with Sophie: confirm that endometrium thickness, cervical length, ovary dimensions, and uterus dimensions are all enabled in the DICOM SR export on the clinic's machines. These are the ones that *should* auto-populate.

3. **Do not invest time in custom DICOM fibroid mapping** at this stage. The return on effort is low — sonographers are used to entering fibroid data manually and the machine-side configuration would be fragile and non-portable between machine brands.

4. **For the OB templates** (not covered in this meeting but noted for completeness): the existing LOINC code mappings are comprehensive. The main gap is nuchal translucency (33069-6) and gestational sac diameter (11850-5) for the early T1 template.

---

## Sources

- [DICOM Supplement 26: OB-GYN Ultrasound Procedure Reports](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/sup26.pdf)
- [OB-GYN Report Templates — DICOM PS3.16](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_OB-GYNReportTemplates.html)
- [CID 12005 Fetal Biometry Measurement](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_12005.html)
- [CID 12011 Pelvis and Uterus](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_12011.html)
- [CID 12008 Amniotic Sac Measurement](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_12008.html)
- [LOINC Code Meanings in DCMR — PS3.16 Chapter H](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_h.html)
- [GE Voluson DICOM Conformance Statements](https://www.gehealthcare.com/products/interoperability/dicom/ultrasound-dicom-conformance-statements)
- [TID 5011 Early Gestation Section](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_TID_5011.html)
