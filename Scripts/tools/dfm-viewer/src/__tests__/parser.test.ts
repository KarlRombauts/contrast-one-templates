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
