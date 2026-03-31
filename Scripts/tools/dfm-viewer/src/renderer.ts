import type { DfmNode, DfmValue, DfmItem } from './types.js';

// ─── Color conversion ─────────────────────────────────────────────────────────

const NAMED_COLORS: Record<string, string> = {
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

/**
 * Convert a Delphi color value (named identifier or integer BGR) to a CSS color string.
 * Delphi integer colors encode as 0x00BBGGRR.
 */
export function delphiColorToCss(value: DfmValue): string {
  if (typeof value === 'string') {
    const named = NAMED_COLORS[value];
    if (named) return named;
    // Integer-as-string
    const n = parseInt(value, 10);
    if (!isNaN(n)) return bgrToCss(n);
    return value;
  }
  if (typeof value === 'number') {
    return bgrToCss(value);
  }
  return '';
}

function bgrToCss(n: number): string {
  // Delphi BGR: low byte = R, middle byte = G, high byte = B
  const r = n & 0xff;
  const g = (n >> 8) & 0xff;
  const b = (n >> 16) & 0xff;
  return `#${hex(r)}${hex(g)}${hex(b)}`;
}

function hex(n: number): string {
  return n.toString(16).padStart(2, '0');
}

// ─── HTML helpers ─────────────────────────────────────────────────────────────

function esc(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

function prop(node: DfmNode, key: string): DfmValue | undefined {
  return node.properties.get(key);
}

function strProp(node: DfmNode, key: string): string {
  const v = prop(node, key);
  if (v === undefined || v === null) return '';
  return String(v);
}

function numProp(node: DfmNode, key: string): number | undefined {
  const v = prop(node, key);
  if (typeof v === 'number') return v;
  if (typeof v === 'string') {
    const n = parseFloat(v);
    if (!isNaN(n)) return n;
  }
  return undefined;
}

function boolProp(node: DfmNode, key: string): boolean | undefined {
  const v = prop(node, key);
  if (typeof v === 'boolean') return v;
  if (v === 'True') return true;
  if (v === 'False') return false;
  return undefined;
}

// ─── Layout helpers ───────────────────────────────────────────────────────────

interface LayoutResult {
  classes: string[];
  inlineStyles: string[];
  attrs: string[];
}

/**
 * Compute layout classes and inline CSS for a node.
 * Handles Align, Left/Top, Width/Height, Visible, Enabled.
 */
function computeLayout(node: DfmNode): LayoutResult {
  const classes: string[] = [];
  const inlineStyles: string[] = [];
  const attrs: string[] = [];

  const align = strProp(node, 'Align');
  const left = numProp(node, 'Left');
  const top = numProp(node, 'Top');
  const width = numProp(node, 'Width');
  const height = numProp(node, 'Height');
  const visible = boolProp(node, 'Visible');
  const enabled = boolProp(node, 'Enabled');

  if (align === 'alClient') {
    classes.push('dfm-align-client');
    if (height !== undefined) inlineStyles.push(`height:${height}px`);
  } else if (align === 'alTop') {
    classes.push('dfm-align-top');
    if (height !== undefined) inlineStyles.push(`height:${height}px`);
  } else if (align === 'alBottom') {
    classes.push('dfm-align-bottom');
    if (height !== undefined) inlineStyles.push(`height:${height}px`);
  } else if (align === 'alLeft') {
    classes.push('dfm-align-left');
    if (width !== undefined) inlineStyles.push(`width:${width}px`);
  } else if (align === 'alRight') {
    classes.push('dfm-align-right');
    if (width !== undefined) inlineStyles.push(`width:${width}px`);
  } else {
    // Absolute positioning
    if (left !== undefined || top !== undefined) {
      classes.push('dfm-absolute');
      if (left !== undefined) inlineStyles.push(`left:${left}px`);
      if (top !== undefined) inlineStyles.push(`top:${top}px`);
    }
    if (width !== undefined) inlineStyles.push(`width:${width}px`);
    if (height !== undefined) inlineStyles.push(`height:${height}px`);
  }

  // Constraints
  const minW = numProp(node, 'Constraints.MinWidth');
  const minH = numProp(node, 'Constraints.MinHeight');
  if (minW !== undefined) inlineStyles.push(`min-width:${minW}px`);
  if (minH !== undefined) inlineStyles.push(`min-height:${minH}px`);

  if (visible === false) {
    classes.push('dfm-hidden');
  }

  if (enabled === false) {
    attrs.push('disabled');
  }

  return { classes, inlineStyles, attrs };
}

/**
 * Build font-related CSS from Style.Font.* properties.
 */
function computeFontStyles(node: DfmNode): string[] {
  const styles: string[] = [];

  const fontName = strProp(node, 'Style.Font.Name');
  if (fontName) styles.push(`font-family:${esc(fontName)}`);

  const fontHeight = numProp(node, 'Style.Font.Height');
  if (fontHeight !== undefined) {
    styles.push(`font-size:${Math.abs(fontHeight)}px`);
  }

  const fontColor = prop(node, 'Style.Font.Color');
  if (fontColor !== undefined) {
    const css = delphiColorToCss(fontColor);
    if (css) styles.push(`color:${css}`);
  }

  const fontStyle = strProp(node, 'Style.Font.Style');
  if (fontStyle) {
    if (fontStyle.includes('fsBold')) styles.push('font-weight:bold');
    if (fontStyle.includes('fsItalic')) styles.push('font-style:italic');
    if (fontStyle.includes('fsUnderline')) styles.push('text-decoration:underline');
  }

  const borderColor = prop(node, 'Style.BorderColor');
  if (borderColor !== undefined) {
    const css = delphiColorToCss(borderColor);
    if (css) styles.push(`border-color:${css}`);
  }

  return styles;
}

/**
 * Build class and style attribute strings from arrays.
 */
function buildAttrs(
  classes: string[],
  inlineStyles: string[],
  extraAttrs: string[],
  dataName: string,
): string {
  let result = `data-name="${esc(dataName)}"`;
  if (classes.length > 0) result += ` class="${classes.join(' ')}"`;
  if (inlineStyles.length > 0) result += ` style="${inlineStyles.join(';')}"`;
  if (extraAttrs.length > 0) result += ' ' + extraAttrs.join(' ');
  return result;
}

// ─── Control renderers ────────────────────────────────────────────────────────

function renderChildren(children: DfmNode[]): string {
  return children.map(renderControl).join('\n');
}

function renderControl(node: DfmNode): string {
  const type = node.type;

  // Container controls
  if (type === 'TcxPageControl') return renderPageControl(node);
  if (type === 'TcxTabSheet') return renderTabSheet(node); // fallback if standalone
  if (type === 'TcxGroupBox') return renderGroupBox(node);
  if (type === 'TScrollBox' || type === 'TcxScrollBox') return renderScrollBox(node);

  // Input controls
  if (type === 'TcxLabel') return renderLabel(node);
  if (type === 'TcxTextEdit') return renderTextEdit(node);
  if (type === 'TcxDateEdit') return renderDateEdit(node);
  if (type === 'TcxSpinEdit') return renderSpinEdit(node);
  if (type === 'TcxComboBox') return renderComboBox(node);
  if (type === 'TcxCheckBox') return renderCheckBox(node);
  if (type === 'TcxCheckComboBox') return renderCheckComboBox(node);
  if (type === 'TcxMaskEdit') return renderMaskEdit(node);
  if (type === 'TcxButton') return renderButton(node);
  if (type === 'TBevel') return renderBevel(node);

  // Skip TcxTabSheet children rendered inside TcxPageControl
  // but handle generic containers / unknown types
  return renderGeneric(node);
}

// ─── TcxPageControl ───────────────────────────────────────────────────────────

function renderPageControl(node: DfmNode): string {
  const { classes, inlineStyles } = computeLayout(node);

  const activePage = strProp(node, 'Properties.ActivePage');
  const tabs = node.children.filter((c) => c.type === 'TcxTabSheet');

  // Determine which tab is active (first tab wins if not specified)
  const activeTabName = activePage || (tabs[0]?.name ?? '');

  // Tab bar
  const tabBarItems = tabs
    .map((tab) => {
      const caption = strProp(tab, 'Caption') || tab.name;
      const isActive = tab.name === activeTabName;
      const tabClass = isActive ? 'dfm-tab active' : 'dfm-tab';
      return `<div class="${tabClass}" data-tab="${esc(tab.name)}" data-pc="${esc(node.name)}">${esc(caption)}</div>`;
    })
    .join('\n');

  // Tab panels
  const tabPanels = tabs
    .map((tab) => {
      const isActive = tab.name === activeTabName;
      const panelClass = isActive ? 'dfm-tab-panel active' : 'dfm-tab-panel';
      const panelContent = renderChildren(tab.children);
      return `<div class="${panelClass}" data-panel="${esc(tab.name)}" data-pc="${esc(node.name)}">\n${panelContent}\n</div>`;
    })
    .join('\n');

  const pcClasses = ['dfm-page-control', ...classes];
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const classAttr = ` class="${pcClasses.join(' ')}"`;

  return `<div${classAttr}${styleAttr} data-name="${esc(node.name)}">
<div class="dfm-tabs" data-pc="${esc(node.name)}">
${tabBarItems}
</div>
${tabPanels}
</div>`;
}

// ─── TcxTabSheet (standalone fallback) ───────────────────────────────────────

function renderTabSheet(node: DfmNode): string {
  const { classes, inlineStyles } = computeLayout(node);
  const allClasses = ['dfm-tab-panel', 'active', ...classes];
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  return `<div class="${allClasses.join(' ')}"${styleAttr} data-panel="${esc(node.name)}" data-name="${esc(node.name)}">
${renderChildren(node.children)}
</div>`;
}

// ─── TcxGroupBox ──────────────────────────────────────────────────────────────

function renderGroupBox(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const fontStyles = computeFontStyles(node);
  const allStyles = [...inlineStyles, ...fontStyles];

  const groupClasses = ['dfm-groupbox'];

  // Style.Edges
  const edges = strProp(node, 'Style.Edges');
  if (edges) {
    if (edges === '[]') {
      groupClasses.push('edges-none');
    } else if (edges.includes('bBottom') && edges.includes('bTop') && edges.includes('bLeft') && edges.includes('bRight')) {
      // all edges = default border, no class needed
    } else if (edges.includes('bBottom')) {
      groupClasses.push('edges-bottom');
    } else if (edges.includes('bTop')) {
      groupClasses.push('edges-top');
    } else if (edges.includes('bLeft')) {
      groupClasses.push('edges-left');
    } else if (edges.includes('bRight')) {
      groupClasses.push('edges-right');
    }
  }

  // Style.BorderStyle
  const borderStyle = strProp(node, 'Style.BorderStyle');
  if (borderStyle === 'ebsNone') {
    if (!groupClasses.includes('edges-none')) groupClasses.push('edges-none');
  }

  // PanelStyle.Active
  const panelActive = boolProp(node, 'PanelStyle.Active');
  if (panelActive === true) {
    groupClasses.push('panel-active');
  }

  groupClasses.push(...classes);

  const styleAttr = allStyles.length > 0 ? ` style="${allStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<div class="${groupClasses.join(' ')}" data-name="${esc(node.name)}"${styleAttr}${attrsStr}>
${renderChildren(node.children)}
</div>`;
}

// ─── TScrollBox / TcxScrollBox ────────────────────────────────────────────────

function renderScrollBox(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-scrollbox', ...classes];
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<div class="${allClasses.join(' ')}" data-name="${esc(node.name)}"${styleAttr}${attrsStr}>
${renderChildren(node.children)}
</div>`;
}

// ─── TcxLabel ─────────────────────────────────────────────────────────────────

function renderLabel(node: DfmNode): string {
  const { classes, inlineStyles } = computeLayout(node);
  const fontStyles = computeFontStyles(node);
  const allStyles = [...inlineStyles, ...fontStyles];
  const allClasses = ['dfm-label', ...classes];
  const caption = strProp(node, 'Caption');
  const styleAttr = allStyles.length > 0 ? ` style="${allStyles.join(';')}"` : '';

  return `<span class="${allClasses.join(' ')}" data-name="${esc(node.name)}"${styleAttr}>${esc(caption)}</span>`;
}

// ─── TcxTextEdit ──────────────────────────────────────────────────────────────

function renderTextEdit(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-input', ...classes];
  const text = strProp(node, 'Text');
  const readonly = boolProp(node, 'Properties.ReadOnly');
  if (readonly === true) attrs.push('readonly');
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<input type="text" class="${allClasses.join(' ')}" data-name="${esc(node.name)}" value="${esc(text)}"${styleAttr}${attrsStr}>`;
}

// ─── TcxDateEdit ──────────────────────────────────────────────────────────────

function renderDateEdit(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-input', ...classes];
  const text = strProp(node, 'Text');
  const readonly = boolProp(node, 'Properties.ReadOnly');
  if (readonly === true) attrs.push('readonly');
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<input type="text" class="${allClasses.join(' ')}" data-name="${esc(node.name)}" placeholder="dd/mm/yyyy" value="${esc(text)}"${styleAttr}${attrsStr}>`;
}

// ─── TcxSpinEdit ──────────────────────────────────────────────────────────────

function renderSpinEdit(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-input', ...classes];
  const text = strProp(node, 'Text');
  const readonly = boolProp(node, 'Properties.ReadOnly');
  if (readonly === true) attrs.push('readonly');

  const spinVisible = boolProp(node, 'Properties.SpinButtons.Visible');
  const inputType = spinVisible === false ? 'text' : 'number';

  const minVal = numProp(node, 'Properties.MinValue');
  const maxVal = numProp(node, 'Properties.MaxValue');
  const increment = numProp(node, 'Properties.Increment');

  if (minVal !== undefined) attrs.push(`min="${minVal}"`);
  if (maxVal !== undefined) attrs.push(`max="${maxVal}"`);
  if (increment !== undefined) attrs.push(`step="${increment}"`);

  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<input type="${inputType}" class="${allClasses.join(' ')}" data-name="${esc(node.name)}" value="${esc(text)}"${styleAttr}${attrsStr}>`;
}

// ─── TcxComboBox ──────────────────────────────────────────────────────────────

function renderComboBox(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-select', ...classes];
  const readonly = boolProp(node, 'Properties.ReadOnly');
  if (readonly === true) attrs.push('disabled');

  const items = prop(node, 'Properties.Items.Strings');
  let options = '';
  if (Array.isArray(items)) {
    options = (items as DfmValue[])
      .map((item) => `<option>${esc(String(item))}</option>`)
      .join('');
  }

  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<select class="${allClasses.join(' ')}" data-name="${esc(node.name)}"${styleAttr}${attrsStr}>${options}</select>`;
}

// ─── TcxCheckBox ──────────────────────────────────────────────────────────────

function renderCheckBox(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-checkbox', ...classes];
  const caption = strProp(node, 'Caption');
  const checked = boolProp(node, 'State') === true ? ' checked' : '';

  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<label class="${allClasses.join(' ')}" data-name="${esc(node.name)}"${styleAttr}${attrsStr}><input type="checkbox"${checked}>${esc(caption)}</label>`;
}

// ─── TcxCheckComboBox ─────────────────────────────────────────────────────────

function renderCheckComboBox(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const wrapClasses = [...classes];
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  const items = prop(node, 'Properties.Items');
  let dropdownItems = '';
  if (Array.isArray(items)) {
    dropdownItems = (items as DfmItem[])
      .map((item) => {
        const desc = item.properties.get('Description');
        const label = desc !== undefined ? String(desc) : '';
        return `<label><input type="checkbox">${esc(label)}</label>`;
      })
      .join('');
  }

  const wrapStyle = wrapClasses.length > 0 ? ` class="${wrapClasses.join(' ')}"` : '';
  const allStyles = ['position:relative', ...inlineStyles];
  const styleAttr = ` style="${allStyles.join(';')}"`;

  return `<div data-name="${esc(node.name)}"${wrapStyle}${styleAttr}${attrsStr}>
<div class="dfm-check-combo">(Select...)</div>
<div class="dfm-check-combo-dropdown">${dropdownItems}</div>
</div>`;
}

// ─── TcxMaskEdit ──────────────────────────────────────────────────────────────

function renderMaskEdit(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-input', ...classes];
  const text = strProp(node, 'Text');
  const mask = strProp(node, 'Properties.EditMask');
  const readonly = boolProp(node, 'Properties.ReadOnly');
  if (readonly === true) attrs.push('readonly');

  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';
  const placeholderAttr = mask ? ` placeholder="${esc(mask)}"` : '';

  return `<input type="text" class="${allClasses.join(' ')}" data-name="${esc(node.name)}" value="${esc(text)}"${placeholderAttr}${styleAttr}${attrsStr}>`;
}

// ─── TcxButton ────────────────────────────────────────────────────────────────

function renderButton(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const allClasses = ['dfm-button', ...classes];
  const caption = strProp(node, 'Caption');
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<button class="${allClasses.join(' ')}" data-name="${esc(node.name)}"${styleAttr}${attrsStr}>${esc(caption)}</button>`;
}

// ─── TBevel ───────────────────────────────────────────────────────────────────

function renderBevel(node: DfmNode): string {
  const { classes, inlineStyles } = computeLayout(node);
  const allClasses = ['dfm-bevel', ...classes];
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';

  return `<div class="${allClasses.join(' ')}" data-name="${esc(node.name)}"${styleAttr}></div>`;
}

// ─── Generic / unknown control ────────────────────────────────────────────────

function renderGeneric(node: DfmNode): string {
  const { classes, inlineStyles, attrs } = computeLayout(node);
  const styleAttr = inlineStyles.length > 0 ? ` style="${inlineStyles.join(';')}"` : '';
  const classAttr = classes.length > 0 ? ` class="${classes.join(' ')}"` : '';
  const attrsStr = attrs.length > 0 ? ' ' + attrs.join(' ') : '';

  return `<div data-name="${esc(node.name)}" data-type="${esc(node.type)}"${classAttr}${styleAttr}${attrsStr}>
${renderChildren(node.children)}
</div>`;
}

// ─── Root form renderer ───────────────────────────────────────────────────────

function renderRootNode(root: DfmNode): string {
  const width = numProp(root, 'Width');
  const height = numProp(root, 'Height');
  const formStyles: string[] = [];
  if (width !== undefined) formStyles.push(`width:${width}px`);
  if (height !== undefined) formStyles.push(`height:${height}px`);

  const styleAttr = formStyles.length > 0 ? ` style="${formStyles.join(';')}"` : '';

  const titlebar = `<div class="dfm-titlebar">${esc(root.name)}</div>`;
  const body = renderChildren(root.children);

  return `<div class="dfm-form"${styleAttr} data-name="${esc(root.name)}">
${titlebar}
<div class="dfm-form-body" style="position:relative">
${body}
</div>
</div>`;
}

// ─── Public API ───────────────────────────────────────────────────────────────

/**
 * Render an array of DFM root nodes to an HTML string.
 */
export function renderDfm(roots: DfmNode[]): string {
  return roots.map(renderRootNode).join('\n');
}
