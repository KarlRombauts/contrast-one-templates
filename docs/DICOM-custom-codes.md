# Custom DICOM Codes for Gynae Template

**Purpose:** Define custom measurement codes to configure on the GE Voluson machines so that caliper measurements auto-populate into Contrast One via DICOM SR.

**Convention:** All custom codes use the `99xxx` prefix (site-defined LOINC range). Codes are grouped by form section. Each code represents one caliper measurement on the machine.

**Note:** Only caliper-measurable values are listed here. Dropdowns, checkboxes, radio buttons, and computed fields remain manual entry in Contrast One regardless of DICOM — they don't come from the machine.

---

## Already Covered by Standard LOINC Codes

These are already working or can be enabled on the machine without custom configuration:

| LOINC | Measurement | Machine Label |
|-------|-------------|---------------|
| 11842-2 | Uterus length | Ut Length |
| 11865-3 | Uterus width | Ut Width |
| 11859-6 | Uterus height | Ut Height |
| 33192-6 | Uterus volume | Ut Vol |
| 12145-9 | Endometrium thickness | Endo Thick |
| 11961-0 | Cervical length | Cx Length |
| 11840-6 | Left ovary length | L Ov Length |
| 11829-9 | Left ovary width | L Ov Width |
| 11857-0 | Left ovary height | L Ov Height |
| 12164-0 | Left ovary volume | L Ov Vol |
| 11841-4 | Right ovary length | R Ov Length |
| 11830-7 | Right ovary width | R Ov Width |
| 11858-8 | Right ovary height | R Ov Height |
| 12165-7 | Right ovary volume | R Ov Vol |

---

## Custom Codes Needed

### Uterus — Congenital Abnormality (2 codes)

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99750-1 | Septum width | Sept Width | mm |
| 99750-2 | Septum length | Sept Length | mm |

### Fibroids (18 codes — up to 6 fibroids × 3 dimensions)

Each fibroid gets three caliper measurements. Six fibroids covers the vast majority of clinical cases. If a patient has more than six, the additional ones would be manual entry.

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99760-1 | Fibroid 1 length | Fib1 L | mm |
| 99760-2 | Fibroid 1 width | Fib1 W | mm |
| 99760-3 | Fibroid 1 height | Fib1 H | mm |
| 99761-1 | Fibroid 2 length | Fib2 L | mm |
| 99761-2 | Fibroid 2 width | Fib2 W | mm |
| 99761-3 | Fibroid 2 height | Fib2 H | mm |
| 99762-1 | Fibroid 3 length | Fib3 L | mm |
| 99762-2 | Fibroid 3 width | Fib3 W | mm |
| 99762-3 | Fibroid 3 height | Fib3 H | mm |
| 99763-1 | Fibroid 4 length | Fib4 L | mm |
| 99763-2 | Fibroid 4 width | Fib4 W | mm |
| 99763-3 | Fibroid 4 height | Fib4 H | mm |
| 99764-1 | Fibroid 5 length | Fib5 L | mm |
| 99764-2 | Fibroid 5 width | Fib5 W | mm |
| 99764-3 | Fibroid 5 height | Fib5 H | mm |
| 99765-1 | Fibroid 6 length | Fib6 L | mm |
| 99765-2 | Fibroid 6 width | Fib6 W | mm |
| 99765-3 | Fibroid 6 height | Fib6 H | mm |

### Endometrium — Polyps (6 codes — up to 2 polyps × 3 dimensions)

Multiple polyps are extremely rare per the meeting notes, but two sets covers it.

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99770-1 | Polyp 1 length | Polyp1 L | mm |
| 99770-2 | Polyp 1 width | Polyp1 W | mm |
| 99770-3 | Polyp 1 height | Polyp1 H | mm |
| 99771-1 | Polyp 2 length | Polyp2 L | mm |
| 99771-2 | Polyp 2 width | Polyp2 W | mm |
| 99771-3 | Polyp 2 height | Polyp2 H | mm |

### Endometrium — RPOC (3 codes)

Only ever one set of retained products.

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99775-1 | RPOC length | RPOC L | mm |
| 99775-2 | RPOC width | RPOC W | mm |
| 99775-3 | RPOC height | RPOC H | mm |

### Ovaries — Follicles and Corpus Luteum (5 codes)

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99780-1 | Right max follicle diameter | R Foll Max | mm |
| 99780-2 | Left max follicle diameter | L Foll Max | mm |
| 99781-1 | Hemorrhagic corpus luteum measurement (right) | R HCL | mm |
| 99781-2 | Hemorrhagic corpus luteum measurement (left) | L HCL | mm |
| 99782-1 | Pouch of Douglas depth | PoD Depth | mm |

### Ovaries — Para-ovarian Cysts (6 codes)

One cyst per side, up to 3 dimensions each.

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99783-1 | Right para-ovarian cyst dim 1 | R ParaCyst D1 | mm |
| 99783-2 | Right para-ovarian cyst dim 2 | R ParaCyst D2 | mm |
| 99783-3 | Right para-ovarian cyst dim 3 | R ParaCyst D3 | mm |
| 99784-1 | Left para-ovarian cyst dim 1 | L ParaCyst D1 | mm |
| 99784-2 | Left para-ovarian cyst dim 2 | L ParaCyst D2 | mm |
| 99784-3 | Left para-ovarian cyst dim 3 | L ParaCyst D3 | mm |

### Ovarian Lesions (12 codes)

One lesion per type per ovary, single measurement each (except endometrioma which gets 3 dims).

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99785-1 | Right simple cyst diameter | R SimpleCyst | mm |
| 99785-2 | Left simple cyst diameter | L SimpleCyst | mm |
| 99786-1 | Right endometrioma length | R Endoma L | mm |
| 99786-2 | Right endometrioma width | R Endoma W | mm |
| 99786-3 | Right endometrioma height | R Endoma H | mm |
| 99787-1 | Left endometrioma length | L Endoma L | mm |
| 99787-2 | Left endometrioma width | L Endoma W | mm |
| 99787-3 | Left endometrioma height | L Endoma H | mm |
| 99788-1 | Right dermoid diameter | R Dermoid | mm |
| 99788-2 | Left dermoid diameter | L Dermoid | mm |
| 99789-1 | Right fibroma diameter | R Fibroma | mm |
| 99789-2 | Left fibroma diameter | L Fibroma | mm |

### Endometriosis — Bladder Nodule (3 codes)

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99790-1 | Bladder nodule length | Blad Nod L | mm |
| 99790-2 | Bladder nodule width | Blad Nod W | mm |
| 99790-3 | Bladder nodule height | Blad Nod H | mm |

### Endometriosis — Vaginal Nodule (3 codes)

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99791-1 | Vaginal nodule length | Vag Nod L | mm |
| 99791-2 | Vaginal nodule width | Vag Nod W | mm |
| 99791-3 | Vaginal nodule height | Vag Nod H | mm |

### Endometriosis — Retro-cervical Nodule (3 codes)

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99792-1 | Retro-cervical nodule length | RC Nod L | mm |
| 99792-2 | Retro-cervical nodule width | RC Nod W | mm |
| 99792-3 | Retro-cervical nodule height | RC Nod H | mm |

### Endometriosis — Uterosacral Ligament Nodules (6 codes)

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99793-1 | Left USL nodule length | L USL Nod L | mm |
| 99793-2 | Left USL nodule width | L USL Nod W | mm |
| 99793-3 | Left USL nodule height | L USL Nod H | mm |
| 99794-1 | Right USL nodule length | R USL Nod L | mm |
| 99794-2 | Right USL nodule width | R USL Nod W | mm |
| 99794-3 | Right USL nodule height | R USL Nod H | mm |

### Endometriosis — Bowel Nodules (15 codes — up to 3 nodules)

Each bowel nodule gets 3 dimensions plus distance measurements.

| Code | Measurement | Machine Label | Units |
|------|-------------|---------------|-------|
| 99795-1 | Bowel nodule 1 length | BN1 L | mm |
| 99795-2 | Bowel nodule 1 width | BN1 W | mm |
| 99795-3 | Bowel nodule 1 height | BN1 H | mm |
| 99795-4 | Bowel nodule 1 distance from anus | BN1 Anus | cm |
| 99796-1 | Bowel nodule 2 length | BN2 L | mm |
| 99796-2 | Bowel nodule 2 width | BN2 W | mm |
| 99796-3 | Bowel nodule 2 height | BN2 H | mm |
| 99796-4 | Bowel nodule 2 distance from BN1 | BN2 Dist | cm |
| 99797-1 | Bowel nodule 3 length | BN3 L | mm |
| 99797-2 | Bowel nodule 3 width | BN3 W | mm |
| 99797-3 | Bowel nodule 3 height | BN3 H | mm |
| 99797-4 | Bowel nodule 3 distance from BN2 | BN3 Dist | cm |

Note: Distance from anus is typically estimated, not measured with calipers. Include the code for completeness but this may remain manual entry in practice.

---

## Summary

| Section | Custom Codes | Standard Codes |
|---------|-------------|----------------|
| Uterus (septum) | 2 | 4 |
| Fibroids | 18 | 0 |
| Endometrium (polyps) | 6 | 1 |
| RPOC | 3 | 0 |
| Ovaries (follicles, CL, PoD) | 5 | 8 |
| Para-ovarian cysts | 6 | 0 |
| Ovarian lesions | 12 | 0 |
| Bladder nodule | 3 | 0 |
| Vaginal nodule | 3 | 0 |
| Retro-cervical nodule | 3 | 0 |
| Uterosacral ligament nodules | 6 | 0 |
| Bowel nodules | 12 | 0 |
| **Total** | **79** | **13** |

---

## Machine Configuration Notes

1. **All 79 custom codes** need to be set up as measurement presets on one Voluson, then the configuration can be exported and loaded onto the other machines.

2. **Machine label convention:** Short labels (≤12 chars) that the sonographer sees when selecting a measurement tool. The labels above are suggestions — Sophie should review them for clinical usability.

3. **Sonographer workflow change:** Instead of using generic calipers, the sonographer would need to select the specific measurement preset (e.g., "Fib1 L") before placing calipers. This adds one step per measurement but enables auto-population.

4. **Fibroid numbering discipline:** The sonographer must measure fibroids in a consistent order (e.g., largest first, or clockwise from fundus) so that Fibroid 1 on the machine matches Fibroid 1 in the report. This is a workflow agreement, not a technical constraint.

5. **Endometriosis measurements:** These are the highest-value codes for auto-population — endometriosis exams involve many small measurements and manual transcription is error-prone.

6. **Fallback:** If the sonographer forgets to use a preset, or there are more lesions than the maximum (e.g., 7+ fibroids), measurements can still be entered manually in Contrast One. The custom codes supplement manual entry; they don't replace it.

---

## Next Steps

1. **Sophie to review** the machine labels and confirm the maximum counts (6 fibroids, 2 polyps, 3 bowel nodules) are practical.
2. **Karl to confirm** with GE that the Voluson supports this many custom measurement presets in a single GYN application preset, and that they export via DICOM SR.
3. **Test on one machine** — configure a handful of codes (e.g., just the fibroid codes), do a test scan, and verify the codes appear in the DICOM SR received by Contrast One.
4. **Roll out incrementally** — start with the highest-value sections (fibroids + endometriosis), confirm they work, then add the rest.
