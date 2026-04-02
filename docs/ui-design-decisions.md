# UI Design Decisions

Design patterns and decisions for the gynaeV2 form (and future Contrast One templates).

## Layout Control (TdxLayoutControl)

Every tab uses TdxLayoutControl for responsive show/hide. When a checkbox is unchecked, the detail section collapses and content below shifts up.

- Use `TdxLayoutSkinLookAndFeel` component for consistent theming
- Script can't access `TdxLayoutGroup` or `TdxLayoutItem` by name -- toggle visibility on the wrapped **control** (TcxGroupBox) instead, or use `lgGroupName.Visible` only if the scripting engine supports it for your version

## Section Groups

Each tab is divided into labeled bordered groups (like the Endometriosis tab pattern):

```
[Bladder]
  [ ] Bladder nodule present
      Dimensions: [  ] x [  ] x [  ] mm
      Location: [dropdown]

[Vaginal Vault]
  ...
```

- `TdxLayoutGroup` with `CaptionOptions.Text`, `ShowBorder = True`
- Checkbox as first item
- Detail sub-group with `Visible = False`, toggled by script

## Table Rows (Fibroids, Bowel Nodules, Polyps)

For repeating tabular data with aligned columns, use **absolute-positioned GroupBoxes wrapped in a layout item**:

- Each row is a `TcxGroupBox` with controls at fixed Left positions
- Rows are inside a container `TcxGroupBox` (e.g. `gbFibroidTable`)
- Container is wrapped in a `TdxLayoutItem` so it participates in layout show/hide
- **Script adjusts container height** based on count: `gbFibroidTable.Height := headerH + count * rowH + padding`
- Column headers are bold `TcxLabel` controls at the top of the container
- Header Left positions must match row control positions (account for row GroupBox Left offset)

Why not individual layout items per row: TdxLayoutControl doesn't auto-collapse items when their wrapped control is hidden from script. Scroll events can also reset visibility states.

### Row Styling

- No borders, no background colors on rows (`Style.BorderStyle = ebsNone`, `Style.Edges = []`)
- Each row has a `#N` index label at the left

### Count Field

- Count spin edit inside `lgDetails` group (hides with the section)
- `AlignHorz = ahLeft` on the layout item to prevent full-width stretching
- Max value set to match number of available rows
- Default to 1 when section is shown

## Dimensions Component

3D measurements (L x W x D mm) use a compact `TcxGroupBox` with absolute positioning for consistent alignment wherever they appear:

```
object gbDims{Name}: TcxGroupBox
  Height = 22
  Width = 175
  [borderless, transparent]

  object se{Name}L: TcxSpinEdit     Left = 0
  object lbl{Name}x1: TcxLabel      Left = 37,  Caption = 'x'
  object se{Name}W: TcxSpinEdit     Left = 47
  object lbl{Name}x2: TcxLabel      Left = 84,  Caption = 'x'
  object se{Name}D: TcxSpinEdit     Left = 94
  object lbl{Name}mm: TcxLabel      Left = 131, Caption = 'mm'
end
```

- Spin edits: `Width = 35`, `SpinButtons.Visible = False`
- Wrap in a `TdxLayoutItem` with a caption (e.g. 'Dimensions') or `CaptionOptions.Visible = False`
- The GroupBox ensures the `x` and `mm` labels stay aligned regardless of layout control stretching
- Reuse this pattern everywhere: ovary measurements, nodule dimensions, polyp dimensions, etc.

## Two-Column Layouts

For left/right anatomical pairs (ovaries, USL, kidneys, tubal patency):

- Parent `TdxLayoutGroup` with `LayoutDirection = ldHorizontal`
- Two child groups: one for Right, one for Left
- Each child has `CaptionOptions.Text = 'Right'` / `'Left'`

## Radio-Style Checkboxes

Mutually exclusive options use `TcxCheckBox` controls with a script handler that unchecks siblings:

```pascal
procedure StatusClick(Sender)
begin
  chkOption1.Checked := (Sender = chkOption1);
  chkOption2.Checked := (Sender = chkOption2);
  chkOption3.Checked := (Sender = chkOption3);
end;
```

All options wire to the same handler name in StartScript.

## Patient Details Tab

Uses TdxLayoutControl with 4 section groups:
- **Scan Type** (horizontal): transabdominal, transvaginal, pain, incomplete report
- **Patient Information**: exam date, LMP + status checkboxes, cycle days, G/P
- **Clinical**: medication (multi-select), referral indication, gynae history
- **Surgery**: past surgery (multi-select), laparoscopy conditional fields

## Naming Conventions

See [naming-conventions.md](naming-conventions.md) for the full prefix table. Key points:
- `chk` for checkboxes, `cmb` for comboboxes (never ambiguous `cb`)
- `lg` for layout groups, `li` for layout items, `lc` for layout controls
- `gb` for GroupBoxes (used for table row containers)
- `rb` prefix signals radio-style mutual exclusion
