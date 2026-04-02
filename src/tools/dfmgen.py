#!/usr/bin/env python3
"""
dfmgen.py - Convert between Delphi DFM and compact YAML representations.

Usage:
  dfmgen.py to-yaml <dfm_file>
  dfmgen.py to-dfm <yaml_file> [--indent N]
  dfmgen.py roundtrip <dfm_file>

The YAML format is a compact representation that:
- Uses short type keys (check, spin, combo, etc.) instead of full Delphi class names
- Omits default property values (Left=10000, Transparent=True, etc.)
- Preserves non-default properties in an 'extra' dict for lossless round-trip
- Supports collection properties (Properties.Items = < item/end> syntax)
"""

import sys
import re
import argparse
from collections import OrderedDict

try:
    import yaml
except ImportError:
    print("Error: PyYAML required. Install with: pip install pyyaml", file=sys.stderr)
    sys.exit(1)


# ---------------------------------------------------------------------------
# Type mapping: DFM class <-> YAML short key
# ---------------------------------------------------------------------------

TYPE_MAP = {
    'TcxCheckBox': 'check',
    'TcxSpinEdit': 'spin',
    'TcxComboBox': 'combo',
    'TcxCheckComboBox': 'checkcombo',
    'TcxLabel': 'cxlabel',
    'TcxDateEdit': 'date',
    'TcxTextEdit': 'text',
    'TcxGroupBox': 'groupbox',
    'TcxScrollBox': 'scrollbox',
    'TcxTabSheet': 'tab',
    'TcxPageControl': 'pagecontrol',
    'TdxLayoutControl': 'layoutcontrol',
    'TdxLayoutGroup': 'group',
    'TdxLayoutItem': 'item',
    'TdxLayoutLabeledItem': 'labeleditem',
    'TdxLayoutSeparatorItem': 'separator',
    'TdxLayoutSkinLookAndFeel': 'skinlookandfeel',
    'TBevel': 'bevel',
    'TcxRichEdit': 'richedit',
}

REVERSE_TYPE_MAP = {v: k for k, v in TYPE_MAP.items()}


# ---------------------------------------------------------------------------
# Default properties per type (omitted from YAML when they match)
# ---------------------------------------------------------------------------

LAYOUT_CONTROL_DEFAULTS = {
    'Left': '10000', 'Top': '10000', 'TabOrder': '0', 'Transparent': 'True',
}

DEFAULTS = {
    'TcxCheckBox': {
        'Left': '10000', 'Top': '10000', 'TabOrder': '0', 'Transparent': 'True',
    },
    'TcxSpinEdit': {
        'Left': '10000', 'Top': '10000', 'TabOrder': '0',
    },
    'TcxComboBox': {
        'Left': '10000', 'Top': '10000', 'TabOrder': '0',
        'Properties.DropDownListStyle': 'lsFixedList',
    },
    'TcxCheckComboBox': {
        'Left': '10000', 'Top': '10000', 'TabOrder': '0',
    },
    'TcxLabel': {
        'Left': '10000', 'Top': '10000', 'Transparent': 'True',
    },
    'TcxDateEdit': {
        'Left': '10000', 'Top': '10000', 'TabOrder': '0',
    },
    'TcxTextEdit': {
        'Left': '10000', 'Top': '10000', 'TabOrder': '0',
    },
    'TdxLayoutItem': {
        'ControlOptions.ShowBorder': 'False',
    },
    'TdxLayoutGroup': {
        'ButtonOptions.Buttons': '<>',
    },
    'TdxLayoutLabeledItem': {},
    'TdxLayoutSeparatorItem': {},
    'TdxLayoutControl': {},
    'TcxGroupBox': {},
    'TcxScrollBox': {},
    'TcxTabSheet': {},
    'TcxPageControl': {},
    'TBevel': {},
    'TdxLayoutSkinLookAndFeel': {},
}

# Properties that get special YAML keys (not in 'extra')
PROPERTY_ALIASES = {
    'Caption': 'caption',
    'Width': 'width',
    'Height': 'height',
    'Enabled': 'enabled',
    'Visible': 'visible',
    'Left': 'left',
    'Top': 'top',
    'Align': 'align',
    'AutoSize': 'autosize',
    'LayoutLookAndFeel': 'skin',
    'CaptionOptions.Text': 'caption',
    'CaptionOptions.Visible': 'caption_visible',
    'LayoutDirection': 'direction',
    'ShowBorder': 'border',
    'Hidden': 'hidden',
    'AlignHorz': 'align_h',
    'AlignVert': 'align_v',
    'Control': 'control',
    'Properties.DisplayFormat': 'format',
    'Properties.ValueType': 'value_type',
    'Properties.MaxValue': 'max',
    'Properties.MinValue': 'min',
    'Properties.DropDownRows': 'rows',
    'Value': 'value',
    'ImageIndex': 'image_index',
    'Properties.ActivePage': 'active_page',
    'TabOrder': 'tab_order',
    'Tag': 'tag',
}

REVERSE_PROPERTY_ALIASES = {}
for k, v in PROPERTY_ALIASES.items():
    if v not in REVERSE_PROPERTY_ALIASES:
        REVERSE_PROPERTY_ALIASES[v] = k

# Types that use CaptionOptions.Text instead of Caption
CAPTION_OPTIONS_TYPES = {
    'TdxLayoutGroup', 'TdxLayoutItem', 'TdxLayoutLabeledItem', 'TdxLayoutSeparatorItem',
}


# ---------------------------------------------------------------------------
# DFM Parser
# ---------------------------------------------------------------------------

class DfmNode:
    """Represents one object/item in the DFM tree."""
    def __init__(self, name, typ, keyword='object', indent=0):
        self.name = name
        self.type = typ
        self.keyword = keyword  # 'object', 'inherited', or 'item'
        self.indent = indent
        self.properties = OrderedDict()  # prop_name -> value (string)
        self.collections = OrderedDict()  # prop_name -> list of OrderedDicts
        self.children = []  # list of DfmNode
        self.items_raw = OrderedDict()  # prop_name -> list of raw item strings (for Properties.Items)

    def __repr__(self):
        return f"DfmNode({self.name}: {self.type})"


def parse_dfm(text):
    """Parse DFM text into a tree of DfmNodes."""
    lines = text.split('\n')
    root_nodes = []
    stack = []  # list of DfmNode

    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()

        # Object/inherited opening
        m = re.match(r'^(object|inherited)\s+(\w+)\s*:\s*(\w+)', stripped)
        if m:
            node = DfmNode(m.group(2), m.group(3), m.group(1), len(line) - len(line.lstrip()))
            if stack:
                stack[-1].children.append(node)
            else:
                root_nodes.append(node)
            stack.append(node)
            i += 1
            continue

        # Item opening (inside collection)
        if stripped == 'item':
            node = DfmNode('__item__', 'item', 'item')
            if stack:
                stack[-1].children.append(node)
            stack.append(node)
            i += 1
            continue

        # end or end>
        if stripped in ('end', 'end>'):
            if stack:
                stack.pop()
            i += 1
            continue

        # Property with empty collection: X = <>
        if '= <>' in stripped and stack:
            prop_name = stripped.split('=')[0].strip()
            stack[-1].collections[prop_name] = []
            i += 1
            continue

        # Property with collection: Properties.Items = <
        if '= <' in stripped and '= <>' not in stripped and stack:
            prop_name = stripped.split('=')[0].strip()
            # Collect items until we find end>
            items = []
            current_item = None
            i += 1
            while i < len(lines):
                inner = lines[i].strip()
                if inner == 'item':
                    current_item = OrderedDict()
                    i += 1
                    continue
                if inner in ('end', 'end>'):
                    if current_item is not None:
                        items.append(current_item)
                        current_item = None
                    if inner == 'end>':
                        break
                    i += 1
                    continue
                if current_item is not None and '=' in inner:
                    k, _, v = inner.partition('=')
                    current_item[k.strip()] = v.strip()
                i += 1
            stack[-1].collections[prop_name] = items
            i += 1
            continue

        # Property with string list: Properties.Items.Strings = (
        if '= (' in stripped and stack:
            prop_name = stripped.split('=')[0].strip()
            items = []
            i += 1
            while i < len(lines):
                inner = lines[i].strip()
                if inner == ')' or inner.endswith(')'):
                    if inner != ')':
                        items.append(inner.rstrip(')').strip())
                    break
                items.append(inner)
                i += 1
            # Clean up quoted strings
            clean_items = []
            for item in items:
                s = item.strip().strip("'")
                clean_items.append(s)
            stack[-1].collections[prop_name] = clean_items
            i += 1
            continue

        # Regular property
        if '=' in stripped and stack:
            prop, _, val = stripped.partition('=')
            stack[-1].properties[prop.strip()] = val.strip()

        i += 1

    return root_nodes


# ---------------------------------------------------------------------------
# DFM -> YAML conversion
# ---------------------------------------------------------------------------

def node_to_yaml(node):
    """Convert a DfmNode to a compact YAML dict."""
    short_type = TYPE_MAP.get(node.type, node.type)
    defaults = DEFAULTS.get(node.type, {})

    d = OrderedDict()
    d['type'] = short_type
    d['name'] = node.name

    if node.keyword == 'inherited':
        d['inherited'] = True

    # Map known properties to short aliases, collect extras
    extra = OrderedDict()
    for prop, val in node.properties.items():
        # Skip defaults
        if prop in defaults and defaults[prop] == val:
            continue

        alias = PROPERTY_ALIASES.get(prop)
        if alias and alias not in d:
            # Clean up values
            clean_val = val.strip("'")
            # Convert booleans
            if clean_val in ('True', 'False'):
                clean_val = clean_val == 'True'
            # Convert numbers - but keep DFM float format for min/max props
            elif re.match(r'^-?\d+\.\d{6,}$', clean_val):
                # Long decimal float (DFM format) - keep as float to signal type
                clean_val = float(clean_val)
            elif re.match(r'^-?\d+$', clean_val):
                clean_val = int(clean_val)
            elif re.match(r'^-?\d+\.\d+$', clean_val):
                clean_val = float(clean_val)
            d[alias] = clean_val
        else:
            extra[prop] = val

    # Collections
    for prop, items in node.collections.items():
        if prop == 'Properties.Items.Strings':
            d['items'] = [s for s in items if s]  # drop empty first item
        elif prop == 'Properties.Items':
            # CheckComboBox items: list of {Description, ShortDescription}
            compact_items = []
            for item in items:
                desc = item.get('Description', '').strip("'")
                short = item.get('ShortDescription', '').strip("'")
                if desc == short:
                    compact_items.append(desc)
                else:
                    compact_items.append({'desc': desc, 'short': short})
            d['items'] = compact_items
        elif prop == 'ButtonOptions.Buttons':
            pass  # skip empty button collections
        elif prop == 'Properties.CustomButtons.Buttons':
            pass  # skip
        else:
            extra[prop] = items

    if extra:
        d['extra'] = dict(extra)

    # Children (excluding __item__ nodes which are handled in collections)
    children = [c for c in node.children if c.name != '__item__']
    if children:
        d['children'] = [node_to_yaml(c) for c in children]

    return dict(d)


def dfm_to_yaml(text):
    """Convert DFM text to YAML string."""
    nodes = parse_dfm(text)
    yaml_data = [node_to_yaml(n) for n in nodes]
    if len(yaml_data) == 1:
        yaml_data = yaml_data[0]
    return yaml.dump(yaml_data, default_flow_style=False, sort_keys=False, allow_unicode=True, width=120)


# ---------------------------------------------------------------------------
# YAML -> DFM conversion
# ---------------------------------------------------------------------------

def yaml_to_node(d):
    """Convert a YAML dict back to a DfmNode."""
    short_type = d.get('type', '')
    dfm_type = REVERSE_TYPE_MAP.get(short_type, short_type)
    name = d.get('name', '')
    keyword = 'inherited' if d.get('inherited') else 'object'

    node = DfmNode(name, dfm_type, keyword)
    defaults = DEFAULTS.get(dfm_type, {})

    # We reconstruct properties preserving a sensible order:
    # Start with non-default aliased props (from YAML), then defaults,
    # then extras. Use an ordered approach.

    # Properties that need quoting in DFM
    QUOTED_PROPS = {
        'Caption', 'CaptionOptions.Text',
        'Properties.DisplayFormat', 'Properties.EditFormat',
    }

    # DFM properties that use the long float format
    LONG_FLOAT_PROPS = {
        'Properties.MaxValue', 'Properties.MinValue',
    }

    def to_dfm_val(dfm_prop, val):
        """Convert a YAML value back to DFM string representation."""
        if isinstance(val, bool):
            return 'True' if val else 'False'
        elif isinstance(val, int):
            # Check if this prop normally uses long float format
            if dfm_prop in LONG_FLOAT_PROPS:
                return f'{float(val):.18f}'
            return str(val)
        elif isinstance(val, float):
            if dfm_prop in LONG_FLOAT_PROPS:
                return f'{val:.18f}'
            return str(val)
        else:
            s = str(val)
            if dfm_prop in QUOTED_PROPS:
                if not s.startswith("'"):
                    s = f"'{s}'"
            return s

    # Build properties in order: aliased props first, then defaults, then extras.
    # But we want defaults to appear in their natural position.
    # Best approach: collect all props, then order as:
    # non-default aliased, defaults, extras

    skip_keys = {'type', 'name', 'inherited', 'extra', 'children', 'items'}

    aliased = OrderedDict()
    for key, val in d.items():
        if key in skip_keys:
            continue
        dfm_prop = REVERSE_PROPERTY_ALIASES.get(key, key)
        # Route 'caption' to the right DFM property based on type
        if key == 'caption' and dfm_type in CAPTION_OPTIONS_TYPES:
            dfm_prop = 'CaptionOptions.Text'
        if key == 'caption_visible' and dfm_type in CAPTION_OPTIONS_TYPES:
            dfm_prop = 'CaptionOptions.Visible'
        aliased[dfm_prop] = to_dfm_val(dfm_prop, val)

    # Merge: defaults that weren't overridden, then aliased, then extras
    # Actually, DFM convention is roughly: position props, then feature props, then style.
    # Simplest correct approach: put everything in, let the order be:
    # aliased props (in YAML order) + defaults not already set + extras

    final = OrderedDict()
    # First: defaults (they tend to be positional/structural)
    for prop, val in defaults.items():
        if prop not in aliased:
            final[prop] = val
    # Then: aliased properties from YAML
    for prop, val in aliased.items():
        final[prop] = val
    # Then: extras
    for prop, val in d.get('extra', {}).items():
        final[prop] = val

    node.properties = final

    # Restore items/collections
    items = d.get('items', None)
    if items is not None:
        if dfm_type == 'TcxComboBox':
            node.collections['Properties.Items.Strings'] = [''] + items
        elif dfm_type == 'TcxCheckComboBox':
            collection = []
            for item in items:
                if isinstance(item, str):
                    collection.append(OrderedDict([('Description', f"'{item}'"), ('ShortDescription', f"'{item}'")]))
                elif isinstance(item, dict):
                    collection.append(OrderedDict([
                        ('Description', f"'{item['desc']}'"),
                        ('ShortDescription', f"'{item['short']}'"),
                    ]))
            node.collections['Properties.Items'] = collection
        else:
            node.collections['Properties.Items.Strings'] = [''] + items

    # Children
    for child_d in d.get('children', []):
        node.children.append(yaml_to_node(child_d))

    return node


def node_to_dfm(node, indent=0):
    """Convert a DfmNode tree to DFM text."""
    lines = []
    prefix = '  ' * indent

    # Opening line
    lines.append(f'{prefix}{node.keyword} {node.name}: {node.type}')

    # Properties
    for prop, val in node.properties.items():
        lines.append(f'{prefix}  {prop} = {val}')

    # Collections
    for prop, items in node.collections.items():
        if prop == 'Properties.Items.Strings':
            lines.append(f'{prefix}  {prop} = (')
            for item in items:
                lines.append(f"{prefix}    '{item}'")
            lines[-1] += ')'
        elif isinstance(items, list) and items and isinstance(items[0], OrderedDict):
            # CheckComboBox-style items
            lines.append(f'{prefix}  {prop} = <')
            for i, item in enumerate(items):
                lines.append(f'{prefix}    item')
                for k, v in item.items():
                    lines.append(f'{prefix}      {k} = {v}')
                if i == len(items) - 1:
                    lines.append(f'{prefix}    end>')
                else:
                    lines.append(f'{prefix}    end')
        else:
            lines.append(f'{prefix}  {prop} = <>')

    # Children
    for child in node.children:
        lines.append(node_to_dfm(child, indent + 1))

    lines.append(f'{prefix}end')
    return '\n'.join(lines)


def yaml_to_dfm(yaml_text):
    """Convert YAML text to DFM text."""
    data = yaml.safe_load(yaml_text)
    if isinstance(data, dict):
        data = [data]
    nodes = [yaml_to_node(d) for d in data]
    return '\n'.join(node_to_dfm(n) for n in nodes) + '\n'


# ---------------------------------------------------------------------------
# Roundtrip comparison
# ---------------------------------------------------------------------------

def normalize_dfm(text):
    """Normalize DFM for comparison: strip whitespace, normalize numbers."""
    lines = []
    for line in text.split('\n'):
        stripped = line.strip()
        if stripped:
            # Normalize float values like 1.000000000000000000 to 1.0
            stripped = re.sub(r'(\d+)\.0{6,}', r'\1.000000000000000000', stripped)
            lines.append(stripped)
    return '\n'.join(lines)


def roundtrip(dfm_text):
    """DFM -> YAML -> DFM, return (yaml_text, regenerated_dfm, differences).

    Comparison is semantic: properties within an object are compared as sets
    (order doesn't matter), but the object/child structure must match.
    """
    yaml_text = dfm_to_yaml(dfm_text)
    regenerated = yaml_to_dfm(yaml_text)

    # Parse both into node trees and compare semantically
    orig_nodes = parse_dfm(dfm_text)
    regen_nodes = parse_dfm(regenerated)

    diffs = []
    _compare_nodes(orig_nodes, regen_nodes, '', diffs)
    return yaml_text, regenerated, diffs


def _compare_nodes(orig_list, regen_list, path, diffs):
    """Recursively compare two lists of DfmNodes."""
    orig_by_name = {n.name: n for n in orig_list if n.name != '__item__'}
    regen_by_name = {n.name: n for n in regen_list if n.name != '__item__'}

    for name in orig_by_name:
        if name not in regen_by_name:
            diffs.append(f"{path}/{name}: missing in regenerated")
            continue

        orig = orig_by_name[name]
        regen = regen_by_name[name]

        if orig.type != regen.type:
            diffs.append(f"{path}/{name}: type {orig.type} vs {regen.type}")

        # Compare properties as sets
        orig_props = set(f"{k}={v}" for k, v in orig.properties.items())
        regen_props = set(f"{k}={v}" for k, v in regen.properties.items())

        for p in orig_props - regen_props:
            diffs.append(f"{path}/{name}: missing prop: {p}")
        for p in regen_props - orig_props:
            diffs.append(f"{path}/{name}: extra prop: {p}")

        # Compare collections
        for coll_name in set(orig.collections) | set(regen.collections):
            orig_coll = orig.collections.get(coll_name, [])
            regen_coll = regen.collections.get(coll_name, [])
            if str(orig_coll) != str(regen_coll):
                diffs.append(f"{path}/{name}: collection {coll_name} differs")

        # Compare children recursively
        _compare_nodes(orig.children, regen.children, f"{path}/{name}", diffs)

    for name in regen_by_name:
        if name not in orig_by_name:
            diffs.append(f"{path}/{name}: extra in regenerated")


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def cmd_to_yaml(args):
    with open(args.file) as f:
        dfm_text = f.read()
    print(dfm_to_yaml(dfm_text))


def cmd_to_dfm(args):
    with open(args.file) as f:
        yaml_text = f.read()
    print(yaml_to_dfm(yaml_text), end='')


def cmd_roundtrip(args):
    with open(args.file) as f:
        dfm_text = f.read()

    yaml_text, regenerated, diffs = roundtrip(dfm_text)

    if diffs:
        print(f"DIFFERENCES ({len(diffs)}):")
        for diff in diffs[:30]:
            print(f"  {diff}")
        if len(diffs) > 30:
            print(f"  ... and {len(diffs) - 30} more")
        sys.exit(1)
    else:
        print("OK: round-trip produces equivalent output")


def main():
    parser = argparse.ArgumentParser(description='Convert between DFM and YAML')
    subparsers = parser.add_subparsers(dest='command', required=True)

    p_yaml = subparsers.add_parser('to-yaml', help='Convert DFM to YAML')
    p_yaml.add_argument('file')

    p_dfm = subparsers.add_parser('to-dfm', help='Convert YAML to DFM')
    p_dfm.add_argument('file')

    p_rt = subparsers.add_parser('roundtrip', help='Test DFM -> YAML -> DFM roundtrip')
    p_rt.add_argument('file')

    args = parser.parse_args()

    if args.command == 'to-yaml':
        cmd_to_yaml(args)
    elif args.command == 'to-dfm':
        cmd_to_dfm(args)
    elif args.command == 'roundtrip':
        cmd_roundtrip(args)


if __name__ == '__main__':
    main()
