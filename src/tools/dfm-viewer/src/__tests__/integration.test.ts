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
