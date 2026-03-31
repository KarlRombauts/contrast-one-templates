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
