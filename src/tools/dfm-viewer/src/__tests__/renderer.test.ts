import { describe, it, expect } from 'vitest';
import { renderDfm } from '../renderer.js';
import type { DfmNode, DfmItem } from '../types.js';

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
    expect(html).toContain('font-family:Tahoma');
    expect(html).toContain('font-size:11px');
    expect(html).toContain('font-weight:bold');
    expect(html).toContain('color:#000000');
  });

  it('renders border color from Delphi named color', () => {
    const grp = makeNode({ name: 'grp1', type: 'TcxGroupBox' });
    grp.properties.set('Style.BorderColor', 'clRed');
    const html = renderDfm([makeNode({ name: 'root', type: 'TForm', children: [grp] })]);
    expect(html).toContain('border-color:#ff0000');
  });
});
