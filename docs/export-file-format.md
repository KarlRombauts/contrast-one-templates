# Contrast One Export File Format

Binary format used to bundle all components of a reporting template into a single file for import/export.

## Structure

The file is a sequence of 5 sections, each (except the first header) preceded by a 4-byte little-endian uint32 length prefix.

```
Offset  Content
------  -------
0x00    4 bytes     Magic / padding (always 00 00 00 00)
0x04    4 bytes     uint32 LE: DFM section length in bytes
0x08    [length]    DFM content (Delphi form definition, text format)
        4 bytes     uint32 LE: Script section length in bytes
        [length]    Script content (Pascal script, text format)
        4 bytes     uint32 LE: Graph section length in bytes
        [length]    Graph XML content (growth chart data)
        4 bytes     uint32 LE: Mappings section length in bytes
        [length]    Mappings CSV content (DICOM code-to-control mappings)
        4 bytes     uint32 LE: RTF section length in bytes
        [length]    RTF content (report output template)
```

## Sections

### 1. DFM (Form Definition)

Text-format Delphi DFM file defining the UI layout. Starts with `inherited FormName: TFormClass`.

The form inherits from a base class that determines the exam type:
- `TGynae` -- gynaecological exams
- `TThird_Trimester` -- obstetric exams (20-week, PE-12week, T3-Singleton, T3-US)
- `TThird_Trimester_Twins` -- twin pregnancy exams
- `TEarly_Pregnancy` -- first trimester dating scans

### 2. Script (Pascal)

Pascal script containing:
- Utility functions (string conversion, formatting)
- UI event handlers (show/hide, validation)
- Report generation (`ProduceMergeFieldData`, `ProduceMergeOrder`)
- Framework entry points (`StartScript`, `InitializeScreen`, `CheckFormComplete`)

The script ends with a bare `StartScript;` call which is the entry point.

### 3. Graph (XML)

Growth chart reference data in XML format. Contains percentile curves for fetal measurements (EFW, BPD, HC, AC, FL, etc.).

Gynae templates have an empty graph section (just `<Graph>\n   </Graph>` or length = 0) since they don't use growth charts.

### 4. Mappings (CSV)

Maps DICOM/LOINC codes to form control names. Format:

```
CODE=controlName,sourceUnit,displayUnit,dataType,default,flags
```

Examples:
```
11842-2=seUterusLength,mm,cm,I,0
99003-1=deSelectedEDD,date,date,D,0,F
P125005|C11820-8=calculated_field
```

### 5. RTF (Report Template)

Rich Text Format template with merge field placeholders. The script's `ProduceMergeFieldData` and `ProduceMergeOrder` procedures generate the values that get substituted into this template.

## Section Sizes (Reference)

Typical sizes across existing templates:

| Template | DFM | Script | Graph | Mappings | RTF | Total |
|----------|-----|--------|-------|----------|-----|-------|
| 20-week | 163K | 86K | 52K | 3K | 32K | 337K |
| Early-T1 | 109K | 56K | 52K | 2K | 16K | 233K |
| Gynae (original) | 323K | 282K | 0 | 1K | 33K | 639K |
| PE-12week | 148K | 63K | 20B | 2K | 148K | 361K |
| T3-Singleton | 227K | 82K | 52K | 2K | 20K | 383K |
| T3-Twins | 184K | 108K | 52K | 3K | 15K | 361K |
| T3-US | 227K | 82K | 52K | 2K | 20K | 383K |
| GynaeV2 | 279K | 18K | 20B | 2K | 143K | 442K |

## Decomposing an Export File

The `filesplit.sh` tool splits a binary export into its component files:

```bash
bash src/tools/filesplit.sh <export_file> <output_directory>
```

This uses `csplitb` to split on null byte boundaries, then identifies each section by content markers (`inherited` for DFM, `procedure StartScript;` for script, `<GraphData>` for graph, `date,date,D` for mappings, `{\rtf1\ansi` for RTF).

## Assembling an Export File

To create a binary export from component files (Python):

```python
import struct

def build_export(dfm_path, script_path, graph_path, mappings_path, rtf_path, output_path):
    components = []
    for path in [dfm_path, script_path, graph_path, mappings_path, rtf_path]:
        with open(path, 'rb') as f:
            components.append(f.read())

    with open(output_path, 'wb') as f:
        f.write(b'\x00\x00\x00\x00')  # magic header
        for data in components:
            f.write(struct.pack('<I', len(data)))
            f.write(data)
```

## Notes

- All text content uses `\r\n` (Windows) line endings
- The DFM section is in Delphi text DFM format (not binary DFM)
- The graph section may contain non-ASCII characters in chart data that get cleaned by `filesplit.sh`
- T3-Singleton and T3-US produce identical section sizes (same base template, different graph data)
