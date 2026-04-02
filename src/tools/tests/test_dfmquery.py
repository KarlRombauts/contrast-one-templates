"""Tests for dfmquery.py - DFM file query tool."""
import pytest
import textwrap
from pathlib import Path
from dfmquery import parse_objects, cmd_list, cmd_types, cmd_get, cmd_children, cmd_validate


# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------

SIMPLE_DFM = textwrap.dedent("""\
    inherited MyForm: TMyForm
      Width = 800
      Height = 600
      object pcMain: TcxPageControl
        Left = 0
        Top = 0
        object tsFirst: TcxTabSheet
          Caption = 'First'
          object chkEnabled: TcxCheckBox
            Left = 10
            Top = 10
            Caption = 'Enabled'
          end
          object seValue: TcxSpinEdit
            Left = 100
            Top = 10
            Width = 50
          end
        end
        object tsSecond: TcxTabSheet
          Caption = 'Second'
          object cmbType: TcxComboBox
            Left = 10
            Top = 10
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              ''
              'Alpha'
              'Beta')
            Width = 120
          end
        end
      end
    end
""")

CHECK_COMBO_DFM = textwrap.dedent("""\
    object MyForm: TMyForm
      object ccbHistory: TcxCheckComboBox
        Left = 10
        Top = 10
        Properties.Items = <
          item
            Description = 'Item A'
            ShortDescription = 'A'
          end
          item
            Description = 'Item B'
            ShortDescription = 'B'
          end
          item
            Description = 'Item C'
            ShortDescription = 'C'
          end>
        TabOrder = 0
        Width = 200
      end
      object chkSimple: TcxCheckBox
        Left = 10
        Top = 50
        Caption = 'Simple'
      end
    end
""")

LAYOUT_DFM = textwrap.dedent("""\
    inherited MyForm: TMyForm
      object lcMain: TdxLayoutControl
        Left = 0
        Top = 0
        Align = alClient
        object chkPresent: TcxCheckBox
          Left = 10000
          Top = 10000
          Caption = 'Present'
        end
        object seLength: TcxSpinEdit
          Left = 10000
          Top = 10000
          Width = 35
        end
        object lcMainGroup_Root: TdxLayoutGroup
          AlignHorz = ahClient
          ShowBorder = False
          object liPresent: TdxLayoutItem
            Control = chkPresent
            ControlOptions.ShowBorder = False
          end
          object lgDetails: TdxLayoutGroup
            CaptionOptions.Text = 'Details'
            Visible = False
            object liLength: TdxLayoutItem
              Control = seLength
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
""")

UNBALANCED_DFM = textwrap.dedent("""\
    object MyForm: TMyForm
      object chkOne: TcxCheckBox
        Caption = 'One'
      end
      object chkTwo: TcxCheckBox
        Caption = 'Two'
""")

BAD_CONTROL_REF_DFM = textwrap.dedent("""\
    object MyForm: TMyForm
      object lcMain: TdxLayoutControl
        object liItem: TdxLayoutItem
          Control = chkGhost
          ControlOptions.ShowBorder = False
        end
      end
    end
""")

DUPLICATE_NAME_DFM = textwrap.dedent("""\
    object MyForm: TMyForm
      object chkOne: TcxCheckBox
        Caption = 'First'
      end
      object chkOne: TcxCheckBox
        Caption = 'Duplicate'
      end
    end
""")


@pytest.fixture
def simple_dfm(tmp_path):
    p = tmp_path / "simple.dfm"
    p.write_text(SIMPLE_DFM)
    return str(p)


@pytest.fixture
def check_combo_dfm(tmp_path):
    p = tmp_path / "checkcombo.dfm"
    p.write_text(CHECK_COMBO_DFM)
    return str(p)


@pytest.fixture
def layout_dfm(tmp_path):
    p = tmp_path / "layout.dfm"
    p.write_text(LAYOUT_DFM)
    return str(p)


@pytest.fixture
def unbalanced_dfm(tmp_path):
    p = tmp_path / "unbalanced.dfm"
    p.write_text(UNBALANCED_DFM)
    return str(p)


@pytest.fixture
def bad_ref_dfm(tmp_path):
    p = tmp_path / "badref.dfm"
    p.write_text(BAD_CONTROL_REF_DFM)
    return str(p)


@pytest.fixture
def duplicate_dfm(tmp_path):
    p = tmp_path / "duplicate.dfm"
    p.write_text(DUPLICATE_NAME_DFM)
    return str(p)


# ---------------------------------------------------------------------------
# parse_objects tests
# ---------------------------------------------------------------------------

class TestParseObjects:
    def test_counts_all_objects(self):
        lines = SIMPLE_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        names = [o['name'] for o in objects]
        assert 'MyForm' in names
        assert 'pcMain' in names
        assert 'tsFirst' in names
        assert 'tsSecond' in names
        assert 'chkEnabled' in names
        assert 'seValue' in names
        assert 'cmbType' in names

    def test_depth_tracking(self):
        lines = SIMPLE_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        by_name = {o['name']: o for o in objects}
        assert by_name['MyForm']['depth'] == 0
        assert by_name['pcMain']['depth'] == 1
        assert by_name['tsFirst']['depth'] == 2
        assert by_name['chkEnabled']['depth'] == 3

    def test_parent_tracking(self):
        lines = SIMPLE_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        by_name = {o['name']: o for o in objects}
        assert by_name['MyForm']['parent'] is None
        assert by_name['pcMain']['parent'] == 'MyForm'
        assert by_name['tsFirst']['parent'] == 'pcMain'
        assert by_name['chkEnabled']['parent'] == 'tsFirst'

    def test_line_offsets(self):
        lines = SIMPLE_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        by_name = {o['name']: o for o in objects}
        assert by_name['MyForm']['line_start'] == 0
        # The closing 'end' for MyForm
        end_line = by_name['MyForm']['line_end']
        assert lines[end_line].strip() == 'end'

    def test_inherited_keyword(self):
        lines = SIMPLE_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        by_name = {o['name']: o for o in objects}
        assert by_name['MyForm']['type'] == 'TMyForm'

    def test_check_combo_with_items(self):
        lines = CHECK_COMBO_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        names = [o['name'] for o in objects]
        assert 'ccbHistory' in names
        assert 'chkSimple' in names
        # items should not appear as named objects
        assert '__item__' not in names

    def test_check_combo_end_angle(self):
        """end> closing should be handled correctly."""
        lines = CHECK_COMBO_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        by_name = {o['name']: o for o in objects}
        # chkSimple should be a sibling of ccbHistory, not nested inside it
        assert by_name['chkSimple']['parent'] == 'MyForm'
        assert by_name['ccbHistory']['parent'] == 'MyForm'

    def test_layout_control_objects(self):
        lines = LAYOUT_DFM.splitlines(keepends=True)
        objects = parse_objects(lines)
        by_name = {o['name']: o for o in objects}
        assert 'lcMain' in by_name
        assert 'lcMainGroup_Root' in by_name
        assert 'lgDetails' in by_name
        assert 'liPresent' in by_name
        assert 'liLength' in by_name
        assert by_name['lcMainGroup_Root']['type'] == 'TdxLayoutGroup'
        assert by_name['lgDetails']['parent'] == 'lcMainGroup_Root'


# ---------------------------------------------------------------------------
# cmd_list tests (via capsys)
# ---------------------------------------------------------------------------

class TestCmdList:
    def test_list_all(self, simple_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm], type=None, depth=None, parent=False)
        cmd_list(args)
        output = capsys.readouterr().out
        assert 'pcMain: TcxPageControl' in output
        assert 'chkEnabled: TcxCheckBox' in output
        assert 'cmbType: TcxComboBox' in output

    def test_list_filter_type(self, simple_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm], type='TcxCheckBox', depth=None, parent=False)
        cmd_list(args)
        output = capsys.readouterr().out
        assert 'chkEnabled' in output
        assert 'cmbType' not in output
        assert 'pcMain' not in output

    def test_list_filter_depth(self, simple_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm], type=None, depth=2, parent=False)
        cmd_list(args)
        output = capsys.readouterr().out
        assert 'tsFirst' in output
        assert 'tsSecond' in output
        assert 'chkEnabled' not in output  # depth 3
        assert 'pcMain' not in output  # depth 1

    def test_list_filter_type_and_depth(self, layout_dfm, capsys):
        args = argparse.Namespace(files=[layout_dfm], type='TdxLayoutGroup', depth=None, parent=False)
        cmd_list(args)
        output = capsys.readouterr().out
        assert 'lcMainGroup_Root' in output
        assert 'lgDetails' in output

    def test_list_shows_line_ranges(self, simple_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm], type='TcxTabSheet', depth=None, parent=False)
        cmd_list(args)
        output = capsys.readouterr().out
        # Should have LINE_START-LINE_END format
        for line in output.strip().split('\n'):
            assert '-' in line.split('\t')[0]

    def test_list_show_parent(self, simple_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm], type='TcxCheckBox', depth=None, parent=True)
        cmd_list(args)
        output = capsys.readouterr().out
        assert '[parent: tsFirst]' in output

    def test_list_multi_file(self, simple_dfm, layout_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm, layout_dfm], type='TcxCheckBox', depth=None, parent=False)
        cmd_list(args)
        output = capsys.readouterr().out
        assert 'chkEnabled' in output
        assert 'chkPresent' in output
        # Multi-file mode should prefix with filename
        assert simple_dfm + ':' in output
        assert layout_dfm + ':' in output


# ---------------------------------------------------------------------------
# cmd_types tests
# ---------------------------------------------------------------------------

class TestCmdTypes:
    def test_types_single_file(self, simple_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm])
        cmd_types(args)
        output = capsys.readouterr().out
        # TcxTabSheet appears twice (tsFirst, tsSecond)
        assert '2\tTcxTabSheet' in output
        assert '1\tTcxCheckBox' in output
        assert '1\tTcxComboBox' in output

    def test_types_multi_file(self, simple_dfm, layout_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm, layout_dfm])
        cmd_types(args)
        output = capsys.readouterr().out
        # TcxCheckBox: 1 in simple + 1 in layout = 2
        assert '2\tTcxCheckBox' in output
        # TdxLayoutGroup only in layout
        assert 'TdxLayoutGroup' in output


# ---------------------------------------------------------------------------
# cmd_get tests
# ---------------------------------------------------------------------------

class TestCmdGet:
    def test_get_simple_object(self, simple_dfm, capsys):
        args = argparse.Namespace(file=simple_dfm, name='chkEnabled', children=False, offsets=False)
        cmd_get(args)
        output = capsys.readouterr().out
        assert 'chkEnabled' in output
        assert "Caption = 'Enabled'" in output
        assert 'end' in output

    def test_get_with_offsets(self, simple_dfm, capsys):
        args = argparse.Namespace(file=simple_dfm, name='chkEnabled', children=False, offsets=True)
        cmd_get(args)
        output = capsys.readouterr().out
        assert output.startswith('# lines ')

    def test_get_without_children(self, simple_dfm, capsys):
        args = argparse.Namespace(file=simple_dfm, name='tsFirst', children=False, offsets=False)
        cmd_get(args)
        output = capsys.readouterr().out
        assert "Caption = 'First'" in output
        assert '// child: chkEnabled: TcxCheckBox' in output
        assert '// child: seValue: TcxSpinEdit' in output
        # Should not contain the actual child content
        assert "Caption = 'Enabled'" not in output

    def test_get_with_children(self, simple_dfm, capsys):
        args = argparse.Namespace(file=simple_dfm, name='tsFirst', children=True, offsets=False)
        cmd_get(args)
        output = capsys.readouterr().out
        assert "Caption = 'First'" in output
        assert "Caption = 'Enabled'" in output
        assert 'seValue: TcxSpinEdit' in output

    def test_get_check_combo_without_children(self, check_combo_dfm, capsys):
        args = argparse.Namespace(file=check_combo_dfm, name='ccbHistory', children=False, offsets=False)
        cmd_get(args)
        output = capsys.readouterr().out
        assert 'Properties.Items = <' in output
        assert 'TabOrder = 0' in output
        assert 'Width = 200' in output
        # Items should be skipped
        assert 'Item A' not in output

    def test_get_check_combo_with_children(self, check_combo_dfm, capsys):
        args = argparse.Namespace(file=check_combo_dfm, name='ccbHistory', children=True, offsets=False)
        cmd_get(args)
        output = capsys.readouterr().out
        assert 'Item A' in output
        assert 'Item B' in output
        assert 'Item C' in output
        assert 'end>' in output

    def test_get_nonexistent(self, simple_dfm):
        args = argparse.Namespace(file=simple_dfm, name='chkGhost', children=False, offsets=False)
        with pytest.raises(SystemExit):
            cmd_get(args)

    def test_get_layout_group_with_children(self, layout_dfm, capsys):
        args = argparse.Namespace(file=layout_dfm, name='lcMainGroup_Root', children=True, offsets=False)
        cmd_get(args)
        output = capsys.readouterr().out
        assert 'liPresent' in output
        assert 'lgDetails' in output
        assert 'liLength' in output


# ---------------------------------------------------------------------------
# cmd_children tests
# ---------------------------------------------------------------------------

class TestCmdChildren:
    def test_children_of_page_control(self, simple_dfm, capsys):
        args = argparse.Namespace(file=simple_dfm, name='pcMain')
        cmd_children(args)
        output = capsys.readouterr().out
        lines = output.strip().split('\n')
        assert len(lines) == 2
        assert 'tsFirst' in output
        assert 'tsSecond' in output

    def test_children_of_tab(self, simple_dfm, capsys):
        args = argparse.Namespace(file=simple_dfm, name='tsFirst')
        cmd_children(args)
        output = capsys.readouterr().out
        assert 'chkEnabled' in output
        assert 'seValue' in output
        # Should not include grandchildren or siblings
        assert 'cmbType' not in output

    def test_children_of_leaf(self, simple_dfm, capsys):
        args = argparse.Namespace(file=simple_dfm, name='chkEnabled')
        cmd_children(args)
        output = capsys.readouterr().out
        assert 'no children' in output

    def test_children_nonexistent(self, simple_dfm):
        args = argparse.Namespace(file=simple_dfm, name='chkGhost')
        with pytest.raises(SystemExit):
            cmd_children(args)

    def test_children_of_layout_control(self, layout_dfm, capsys):
        args = argparse.Namespace(file=layout_dfm, name='lcMain')
        cmd_children(args)
        output = capsys.readouterr().out
        assert 'chkPresent' in output
        assert 'seLength' in output
        assert 'lcMainGroup_Root' in output


# ---------------------------------------------------------------------------
# cmd_validate tests
# ---------------------------------------------------------------------------

class TestCmdValidate:
    def test_valid_simple(self, simple_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm])
        cmd_validate(args)
        output = capsys.readouterr().out
        assert 'OK' in output

    def test_valid_check_combo(self, check_combo_dfm, capsys):
        args = argparse.Namespace(files=[check_combo_dfm])
        cmd_validate(args)
        output = capsys.readouterr().out
        assert 'OK' in output

    def test_valid_layout(self, layout_dfm, capsys):
        args = argparse.Namespace(files=[layout_dfm])
        cmd_validate(args)
        output = capsys.readouterr().out
        assert 'OK' in output

    def test_unbalanced(self, unbalanced_dfm):
        args = argparse.Namespace(files=[unbalanced_dfm])
        with pytest.raises(SystemExit):
            cmd_validate(args)

    def test_bad_control_ref(self, bad_ref_dfm, capsys):
        args = argparse.Namespace(files=[bad_ref_dfm])
        with pytest.raises(SystemExit):
            cmd_validate(args)

    def test_duplicate_names(self, duplicate_dfm, capsys):
        args = argparse.Namespace(files=[duplicate_dfm])
        with pytest.raises(SystemExit):
            cmd_validate(args)

    def test_validate_multi_file(self, simple_dfm, layout_dfm, capsys):
        args = argparse.Namespace(files=[simple_dfm, layout_dfm])
        cmd_validate(args)
        output = capsys.readouterr().out
        assert simple_dfm in output
        assert layout_dfm in output
        assert output.count('OK') == 2


# ---------------------------------------------------------------------------
# Integration: test against real gynaeV2 form if available
# ---------------------------------------------------------------------------

GYNAE_V2_DFM = Path(__file__).parent.parent.parent / 'exams' / 'gynaeV2' / 'screen.dfm'


@pytest.mark.skipif(not GYNAE_V2_DFM.exists(), reason='gynaeV2 screen.dfm not found')
class TestGynaeV2Integration:
    def test_validate_passes(self, capsys):
        args = argparse.Namespace(files=[str(GYNAE_V2_DFM)])
        cmd_validate(args)
        output = capsys.readouterr().out
        assert 'OK' in output

    def test_list_layout_controls(self, capsys):
        args = argparse.Namespace(files=[str(GYNAE_V2_DFM)], type='TdxLayoutControl', depth=None, parent=False)
        cmd_list(args)
        output = capsys.readouterr().out
        assert 'lcUterus' in output
        assert 'lcEndometriosis' in output
        assert 'lcProcedures' in output

    def test_children_of_pcReportBody(self, capsys):
        args = argparse.Namespace(file=str(GYNAE_V2_DFM), name='pcReportBody')
        cmd_children(args)
        output = capsys.readouterr().out
        assert 'tsPatientDetails' in output
        assert 'tsUterus' in output
        assert 'tsEndometriosis' in output
        assert 'tsProcedures' in output

    def test_get_checkbox_with_offsets(self, capsys):
        args = argparse.Namespace(file=str(GYNAE_V2_DFM), name='chkHysterectomy', children=False, offsets=True)
        cmd_get(args)
        output = capsys.readouterr().out
        assert '# lines' in output
        assert 'chkHysterectomy' in output
        assert 'Hysterectomy' in output

    def test_get_check_combo_with_items(self, capsys):
        args = argparse.Namespace(file=str(GYNAE_V2_DFM), name='ccbReferralIndication', children=True, offsets=False)
        cmd_get(args)
        output = capsys.readouterr().out
        assert 'Pelvic pain' in output
        assert 'end>' in output


# Need argparse import for Namespace
import argparse
