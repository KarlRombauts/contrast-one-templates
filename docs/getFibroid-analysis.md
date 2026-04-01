# `getFibroid` Function Analysis

## Purpose

Generates a natural-language sentence describing fibroids for inclusion in an ultrasound clinical report. The output is appended to the report body with leading blank lines and a trailing full stop.

## Location

- **Canonical (gynae):** `src/shared/gynae/fibroids.pas:351`
- **Variants:** `src/shared/variants/getFibroid.{t3Singleton,pe12week,t3twins}.pas`

All four copies are near-identical (see [Variant Differences](#variant-differences) below).

## Logic Flow

```
fibroidCount > 0?
├── YES, count = 1
│   ├── Has dimensions? → "There is a 25 x 18 x 12mm anterior subserosal fibroid seen. It is close to the cervix (within 5mm)."
│   └── No dimensions  → sets GFibroidWarning, returns bare "Fibroid"
├── YES, count > 1
│   ├── Has any data?   → "There are fibroids identified: <fibroid1>, <fibroid2> and <fibroid3>."
│   └── No data         → sets GFibroidWarning, returns bare "Fibroids"
└── NO (count = 0)
    ├── cbFibroidsVisualised checked? → sets GFibroidWarning, returns "Fibroid/s"
    └── Otherwise → returns empty string
```

When `GFibroidWarning` is set to `TRUE`, the report system flags that fibroid details are incomplete (the sonographer indicated fibroids exist but didn't enter measurements).

## Helper Functions

| Function | Returns | Example |
|---|---|---|
| `GetSingleFibroidDimensions` | Measurement string with leading space | `" 25 x 18 x 12mm"` or `" 25 x 18 x 12mm (vol. 8cc)"` |
| `GetSingleFibroid` | Position + type with leading space | `" anterior subserosal"` |
| `GetSingleCloseOrClear` | Cervix proximity sentence | `"close to the cervix (within 5mm)"` or `"clear of the cervix"` |
| `GetFibroidString(i)` | Full description for fibroid #i | `" 20 x 15mm anterior intramural"` |
| `AddFullStopToEnd` | Ensures string ends with a full stop | |

## Bugs

### Syntax error: semicolon before `else`

```pascal
  end;          // ← semicolon terminates the if-else chain
  else          // ← this else is now orphaned (compile error in strict Pascal)
    result := '';
```

Lines 396-397 in the gynae version (and all variants). The semicolon after `end` on the `cbFibroidsVisualised` branch terminates the `if` statement, making the following `else` a syntax error. The final `else result := ''` branch is unreachable anyway since `result` is already initialised to `''` at the top. **Fix: remove both the semicolon and the dead `else` branch.**

### Missing space after article (gynae only)

The gynae version has `'There is a'` (no trailing space), while pe12week and t3twins have `'There is a '`. Since `GetSingleFibroidDimensions` returns a string with a leading space, this works by accident, but will produce `"There is a fibroid seen."` (no space) if dimensions are empty but `GetSingleFibroid` returns text — which can't currently happen due to the guard, but is fragile.

## Variant Differences

| Aspect | gynae | t3Singleton | pe12week | t3twins |
|---|---|---|---|---|
| `'There is a'` spacing | `'a'` (no space) | `'a'` (no space) | `'a '` (space) | `'a '` (space) |
| Comma/and separators | no spaces (`','`, `' and'`) | spaces (`', '`, `' and '`) | spaces | spaces |
| Single fibroid guard | checks `GetSingleFibroidDimensions <> ''` | checks | checks | **no check** — always builds text |
| Visualised fallback text | `'Fibroid/s'` | `'Fibroid/s'` | `'Fibroid/s'` | `'Fibroid'` (singular only) |

These differences may be intentional (twins exam always expects dimensions to be entered) or accidental divergence from copy-paste.

## Refactored Version

Below is a refactored version of the gynae/t3Singleton variant with identical output behaviour, restructured for readability. The syntax bug is fixed and the dead branch removed.

The structure is: **build** a description, then **select** the result, then **format** it. Three flat phases instead of nested conditionals.

```pascal
function getFibroid: String;
var
  i, count: Integer;
  description, proximity: String;
begin
  count := spFibroidCount.Value;
  description := '';

  { --- Phase 1: Build description from entered data --- }

  if count = 1 then
  begin
    description := GetSingleFibroidDimensions;
    if description <> '' then
    begin
      description := 'There is a ' + description
        + GetSingleFibroid + ' fibroid seen.  ';
      proximity := GetSingleCloseOrClear;
      if proximity <> '' then
        description := description + 'It is ' + proximity;
    end;
  end
  else if count > 1 then
  begin
    for i := 1 to count do
    begin
      if description <> '' then
      begin
        if i = count then
          description := description + ' and '
        else
          description := description + ', ';
      end;
      description := description + GetFibroidString(i);
    end;
    if description <> '' then
      description := 'There are fibroids identified: ' + description;
  end;

  { --- Phase 2: Select result — use description, or flag warning --- }

  if description <> '' then
    result := description
  else if count = 1 then
  begin
    GFibroidWarning := TRUE;
    result := 'Fibroid';
  end
  else if count > 1 then
  begin
    GFibroidWarning := TRUE;
    result := 'Fibroids';
  end
  else if cbFibroidsVisualised.Checked then
  begin
    GFibroidWarning := TRUE;
    result := 'Fibroid/s';
  end
  else
    result := '';

  { --- Phase 3: Format for report --- }

  if result <> '' then
    result := #13#10 + #13#10 + AddFullStopToEnd(result);
end;
```

### What changed

| Change | Why |
|---|---|
| Separated build/select/format into three flat phases | Eliminates nested `if result = ''` checks inside outer `if count > 0` |
| Used `description` variable for the build phase | Decouples building from result selection — each phase has a single job |
| Removed dead `else result := ''` branch and semicolon before it | Fixes syntax error; the branch was unreachable anyway |
| Warning fallback is now a single `if/else if` chain | All five outcomes (description, Fibroid, Fibroids, Fibroid/s, empty) are siblings at the same nesting level |
| Consistent spacing in separators (`', '` and `' and '`) | Matches the t3Singleton/pe12week/t3twins variants |
| Cached `GetSingleCloseOrClear` in `proximity` variable | Avoids calling the function twice (once to check, once to use) |
