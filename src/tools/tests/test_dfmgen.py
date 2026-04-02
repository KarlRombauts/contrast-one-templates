"""Tests for dfmgen.py - DFM <-> YAML conversion tool."""
import pytest
import textwrap
from pathlib import Path
from dfmgen import parse_dfm, dfm_to_yaml, yaml_to_dfm, roundtrip, node_to_yaml, yaml_to_node


# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------

CHECKBOX_DFM = textwrap.dedent("""\
    object chkEnabled: TcxCheckBox
      Left = 10000
      Top = 10000
      Caption = 'Enabled'
      TabOrder = 0
      Transparent = True
      Width = 90
    end
""")

SPIN_DFM = textwrap.dedent("""\
    object seLength: TcxSpinEdit
      Left = 10000
      Top = 10000
      Properties.AssignedValues.MinValue = True
      Properties.SpinButtons.Visible = False
      Properties.DisplayFormat = '#0.0'
      Properties.EditFormat = '#0.0'
      Properties.ValueType = vtFloat
      Enabled = False
      TabOrder = 0
      Width = 35
    end
""")

COMBO_DFM = textwrap.dedent("""\
    object cmbPhase: TcxComboBox
      Left = 10000
      Top = 10000
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        ''
        'proliferative'
        'secretory'
        'menstrual')
      TabOrder = 0
      Width = 140
    end
""")

CHECKCOMBO_DFM = textwrap.dedent("""\
    object ccbHistory: TcxCheckComboBox
      Left = 10000
      Top = 10000
      Properties.DropDownRows = 15
      Properties.Items = <
        item
          Description = 'Item A'
          ShortDescription = 'A'
        end
        item
          Description = 'Same'
          ShortDescription = 'Same'
        end>
      TabOrder = 0
      Width = 200
    end
""")

LAYOUT_GROUP_DFM = textwrap.dedent("""\
    object lgDetails: TdxLayoutGroup
      CaptionOptions.Text = 'Details'
      CaptionOptions.Visible = True
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = True
      Visible = False
    end
""")

LAYOUT_ITEM_DFM = textwrap.dedent("""\
    object liLength: TdxLayoutItem
      CaptionOptions.Text = 'Length'
      Control = seLength
      ControlOptions.ShowBorder = False
    end
""")

LABELED_ITEM_DFM = textwrap.dedent("""\
    object liSep: TdxLayoutLabeledItem
      CaptionOptions.Text = 'x'
    end
""")

NESTED_DFM = textwrap.dedent("""\
    object tsTab: TcxTabSheet
      Caption = 'My Tab'
      ImageIndex = 5
      object lcMain: TdxLayoutControl
        Left = 0
        Top = 0
        Align = alClient
        AutoSize = True
        object chkPresent: TcxCheckBox
          Left = 10000
          Top = 10000
          Caption = 'Present'
          TabOrder = 0
          Transparent = True
          Width = 80
        end
        object lcMainGroup_Root: TdxLayoutGroup
          AlignHorz = ahClient
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          object liPresent: TdxLayoutItem
            CaptionOptions.Visible = False
            Control = chkPresent
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
""")


# ---------------------------------------------------------------------------
# parse_dfm tests
# ---------------------------------------------------------------------------

class TestParseDfm:
    def test_checkbox(self):
        nodes = parse_dfm(CHECKBOX_DFM)
        assert len(nodes) == 1
        assert nodes[0].name == 'chkEnabled'
        assert nodes[0].type == 'TcxCheckBox'
        assert nodes[0].properties['Caption'] == "'Enabled'"

    def test_combo_with_string_items(self):
        nodes = parse_dfm(COMBO_DFM)
        assert 'Properties.Items.Strings' in nodes[0].collections
        items = nodes[0].collections['Properties.Items.Strings']
        assert 'proliferative' in items

    def test_checkcombo_with_collection_items(self):
        nodes = parse_dfm(CHECKCOMBO_DFM)
        items = nodes[0].collections['Properties.Items']
        assert len(items) == 2
        assert items[0]['Description'] == "'Item A'"

    def test_empty_collection(self):
        nodes = parse_dfm(LAYOUT_GROUP_DFM)
        assert 'ButtonOptions.Buttons' in nodes[0].collections
        assert nodes[0].collections['ButtonOptions.Buttons'] == []

    def test_nested_children(self):
        nodes = parse_dfm(NESTED_DFM)
        tab = nodes[0]
        assert tab.name == 'tsTab'
        assert len(tab.children) == 1
        lc = tab.children[0]
        assert lc.name == 'lcMain'
        assert len(lc.children) == 2  # chkPresent + lcMainGroup_Root

    def test_inherited_keyword(self):
        dfm = "inherited MyForm: TMyForm\n  Width = 800\nend\n"
        nodes = parse_dfm(dfm)
        assert nodes[0].keyword == 'inherited'


# ---------------------------------------------------------------------------
# YAML conversion tests
# ---------------------------------------------------------------------------

class TestToYaml:
    def test_checkbox_compact(self):
        y = dfm_to_yaml(CHECKBOX_DFM)
        import yaml
        data = yaml.safe_load(y)
        assert data['type'] == 'check'
        assert data['name'] == 'chkEnabled'
        assert data['caption'] == 'Enabled'
        assert data['width'] == 90
        # Defaults should be omitted
        assert 'left' not in data
        assert 'top' not in data
        assert 'tab_order' not in data

    def test_spin_format_preserved(self):
        y = dfm_to_yaml(SPIN_DFM)
        import yaml
        data = yaml.safe_load(y)
        assert data['type'] == 'spin'
        assert data['format'] == '#0.0'
        assert data['value_type'] == 'vtFloat'
        assert data['enabled'] == False

    def test_combo_items(self):
        y = dfm_to_yaml(COMBO_DFM)
        import yaml
        data = yaml.safe_load(y)
        assert 'items' in data
        assert 'proliferative' in data['items']
        assert '' not in data['items']  # empty first item stripped

    def test_checkcombo_items_compact(self):
        y = dfm_to_yaml(CHECKCOMBO_DFM)
        import yaml
        data = yaml.safe_load(y)
        items = data['items']
        # Same desc/short -> single string
        assert 'Same' in items
        # Different desc/short -> dict
        assert any(isinstance(i, dict) and i.get('desc') == 'Item A' for i in items)

    def test_layout_group_properties(self):
        y = dfm_to_yaml(LAYOUT_GROUP_DFM)
        import yaml
        data = yaml.safe_load(y)
        assert data['type'] == 'group'
        assert data['caption'] == 'Details'
        assert data['direction'] == 'ldHorizontal'
        assert data['visible'] == False

    def test_labeled_item(self):
        y = dfm_to_yaml(LABELED_ITEM_DFM)
        import yaml
        data = yaml.safe_load(y)
        assert data['type'] == 'labeleditem'
        assert data['caption'] == 'x'


# ---------------------------------------------------------------------------
# Round-trip tests
# ---------------------------------------------------------------------------

class TestRoundtrip:
    def test_checkbox_roundtrip(self):
        _, _, diffs = roundtrip(CHECKBOX_DFM)
        assert diffs == [], f"Diffs: {diffs}"

    def test_spin_roundtrip(self):
        _, _, diffs = roundtrip(SPIN_DFM)
        assert diffs == [], f"Diffs: {diffs}"

    def test_combo_roundtrip(self):
        _, _, diffs = roundtrip(COMBO_DFM)
        assert diffs == [], f"Diffs: {diffs}"

    def test_checkcombo_roundtrip(self):
        _, _, diffs = roundtrip(CHECKCOMBO_DFM)
        assert diffs == [], f"Diffs: {diffs}"

    def test_layout_group_roundtrip(self):
        _, _, diffs = roundtrip(LAYOUT_GROUP_DFM)
        assert diffs == [], f"Diffs: {diffs}"

    def test_layout_item_roundtrip(self):
        _, _, diffs = roundtrip(LAYOUT_ITEM_DFM)
        assert diffs == [], f"Diffs: {diffs}"

    def test_labeled_item_roundtrip(self):
        _, _, diffs = roundtrip(LABELED_ITEM_DFM)
        assert diffs == [], f"Diffs: {diffs}"

    def test_nested_roundtrip(self):
        _, _, diffs = roundtrip(NESTED_DFM)
        assert diffs == [], f"Diffs: {diffs}"


# ---------------------------------------------------------------------------
# to-dfm generation tests
# ---------------------------------------------------------------------------

class TestToDfm:
    def test_generates_valid_dfm(self):
        y = dfm_to_yaml(CHECKBOX_DFM)
        dfm = yaml_to_dfm(y)
        assert 'object chkEnabled: TcxCheckBox' in dfm
        assert "Caption = 'Enabled'" in dfm
        assert 'end' in dfm

    def test_checkcombo_generates_items(self):
        y = dfm_to_yaml(CHECKCOMBO_DFM)
        dfm = yaml_to_dfm(y)
        assert 'Properties.Items = <' in dfm
        assert "Description = 'Item A'" in dfm
        assert 'end>' in dfm

    def test_combo_generates_string_items(self):
        y = dfm_to_yaml(COMBO_DFM)
        dfm = yaml_to_dfm(y)
        assert 'Properties.Items.Strings = (' in dfm
        assert "'proliferative'" in dfm

    def test_layout_item_uses_caption_options(self):
        y = dfm_to_yaml(LAYOUT_ITEM_DFM)
        dfm = yaml_to_dfm(y)
        assert "CaptionOptions.Text = 'Length'" in dfm
        assert 'Caption =' not in dfm


# ---------------------------------------------------------------------------
# Integration: test against real gynaeV2 form
# ---------------------------------------------------------------------------

GYNAE_V2_DFM = Path(__file__).parent.parent.parent / 'exams' / 'gynaeV2' / 'screen.dfm'


@pytest.mark.skipif(not GYNAE_V2_DFM.exists(), reason='gynaeV2 screen.dfm not found')
class TestGynaeV2Integration:
    def test_roundtrip(self):
        with open(GYNAE_V2_DFM) as f:
            dfm_text = f.read()
        _, _, diffs = roundtrip(dfm_text)
        assert diffs == [], f"Round-trip diffs ({len(diffs)}): {diffs[:5]}"

    def test_to_yaml_produces_output(self):
        with open(GYNAE_V2_DFM) as f:
            dfm_text = f.read()
        y = dfm_to_yaml(dfm_text)
        assert len(y) > 100
        assert 'check' in y
        assert 'spin' in y
        assert 'group' in y

    def test_yaml_roundtrip_preserves_all_objects(self):
        import yaml as yaml_mod
        with open(GYNAE_V2_DFM) as f:
            dfm_text = f.read()
        y = dfm_to_yaml(dfm_text)
        data = yaml_mod.safe_load(y)

        # Count objects recursively
        def count_objects(d):
            c = 1
            for child in d.get('children', []):
                c += count_objects(child)
            return c

        yaml_count = count_objects(data)

        # Count in original
        orig_nodes = parse_dfm(dfm_text)
        def count_nodes(nodes):
            c = 0
            for n in nodes:
                if n.name != '__item__':
                    c += 1
                    c += count_nodes(n.children)
            return c

        dfm_count = count_nodes(orig_nodes)
        assert yaml_count == dfm_count
