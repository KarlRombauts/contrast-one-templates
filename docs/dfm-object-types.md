# DFM Object Types Reference

Complete inventory of Delphi DFM object types used across the Contrast One exam templates, generated using `dfmquery.py list` against all `src/exams/*/screen.dfm` files.

## Summary by Exam

| Exam | Total Objects |
|------|--------------|
| earlyT1Singleton | 350 |
| 20week | 444 |
| gynae | 899 |
| t3twins | 514 |
| pe12week | 445 |
| t3Singleton | 637 |
| gynaeV2 | 976 |
| **Total** | **4,265** |

## Object Types

### Form Root Types

These are the top-level inherited form objects at depth 0. Each DFM file has exactly one.

| Type | Count | Description |
|------|-------|-------------|
| `TEarly_Pregnancy` | 1 | Root form for the early T1 singleton exam |
| `TGynae` | 2 | Root form for gynaecology exams (gynae, gynaeV2) |
| `TThird_Trimester` | 2 | Root form for third trimester exams (t3Singleton, pe12week) |
| `TContrastReportDetailTemplate` | 1 | Root form for t3twins -- the base template class that other root types inherit from |

### Container / Layout Types

These objects organise other controls into visual groups, tabs, and scrollable regions.

| Type | Count | Used In | Description |
|------|-------|---------|-------------|
| `TcxPageControl` | 31 | All exams | Tab container holding `TcxTabSheet` children. Used for the main exam sections (e.g. patient details, anatomy, measurements) and nested sub-tabs. |
| `TcxTabSheet` | 75 | All exams | Individual tab page within a `TcxPageControl`. Each tab represents a section of the form (e.g. "Uterus", "Ovaries", "Fetus"). |
| `TcxGroupBox` | 289 | All except gynaeV2 (3 only) | Visual grouping container with an optional border and caption. Used extensively to group related controls (e.g. "Heart Motion", "Embryo Measurements"). |
| `TcxScrollBox` | 11 | 20week, gynae, t3twins, pe12week, t3Singleton, gynaeV2 | Scrollable container for content that may exceed the visible area. Often wraps an entire tab's content. |
| `TScrollBox` | 4 | earlyT1Singleton, t3twins, pe12week, t3Singleton | Standard Delphi scrollable container (non-DevExpress). Same purpose as `TcxScrollBox`. |

### DevExpress Layout Manager Types (gynaeV2 only)

The gynaeV2 exam uses the DevExpress Layout Control system instead of manual positioning. This replaces absolute `Left`/`Top` placement with automatic layout flow.

| Type | Count | Description |
|------|-------|-------------|
| `TdxLayoutControl` | 8 | Top-level layout container that auto-arranges its children. Replaces manual `TcxGroupBox` nesting. Each major tab section (Uterus, Endometrium, Ovaries) has one. |
| `TdxLayoutGroup` | 147 | Groups layout items together, optionally with a caption and border. Can set `LayoutDirection = ldHorizontal` for side-by-side arrangement. Replaces `TcxGroupBox` in the layout system. |
| `TdxLayoutItem` | 313 | Wraps an input control (e.g. `TcxSpinEdit`, `TcxComboBox`) with a caption label. The `Control` property references the wrapped control, and `CaptionOptions.Text` sets the label. Eliminates the need for separate `TcxLabel` objects. |
| `TdxLayoutLabeledItem` | 128 | Standalone text label within the layout flow. Used for unit labels ("x", "mm", "cc") and decorative text between controls. Replaces `TcxLabel` in the layout system. |
| `TdxLayoutSeparatorItem` | 12 | Visual horizontal separator line with an optional caption. Used to divide sections within a layout group (e.g. "Myometrium", "Fibroids"). |
| `TdxLayoutSkinLookAndFeel` | 1 | Global skin/theme reference for all layout controls. A single instance at the form root, referenced by each `TdxLayoutControl` via `LayoutLookAndFeel`. |

### Input Controls

Controls that accept user input for clinical data entry.

| Type | Count | Used In | Description |
|------|-------|---------|-------------|
| `TcxTextEdit` | 80 | All exams | Single-line free text input. Used for names, clinical history, medication details, and other text fields. Prefix: `edt`. |
| `TcxSpinEdit` | 659 | All exams | Numeric input with optional spin buttons. The most common measurement input -- used for biometry values (BPD, HC, FL, AC), heart rate, gestational age, and all numeric clinical data. Spin buttons are often hidden (`Properties.SpinButtons.Visible = False`). Prefix: `se`. |
| `TcxMaskEdit` | 140 | All exams | Text input with a regex mask for formatted numeric entry. Used for measurements that need decimal formatting (e.g. embryo size `(\d?)(\d?)\.\d\d`). Prefix: `edt`. |
| `TcxComboBox` | 329 | All exams | Drop-down selection list. Used for categorical clinical choices like presentation, placenta position, liquor volume, and anatomy findings. Prefix: `cb` or `cmb`. |
| `TcxCheckBox` | 686 | All exams | Boolean toggle checkbox. Used for binary clinical findings (normal/abnormal, visualised/not visualised, male/female). Often used in pairs for mutually exclusive options. Prefix: `chk` or `cb`. |
| `TcxCheckComboBox` | 22 | All exams | Drop-down multi-select checkbox list. Used for fields where multiple values can be selected, such as clinical history items and referral indicators. Prefix: `cb` or `cxccb`. |
| `TcxDateEdit` | 37 | All exams | Date picker input with calendar popup. Used for exam date, LMP date, EDD, and other date fields. Prefix: `de`. |
| `TcxRadioGroup` | 6 | t3Singleton | Group of mutually exclusive radio buttons. Used for left/right and SI (satisfactory/inadequate) selections in the third trimester scan. Prefix: `rg`. |
| `TcxMemo` | 11 | 20week, gynae, t3twins, t3Singleton | Multi-line text area. Used for hidden data storage (e.g. `cxGraphData` for growth chart data) and free-text comment fields. |
| `TcxRichEdit` | 1 | gynae | Rich text editor with formatting support. Used for the diagnosis comments field in gynaecology. Prefix: `re`. |
| `TcxButton` | 17 | All obstetric exams | Clickable button that triggers script actions. Used for "Get Percentiles" and "Calculate Growth" operations. Prefix: `btn`. |
| `TAdvTreeComboBox` | 9 | gynae | Third-party (TMS) hierarchical tree drop-down. Used for structured multi-level selections like medication type and ovarian cyst classification, where items have parent-child relationships. Prefix: `tcb` or `cb`. |

### Display Controls

Non-interactive controls for labelling and visual structure.

| Type | Count | Description |
|------|-------|-------------|
| `TcxLabel` | 1,172 | Static text label. The most numerous object type. Used to label every input control, display units ("mm", "bpm", "weeks"), and section headings. In gynaeV2 (layout version), most labels are replaced by `TdxLayoutItem` captions, reducing the count from 322 to 18. Prefix: `lbl` or `cxLabel`. |
| `TBevel` | 71 | Visual separator line (sunken or raised). Used to divide sections within group boxes. Being phased out in favour of layout separators. |

## Type Count by Exam

| Type | earlyT1 | 20week | gynae | t3twins | pe12week | t3Singleton | gynaeV2 |
|------|---------|--------|-------|---------|----------|-------------|---------|
| TcxLabel | 132 | 138 | 322 | 181 | 161 | 220 | 18 |
| TcxCheckBox | 32 | 102 | 157 | 83 | 71 | 104 | 137 |
| TcxSpinEdit | 78 | 55 | 204 | 59 | 67 | 61 | 135 |
| TcxComboBox | 35 | 36 | 84 | 41 | 37 | 45 | 51 |
| TdxLayoutItem | - | - | - | - | - | - | 313 |
| TcxGroupBox | 25 | 43 | 66 | 53 | 36 | 63 | 3 |
| TdxLayoutGroup | - | - | - | - | - | - | 147 |
| TcxMaskEdit | 3 | 21 | - | 41 | 13 | 62 | - |
| TdxLayoutLabeledItem | - | - | - | - | - | - | 128 |
| TcxTextEdit | 9 | 17 | 7 | 15 | 9 | 22 | 1 |
| TcxTabSheet | 11 | 7 | 11 | 9 | 14 | 12 | 11 |
| TBevel | 3 | 10 | 20 | 12 | 8 | 18 | - |
| TcxDateEdit | 12 | 3 | 2 | 2 | 14 | 2 | 2 |
| TcxPageControl | 5 | 4 | 3 | 5 | 5 | 6 | 3 |
| TcxCheckComboBox | 2 | 2 | 6 | 3 | 3 | 2 | 4 |
| TcxButton | 1 | 3 | - | 4 | 3 | 6 | - |
| TdxLayoutSeparatorItem | - | - | - | - | - | - | 12 |
| TcxScrollBox | - | 2 | 1 | 2 | 2 | 3 | 1 |
| TcxMemo | - | 1 | 5 | 2 | - | 3 | - |
| TAdvTreeComboBox | - | - | 9 | - | - | - | - |
| TcxRadioGroup | - | - | - | - | - | 6 | - |
| TScrollBox | 1 | - | - | 1 | 1 | 1 | - |
| TcxRichEdit | - | - | 1 | - | - | - | - |
| TdxLayoutControl | - | - | - | - | - | - | 8 |
| TdxLayoutSkinLookAndFeel | - | - | - | - | - | - | 1 |

## Notes

- **gynaeV2 is the layout-based rewrite** of gynae. It replaces manual absolute positioning (`Left`/`Top`) with the DevExpress Layout Control system. This dramatically reduces the number of `TcxLabel` objects (322 -> 18) and `TcxGroupBox` objects (66 -> 3), since the layout system handles labelling and grouping automatically.
- **Naming conventions** vary between exams but generally follow: `se` (spin edit), `edt` (text/mask edit), `cb`/`cmb` (combo box), `chk`/`cb` (check box), `de` (date edit), `btn` (button), `lbl`/`cxLabel` (label), `ts` (tab sheet), `pc` (page control), `gb`/`cxGroupBox` (group box).
- **`TcxMaskEdit` vs `TcxSpinEdit`**: Both are used for numeric measurement entry. MaskEdit uses regex patterns for formatted input (e.g. `12.5`), while SpinEdit provides increment/decrement buttons and numeric validation. The choice varies by exam.
- **`TAdvTreeComboBox`** is from the TMS Component Pack, not DevExpress. It only appears in gynae for hierarchical selections.
