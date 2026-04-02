# Gynae Form Second Review Notes

Notes from second review of the gynaeV2 form.

---

## Common Pathologies

- Simple cyst, dermoid, and fibroma all need the 3D measurement GroupBox pattern (gbDims)
- Horizontal rule between each pathology checkbox so expansions don't run into each other

## Details Tab

- Exam date, LMP date, referral indication, gynae history, gynae surgery: all left-aligned (not full width)
- Day and G labels are misaligned (too far left, aligning with LMP date field above) -- needs fixing
- Medication "Other" text field: disabled by default, enabled only when "Other" is selected
- Placeholder text "Other" on the text field if possible

## Uterus

- Position and severity fields: left-aligned
- Adenomyosis section: add horizontal dividing lines between sub-sections

## Endometrium

- RPOC section: add horizontal dividers between sub-sections
- General tab (phase, thickness, IUD): add horizontal dividers

## Common Pathologies Layout

- Horizontal rule between each pathology (simple cyst, endometrioma, dermoid, fibroma) to prevent messy expansion

## Pouch of Douglas

- Remove the "Obliteration" label
- Add horizontal rule between free fluid section and obliteration section
- Partial obliteration side dropdown: disabled by default, enabled only when partial obliteration is selected

## Procedures

- Findings field and enhancement method field: left-aligned
- Right/Left tube restructure:
  - First line: "Absent" checkbox
  - If absent is ticked: hide patent and patency options
  - If absent is unticked (default): show patent and patency options
  - Horizontal rule between absent and patency options

## Scan Type

- First line: "Incomplete report" checkbox with horizontal rule below
- Second line: Transabdominal, Transvaginal, Pain with probe insertion
- Pain with probe insertion: hidden by default, shown only when transvaginal is checked
- Transabdominal and Transvaginal: radio-style (mutually exclusive)
