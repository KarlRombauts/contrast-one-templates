# Meeting Notes: Overview of Contrast One

## Attendees

- **Sophie** -- Practice manager / clinical lead at City Imaging; primary domain expert walking through the system
- **Karl** -- Developer; asking technical questions, taking direction on improvements

---

## Summary

Sophie walked Karl through the end-to-end Contrast One workflow: from patient appointment booking through arrival, scanning, reporting, and report dispatch. The session covered the online booking system, the Jotform-based manual booking flow, the patient queue system, the two report generation pathways (electronic template vs. common/comment template), DICOM structured report codes, merge fields, and the gynae reporting gap. Multiple pain points and improvement opportunities were identified.

---

## 1. Appointment Booking

### Online Booking (Web Module)
- Patients visit the City Imaging website and select an exam type (T1, T2, T3, gynae)
- The system restricts appointment slots based on scan type:
  - **T1 scans**: must be done between 12-14 weeks; patient enters due date or LMP, system calculates eligible dates
  - **T2 scans**: most complex scans; slots are carefully allocated to avoid consecutive T2 bookings
  - **T3 scans**: based on gestation
  - **Gynae scans**: can be done any time
- Patient verifies phone number, enters details, uploads/photographs referral
- All information flows **automatically** into the Contrast One database -- minimal staff effort
- The online booking form UI is poor: not responsive, not user-friendly (acknowledged issue)

### Phone Booking (Manual via Jotform)
- Staff finds or creates the patient, links referring doctor, selects exam type
- Patient receives SMS confirmation + a Jotform link to enter: personal details, referring doctor, DOB, Medicare details, and referral photo
- **Problem**: Jotform responses are emailed back and must be **manually re-entered** into Contrast One -- error-prone and labour-intensive
- Sometimes patients do not submit the referral; staff may not know it is missing

### Desired Improvement: Custom Web Form
- Replace the Jotform with a proper web form that submits data **directly** to Contrast One (not via email)
- The form for phone-booked patients should capture: name, DOB, address, email, Medicare number, and referral photo
- It does **not** need to capture appointment type/time/due date (already entered by staff)
- There is currently an SMS that gets sent automatically with a link, but the link points to `localhost` (127.0.0.1) -- it does not work; this needs to be replaced with the real web form

---

## 2. Appointment Booking Form -- Specific Fixes Needed

- **Medicare number field**: must accept numbers only (no letters); should also capture the patient's position number on the card and expiry date
- **Medicare opt-out**: add a checkbox "I don't have a Medicare card" or "I have been to the practice before" -- ticking either skips the Medicare fields
- **Mobile phone number**: accept international format (e.g., `+61 4xx xxx xxx`) as long as verification succeeds; current validation is too strict
- **Address fields**: should be added to the online booking form (currently only in the Jotform flow)
- **Medicare number**: should be a required field in online booking (unless the patient opts out)

---

## 3. Patient Queue / Workflow System

The system has a series of queues that track patient flow:

1. **Appointments queue** -- shows all appointments for the day, filterable by room/practice
2. **Arrival queue** -- patients expected today who have not yet arrived; list shrinks through the day
3. **Waiting room** -- receptionist clicks "arrive" on a patient; patient moves here; includes patients physically in the waiting room or scan room (sonographers often do not update status when scanning begins)
4. **Reporting room** -- after the scan, the patient/case appears here for the doctor to report on

### Arrival Process
- Receptionist opens patient record, checks completeness of information
- The more that was pre-filled (online booking), the less work at reception
- Quick confirmation: "Are you still at [address]?"
- Click "Arrive" to move the patient to the waiting room

---

## 4. Scanning and Sonographer Workflow

### Paper Forms
- Sonographers fill out a **pre-printed paper form** during/after the scan (circle findings, write measurements, add clinical notes)
- The paper form is scanned into Contrast One via a "scan document" button
- **Gynae scans**: only the paper form is completed -- no electronic template is used
- **Obstetric scans**: the paper form is completed **and** an electronic template is filled out (duplication)

### Why Sonographers Keep the Paper Form
- It captures subjective/clinical notes not suitable for reports: "patient was very anxious", "patient cried when discussing prior loss", "high blood pressure last 3 days", "previously diagnosed with miscarriage in room 1 -- do not use room 1"
- These notes are referenced in future visits to give context
- A notes field exists in the software but sonographers do not use it
- From the doctor's perspective, the electronic template alone would be sufficient for obstetric scans

---

## 5. Report Generation -- Two Pathways

### Pathway 1: Electronic Template (Smart Reports)
- Used for **all obstetric scans** (except twins, which lack a template)
- The sonographer fills out the electronic template with measurements, dropdowns, etc.
- In the reporting room, a button lights up indicating a template is available
- Doctor clicks "insert" -- the template populates a structured report with patient details, measurements, conclusions
- The report can be immediately verified and sent to the referring doctor
- Contains logic: e.g., if "placenta is low" is ticked, it auto-generates text about 32-week review
- Templates are written in Pascal (script.pas files), ranging from 2,000 to 6,000 lines
- Logic is intentionally kept moderate -- the practice does not want fully automated boilerplate reports because doctors want clinical judgment in the wording

### Pathway 2: Common Template (Comment Template / Dictation)
- Used for **gynae scans** and cases without electronic templates
- Loads a skeleton report with merge fields (patient name, referring doctor, copy doctor, etc.)
- Empty spaces (marked `##`) are filled by the doctor dictating or typing
- F12 key cycles through the blank fields
- Some basic intelligence exists (e.g., conditional text for certain findings)
- Staff then types up dictated content

### Merge Fields
- **Administrative merge fields** (patient name, DOB, referring doctor, copy doctor) come from Contrast One's patient/appointment data -- not from the template
- **Clinical merge fields** (measurements, findings) come from the electronic template
- Both types appear in the final report

---

## 6. Copy Doctor Field -- Persistent Annoyance

- Reports have a "Referred by" doctor (always present) and optionally a "Copy to" doctor
- The copy doctor is set via a "Flags" dialog in the patient record
- Sophie frequently has to manually add or remove the "Copy to:" line:
  - If no copy doctor exists, she manually deletes the "Copy to:" text and adjusts spacing
  - If a copy doctor is added mid-report, she enters it via Flags and it populates
- **Desired behaviour**: the "Copy to:" label and merge field should only render when a copy doctor is present; if absent, the entire line should be hidden
- Previous attempts by Sirisha to fix this produced poor visual results
- The difficulty is that the "Copy to" merge field is administrative (not part of the electronic template), making conditional rendering hard within the current architecture

---

## 7. DICOM Codes and Structured Report Data

- Ultrasound machines send measurements using **DICOM codes** (universal standard across all machines)
- The machine transmits: a code identifier + a numeric value (no explicit units)
- Units and precision are known from the DICOM code specification
- Contrast One maps these codes to internal merge field names
- Unit conversions and decimal formatting are configured per merge field:
  - Multiply by 1 with 1 decimal place = display in original unit with 1 decimal
  - Multiply by 0.001 = convert e.g., cubic mm to cc
  - Integer with 0 decimal places for whole-number display
- Structured report data is viewable via right-click > "Review Documents" on the patient request (not via the Documents sub-node, which only shows referrals and scanned sheets -- this is a UI inconsistency that confuses users)
- The structured report often arrives with excessive precision (e.g., 2 decimal places in mm) which must be reformatted for clinical reports

### Structured Report Codes Configuration
- Defined under Organisation > Structured Report Codes
- Each entry has: template name, DICOM code, display format (float/integer, decimal places), and a boolean flag (purpose unclear -- needs follow-up with Sirisha)
- Templates auto-import these codes; common templates use them via merge fields

---

## 8. Fibroid Measurements -- Automation Opportunity

- Ultrasound machines can capture fibroid measurements (fibroid 1, 2, 3... up to 30) with 3D dimensions
- Currently: sonographers measure fibroids on the machine, take photos, then **manually write down** all measurements; for obstetric reports they must also type them into the electronic template
- The DICOM codes for fibroids exist and the machine sends them if the sonographer assigns them (e.g., assigns measurement to "fibroid 1")
- **Problem**: merge fields for fibroids have not been created in the report templates
- **Opportunity**: create merge fields for fibroid measurements so they auto-populate in reports, eliminating significant manual transcription (especially for cases with many fibroids)

---

## 9. Gynae Electronic Template -- Needed

- Gynae scans currently have no electronic template -- only the common (comment) template with dictation
- A gynae electronic template with tick-boxes would significantly reduce typing:
  - Most gynae reports are very similar with subtle differences
  - Key variable findings: endometriosis nodules (bladder, vaginal, Pouch of Douglas obliteration), endometrium measurements, ovarian findings
  - Default state should be "normal" (no nodules, no obliteration) since that is the most common scenario
- Sophie offered to provide ~50 de-identified gynae reports for analysis to understand the range of variations
- She can also provide the existing common template as a starting point

---

## 10. Report Formatting Issues

- Inconsistent spacing: some fields have trailing spaces, others do not; full stops missing or inconsistent
- Graph placement: Sophie always manually adds a space to push the growth chart graph to the next page -- this should be automated (graph should start on a new page)
- The T2 scan has many report variants based on Down syndrome screening type (maternal serum, nuchal translucency only, NIPS normal, NIPS pending, no screening, etc.) -- each is a separate report template with only minor text differences; these should be consolidated into a single template with conditional logic

---

## Action Items / Decisions

| # | Item | Owner |
|---|------|-------|
| 1 | Build a web form to replace Jotform that submits directly to Contrast One (captures name, DOB, address, email, Medicare, referral photo) | Karl |
| 2 | Fix Medicare field validation: numbers only, add card position number and expiry date, add opt-out checkbox | Karl |
| 3 | Accept international mobile number format in booking form (`+61...`) | Karl |
| 4 | Make address a required field in the online booking form | Karl |
| 5 | Fix the SMS link for phone-booked patients (currently points to localhost) to use the new web form | Karl |
| 6 | Implement conditional "Copy to" field in report templates: only render when a copy doctor is present | Karl |
| 7 | Fix graph placement in reports so growth charts start on a new page automatically | Karl |
| 8 | Create merge fields for fibroid measurements (fibroid 1-N, 3 dimensions each) in report templates | Karl |
| 9 | Build an electronic reporting template for gynae scans with tick-box interface for common findings | Karl |
| 10 | Consolidate T2 scan report variants (currently split by Down syndrome screening type) into a single template with conditional logic | Karl |
| 11 | Sophie to provide ~50 de-identified gynae reports for analysis | Sophie |
| 12 | Sophie to go through each report type with sample data and record/list all manual adjustments she routinely makes (formatting fixes, spacing, copy doctor removal, etc.) | Sophie |
| 13 | Clarify the boolean flag in structured report code configuration (ask Sirisha) | Sophie |
| 14 | Investigate the "Documents" vs "Review Documents" UI inconsistency (structured reports not visible under Documents sub-node) | Karl |
