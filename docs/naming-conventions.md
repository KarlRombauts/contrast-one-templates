# Naming Conventions

Control and variable naming conventions used in the gynaeV2 form (and Contrast One templates generally).

## Control Name Prefixes

### Form Controls

| Prefix | Control Type | Description | Example |
|--------|-------------|-------------|---------|
| `cb` | `TcxCheckBox` or `TcxComboBox` | Checkbox or dropdown combo box. Context distinguishes: checkboxes describe a state (`cbHysterectomy`, `cbFibroidsPresent`), combos select from a list (`cbUterusPosition`, `cbFibroidType1`). | `cbTransvaginal`, `cbEndometriumPhase` |
| `se` | `TcxSpinEdit` | Numeric spin edit for measurements and values. | `seUterusLength`, `seRightOvaryCC` |
| `sp` | `TcxSpinEdit` | Numeric spin edit for counts specifically. | `spFibroidCount`, `spBowelNoduleCount` |
| `rb` | `TcxCheckBox` | Radio-button-style checkbox (mutually exclusive within a group, toggled via script). Uses `TcxCheckBox` but behaves as a radio button. | `rbPODNoObliteration`, `rbRPOCVascular` |
| `de` | `TcxDateEdit` | Date picker control. | `deExamDate`, `deLMPDate` |
| `edt` | `TcxTextEdit` | Free-text input field. | `edtOtherMedication` |
| `cxccb` | `TcxCheckComboBox` | Multi-select dropdown (checkboxes inside a dropdown). | `cxccbReferralIndication`, `cxccbMedication` |
| `lbl` | `TcxLabel` | Dynamic label (caption set by script at runtime). | `lblUterusSizeClass`, `lblTotalAFC` |

### Container / Structural Controls

| Prefix | Control Type | Description | Example |
|--------|-------------|-------------|---------|
| `gb` | `TcxGroupBox` | Group box container for related controls. Used for show/hide sections in non-layout tabs. | `gbScanType`, `gbLaparoscopy` |
| `ts` | `TcxTabSheet` | Tab page within a page control. | `tsUterus`, `tsEndometriosis` |
| `pc` | `TcxPageControl` | Tab container holding multiple tab sheets. | `pcReportBody`, `pcOvarianLesions` |
| `sb` | `TcxScrollBox` | Scrollable container for overflow content. | `sbUterus`, `sbOvaries` |
| `cx` | `TcxLabel` / `TcxGroupBox` | Static labels and general DevExpress controls. Used for fixed captions. | `cxLabel1`, `cxGroupBox5` |

### Layout Controls (TdxLayoutControl)

| Prefix | Control Type | Description | Example |
|--------|-------------|-------------|---------|
| `dxlc` | `TdxLayoutControl` or root `TdxLayoutGroup` | The layout control itself, or its root group. | `dxlcEndometriosis`, `dxlcUterusGroup_Root` |
| `lg` | `TdxLayoutGroup` | Layout group -- a container for layout items. Controls show/hide of sections. Set `lg*.Visible := False` in script to hide a section and auto-shift content below. | `lgAdenomyosisDetails`, `lgFibroid3` |
| `li` | `TdxLayoutItem`, `TdxLayoutLabeledItem`, or `TdxLayoutSeparatorItem` | Layout item wrapping a control, a standalone label, or a visual separator. | `liAdenomyosis`, `liFibSep`, `liUxW` |

## Naming Body Conventions

After the prefix, names follow these patterns:

| Pattern | Meaning | Example |
|---------|---------|---------|
| `Right` / `Left` | Side-specific control | `seRightOvaryLength`, `cbLeftUSLNodule` |
| `1`, `2`, `3`... | Numbered instance (fibroids, bowel nodules, endometriomas) | `seFibroidLength3`, `gbRightEndometrioma2` |
| `L`, `W`, `D` | Length, Width, Depth dimension suffixes | `seRightSimpleCystL`, `seRetroCervWidth` |
| `Details` | Sub-group shown/hidden by a parent checkbox | `lgAdenomyosisDetails`, `lgRCDetails` |

## Script Event Handler Conventions

| Convention | Example |
|-----------|---------|
| `{controlName}Click` | `cbTransvaginalClick` -- OnClick handler for a checkbox |
| `{controlName}Change` | `cbRightOvaryStatusChange` -- OnChange handler for a combo/spin |
| Shared handler for radio groups | `PODObliterationClick` -- one handler for all mutually exclusive checkboxes |

## Framework-Required Procedures

Every Contrast One script must define these (called by the application framework):

| Procedure | Purpose |
|-----------|---------|
| `StartScript` | Wires event handlers. Last procedure in file. Entry point called via bare `StartScript;` at end of file. |
| `InitializeScreen` | Sets initial form state (called from within `StartScript`). |
| `CheckFormComplete: Boolean` | Validates required fields before report generation. |
| `ProduceMergeFieldData` | Generates merge field key-value pairs for the report template. |
| `ProduceMergeOrder` | Defines the ordering of merge sections in the report output. |
