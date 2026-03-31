# DFM Viewer Design Spec

**Date:** 2026-04-01
**Status:** Approved

## Summary

A local Node/TypeScript dev server that parses Delphi DFM files and renders them as interactive HTML previews in the browser. Point it at a DFM file path, open localhost, and see an approximate DevExpress-styled form with working tabs and hot reload.

## Goals

- Render DFM files as interactive HTML that visually approximates the DevExpress form appearance
- Support all ~15 control types used in the project's DFM files
- Hot reload when the DFM file changes on disk, preserving form state (active tab, input values)
- Run as a local dev tool alongside existing build tooling

## Non-Goals

- Pixel-perfect DevExpress reproduction
- Hosting/deployment as a static web page
- Paste/upload-based input (file path only)
- Full property support for every obscure DFM property

## Architecture

Three modules, each independently testable:

### 1. Parser (`src/parser.ts`)

Parses DFM text into a typed AST.

**Input:** Raw DFM text string.

**Output:**

```typescript
interface DfmNode {
  keyword: 'object' | 'inherited';
  name: string;           // e.g. "edtBPD"
  type: string;           // e.g. "TcxSpinEdit"
  properties: Map<string, DfmValue>;
  children: DfmNode[];
}

type DfmValue = string | number | boolean | string[];
```

**Parsing rules:**

- Lines matching `object <name>: <type>` or `inherited <name>: <type>` start a new node
- Lines matching `<key> = <value>` are properties on the current node
- `end` closes the current node
- Parenthesized string lists (used by `Properties.Items.Strings`) are parsed into `string[]`:
  ```
  Properties.Items.Strings = (
    'Option A'
    'Option B')
  ```
- Delphi color integers (e.g. `Style.Font.Color = 16711680`) are stored as numbers, converted to CSS hex at render time
- Nested dot properties (e.g. `Properties.SpinButtons.Visible`) are stored as flat keys in the properties map

### 2. Renderer (`src/renderer.ts`)

Converts the AST into an HTML string.

**Visual target:** Windows Classic form aesthetic matching `gynae-reports/GYNAE_TEMPLATE_SPECIFICATION.html` — `#ece9d8` form background, `#3a6ea5→#1e4d8c` gradient title bar, `#d4d0c8` tab bar, `#7f9db9` input borders, Segoe UI/Tahoma at 11px, 20px input height.

**Control type mapping:**

| DFM Type | HTML Element | Notes |
|---|---|---|
| `TcxPageControl` | Tab bar container `<div>` | `#d4d0c8` background, clickable tabs |
| `TcxTabSheet` | Tab panel `<div>` | Show/hide on tab click, `Caption` property for tab label |
| `TcxGroupBox` | `<div>` | `#aaa` border, respects `Style.Edges` (selective borders), `PanelStyle.Active` for flat panel mode |
| `TScrollBox` / `TcxScrollBox` | `<div>` | `overflow: auto`, `position: relative` |
| `TcxLabel` | `<span>` | Absolute positioned, supports `Style.Font.*` |
| `TcxTextEdit` | `<input type="text">` | `#7f9db9` border, 20px height |
| `TcxDateEdit` | `<input type="text">` | Same styling + `dd/mm/yyyy` placeholder |
| `TcxSpinEdit` | `<input type="number">` or `<input type="text">` | `type="number"` when `SpinButtons.Visible` is true (default), `type="text"` when false |
| `TcxComboBox` | `<select>` | Items populated from `Properties.Items.Strings` |
| `TcxCheckBox` | `<label><input type="checkbox"></label>` | Caption from DFM |
| `TcxCheckComboBox` | `<div>` styled as dropdown with `<label><input type="checkbox">` per item | Click toggles a dropdown panel showing checkable items from `Properties.Items`; selected items shown as comma-separated text when closed |
| `TcxMaskEdit` | `<input type="text">` | Mask pattern as placeholder |
| `TcxButton` | `<button>` | `#d4d0c8` bg, `#808080` border, raised look |
| `TBevel` | `<hr>` | `#aaa`, 1px |

**Layout model:**

- Controls with `Left`/`Top` properties use `position: absolute` within their parent container
- Parent containers (`TcxGroupBox`, `TScrollBox`, `TcxTabSheet`) use `position: relative`
- `Align` property overrides absolute positioning:
  - `alClient` → `width: 100%; height: 100%` (fills parent)
  - `alTop` → `width: 100%`, docked to top, height from `Height` property
- `Constraints.MinHeight` / `Constraints.MinWidth` → CSS `min-height` / `min-width`
- Container height is set from `Height` property; if absent, use CSS `min-height` based on the maximum `Top + Height` of its children so the container fits its contents

**Property support (level B+):**

Core layout:
- `Left`, `Top` → `position: absolute; left: Xpx; top: Ypx`
- `Width`, `Height` → `width: Xpx; height: Xpx`
- `Align` → see layout model above
- `Visible = False` → `display: none`
- `Enabled = False` → `disabled` attribute + `#f0f0f0` bg, `#d0d0d0` border, `#999` text

Labels and text:
- `Caption` → text content or tab label
- `Text` → input default value
- `Transparent = True` → no background on labels

Font styling:
- `Style.Font.Name` → `font-family`
- `Style.Font.Height` → `font-size` (Delphi uses negative pixel values; negate for CSS px)
- `Style.Font.Color` → `color` (Delphi integer → CSS hex)
- `Style.Font.Style` → `[fsBold]` → `font-weight: bold`, `[fsItalic]` → `font-style: italic`
- `ParentFont = False` → apply the font properties (otherwise inherit)

Border styling:
- `Style.Edges` → selective CSS borders: `[bBottom]` → `border-bottom` only, `[bLeft, bRight]` → those two sides, etc.
- `Style.BorderColor` → `border-color`
- `Style.BorderStyle` → `ebsNone` → no border, `ebsSingle` → `1px solid`

Control-specific:
- `Properties.Items.Strings` → combo box / check combo box options
- `Properties.SpinButtons.Visible` → show/hide number input spin buttons
- `Properties.DisplayFormat` / `Properties.EditFormat` → placeholder text hint
- `Properties.Increment` → `step` attribute on number inputs
- `Properties.ReadOnly = True` → `readonly` attribute + subtle styling
- `Properties.DropDownListStyle = lsFixedList` → `<select>` (no free text entry)
- `Properties.MaxValue` / `Properties.MinValue` → `min`/`max` attributes
- `Properties.ActivePage` → which tab is initially selected

Ignored (no visual impact):
- `TabOrder` — not relevant for preview
- `Tag` — internal integer
- `ImageIndex` — would need image assets
- `ExplicitWidth` / `ExplicitHeight` — Delphi layout engine internals
- `ClientRect*` — computed layout properties
- `Style*.LookAndFeel.NativeStyle` — hover/focus decoration
- `Properties.ImmediatePost` — data binding behavior
- `Properties.SaveTime` — serialization behavior
- `ShortDescription` / `Description` — accessibility metadata on combo items

### 3. Server (`src/server.ts`)

Express server with file watching and WebSocket-based hot reload.

**Startup:**
1. Read the DFM file from the provided path
2. Parse → render → cache the HTML
3. Start Express on port 3000 (or next available)
4. Start watching the file with chokidar
5. Open WebSocket endpoint at `/ws`
6. Print URL to stdout

**File change cycle:**
1. chokidar detects file change
2. Re-parse and re-render the DFM
3. Push `{ type: "reload" }` over WebSocket to all connected clients
4. Client-side JS receives message, saves state, reloads page

**Client-side state preservation:**
- On any input change event, save value to `sessionStorage` keyed by control name (e.g. `dfm-state:edtBPD`)
- On tab change, save active tab index to `sessionStorage` keyed by page control name (e.g. `dfm-tab:pcReportBody`)
- After page load, restore all saved values and active tabs
- `sessionStorage` scoped to the browser tab, so multiple DFM files can be viewed simultaneously without conflicts

### 4. Styles (`src/styles.ts`)

CSS string constant matching the Windows Classic aesthetic. Based on the proven CSS from `gynae-reports/GYNAE_TEMPLATE_SPECIFICATION.html`:

- Form background: `#ece9d8`
- Title bar: `linear-gradient(180deg, #3a6ea5, #1e4d8c)`, white text
- Tab bar: `#d4d0c8` background, `#808080` borders, active tab merges with body
- Input controls: `#7f9db9` border, white background, 20px height, 11px font
- Disabled controls: `#f0f0f0` background, `#d0d0d0` border, `#999` text
- Group boxes: `#aaa` border, `rgba(255,255,255,0.3)` background
- Bevels/separators: `#aaa` 1px
- Font: `'Segoe UI', Tahoma, sans-serif` at 11px base

## CLI Interface

```bash
# Point at a specific DFM file
npx dfm-viewer Scripts/earlyT1Singleton/screen.dfm

# Point at a directory (auto-finds screen.dfm)
npx dfm-viewer Scripts/earlyT1Singleton/

# Custom port
npx dfm-viewer --port 8080 Scripts/gynae/screen.dfm
```

**Output:**
```
Serving screen.dfm at http://localhost:3000
Watching for changes...
```

## Project Structure

```
Scripts/tools/dfm-viewer/
  package.json          # name: dfm-viewer, bin entry
  tsconfig.json
  src/
    types.ts            # DfmNode, DfmValue type definitions
    parser.ts           # DFM text → AST
    renderer.ts         # AST → HTML string
    styles.ts           # CSS string constant
    server.ts           # Express + chokidar + WebSocket + CLI entry
```

**Dependencies:**
- `express` — HTTP server
- `ws` — WebSocket server
- `chokidar` — file watching
- `tsx` — run TypeScript directly without build step

**Dev dependencies:**
- `typescript`
- `@types/express`, `@types/ws`

## Testing Strategy

Parser and renderer are pure functions, straightforward to unit test:

- **Parser tests:** Feed DFM text snippets, assert AST structure. Cover: simple properties, nested objects, string lists, color values, inherited keyword.
- **Renderer tests:** Feed AST nodes, assert HTML output contains expected elements and styles. Cover: each control type, layout properties, font/border properties, disabled state, hidden controls.
- **Integration test:** Parse a real project DFM file (e.g. `Scripts/earlyT1Singleton/screen.dfm`), render it, assert no errors and output contains expected control names.

Tests live in `src/__tests__/` and run with the project's existing test patterns.
