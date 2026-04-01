import { DfmNode, DfmValue, DfmItem } from './types.js';

export function parseDfm(input: string): DfmNode[] {
  const lines = input.split('\n');
  const roots: DfmNode[] = [];
  const stack: DfmNode[] = [];
  let i = 0;

  while (i < lines.length) {
    const line = lines[i].trim();
    i++;

    if (line === '') continue;

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
            break;
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
