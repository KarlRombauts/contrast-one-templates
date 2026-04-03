# UI Design Decisions

Design patterns and decisions for the gynaeV2 form (and future Contrast One templates).

## Form Structure

### Tab Hierarchy

```
cxpcReportMainPage (framework level - Form, Script, Template, etc.)
  tsForm
    pcReportBody (exam tabs)
      tsPatientDetails (Details)
      tsUterus
      tsEndometrium
      tsOvaries
      tsOvarianLesions
        tsCommonPathology
        tsComplexPathology
        tsIOTASimpleRules
      tsEndometriosis
      tsProcedures
```

The framework adds Script/Template/GraphData tabs at the `cxpcReportMainPage` level. Exam tabs live inside `pcReportBody` to stay separate.

### TdxLayoutControl

Every body tab uses `TdxLayoutControl` for responsive show/hide. A `TdxLayoutSkinLookAndFeel` component on the form provides consistent theming.

## Section Groups

Each tab is divided into labeled bordered groups:

```
[General]
  Position: [dropdown]
  Measured: [L] x [W] x [H] mm  Vol [cc]
  [ ] Hysterectomy  [ ] Cervix present

[Adenomyosis]
  [ ] Adenomyosis present
      (details expand here when checked)

[Fibroids]
  [ ] Fibroids present  Count: [spinner]
      (table rows expand here)
```

- `TdxLayoutGroup` with `CaptionOptions.Text`, `ShowBorder = True`
- Checkbox as first item
- Detail sub-group with `Visible = False` (set in both DFM and InitializeScreen), toggled by script
- See `layout-control-gotchas.md` for which visibility patterns work

## Dimensions Component

3D measurements (L x W x D mm) use a compact `TcxGroupBox` with absolute positioning:

```
gbDims{Name}: TcxGroupBox (Height=22, Width=175, borderless)
  se{Name}L      Left=0    (TcxSpinEdit, Width=35)
  lbl x          Left=37
  se{Name}W      Left=47
  lbl x          Left=84
  se{Name}D      Left=94
  lbl mm         Left=131
```

2D variant (L x W mm) uses Width=140 with same column positions up to the second spin.

Measurement variant with volume (uterus, ovaries) uses Width=280 and adds `Vol` spin + `cc` label.

**Why GroupBox:** The layout control stretches inline items unpredictably. A GroupBox with absolute positioning guarantees the `x` and `mm` labels stay aligned.

## Table Rows (Fibroids, Bowel Nodules, Polyps, Endometriomas)

For repeating tabular data with aligned columns:

```
gbFibroidTable: TcxGroupBox (container, borderless)
  Bold header labels (absolute positioned)
  gbFibRow1: TcxGroupBox (row, absolute positioned within container)
    #1 label, Side combo, Position combo, Type combo, dims, cavity checkbox
  gbFibRow2: TcxGroupBox (hidden by default)
  ...
```

- Container GroupBox wrapped in a `TdxLayoutItem`
- Bold column headers at the top of the container
- Each row is a `TcxGroupBox` at a fixed `Top` offset, with controls at fixed `Left` positions
- Header `Left` positions account for the row GroupBox `Left` offset (typically +2px)
- Script adjusts container height: `gbTable.Height := headerH + count * rowH + padding`
- Row visibility: `gbRow{n}.Visible := (seCount.Value >= n)`
- Count field uses `AlignHorz = ahLeft` to prevent full-width stretching
- Count defaults to 1 when parent section is shown

## Two-Column Layouts

For left/right anatomical pairs (ovaries, USL, kidneys, tubal patency):

- Parent `TdxLayoutGroup` with `LayoutDirection = ldHorizontal`
- Two child groups with `ShowBorder = True` for clear visual separation
- `CaptionOptions.Text = 'Right'` / `'Left'`

## Radio-Style Checkboxes

Mutually exclusive options use `TcxCheckBox` controls. The script handler unchecks siblings:

```pascal
procedure AdenoTypeClick(Sender)
begin
  if rbAdenoDiffuse.Checked then
    rbAdenoFocal.Checked := False;
  if rbAdenoFocal.Checked then
    rbAdenoDiffuse.Checked := False;
end;
```

All options wire to the same handler in `StartScript`. **Never** use `Sender = controlName` -- the scripting engine throws a runtime error on variant comparison.

The shared `cbToggleCheckOnClick` function from original exports works when checkboxes share a `TcxGroupBox` parent, but NOT inside `TdxLayoutControl` (where `Sender.Parent` returns the layout control, affecting all checkboxes on the page).

## Horizontal Separators

Use `TdxLayoutSeparatorItem` for visual division between sub-sections:

```
object liSepName: TdxLayoutSeparatorItem
  CaptionOptions.Text = ''
end
```

With text for labeled sections: `CaptionOptions.Text = 'Myometrium'`

## Left Alignment

Dropdowns and text fields that shouldn't stretch to full width use `AlignHorz = ahLeft` on their `TdxLayoutItem`:

```
object liPosition: TdxLayoutItem
  CaptionOptions.Text = 'Position'
  AlignHorz = ahLeft
  Control = cmbUterusPosition
```

## Default States

All initial visibility and enabled states are set in **both** DFM and `InitializeScreen`:

- **DFM:** Ensures correct state on form load and prevents scroll-reset issues
- **InitializeScreen:** Reinforces from script, handles any edge cases

The `dfmquery.py find` command can audit this:
```bash
dfmquery.py find screen.dfm --prop "Visible=False"
dfmquery.py find screen.dfm --prop "Enabled=False"
```

## "Other" Free Text Fields

For multi-select dropdowns (medication, surgery) with an "Other" option:

- `edtOther{Name}` text field, hidden by default (`Visible = False` in DFM + InitializeScreen)
- Handler checks if the last item in the dropdown is selected
- Should be wrapped in a `TdxLayoutGroup` for proper show/hide (see gotchas doc)

## Naming Conventions

See `naming-conventions.md` for the full prefix table. Key points:
- `chk` for checkboxes, `cmb` for comboboxes, `ccb` for check-comboboxes
- `se` for spin edits, `de` for date edits, `edt` for text edits
- `rb` prefix signals radio-style mutual exclusion
- `lg` for layout groups, `li` for layout items, `lc` for layout controls
- `gb` for GroupBoxes (table containers, dimension components)
- `gbDims{Name}` for dimension GroupBoxes, `gbFibRow{N}` for table rows

## Script Structure

```
cbToggleCheckOnClick       -- shared radio toggle (for GroupBox-parented checkboxes)
CheckFormComplete          -- framework required
ProduceMergeFieldData      -- framework required (empty stub)
ProduceMergeOrder          -- framework required (empty stub)
InitializeScreen           -- sets all default Visible/Enabled states

[event handlers]           -- all defined before StartScript
                           -- procedures called by other handlers defined ABOVE the caller

StartScript                -- wires all event handlers, calls InitializeScreen
                           -- LAST procedure in file

StartScript;               -- bare call, script entry point
```

## Tools

| Tool | Purpose |
|------|---------|
| `dfmquery.py list` | List objects by type/depth |
| `dfmquery.py get` | Extract object with/without children |
| `dfmquery.py children` | List direct children |
| `dfmquery.py find --prop "X=Y"` | Find objects with specific properties |
| `dfmquery.py validate` | Check nesting, Control refs, duplicates |
| `dfmquery.py xref` | Cross-validate script against DFM |
| `exportbundle.py extract/bundle` | Split/combine binary export files |
