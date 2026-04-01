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
