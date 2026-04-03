# TdxLayoutControl Gotchas

Idiosyncrasies discovered while building the gynaeV2 form.

## Show/Hide Patterns: What Works

### Pattern 1: Layout Group .Visible (WORKS)

Setting `lgGroupName.Visible := False` from script collapses the group and everything shifts up. This is the primary mechanism for show/hide sections.

```pascal
lgAdenomyosisDetails.Visible := chkAdenomyosis.Checked;
```

**Use this for:** Section-level show/hide (adenomyosis details, polyp details, RPOC details, etc.)

### Pattern 2: GroupBox .Visible inside a container GroupBox (WORKS)

For table rows (fibroids, bowel nodules, polyps), each row is a `TcxGroupBox` inside a container `TcxGroupBox`. The container is wrapped in a `TdxLayoutItem`. Hiding individual row GroupBoxes works, and the script adjusts the container height.

```pascal
gbFibRow3.Visible := (seFibroidCount.Value >= 3);
gbFibroidTable.Height := 20 + seFibroidCount.Value * 24 + 4;
```

**Use this for:** Table-style repeating rows with aligned columns.

### Pattern 3: Direct control .Visible inside layout (BROKEN)

Setting `.Visible` on a control that's directly wrapped in a `TdxLayoutItem` does NOT collapse the layout item. The space remains. Scrolling may also reset the visibility.

```pascal
// BROKEN - layout item stays, creates gap, scroll resets
edtOtherMedication.Visible := False;
chkPainWithProbe.Visible := False;
```

**Fix:** Wrap the control's layout item inside a `TdxLayoutGroup`, then set the GROUP's visibility instead:

```
object lgPainWithProbe: TdxLayoutGroup    <-- set .Visible on this
  CaptionOptions.Visible = False
  ButtonOptions.Buttons = <>
  ShowBorder = False
  object liPainWithProbe: TdxLayoutItem
    Control = chkPainWithProbe
    ...
  end
end
```

### Pattern 4: Control .Enabled (WORKS)

Setting `.Enabled` on any control works fine. No layout impact needed.

```pascal
cmbPODPartialSide.Enabled := rbPODPartialObliteration.Checked;
```

**Use this for:** Greying out fields without hiding them.

## Rule of Thumb

| Want to... | Do this |
|-----------|---------|
| Hide a section with multiple items | Set `lgGroup.Visible` |
| Hide a single control in layout | Wrap its `TdxLayoutItem` in a `TdxLayoutGroup`, set group `.Visible` |
| Hide table rows | Use container GroupBox pattern, set row `gb.Visible` + adjust container height |
| Disable a field | Set `control.Enabled` directly |

**Never** set `.Visible` directly on a control inside a `TdxLayoutItem`. Always go through a layout group.

## Default States

Both DFM and `InitializeScreen` should set defaults:
- **DFM:** `Visible = False` / `Enabled = False` ensures correct state on form load
- **InitializeScreen:** Reinforces the same defaults from script

Both are needed because:
- DFM alone doesn't help when the script needs to toggle state later
- Script alone doesn't work reliably for layout-managed items (scroll resets)

## Script Engine Limitations

| Feature | Supported? |
|---------|-----------|
| `lgGroup.Visible := X` | Yes |
| `gbControl.Visible := X` | Yes (inside container GroupBoxes) |
| `control.Visible := X` inside TdxLayoutItem | No (gaps, scroll resets) |
| `control.Enabled := X` | Yes |
| `Sender = controlName` comparison | No (runtime error) |
| `TdxLayoutItem` access by name | No (unknown identifier) |
| Forward procedure calls | No (must define before calling) |
| `const` parameters | No |
| Semicolon after `procedure Name(Sender)` | Optional |
| `procedure Name;` (no params) | Needs semicolon |
| `function Name: Type;` | Needs semicolon |

## Controls That Still Need Wrapping

These controls use Pattern 3 (broken) and should be wrapped in layout groups:

- `chkPainWithProbe` - scan type section
- `edtOtherMedication` - medication section
- `edtOtherSurgery` - surgery section
- `liCervixPresent` - uterus general section
- `rbRightTubePatent`, `rbRightTubeNotDemonstrated` - right tube
- `rbLeftTubePatent`, `rbLeftTubeNotDemonstrated` - left tube
