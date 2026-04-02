"""Tests for exportbundle.py - Contrast One export file bundler/extractor."""
import pytest
import struct
from pathlib import Path
from exportbundle import read_sections, MAGIC, SECTION_NAMES, SECTION_LABELS


# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------

def make_export(sections):
    """Build a binary export from a list of byte strings."""
    data = bytearray(MAGIC)
    for content in sections:
        data.extend(struct.pack('<I', len(content)))
        data.extend(content)
    return bytes(data)


SAMPLE_DFM = b"inherited Gynae: TGynae\r\n  Width = 800\r\nend\r\n"
SAMPLE_SCRIPT = b"function CheckFormComplete: Boolean;\r\nbegin\r\n  result := True;\r\nend;\r\n\r\nStartScript;\r\n"
SAMPLE_GRAPH = b"<Graph>\r\n   </Graph>"
SAMPLE_MAPPINGS = b"11842-2=seLength,mm,cm,I,0\r\n"
SAMPLE_RTF = b"{\\rtf1\\ansi test document}"


@pytest.fixture
def sample_export(tmp_path):
    data = make_export([SAMPLE_DFM, SAMPLE_SCRIPT, SAMPLE_GRAPH, SAMPLE_MAPPINGS, SAMPLE_RTF])
    p = tmp_path / "TestExport"
    p.write_bytes(data)
    return str(p)


@pytest.fixture
def sample_dir(tmp_path):
    d = tmp_path / "components"
    d.mkdir()
    (d / "screen.dfm").write_bytes(SAMPLE_DFM)
    (d / "script.pas").write_bytes(SAMPLE_SCRIPT)
    (d / "graph.xml").write_bytes(SAMPLE_GRAPH)
    (d / "mappings.csv").write_bytes(SAMPLE_MAPPINGS)
    (d / "template.rtf").write_bytes(SAMPLE_RTF)
    return str(d)


# ---------------------------------------------------------------------------
# read_sections tests
# ---------------------------------------------------------------------------

class TestReadSections:
    def test_parses_all_five_sections(self):
        data = make_export([SAMPLE_DFM, SAMPLE_SCRIPT, SAMPLE_GRAPH, SAMPLE_MAPPINGS, SAMPLE_RTF])
        sections = read_sections(data)
        assert len(sections) == 5
        labels = [s[0] for s in sections]
        assert labels == SECTION_LABELS

    def test_correct_content(self):
        data = make_export([SAMPLE_DFM, SAMPLE_SCRIPT, SAMPLE_GRAPH, SAMPLE_MAPPINGS, SAMPLE_RTF])
        sections = read_sections(data)
        assert sections[0][3] == SAMPLE_DFM
        assert sections[1][3] == SAMPLE_SCRIPT
        assert sections[2][3] == SAMPLE_GRAPH
        assert sections[3][3] == SAMPLE_MAPPINGS
        assert sections[4][3] == SAMPLE_RTF

    def test_correct_lengths(self):
        data = make_export([SAMPLE_DFM, SAMPLE_SCRIPT, SAMPLE_GRAPH, SAMPLE_MAPPINGS, SAMPLE_RTF])
        sections = read_sections(data)
        assert sections[0][2] == len(SAMPLE_DFM)
        assert sections[1][2] == len(SAMPLE_SCRIPT)
        assert sections[2][2] == len(SAMPLE_GRAPH)

    def test_empty_section(self):
        data = make_export([SAMPLE_DFM, SAMPLE_SCRIPT, b'', SAMPLE_MAPPINGS, SAMPLE_RTF])
        sections = read_sections(data)
        assert sections[2][2] == 0
        assert sections[2][3] == b''

    def test_roundtrip_bytes(self):
        original = make_export([SAMPLE_DFM, SAMPLE_SCRIPT, SAMPLE_GRAPH, SAMPLE_MAPPINGS, SAMPLE_RTF])
        sections = read_sections(original)
        rebuilt = bytearray(MAGIC)
        for label, offset, length, content in sections:
            rebuilt.extend(struct.pack('<I', len(content)))
            rebuilt.extend(content)
        assert bytes(rebuilt) == original


# ---------------------------------------------------------------------------
# CLI extract tests
# ---------------------------------------------------------------------------

class TestExtract:
    def test_creates_all_files(self, sample_export, tmp_path):
        import subprocess
        out_dir = tmp_path / "extracted"
        result = subprocess.run(
            ['python3', 'src/tools/exportbundle.py', 'extract', sample_export, str(out_dir)],
            capture_output=True, text=True,
            cwd=str(Path(__file__).parent.parent.parent.parent)
        )
        assert result.returncode == 0
        for name in SECTION_NAMES:
            assert (out_dir / name).exists()

    def test_extract_content_matches(self, sample_export, tmp_path):
        import subprocess
        out_dir = tmp_path / "extracted"
        subprocess.run(
            ['python3', 'src/tools/exportbundle.py', 'extract', sample_export, str(out_dir)],
            capture_output=True, text=True,
            cwd=str(Path(__file__).parent.parent.parent.parent)
        )
        assert (out_dir / "screen.dfm").read_bytes() == SAMPLE_DFM
        assert (out_dir / "script.pas").read_bytes() == SAMPLE_SCRIPT
        assert (out_dir / "graph.xml").read_bytes() == SAMPLE_GRAPH
        assert (out_dir / "mappings.csv").read_bytes() == SAMPLE_MAPPINGS
        assert (out_dir / "template.rtf").read_bytes() == SAMPLE_RTF


# ---------------------------------------------------------------------------
# CLI bundle tests
# ---------------------------------------------------------------------------

class TestBundle:
    def test_bundle_produces_valid_export(self, sample_dir, tmp_path):
        import subprocess
        out_file = tmp_path / "bundled"
        result = subprocess.run(
            ['python3', 'src/tools/exportbundle.py', 'bundle', sample_dir, str(out_file)],
            capture_output=True, text=True,
            cwd=str(Path(__file__).parent.parent.parent.parent)
        )
        assert result.returncode == 0
        assert out_file.exists()

        data = out_file.read_bytes()
        sections = read_sections(data)
        assert len(sections) == 5
        assert sections[0][3] == SAMPLE_DFM

    def test_bundle_missing_file_creates_empty_section(self, tmp_path):
        import subprocess
        d = tmp_path / "partial"
        d.mkdir()
        (d / "screen.dfm").write_bytes(SAMPLE_DFM)
        (d / "script.pas").write_bytes(SAMPLE_SCRIPT)
        # graph.xml, mappings.csv, template.rtf missing

        out_file = tmp_path / "partial_export"
        result = subprocess.run(
            ['python3', 'src/tools/exportbundle.py', 'bundle', str(d), str(out_file)],
            capture_output=True, text=True,
            cwd=str(Path(__file__).parent.parent.parent.parent)
        )
        assert result.returncode == 0
        sections = read_sections(out_file.read_bytes())
        assert sections[0][3] == SAMPLE_DFM
        assert sections[1][3] == SAMPLE_SCRIPT
        assert sections[2][3] == b''  # empty graph
        assert sections[3][3] == b''  # empty mappings
        assert sections[4][3] == b''  # empty rtf


# ---------------------------------------------------------------------------
# CLI roundtrip tests
# ---------------------------------------------------------------------------

class TestRoundtrip:
    def test_synthetic_roundtrip(self, sample_export):
        import subprocess
        result = subprocess.run(
            ['python3', 'src/tools/exportbundle.py', 'roundtrip', sample_export],
            capture_output=True, text=True,
            cwd=str(Path(__file__).parent.parent.parent.parent)
        )
        assert result.returncode == 0
        assert 'OK' in result.stdout

    def test_extract_bundle_roundtrip(self, sample_export, tmp_path):
        """Extract to files, re-bundle, compare bytes."""
        import subprocess
        cwd = str(Path(__file__).parent.parent.parent.parent)

        out_dir = tmp_path / "rt_extract"
        subprocess.run(
            ['python3', 'src/tools/exportbundle.py', 'extract', sample_export, str(out_dir)],
            capture_output=True, cwd=cwd
        )

        rebundled = tmp_path / "rt_rebundle"
        subprocess.run(
            ['python3', 'src/tools/exportbundle.py', 'bundle', str(out_dir), str(rebundled)],
            capture_output=True, cwd=cwd
        )

        assert Path(sample_export).read_bytes() == rebundled.read_bytes()


# ---------------------------------------------------------------------------
# Integration: test against real export files
# ---------------------------------------------------------------------------

EXPORTS_DIR = Path(__file__).parent.parent.parent.parent / 'original-exports'

REAL_EXPORTS = [
    '20-week-export', 'Early-T1-Singleton', 'Gynae-Template',
    'PE-12week-Singleton', 'T3-Singleton', 'T3-Twins', 'T3-US',
]


@pytest.mark.skipif(not EXPORTS_DIR.exists(), reason='original-exports not found')
class TestRealExports:
    @pytest.mark.parametrize('name', REAL_EXPORTS)
    def test_roundtrip(self, name):
        path = EXPORTS_DIR / name
        if not path.exists():
            pytest.skip(f'{name} not found')
        data = path.read_bytes()
        sections = read_sections(data)

        rebuilt = bytearray(MAGIC)
        for label, offset, length, content in sections:
            rebuilt.extend(struct.pack('<I', len(content)))
            rebuilt.extend(content)
        assert bytes(rebuilt) == data

    @pytest.mark.parametrize('name', REAL_EXPORTS)
    def test_has_five_sections(self, name):
        path = EXPORTS_DIR / name
        if not path.exists():
            pytest.skip(f'{name} not found')
        sections = read_sections(path.read_bytes())
        assert len(sections) == 5

    @pytest.mark.parametrize('name', REAL_EXPORTS)
    def test_dfm_starts_with_inherited(self, name):
        path = EXPORTS_DIR / name
        if not path.exists():
            pytest.skip(f'{name} not found')
        sections = read_sections(path.read_bytes())
        dfm = sections[0][3]
        assert dfm.startswith(b'inherited ')

    @pytest.mark.parametrize('name', REAL_EXPORTS)
    def test_script_contains_startscript(self, name):
        path = EXPORTS_DIR / name
        if not path.exists():
            pytest.skip(f'{name} not found')
        sections = read_sections(path.read_bytes())
        script = sections[1][3]
        assert b'StartScript' in script

    @pytest.mark.parametrize('name', REAL_EXPORTS)
    def test_rtf_starts_with_marker(self, name):
        path = EXPORTS_DIR / name
        if not path.exists():
            pytest.skip(f'{name} not found')
        sections = read_sections(path.read_bytes())
        rtf = sections[4][3]
        assert rtf.startswith(b'{\\rtf1')
