# DFM Viewer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a local Node/TypeScript dev server that parses Delphi DFM files and renders them as interactive HTML form previews with hot reload.

**Architecture:** Three pure modules (parser, renderer, styles) plus a thin server layer. Parser converts DFM text to a typed AST. Renderer maps each DevExpress control type to styled HTML. Server watches the file and pushes reloads over WebSocket, with client-side state preservation.

**Tech Stack:** TypeScript, Express, ws (WebSocket), chokidar (file watching), tsx (runtime), vitest (testing)

**Spec:** `docs/superpowers/specs/2026-04-01-dfm-viewer-design.md`

---

## File Map

```
Scripts/tools/dfm-viewer/
  package.json
  tsconfig.json
  src/
    types.ts              # DfmNode, DfmValue type definitions
    parser.ts             # DFM text → AST
    renderer.ts           # AST → HTML string (all control types)
    styles.ts             # CSS string constant (Windows Classic theme)
    client.ts             # Client-side JS string (tabs, state, WebSocket)
    server.ts             # Express + chokidar + WebSocket + CLI entry
  src/__tests__/
    parser.test.ts        # Parser unit tests
    renderer.test.ts      # Renderer unit tests
    integration.test.ts   # End-to-end: parse real DFM → render → validate
```

Note: `client.ts` is separated from `renderer.ts` because it exports a JS string that runs in the browser (tab switching, state persistence, WebSocket reload), while `renderer.ts` runs on the server and produces HTML. They have different execution contexts.

---

### Task 1: Project Scaffolding

**Files:**
- Create: `Scripts/tools/dfm-viewer/package.json`
- Create: `Scripts/tools/dfm-viewer/tsconfig.json`
- Create: `Scripts/tools/dfm-viewer/src/types.ts`

- [ ] **Step 1: Create package.json**

```json
{
  "name": "dfm-viewer",
  "version": "0.1.0",
  "description": "DFM form file viewer with hot reload",
  "type": "module",
  "bin": {
    "dfm-viewer": "./src/server.ts"
  },
  "scripts": {
    "start": "tsx src/server.ts",
    "test": "vitest run",
    "test:watch": "vitest"
  },
  "dependencies": {
    "chokidar": "^4.0.0",
    "express": "^5.1.0",
    "ws": "^8.18.0"
  },
  "devDependencies": {
    "@types/express": "^5.0.0",
    "@types/ws": "^8.5.0",
    "tsx": "^4.19.0",
    "typescript": "^5.7.0",
    "vitest": "^3.1.0"
  }
}
```

- [ ] **Step 2: Create tsconfig.json**

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "Node16",
    "moduleResolution": "Node16",
    "strict": true,
    "esModuleInterop": true,
    "outDir": "dist",
    "rootDir": "src",
    "declaration": true,
    "sourceMap": true
  },
  "include": ["src/**/*"]
}
```

- [ ] **Step 3: Create types.ts**

```typescript
export interface DfmNode {
  keyword: 'object' | 'inherited';
  name: string;
  type: string;
  properties: Map<string, DfmValue>;
  children: DfmNode[];
}

export type DfmValue = string | number | boolean | DfmValue[] | DfmItem[];

export interface DfmItem {
  properties: Map<string, DfmValue>;
}
```

`DfmItem` is needed for `Properties.Items = <item...end>` collections used by `TcxCheckComboBox`. Each `item` block has its own properties (Description, ShortDescription). `DfmValue[]` covers `Properties.Items.Strings = ('a' 'b')` — flat string arrays used by `TcxComboBox`.

- [ ] **Step 4: Install dependencies**

Run: `cd Scripts/tools/dfm-viewer && npm install`
Expected: `node_modules/` created, lock file generated

- [ ] **Step 5: Verify TypeScript compiles**

Run: `cd Scripts/tools/dfm-viewer && npx tsc --noEmit`
Expected: No errors

- [ ] **Step 6: Commit**

```bash
git add Scripts/tools/dfm-viewer/package.json Scripts/tools/dfm-viewer/tsconfig.json Scripts/tools/dfm-viewer/src/types.ts Scripts/tools/dfm-viewer/package-lock.json
git commit -m "feat(dfm-viewer): scaffold project with types"
```

---

### Task 2: DFM Parser — Core Structure

**Files:**
- Create: `Scripts/tools/dfm-viewer/src/__tests__/parser.test.ts`
- Create: `Scripts/tools/dfm-viewer/src/parser.ts`

- [ ] **Step 1: Write failing tests for basic parsing**

```typescript
import { describe, it, expect } from 'vitest';
import { parseDfm } from '../parser.js';

describe('parseDfm', () => {
  it('parses a single object with simple properties', () => {
    const input = `object cxLabel1: TcxLabel
  Left = 36
  Top = 2
  Caption = 'Exam Date'
  Transparent = True
end`;
    const nodes = parseDfm(input);
    expect(nodes).toHaveLength(1);
    expect(nodes[0].keyword).toBe('object');
    expect(nodes[0].name).toBe('cxLabel1');
    expect(nodes[0].type).toBe('TcxLabel');
    expect(nodes[0].properties.get('Left')).toBe(36);
    expect(nodes[0].properties.get('Top')).toBe(2);
    expect(nodes[0].properties.get('Caption')).toBe('Exam Date');
    expect(nodes[0].properties.get('Transparent')).toBe(true);
    expect(nodes[0].children).toHaveLength(0);
  });

  it('parses inherited keyword', () => {
    const input = `inherited Early_Pregnancy: TEarly_Pregnancy
  Width = 1404
  Height = 808
end`;
    const nodes = parseDfm(input);
    expect(nodes).toHaveLength(1);
    expect(nodes[0].keyword).toBe('inherited');
    expect(nodes[0].name).toBe('Early_Pregnancy');
    expect(nodes[0].type).toBe('TEarly_Pregnancy');
    expect(nodes[0].properties.get('Width')).toBe(1404);
  });

  it('parses nested objects', () => {
    const input = `object cxGroupBox1: TcxGroupBox
  Left = 0
  Top = 0
  object cxLabel1: TcxLabel
    Left = 36
    Caption = 'Name'
  end
  object edtName: TcxTextEdit
    Left = 100
    Width = 200
  end
end`;
    const nodes = parseDfm(input);
    expect(nodes).toHaveLength(1);
    expect(nodes[0].children).toHaveLength(2);
    expect(nodes[0].children[0].name).toBe('cxLabel1');
    expect(nodes[0].children[0].type).toBe('TcxLabel');
    expect(nodes[0].children[1].name).toBe('edtName');
    expect(nodes[0].children[1].type).toBe('TcxTextEdit');
  });

  it('parses deeply nested objects', () => {
    const input = `object pcMain: TcxPageControl
  Width = 800
  object tab1: TcxTabSheet
    Caption = 'Tab 1'
    object grp1: TcxGroupBox
      object lbl1: TcxLabel
        Caption = 'Deep'
      end
    end
  end
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].children[0].children[0].children[0].properties.get('Caption')).toBe('Deep');
  });

  it('parses dot-notation properties as flat keys', () => {
    const input = `object spin1: TcxSpinEdit
  Properties.SpinButtons.Visible = False
  Properties.MaxValue = 45.000000000000000000
  Properties.MinValue = 1.000000000000000000
  Style.BorderStyle = ebsNone
end`;
    const nodes = parseDfm(input);
    const props = nodes[0].properties;
    expect(props.get('Properties.SpinButtons.Visible')).toBe(false);
    expect(props.get('Properties.MaxValue')).toBeCloseTo(45.0);
    expect(props.get('Properties.MinValue')).toBeCloseTo(1.0);
    expect(props.get('Style.BorderStyle')).toBe('ebsNone');
  });

  it('parses numeric values including floats', () => {
    const input = `object spin1: TcxSpinEdit
  Value = 28
  Properties.Increment = 0.100000000000000000
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Value')).toBe(28);
    expect(nodes[0].properties.get('Properties.Increment')).toBeCloseTo(0.1);
  });

  it('parses boolean values', () => {
    const input = `object cb1: TcxCheckBox
  Enabled = False
  Visible = True
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Enabled')).toBe(false);
    expect(nodes[0].properties.get('Visible')).toBe(true);
  });
});
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run src/__tests__/parser.test.ts`
Expected: FAIL — `parseDfm` not found

- [ ] **Step 3: Implement core parser**

```typescript
import { DfmNode, DfmValue, DfmItem } from './types.js';

export function parseDfm(input: string): DfmNode[] {
  const lines = input.split('\n');
  const roots: DfmNode[] = [];
  const stack: DfmNode[] = [];
  let i = 0;

  while (i < lines.length) {
    const line = lines[i].trim();
    i++;

    if (line === '' || line === '') continue;

    // Object/inherited declaration
    const objMatch = line.match(/^(object|inherited)\s+(\w+):\s+(\w+)$/);
    if (objMatch) {
      const node: DfmNode = {
        keyword: objMatch[1] as 'object' | 'inherited',
        name: objMatch[2],
        type: objMatch[3],
        properties: new Map(),
        children: [],
      };
      if (stack.length > 0) {
        stack[stack.length - 1].children.push(node);
      } else {
        roots.push(node);
      }
      stack.push(node);
      continue;
    }

    // End of object
    if (line === 'end') {
      stack.pop();
      continue;
    }

    // Property assignment
    const propMatch = line.match(/^([\w.]+)\s*=\s*(.*)$/);
    if (propMatch && stack.length > 0) {
      const key = propMatch[1];
      const rawValue = propMatch[2];
      const current = stack[stack.length - 1];

      // Parenthesized string list: Properties.Items.Strings = (
      if (rawValue === '(') {
        const strings: string[] = [];
        while (i < lines.length) {
          const sLine = lines[i].trim();
          i++;
          // Line with closing paren: 'value')
          if (sLine.endsWith(')')) {
            const last = sLine.slice(0, -1).trim();
            if (last.startsWith("'") && last.endsWith("'")) {
              strings.push(last.slice(1, -1));
            }
            break;
          }
          if (sLine.startsWith("'") && sLine.endsWith("'")) {
            strings.push(sLine.slice(1, -1));
          }
        }
        current.properties.set(key, strings);
        continue;
      }

      // Angle-bracket item collection: Properties.Items = <
      if (rawValue === '<') {
        const items: DfmItem[] = [];
        // Parse until we find the closing >
        // Items are: item ... end> or item ... end\n ... >
        let currentItem: DfmItem | null = null;
        while (i < lines.length) {
          const iLine = lines[i].trim();
          i++;
          if (iLine === 'item') {
            currentItem = { properties: new Map() };
            continue;
          }
          if (iLine === 'end>' || iLine === '>') {
            if (currentItem) {
              items.push(currentItem);
              currentItem = null;
            }
            if (iLine === 'end>' || iLine === '>') break;
            continue;
          }
          if (iLine === 'end') {
            if (currentItem) {
              items.push(currentItem);
              currentItem = null;
            }
            continue;
          }
          // Property inside item
          if (currentItem) {
            const itemPropMatch = iLine.match(/^([\w.]+)\s*=\s*(.*)$/);
            if (itemPropMatch) {
              currentItem.properties.set(itemPropMatch[1], parseValue(itemPropMatch[2]));
            }
          }
        }
        current.properties.set(key, items);
        continue;
      }

      // Empty collection: <>
      if (rawValue === '<>') {
        current.properties.set(key, []);
        continue;
      }

      current.properties.set(key, parseValue(rawValue));
      continue;
    }
  }

  return roots;
}

function parseValue(raw: string): DfmValue {
  // Boolean
  if (raw === 'True') return true;
  if (raw === 'False') return false;

  // Quoted string
  if (raw.startsWith("'") && raw.endsWith("'")) {
    return raw.slice(1, -1);
  }

  // Number (integer or float)
  if (/^-?\d+(\.\d+)?$/.test(raw)) {
    return parseFloat(raw);
  }

  // Everything else is a string identifier (e.g. clRed, ebsNone, alClient, [bBottom], cxtsPregnancy)
  return raw;
}
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run src/__tests__/parser.test.ts`
Expected: All 7 tests PASS

- [ ] **Step 5: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/parser.ts Scripts/tools/dfm-viewer/src/__tests__/parser.test.ts
git commit -m "feat(dfm-viewer): implement core DFM parser with tests"
```

---

### Task 3: DFM Parser — Collection and Edge Case Support

**Files:**
- Modify: `Scripts/tools/dfm-viewer/src/__tests__/parser.test.ts`
- (parser.ts already handles these — this task adds test coverage)

- [ ] **Step 1: Write failing tests for collection formats and edge cases**

Add these tests to the existing `describe('parseDfm')` block in `parser.test.ts`:

```typescript
  it('parses Properties.Items.Strings parenthesized list', () => {
    const input = `object cb1: TcxComboBox
  Properties.Items.Strings = (
    ''
    'Normal'
    'Bradycardia'
    'Tachycardia')
  TabOrder = 3
end`;
    const nodes = parseDfm(input);
    const items = nodes[0].properties.get('Properties.Items.Strings');
    expect(items).toEqual(['', 'Normal', 'Bradycardia', 'Tachycardia']);
  });

  it('parses Properties.Items angle-bracket collection', () => {
    const input = `object ccb1: TcxCheckComboBox
  Properties.Items = <
    item
      Description = 'Dating'
      ShortDescription = 'Dating'
    end
    item
      Description = 'Viability'
      ShortDescription = 'Viability'
    end>
  Width = 163
end`;
    const nodes = parseDfm(input);
    const items = nodes[0].properties.get('Properties.Items') as DfmItem[];
    expect(items).toHaveLength(2);
    expect(items[0].properties.get('Description')).toBe('Dating');
    expect(items[1].properties.get('Description')).toBe('Viability');
  });

  it('parses empty angle-bracket collection', () => {
    const input = `object pc1: TcxPageControl
  Properties.CustomButtons.Buttons = <>
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Properties.CustomButtons.Buttons')).toEqual([]);
  });

  it('parses Delphi color constants as strings', () => {
    const input = `object ccb1: TcxCheckComboBox
  Style.BorderColor = clRed
  Style.Font.Color = clWindowText
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Style.BorderColor')).toBe('clRed');
    expect(nodes[0].properties.get('Style.Font.Color')).toBe('clWindowText');
  });

  it('parses set notation properties', () => {
    const input = `object grp1: TcxGroupBox
  Style.Edges = [bBottom]
  Style.Font.Style = [fsBold]
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Style.Edges')).toBe('[bBottom]');
    expect(nodes[0].properties.get('Style.Font.Style')).toBe('[fsBold]');
  });

  it('parses empty set notation', () => {
    const input = `object grp1: TcxGroupBox
  Style.Edges = []
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Style.Edges')).toBe('[]');
  });

  it('parses Align property values', () => {
    const input = `object sb1: TScrollBox
  Align = alClient
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Align')).toBe('alClient');
  });

  it('parses Properties.ActivePage as a string reference', () => {
    const input = `object pc1: TcxPageControl
  Properties.ActivePage = cxtsPregnancy
end`;
    const nodes = parseDfm(input);
    expect(nodes[0].properties.get('Properties.ActivePage')).toBe('cxtsPregnancy');
  });
```

Add this import at the top of the test file (alongside the existing import):

```typescript
import type { DfmItem } from '../types.js';
```

- [ ] **Step 2: Run tests to verify they pass**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run src/__tests__/parser.test.ts`
Expected: All 15 tests PASS (the parser already handles all these cases)

- [ ] **Step 3: If any tests fail, fix the parser and re-run**

- [ ] **Step 4: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/__tests__/parser.test.ts
git commit -m "test(dfm-viewer): add parser tests for collections and edge cases"
```

---

### Task 4: CSS Styles Module

**Files:**
- Create: `Scripts/tools/dfm-viewer/src/styles.ts`

- [ ] **Step 1: Create the CSS string constant**

This CSS is based on the proven styling from `gynae-reports/GYNAE_TEMPLATE_SPECIFICATION.html`. It defines the Windows Classic form aesthetic used by all rendered controls.

```typescript
export const formStyles = `
/* === DFM Viewer — Windows Classic Form Theme === */
* { box-sizing: border-box; margin: 0; padding: 0; }

body {
  font-family: 'Segoe UI', Tahoma, sans-serif;
  font-size: 12px;
  background: #c0c0c0;
  padding: 20px;
}

.dfm-form {
  background: #ece9d8;
  border: 2px solid #999;
  border-radius: 4px;
  font-family: 'Segoe UI', Tahoma, sans-serif;
  font-size: 12px;
  box-shadow: 2px 2px 8px rgba(0,0,0,0.15);
  max-width: 1440px;
}

.dfm-titlebar {
  background: linear-gradient(180deg, #3a6ea5, #1e4d8c);
  color: white;
  padding: 3px 8px;
  font-size: 11px;
  font-weight: bold;
}

/* === Tab Controls === */
.dfm-tabs {
  display: flex;
  background: #d4d0c8;
  border-bottom: 1px solid #808080;
  padding: 2px 4px 0;
  flex-wrap: wrap;
}

.dfm-tab {
  padding: 3px 12px;
  margin-right: 2px;
  background: #d4d0c8;
  border: 1px solid #808080;
  border-bottom: none;
  border-radius: 3px 3px 0 0;
  cursor: pointer;
  font-size: 11px;
  color: #333;
  user-select: none;
}

.dfm-tab:hover {
  background: #e4e0d8;
}

.dfm-tab.active {
  background: #ece9d8;
  border-bottom: 1px solid #ece9d8;
  margin-bottom: -1px;
  font-weight: bold;
}

.dfm-tab-panel {
  display: none;
  position: relative;
  background: #ece9d8;
}

.dfm-tab-panel.active {
  display: block;
}

.dfm-page-control {
  position: relative;
}

/* === Containers === */
.dfm-groupbox {
  position: relative;
  border: 1px solid #aaa;
  padding: 4px;
  background: rgba(255,255,255,0.3);
}

.dfm-groupbox.panel-active {
  border: none;
  background: transparent;
  padding: 0;
}

.dfm-groupbox.edges-none {
  border: none;
}

.dfm-groupbox.edges-bottom {
  border: none;
  border-bottom: 1px solid #aaa;
}

.dfm-groupbox.edges-top {
  border: none;
  border-top: 1px solid #aaa;
}

.dfm-groupbox.edges-left {
  border: none;
  border-left: 1px solid #aaa;
}

.dfm-groupbox.edges-right {
  border: none;
  border-right: 1px solid #aaa;
}

.dfm-scrollbox {
  position: relative;
  overflow: auto;
}

/* === Input Controls === */
.dfm-input {
  background: white;
  border: 1px solid #7f9db9;
  padding: 1px 4px;
  font-size: 11px;
  font-family: inherit;
  height: 20px;
}

.dfm-input:disabled,
.dfm-input[readonly] {
  background: #f0f0f0;
  border-color: #d0d0d0;
  color: #999;
}

.dfm-select {
  background: white;
  border: 1px solid #7f9db9;
  padding: 1px 4px;
  font-size: 11px;
  font-family: inherit;
  height: 20px;
}

.dfm-select:disabled {
  background: #f0f0f0;
  border-color: #d0d0d0;
  color: #999;
}

/* === Check Combo Box === */
.dfm-check-combo {
  background: white;
  border: 1px solid #7f9db9;
  padding: 1px 4px;
  font-size: 11px;
  font-family: inherit;
  height: 20px;
  cursor: pointer;
  display: flex;
  align-items: center;
  position: relative;
  user-select: none;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.dfm-check-combo-dropdown {
  display: none;
  position: absolute;
  top: 100%;
  left: -1px;
  background: white;
  border: 1px solid #7f9db9;
  z-index: 100;
  max-height: 300px;
  overflow-y: auto;
  min-width: 100%;
}

.dfm-check-combo-dropdown.open {
  display: block;
}

.dfm-check-combo-dropdown label {
  display: flex;
  align-items: center;
  padding: 2px 6px;
  gap: 4px;
  font-size: 11px;
  cursor: pointer;
}

.dfm-check-combo-dropdown label:hover {
  background: #316ac5;
  color: white;
}

/* === Checkbox === */
.dfm-checkbox {
  display: inline-flex;
  align-items: center;
  font-size: 11px;
  gap: 2px;
  position: absolute;
}

.dfm-checkbox input {
  margin: 0;
}

/* === Label === */
.dfm-label {
  font-size: 11px;
  color: #333;
  position: absolute;
  white-space: nowrap;
}

/* === Button === */
.dfm-button {
  background: #d4d0c8;
  border: 1px solid #808080;
  padding: 2px 12px;
  font-size: 11px;
  font-family: inherit;
  cursor: pointer;
  border-radius: 1px;
  position: absolute;
}

.dfm-button:hover {
  background: #e4e0d8;
}

.dfm-button:active {
  background: #c4c0b8;
}

/* === Bevel === */
.dfm-bevel {
  position: absolute;
  border: none;
  border-top: 1px solid #808080;
  border-bottom: 1px solid #fff;
}

/* === Layout helpers === */
.dfm-absolute {
  position: absolute;
}

.dfm-align-client {
  position: relative !important;
  width: 100%;
}

.dfm-align-top {
  position: relative !important;
  width: 100%;
}

/* === Hidden === */
.dfm-hidden {
  display: none !important;
}
`;
```

- [ ] **Step 2: Verify it compiles**

Run: `cd Scripts/tools/dfm-viewer && npx tsc --noEmit`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/styles.ts
git commit -m "feat(dfm-viewer): add Windows Classic CSS theme"
```

---

### Task 5: Renderer — Container Controls and Layout

**Files:**
- Create: `Scripts/tools/dfm-viewer/src/__tests__/renderer.test.ts`
- Create: `Scripts/tools/dfm-viewer/src/renderer.ts`

This task implements the renderer for container controls (PageControl, TabSheet, GroupBox, ScrollBox) and the layout model (absolute positioning, Align property). Input controls are added in Task 6.

- [ ] **Step 1: Write failing tests for container rendering**

```typescript
import { describe, it, expect } from 'vitest';
import { renderDfm } from '../renderer.js';
import type { DfmNode } from '../types.js';

function makeNode(overrides: Partial<DfmNode> & { name: string; type: string }): DfmNode {
  return {
    keyword: 'object',
    properties: new Map(),
    children: [],
    ...overrides,
  };
}

describe('renderDfm', () => {
  it('renders a root node as a form container with titlebar', () => {
    const node = makeNode({
      keyword: 'inherited',
      name: 'Early_Pregnancy',
      type: 'TEarly_Pregnancy',
    });
    node.properties.set('Width', 1404);
    node.properties.set('Height', 808);
    const html = renderDfm([node]);
    expect(html).toContain('dfm-form');
    expect(html).toContain('dfm-titlebar');
    expect(html).toContain('Early_Pregnancy');
  });

  it('renders TcxPageControl with tab bar', () => {
    const tab1 = makeNode({ name: 'tab1', type: 'TcxTabSheet' });
    tab1.properties.set('Caption', 'Details');
    const tab2 = makeNode({ name: 'tab2', type: 'TcxTabSheet' });
    tab2.properties.set('Caption', 'Settings');

    const pc = makeNode({ name: 'pc1', type: 'TcxPageControl' });
    pc.children = [tab1, tab2];
    pc.properties.set('Properties.ActivePage', 'tab1');

    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [pc] })]);
    expect(html).toContain('dfm-tabs');
    expect(html).toContain('Details');
    expect(html).toContain('Settings');
    expect(html).toContain('dfm-tab-panel');
  });

  it('renders TcxGroupBox with edges', () => {
    const grp = makeNode({ name: 'grp1', type: 'TcxGroupBox' });
    grp.properties.set('Style.Edges', '[bBottom]');
    grp.properties.set('Left', 0);
    grp.properties.set('Top', 0);
    grp.properties.set('Width', 400);
    grp.properties.set('Height', 100);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [grp] })]);
    expect(html).toContain('edges-bottom');
  });

  it('renders TcxGroupBox with PanelStyle.Active', () => {
    const grp = makeNode({ name: 'grp1', type: 'TcxGroupBox' });
    grp.properties.set('PanelStyle.Active', true);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [grp] })]);
    expect(html).toContain('panel-active');
  });

  it('renders TScrollBox with overflow', () => {
    const sb = makeNode({ name: 'sb1', type: 'TScrollBox' });
    sb.properties.set('Width', 800);
    sb.properties.set('Height', 600);
    sb.properties.set('Align', 'alClient');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [sb] })]);
    expect(html).toContain('dfm-scrollbox');
  });

  it('applies absolute positioning from Left/Top', () => {
    const lbl = makeNode({ name: 'lbl1', type: 'TcxLabel' });
    lbl.properties.set('Left', 36);
    lbl.properties.set('Top', 2);
    lbl.properties.set('Caption', 'Test');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [lbl] })]);
    expect(html).toContain('left:36px');
    expect(html).toContain('top:2px');
  });

  it('applies alTop alignment', () => {
    const grp = makeNode({ name: 'grp1', type: 'TcxGroupBox' });
    grp.properties.set('Align', 'alTop');
    grp.properties.set('Height', 126);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [grp] })]);
    expect(html).toContain('dfm-align-top');
    expect(html).toContain('height:126px');
  });

  it('applies alClient alignment', () => {
    const sb = makeNode({ name: 'sb1', type: 'TScrollBox' });
    sb.properties.set('Align', 'alClient');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [sb] })]);
    expect(html).toContain('dfm-align-client');
  });

  it('applies Visible = False as hidden', () => {
    const lbl = makeNode({ name: 'lbl1', type: 'TcxLabel' });
    lbl.properties.set('Visible', false);
    lbl.properties.set('Caption', 'Hidden');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [lbl] })]);
    expect(html).toContain('dfm-hidden');
  });
});
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run src/__tests__/renderer.test.ts`
Expected: FAIL — `renderDfm` not found

- [ ] **Step 3: Implement the renderer**

```typescript
import type { DfmNode, DfmValue, DfmItem } from './types.js';

export function renderDfm(roots: DfmNode[]): string {
  if (roots.length === 0) return '';
  const root = roots[0];
  const formName = root.name.replace(/_/g, ' ');
  const width = root.properties.get('Width') as number | undefined;

  let html = `<div class="dfm-form"${width ? ` style="width:${width}px"` : ''}>`;
  html += `<div class="dfm-titlebar">${escapeHtml(formName)}</div>`;
  html += `<div style="position:relative;background:#ece9d8;padding:0">`;
  for (const child of root.children) {
    html += renderNode(child);
  }
  html += `</div></div>`;
  return html;
}

function renderNode(node: DfmNode): string {
  switch (node.type) {
    case 'TcxPageControl':
      return renderPageControl(node);
    case 'TcxTabSheet':
      return renderTabPanel(node);
    case 'TcxGroupBox':
      return renderGroupBox(node);
    case 'TScrollBox':
    case 'TcxScrollBox':
      return renderScrollBox(node);
    case 'TcxLabel':
      return renderLabel(node);
    case 'TcxTextEdit':
      return renderTextEdit(node);
    case 'TcxDateEdit':
      return renderDateEdit(node);
    case 'TcxSpinEdit':
      return renderSpinEdit(node);
    case 'TcxComboBox':
      return renderComboBox(node);
    case 'TcxCheckBox':
      return renderCheckBox(node);
    case 'TcxCheckComboBox':
      return renderCheckComboBox(node);
    case 'TcxMaskEdit':
      return renderMaskEdit(node);
    case 'TcxButton':
      return renderButton(node);
    case 'TBevel':
      return renderBevel(node);
    default:
      // Unknown control type: render as a generic container with its children
      return renderGenericContainer(node);
  }
}

// === Helper functions ===

function prop(node: DfmNode, key: string): DfmValue | undefined {
  return node.properties.get(key);
}

function propStr(node: DfmNode, key: string): string {
  const v = node.properties.get(key);
  return typeof v === 'string' ? v : '';
}

function propNum(node: DfmNode, key: string): number | undefined {
  const v = node.properties.get(key);
  return typeof v === 'number' ? v : undefined;
}

function propBool(node: DfmNode, key: string): boolean | undefined {
  const v = node.properties.get(key);
  return typeof v === 'boolean' ? v : undefined;
}

function escapeHtml(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function buildStyle(node: DfmNode): string {
  const parts: string[] = [];
  const align = propStr(node, 'Align');

  if (align !== 'alClient' && align !== 'alTop') {
    const left = propNum(node, 'Left');
    const top = propNum(node, 'Top');
    if (left !== undefined) parts.push(`left:${left}px`);
    if (top !== undefined) parts.push(`top:${top}px`);
  }

  const width = propNum(node, 'Width');
  const height = propNum(node, 'Height');
  if (width !== undefined && align !== 'alClient' && align !== 'alTop') parts.push(`width:${width}px`);
  if (height !== undefined) parts.push(`height:${height}px`);

  const minW = propNum(node, 'Constraints.MinWidth');
  const minH = propNum(node, 'Constraints.MinHeight');
  if (minW !== undefined) parts.push(`min-width:${minW}px`);
  if (minH !== undefined) parts.push(`min-height:${minH}px`);

  // Font properties
  const fontName = propStr(node, 'Style.Font.Name');
  const fontHeight = propNum(node, 'Style.Font.Height');
  const fontColor = prop(node, 'Style.Font.Color');
  const fontStyle = propStr(node, 'Style.Font.Style');

  if (fontName) parts.push(`font-family:'${fontName}',sans-serif`);
  if (fontHeight !== undefined) parts.push(`font-size:${Math.abs(fontHeight)}px`);
  if (fontColor !== undefined) parts.push(`color:${delphiColorToCss(fontColor)}`);
  if (fontStyle.includes('fsBold')) parts.push('font-weight:bold');
  if (fontStyle.includes('fsItalic')) parts.push('font-style:italic');

  // Border color
  const borderColor = prop(node, 'Style.BorderColor');
  if (borderColor !== undefined) {
    parts.push(`border-color:${delphiColorToCss(borderColor)}`);
  }

  return parts.join(';');
}

function buildClasses(node: DfmNode, baseClass: string): string {
  const classes = [baseClass];
  const align = propStr(node, 'Align');

  if (align === 'alClient') classes.push('dfm-align-client');
  else if (align === 'alTop') classes.push('dfm-align-top');
  else classes.push('dfm-absolute');

  if (propBool(node, 'Visible') === false) classes.push('dfm-hidden');

  return classes.join(' ');
}

function delphiColorToCss(value: DfmValue): string {
  // Named Delphi colors
  const colorMap: Record<string, string> = {
    clRed: '#ff0000',
    clBlue: '#0000ff',
    clGreen: '#008000',
    clBlack: '#000000',
    clWhite: '#ffffff',
    clYellow: '#ffff00',
    clWindowText: '#000000',
    clWindow: '#ffffff',
    clBtnFace: '#d4d0c8',
    clGray: '#808080',
    clSilver: '#c0c0c0',
    clMaroon: '#800000',
    clNavy: '#000080',
    clOlive: '#808000',
    clPurple: '#800080',
    clTeal: '#008080',
    clAqua: '#00ffff',
    clFuchsia: '#ff00ff',
    clNone: 'transparent',
  };

  if (typeof value === 'string') {
    return colorMap[value] ?? value;
  }

  if (typeof value === 'number') {
    // Delphi stores colors as BGR integers
    const b = (value >> 16) & 0xff;
    const g = (value >> 8) & 0xff;
    const r = value & 0xff;
    return `#${r.toString(16).padStart(2, '0')}${g.toString(16).padStart(2, '0')}${b.toString(16).padStart(2, '0')}`;
  }

  return '#000000';
}

function renderChildren(node: DfmNode): string {
  return node.children.map(renderNode).join('');
}

function getEdgesClass(node: DfmNode): string {
  const edges = propStr(node, 'Style.Edges');
  if (!edges) return '';
  if (edges === '[]') return 'edges-none';
  if (edges === '[bBottom]') return 'edges-bottom';
  if (edges === '[bTop]') return 'edges-top';
  if (edges === '[bLeft]') return 'edges-left';
  if (edges === '[bRight]') return 'edges-right';
  return '';
}

function disabledAttr(node: DfmNode): string {
  if (propBool(node, 'Enabled') === false) return ' disabled';
  if (propBool(node, 'Properties.ReadOnly') === true) return ' readonly';
  return '';
}

// === Container Renderers ===

function renderPageControl(node: DfmNode): string {
  const activePage = propStr(node, 'Properties.ActivePage');
  const tabs = node.children.filter(c => c.type === 'TcxTabSheet');
  const style = buildStyle(node);
  const classes = buildClasses(node, 'dfm-page-control');

  let html = `<div class="${classes}" style="${style}" data-name="${node.name}">`;
  html += `<div class="dfm-tabs" data-pc="${node.name}">`;
  for (const tab of tabs) {
    const caption = propStr(tab, 'Caption') || tab.name;
    const isActive = tab.name === activePage || (!activePage && tab === tabs[0]);
    html += `<div class="dfm-tab${isActive ? ' active' : ''}" data-tab="${tab.name}" data-pc="${node.name}">${escapeHtml(caption)}</div>`;
  }
  html += `</div>`;
  for (const tab of tabs) {
    const isActive = tab.name === activePage || (!activePage && tab === tabs[0]);
    html += `<div class="dfm-tab-panel${isActive ? ' active' : ''}" data-panel="${tab.name}" data-pc="${node.name}" style="position:relative;background:#ece9d8">`;
    html += renderChildren(tab);
    html += `</div>`;
  }
  html += `</div>`;
  return html;
}

function renderTabPanel(node: DfmNode): string {
  // TabSheets are rendered by renderPageControl — this is a fallback
  let html = `<div style="position:relative">`;
  html += renderChildren(node);
  html += `</div>`;
  return html;
}

function renderGroupBox(node: DfmNode): string {
  const classes = buildClasses(node, 'dfm-groupbox');
  const edgesClass = getEdgesClass(node);
  const panelActive = propBool(node, 'PanelStyle.Active') === true ? 'panel-active' : '';
  const borderStyle = propStr(node, 'Style.BorderStyle');
  const borderNone = borderStyle === 'ebsNone' ? 'edges-none' : '';
  const style = buildStyle(node);

  const allClasses = [classes, edgesClass, panelActive, borderNone].filter(Boolean).join(' ');
  let html = `<div class="${allClasses}" style="${style}" data-name="${node.name}">`;
  html += renderChildren(node);
  html += `</div>`;
  return html;
}

function renderScrollBox(node: DfmNode): string {
  const classes = buildClasses(node, 'dfm-scrollbox');
  const style = buildStyle(node);
  let html = `<div class="${classes}" style="${style}" data-name="${node.name}">`;
  html += renderChildren(node);
  html += `</div>`;
  return html;
}

function renderGenericContainer(node: DfmNode): string {
  const style = buildStyle(node);
  const align = propStr(node, 'Align');
  const posClass = align === 'alClient' ? 'dfm-align-client' : align === 'alTop' ? 'dfm-align-top' : 'dfm-absolute';
  const hidden = propBool(node, 'Visible') === false ? ' dfm-hidden' : '';
  let html = `<div class="${posClass}${hidden}" style="position:relative;${style}" data-name="${node.name}">`;
  html += renderChildren(node);
  html += `</div>`;
  return html;
}

// === Input Control Renderers ===

function renderLabel(node: DfmNode): string {
  const classes = buildClasses(node, 'dfm-label');
  const style = buildStyle(node);
  const caption = propStr(node, 'Caption');
  return `<span class="${classes}" style="${style}" data-name="${node.name}">${escapeHtml(caption)}</span>`;
}

function renderTextEdit(node: DfmNode): string {
  const style = buildStyle(node);
  const classes = buildClasses(node, '');
  const width = propNum(node, 'Width');
  const text = propStr(node, 'Text');
  return `<input type="text" class="dfm-input ${classes}" style="${style}${width ? `;width:${width}px` : ''}"${disabledAttr(node)} value="${escapeHtml(text)}" data-name="${node.name}">`;
}

function renderDateEdit(node: DfmNode): string {
  const style = buildStyle(node);
  const classes = buildClasses(node, '');
  const width = propNum(node, 'Width');
  return `<input type="text" class="dfm-input ${classes}" style="${style}${width ? `;width:${width}px` : ''}" placeholder="dd/mm/yyyy"${disabledAttr(node)} data-name="${node.name}">`;
}

function renderSpinEdit(node: DfmNode): string {
  const style = buildStyle(node);
  const classes = buildClasses(node, '');
  const width = propNum(node, 'Width');
  const spinVisible = propBool(node, 'Properties.SpinButtons.Visible');
  const inputType = spinVisible === false ? 'text' : 'number';
  const min = propNum(node, 'Properties.MinValue');
  const max = propNum(node, 'Properties.MaxValue');
  const step = propNum(node, 'Properties.Increment');
  const value = prop(node, 'Value');

  let attrs = '';
  if (inputType === 'number') {
    if (min !== undefined) attrs += ` min="${min}"`;
    if (max !== undefined) attrs += ` max="${max}"`;
    if (step !== undefined) attrs += ` step="${step}"`;
  }
  if (value !== undefined) attrs += ` value="${value}"`;

  return `<input type="${inputType}" class="dfm-input ${classes}" style="${style}${width ? `;width:${width}px` : ''}"${attrs}${disabledAttr(node)} data-name="${node.name}">`;
}

function renderComboBox(node: DfmNode): string {
  const style = buildStyle(node);
  const classes = buildClasses(node, '');
  const width = propNum(node, 'Width');
  const items = prop(node, 'Properties.Items.Strings');
  const text = propStr(node, 'Text');

  let html = `<select class="dfm-select ${classes}" style="${style}${width ? `;width:${width}px` : ''}"${disabledAttr(node)} data-name="${node.name}">`;
  if (Array.isArray(items)) {
    for (const item of items) {
      if (typeof item === 'string') {
        const selected = item === text ? ' selected' : '';
        html += `<option value="${escapeHtml(item)}"${selected}>${escapeHtml(item || '(empty)')}</option>`;
      }
    }
  }
  html += `</select>`;
  return html;
}

function renderCheckBox(node: DfmNode): string {
  const classes = buildClasses(node, 'dfm-checkbox');
  const style = buildStyle(node);
  const caption = propStr(node, 'Caption');
  return `<label class="${classes}" style="${style}" data-name="${node.name}"><input type="checkbox"${disabledAttr(node)}> ${escapeHtml(caption)}</label>`;
}

function renderCheckComboBox(node: DfmNode): string {
  const style = buildStyle(node);
  const classes = buildClasses(node, '');
  const width = propNum(node, 'Width');
  const items = prop(node, 'Properties.Items');

  let html = `<div class="${classes}" style="${style}${width ? `;width:${width}px` : ''};position:relative" data-name="${node.name}">`;
  html += `<div class="dfm-check-combo" data-ccb="${node.name}">Click to select...</div>`;
  html += `<div class="dfm-check-combo-dropdown" data-ccb-dropdown="${node.name}">`;
  if (Array.isArray(items)) {
    for (const item of items) {
      if (typeof item === 'object' && item !== null && 'properties' in item) {
        const dfmItem = item as DfmItem;
        const desc = dfmItem.properties.get('Description') as string ?? '';
        html += `<label><input type="checkbox" value="${escapeHtml(desc)}"> ${escapeHtml(desc)}</label>`;
      }
    }
  }
  html += `</div></div>`;
  return html;
}

function renderMaskEdit(node: DfmNode): string {
  const style = buildStyle(node);
  const classes = buildClasses(node, '');
  const width = propNum(node, 'Width');
  return `<input type="text" class="dfm-input ${classes}" style="${style}${width ? `;width:${width}px` : ''}" placeholder="__/__/____"${disabledAttr(node)} data-name="${node.name}">`;
}

function renderButton(node: DfmNode): string {
  const style = buildStyle(node);
  const width = propNum(node, 'Width');
  const caption = propStr(node, 'Caption');
  const hidden = propBool(node, 'Visible') === false ? ' dfm-hidden' : '';
  return `<button class="dfm-button${hidden}" style="${style}${width ? `;width:${width}px` : ''}" data-name="${node.name}">${escapeHtml(caption)}</button>`;
}

function renderBevel(node: DfmNode): string {
  const left = propNum(node, 'Left') ?? 0;
  const top = propNum(node, 'Top') ?? 0;
  const width = propNum(node, 'Width') ?? 100;
  const height = propNum(node, 'Height') ?? 2;
  return `<div class="dfm-bevel" style="left:${left}px;top:${top}px;width:${width}px;height:${height}px" data-name="${node.name}"></div>`;
}
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run src/__tests__/renderer.test.ts`
Expected: All 9 tests PASS

- [ ] **Step 5: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/renderer.ts Scripts/tools/dfm-viewer/src/__tests__/renderer.test.ts
git commit -m "feat(dfm-viewer): implement renderer with container and input controls"
```

---

### Task 6: Renderer — Input Control Tests

**Files:**
- Modify: `Scripts/tools/dfm-viewer/src/__tests__/renderer.test.ts`

This task adds test coverage for every input control type. The renderer from Task 5 already includes all the implementations — this task validates them.

- [ ] **Step 1: Add input control tests**

Append these tests inside the existing `describe('renderDfm')` block:

```typescript
  it('renders TcxTextEdit with value and disabled state', () => {
    const edit = makeNode({ name: 'edtName', type: 'TcxTextEdit' });
    edit.properties.set('Left', 100);
    edit.properties.set('Top', 20);
    edit.properties.set('Width', 200);
    edit.properties.set('Text', 'Hello');
    edit.properties.set('Enabled', false);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [edit] })]);
    expect(html).toContain('type="text"');
    expect(html).toContain('dfm-input');
    expect(html).toContain('width:200px');
    expect(html).toContain('value="Hello"');
    expect(html).toContain('disabled');
  });

  it('renders TcxDateEdit with placeholder', () => {
    const edit = makeNode({ name: 'deExamDate', type: 'TcxDateEdit' });
    edit.properties.set('Width', 121);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [edit] })]);
    expect(html).toContain('placeholder="dd/mm/yyyy"');
    expect(html).toContain('width:121px');
  });

  it('renders TcxSpinEdit with number type and min/max', () => {
    const spin = makeNode({ name: 'spCRL', type: 'TcxSpinEdit' });
    spin.properties.set('Width', 50);
    spin.properties.set('Properties.MaxValue', 45);
    spin.properties.set('Properties.MinValue', 1);
    spin.properties.set('Properties.Increment', 0.1);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [spin] })]);
    expect(html).toContain('type="number"');
    expect(html).toContain('min="1"');
    expect(html).toContain('max="45"');
    expect(html).toContain('step="0.1"');
  });

  it('renders TcxSpinEdit as text when SpinButtons hidden', () => {
    const spin = makeNode({ name: 'spHidden', type: 'TcxSpinEdit' });
    spin.properties.set('Properties.SpinButtons.Visible', false);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [spin] })]);
    expect(html).toContain('type="text"');
  });

  it('renders TcxComboBox with items', () => {
    const cb = makeNode({ name: 'cbMed', type: 'TcxComboBox' });
    cb.properties.set('Width', 180);
    cb.properties.set('Properties.Items.Strings', ['', 'Aspirin', 'Clomiphene']);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [cb] })]);
    expect(html).toContain('<select');
    expect(html).toContain('dfm-select');
    expect(html).toContain('Aspirin');
    expect(html).toContain('Clomiphene');
  });

  it('renders TcxCheckBox with caption', () => {
    const chk = makeNode({ name: 'chkBreech', type: 'TcxCheckBox' });
    chk.properties.set('Left', 10);
    chk.properties.set('Top', 50);
    chk.properties.set('Caption', 'Breech presentation');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [chk] })]);
    expect(html).toContain('type="checkbox"');
    expect(html).toContain('Breech presentation');
    expect(html).toContain('dfm-checkbox');
  });

  it('renders TcxCheckComboBox with items from angle-bracket collection', () => {
    const ccb = makeNode({ name: 'ccb1', type: 'TcxCheckComboBox' });
    ccb.properties.set('Width', 163);
    const items: DfmItem[] = [
      { properties: new Map([['Description', 'Dating'], ['ShortDescription', 'Dating']]) },
      { properties: new Map([['Description', 'Viability'], ['ShortDescription', 'Viability']]) },
    ];
    ccb.properties.set('Properties.Items', items);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [ccb] })]);
    expect(html).toContain('dfm-check-combo');
    expect(html).toContain('Dating');
    expect(html).toContain('Viability');
    expect(html).toContain('type="checkbox"');
  });

  it('renders TcxButton', () => {
    const btn = makeNode({ name: 'btnCalc', type: 'TcxButton' });
    btn.properties.set('Left', 200);
    btn.properties.set('Top', 100);
    btn.properties.set('Width', 80);
    btn.properties.set('Caption', 'Calculate');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [btn] })]);
    expect(html).toContain('<button');
    expect(html).toContain('dfm-button');
    expect(html).toContain('Calculate');
  });

  it('renders TBevel as a horizontal line', () => {
    const bevel = makeNode({ name: 'bevel1', type: 'TBevel' });
    bevel.properties.set('Left', 0);
    bevel.properties.set('Top', 50);
    bevel.properties.set('Width', 400);
    bevel.properties.set('Height', 2);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [bevel] })]);
    expect(html).toContain('dfm-bevel');
    expect(html).toContain('width:400px');
  });

  it('renders font styling on labels', () => {
    const lbl = makeNode({ name: 'lbl1', type: 'TcxLabel' });
    lbl.properties.set('Caption', 'Bold Label');
    lbl.properties.set('Style.Font.Name', 'Tahoma');
    lbl.properties.set('Style.Font.Height', -11);
    lbl.properties.set('Style.Font.Color', 'clWindowText');
    lbl.properties.set('Style.Font.Style', '[fsBold]');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [lbl] })]);
    expect(html).toContain("font-family:'Tahoma'");
    expect(html).toContain('font-size:11px');
    expect(html).toContain('font-weight:bold');
    expect(html).toContain('color:#000000');
  });

  it('renders border color from Delphi named color', () => {
    const ccb = makeNode({ name: 'ccb1', type: 'TcxCheckComboBox' });
    ccb.properties.set('Style.BorderColor', 'clRed');
    ccb.properties.set('Properties.Items', []);
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [ccb] })]);
    expect(html).toContain('border-color:#ff0000');
  });
```

Add this import at the top of the test file (if not already there):

```typescript
import type { DfmItem } from '../types.js';
```

- [ ] **Step 2: Run tests to verify they pass**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run src/__tests__/renderer.test.ts`
Expected: All 20 tests PASS

- [ ] **Step 3: If any tests fail, fix and re-run**

- [ ] **Step 4: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/__tests__/renderer.test.ts
git commit -m "test(dfm-viewer): add input control and styling renderer tests"
```

---

### Task 7: Client-Side JavaScript

**Files:**
- Create: `Scripts/tools/dfm-viewer/src/client.ts`

This module exports a JS string that runs in the browser. It handles tab switching, check combo box dropdowns, WebSocket hot reload, and state preservation via sessionStorage.

- [ ] **Step 1: Create client.ts**

```typescript
export const clientScript = `
(function() {
  // === Tab Switching ===
  document.addEventListener('click', function(e) {
    var tab = e.target.closest('.dfm-tab');
    if (!tab) return;
    var pc = tab.dataset.pc;
    var tabName = tab.dataset.tab;
    // Deactivate all tabs in this page control
    document.querySelectorAll('.dfm-tab[data-pc="' + pc + '"]').forEach(function(t) {
      t.classList.remove('active');
    });
    document.querySelectorAll('.dfm-tab-panel[data-pc="' + pc + '"]').forEach(function(p) {
      p.classList.remove('active');
    });
    // Activate clicked tab
    tab.classList.add('active');
    var panel = document.querySelector('.dfm-tab-panel[data-panel="' + tabName + '"][data-pc="' + pc + '"]');
    if (panel) panel.classList.add('active');
    // Save tab state
    sessionStorage.setItem('dfm-tab:' + pc, tabName);
  });

  // === Check Combo Box ===
  document.addEventListener('click', function(e) {
    var ccb = e.target.closest('.dfm-check-combo');
    if (!ccb) return;
    var name = ccb.dataset.ccb;
    var dropdown = document.querySelector('[data-ccb-dropdown="' + name + '"]');
    if (dropdown) {
      dropdown.classList.toggle('open');
    }
  });

  // Close check combo dropdowns when clicking outside
  document.addEventListener('click', function(e) {
    if (!e.target.closest('.dfm-check-combo') && !e.target.closest('.dfm-check-combo-dropdown')) {
      document.querySelectorAll('.dfm-check-combo-dropdown.open').forEach(function(d) {
        d.classList.remove('open');
      });
    }
  });

  // Update check combo display text when checkboxes change
  document.addEventListener('change', function(e) {
    var checkbox = e.target;
    if (!checkbox.closest('.dfm-check-combo-dropdown')) return;
    var dropdown = checkbox.closest('.dfm-check-combo-dropdown');
    var name = dropdown.dataset.ccbDropdown;
    var display = document.querySelector('.dfm-check-combo[data-ccb="' + name + '"]');
    if (!display) return;
    var checked = dropdown.querySelectorAll('input:checked');
    if (checked.length === 0) {
      display.textContent = 'Click to select...';
    } else {
      var texts = [];
      checked.forEach(function(cb) { texts.push(cb.value); });
      display.textContent = texts.join(', ');
    }
    // Save state
    var state = [];
    dropdown.querySelectorAll('input[type="checkbox"]').forEach(function(cb) {
      state.push(cb.checked ? '1' : '0');
    });
    sessionStorage.setItem('dfm-state:' + name, state.join(','));
  });

  // === State Preservation ===

  // Save input values on change
  document.addEventListener('input', function(e) {
    var el = e.target;
    var name = el.dataset && el.dataset.name;
    if (!name) return;
    if (el.tagName === 'INPUT' || el.tagName === 'SELECT') {
      sessionStorage.setItem('dfm-state:' + name, el.value);
    }
  });
  document.addEventListener('change', function(e) {
    var el = e.target;
    var name = el.dataset && el.dataset.name;
    if (!name) return;
    if (el.tagName === 'SELECT') {
      sessionStorage.setItem('dfm-state:' + name, el.value);
    }
    if (el.type === 'checkbox' && el.closest('.dfm-checkbox')) {
      sessionStorage.setItem('dfm-state:' + name, el.checked ? '1' : '0');
    }
  });

  // Restore state on load
  function restoreState() {
    // Restore tab states
    document.querySelectorAll('.dfm-tabs').forEach(function(tabBar) {
      var pc = tabBar.dataset.pc;
      var saved = sessionStorage.getItem('dfm-tab:' + pc);
      if (!saved) return;
      tabBar.querySelectorAll('.dfm-tab').forEach(function(t) { t.classList.remove('active'); });
      var target = tabBar.querySelector('.dfm-tab[data-tab="' + saved + '"]');
      if (target) target.classList.add('active');
      var parent = tabBar.parentElement;
      if (parent) {
        parent.querySelectorAll(':scope > .dfm-tab-panel').forEach(function(p) { p.classList.remove('active'); });
        var panel = parent.querySelector('.dfm-tab-panel[data-panel="' + saved + '"]');
        if (panel) panel.classList.add('active');
      }
    });

    // Restore input values
    document.querySelectorAll('[data-name]').forEach(function(el) {
      var name = el.dataset.name;
      var saved = sessionStorage.getItem('dfm-state:' + name);
      if (saved === null) return;
      if (el.tagName === 'INPUT' && el.type !== 'checkbox') {
        el.value = saved;
      } else if (el.tagName === 'SELECT') {
        el.value = saved;
      } else if (el.type === 'checkbox' && el.closest('.dfm-checkbox')) {
        el.querySelector('input').checked = saved === '1';
      }
    });

    // Restore check combo states
    document.querySelectorAll('.dfm-check-combo-dropdown').forEach(function(dropdown) {
      var name = dropdown.dataset.ccbDropdown;
      var saved = sessionStorage.getItem('dfm-state:' + name);
      if (!saved) return;
      var states = saved.split(',');
      var checkboxes = dropdown.querySelectorAll('input[type="checkbox"]');
      states.forEach(function(s, i) {
        if (checkboxes[i]) checkboxes[i].checked = s === '1';
      });
      // Update display
      var display = document.querySelector('.dfm-check-combo[data-ccb="' + name + '"]');
      if (!display) return;
      var checked = dropdown.querySelectorAll('input:checked');
      if (checked.length === 0) {
        display.textContent = 'Click to select...';
      } else {
        var texts = [];
        checked.forEach(function(cb) { texts.push(cb.value); });
        display.textContent = texts.join(', ');
      }
    });
  }

  restoreState();

  // === WebSocket Hot Reload ===
  var protocol = location.protocol === 'https:' ? 'wss:' : 'ws:';
  var ws = new WebSocket(protocol + '//' + location.host + '/ws');
  ws.onmessage = function(event) {
    var msg = JSON.parse(event.data);
    if (msg.type === 'reload') {
      location.reload();
    }
  };
  ws.onclose = function() {
    // Reconnect after 2 seconds
    setTimeout(function() {
      location.reload();
    }, 2000);
  };
})();
`;
```

- [ ] **Step 2: Verify it compiles**

Run: `cd Scripts/tools/dfm-viewer && npx tsc --noEmit`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/client.ts
git commit -m "feat(dfm-viewer): add client-side JS for tabs, state, and hot reload"
```

---

### Task 8: Server

**Files:**
- Create: `Scripts/tools/dfm-viewer/src/server.ts`

- [ ] **Step 1: Create the server entry point**

```typescript
import express from 'express';
import { createServer } from 'http';
import { WebSocketServer } from 'ws';
import { watch } from 'chokidar';
import { readFileSync, statSync, existsSync } from 'fs';
import { resolve, basename, join } from 'path';
import { parseDfm } from './parser.js';
import { renderDfm } from './renderer.js';
import { formStyles } from './styles.js';
import { clientScript } from './client.js';

function buildPage(dfmPath: string): string {
  const dfmText = readFileSync(dfmPath, 'utf-8');
  const ast = parseDfm(dfmText);
  const formHtml = renderDfm(ast);
  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DFM Viewer — ${basename(dfmPath)}</title>
<style>${formStyles}</style>
</head>
<body>
${formHtml}
<script>${clientScript}</script>
</body>
</html>`;
}

function main() {
  const args = process.argv.slice(2);
  let port = 3000;
  let dfmPath: string | undefined;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--port' && args[i + 1]) {
      port = parseInt(args[i + 1], 10);
      i++;
    } else if (!args[i].startsWith('-')) {
      dfmPath = resolve(args[i]);
    }
  }

  if (!dfmPath) {
    console.error('Usage: dfm-viewer [--port PORT] <path-to-dfm-file-or-directory>');
    process.exit(1);
  }

  // If path is a directory, look for screen.dfm
  if (existsSync(dfmPath) && statSync(dfmPath).isDirectory()) {
    const candidate = join(dfmPath, 'screen.dfm');
    if (existsSync(candidate)) {
      dfmPath = candidate;
    } else {
      console.error(`No screen.dfm found in ${dfmPath}`);
      process.exit(1);
    }
  }

  if (!existsSync(dfmPath)) {
    console.error(`File not found: ${dfmPath}`);
    process.exit(1);
  }

  const app = express();
  const server = createServer(app);
  const wss = new WebSocketServer({ server, path: '/ws' });

  let cachedPage = buildPage(dfmPath);

  app.get('/', (_req, res) => {
    res.type('html').send(cachedPage);
  });

  // Watch the DFM file for changes
  const watcher = watch(dfmPath, { ignoreInitial: true });
  watcher.on('change', () => {
    try {
      cachedPage = buildPage(dfmPath!);
      console.log(`Reloaded ${basename(dfmPath!)}`);
      wss.clients.forEach(client => {
        if (client.readyState === 1) {
          client.send(JSON.stringify({ type: 'reload' }));
        }
      });
    } catch (err) {
      console.error('Error rebuilding:', err);
    }
  });

  // Try the requested port, fall back to next available
  server.on('error', (err: NodeJS.ErrnoException) => {
    if (err.code === 'EADDRINUSE') {
      console.log(`Port ${port} in use, trying ${port + 1}...`);
      port++;
      server.listen(port);
    }
  });

  server.listen(port, () => {
    console.log(`Serving ${basename(dfmPath!)} at http://localhost:${port}`);
    console.log('Watching for changes...');
  });

  // Graceful shutdown
  process.on('SIGINT', () => {
    watcher.close();
    wss.close();
    server.close();
    process.exit(0);
  });
}

main();
```

- [ ] **Step 2: Verify it compiles**

Run: `cd Scripts/tools/dfm-viewer && npx tsc --noEmit`
Expected: No errors

- [ ] **Step 3: Manual smoke test with a real DFM file**

Run: `cd Scripts/tools/dfm-viewer && npx tsx src/server.ts ../../earlyT1Singleton/screen.dfm`
Expected: Prints `Serving screen.dfm at http://localhost:3000` and `Watching for changes...`

Open `http://localhost:3000` in a browser. You should see a rendered form with the Windows Classic styling, clickable tabs, and form controls. Press Ctrl+C to stop.

- [ ] **Step 4: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/server.ts
git commit -m "feat(dfm-viewer): add Express server with hot reload"
```

---

### Task 9: Integration Test

**Files:**
- Create: `Scripts/tools/dfm-viewer/src/__tests__/integration.test.ts`

- [ ] **Step 1: Write integration test that parses and renders a real DFM**

```typescript
import { describe, it, expect } from 'vitest';
import { readFileSync } from 'fs';
import { resolve } from 'path';
import { parseDfm } from '../parser.js';
import { renderDfm } from '../renderer.js';

describe('integration', () => {
  it('parses and renders earlyT1Singleton/screen.dfm without errors', () => {
    const dfmPath = resolve(import.meta.dirname, '../../../../earlyT1Singleton/screen.dfm');
    const dfmText = readFileSync(dfmPath, 'utf-8');
    const ast = parseDfm(dfmText);

    // Should have one root node
    expect(ast).toHaveLength(1);
    expect(ast[0].name).toBe('Early_Pregnancy');
    expect(ast[0].type).toBe('TEarly_Pregnancy');

    // Should have children (the page control and its tabs)
    expect(ast[0].children.length).toBeGreaterThan(0);

    // Render should produce HTML without throwing
    const html = renderDfm(ast);

    // Should contain known control names from this DFM
    expect(html).toContain('deExamDate');
    expect(html).toContain('edtPresentComplaintOther');
    expect(html).toContain('cbClinicalHistory');
    expect(html).toContain('cxccbReferralIndicators');
    expect(html).toContain('edtG');
    expect(html).toContain('cbNaturalMedication');
    expect(html).toContain('pcReportBody');

    // Should contain tab captions
    expect(html).toContain('Details');
    expect(html).toContain('Pregnancy Type');

    // Should contain CSS classes
    expect(html).toContain('dfm-form');
    expect(html).toContain('dfm-tabs');
    expect(html).toContain('dfm-input');
    expect(html).toContain('dfm-select');
  });

  it('parses and renders gynae/screen.dfm without errors', () => {
    const dfmPath = resolve(import.meta.dirname, '../../../../gynae/screen.dfm');
    const dfmText = readFileSync(dfmPath, 'utf-8');
    const ast = parseDfm(dfmText);

    expect(ast).toHaveLength(1);
    expect(ast[0].name).toBe('Gynae');

    const html = renderDfm(ast);
    expect(html).toContain('dfm-form');
    expect(html).toContain('Gynae');
    // gynae has combo boxes with items
    expect(html).toContain('Oral contraceptive pill');
  });
});
```

- [ ] **Step 2: Run the full test suite**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run`
Expected: All tests PASS (parser unit tests + renderer unit tests + integration tests)

- [ ] **Step 3: If any tests fail, fix and re-run**

The most likely failure is a DFM parsing edge case not covered by unit tests. Read the error, check the DFM line that fails, and fix the parser.

- [ ] **Step 4: Commit**

```bash
git add Scripts/tools/dfm-viewer/src/__tests__/integration.test.ts
git commit -m "test(dfm-viewer): add integration tests against real DFM files"
```

---

### Task 10: Final Polish and Verification

**Files:**
- (no new files — verification and manual testing)

- [ ] **Step 1: Run the complete test suite**

Run: `cd Scripts/tools/dfm-viewer && npx vitest run`
Expected: All tests PASS

- [ ] **Step 2: Manual test with earlyT1Singleton**

Run: `cd Scripts/tools/dfm-viewer && npx tsx src/server.ts ../../earlyT1Singleton/screen.dfm`

Verify in browser:
1. Form renders with Windows Classic styling (beige background, blue title bar)
2. Tabs are clickable and switch content panels
3. Controls are positioned correctly (labels next to their inputs)
4. Combo boxes show dropdown items from the DFM
5. Check combo boxes open a dropdown with checkboxes
6. Type a value in a text field, switch tabs, confirm tab state persists

- [ ] **Step 3: Manual test with gynae (largest DFM)**

Run: `cd Scripts/tools/dfm-viewer && npx tsx src/server.ts ../../gynae/screen.dfm`

Verify: renders without errors, tabs work, form is scrollable.

- [ ] **Step 4: Test hot reload**

With the server running on a DFM file, open the DFM in an editor, change a label's Caption, and save. The browser should auto-refresh and show the new caption. Verify that any tab state and input values you'd set are preserved.

- [ ] **Step 5: Test directory mode**

Run: `cd Scripts/tools/dfm-viewer && npx tsx src/server.ts ../../earlyT1Singleton/`
Expected: Automatically finds and serves `screen.dfm`

- [ ] **Step 6: Commit any final fixes**

```bash
git add -A Scripts/tools/dfm-viewer/
git commit -m "feat(dfm-viewer): complete DFM viewer with all control types and hot reload"
```
