#!/usr/bin/env python3
"""Generate shared function audit document across all 6 exam scripts.

Parses each exam script using pascal_parser, identifies functions appearing
in 2+ exams, compares them, and generates a comprehensive markdown report
with diffs and recommendations.
"""

import sys
import os
import difflib
import re
from collections import defaultdict, OrderedDict

# Add tools dir to path
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, SCRIPT_DIR)
from pascal_parser import parse

BASE_DIR = os.path.join(SCRIPT_DIR, '..', 'originals')

EXAM_FILES = OrderedDict([
    ('earlyT1Singleton', 'earlyT1Singleton.pas'),
    ('20week', '20week.pas'),
    ('gynae', 'gynae.pas'),
    ('pe12week', 'pe12week.pas'),
    ('t3Singleton', 't3Singleton.pas'),
    ('t3twins', 't3twins.pas'),
])

SHORT_NAMES = {
    'earlyT1Singleton': 'earlyT1',
    '20week': '20week',
    'gynae': 'gynae',
    'pe12week': 'pe12week',
    't3Singleton': 't3Single',
    't3twins': 't3twins',
}

# Category assignments for known functions
CATEGORIES = OrderedDict([
    ('String Utilities', [
        'StrToFloatDef', 'StrToIntDef', 'StringReplace', 'IncludeComma',
        'RemoveDecimalPointAtEnd', 'Min', 'Max',
    ]),
    ('Formatting', [
        'InitCaps', 'AddFullStop', 'PadDecimalPlaces',
        'GetIntegerMeasuredString', 'GetMeasuredString',
    ]),
    ('Date Utilities', [
        'GetFullDateString',
    ]),
    ('Articles', [
        'GetIndefinateArticle', 'GetValueSuffix',
    ]),
    ('Form Utilities', [
        'CheckFormComplete', 'AddToResult', 'cbToggleCheckOnClick',
        'SetCheckBoxGlyph', 'SetPanelCheckBoxGlyphs',
    ]),
    ('EDD Handling', [
        'cbEDDPrincipleOnChange', 'PopulateEDDControls',
        'GetEDDPrincipleMethod', 'GetEDDDatePrinciple',
        'edEDDOnChange', 'edEDDKeyPress',
        'GetEnteredEDD', 'deStatedEDDOnChange',
        'cbUSSEDDOnChange', 'deIVFEDDOnChange',
        'deMUFWEddOnChange', 'deMenstrualEDDOnChange',
        'deOvulationEDDOnChange', 'cbDateOfConceptionOnChange',
        'cbLMPDateOnChange', 'getGAFromEnteredEDD',
        'getCompositeDate', 'btnPregnancyRedatedOnClick',
    ]),
    ('Gestational Age', [
        'GetWeeksFromDueDate', 'GetDaysFromDueDate',
        'GetWeeksAndDaysString', 'GetGestAge',
        'GetWeeksFromDueDateAtDate', 'GetDaysFromDueDateAtDate',
        'GetDaysFromLMPDate', 'GetWeeksFromLMPDate',
        'GetGestDays', 'GetGestWeeks',
        'cbGestationTypeChange',
    ]),
    ('Clinical History', [
        'GetClinicalIndicators', 'GetClinicalHistory',
        'GetClinicalHistoryMaster', 'GetObstetricHistory',
        'cxccbObstetricHistoryChange',
        'cxccbReferralIndicationChange', 'cxccbReferralIndicatorsChange',
    ]),
    ('Fibroids', [
        'GetFibroidLocationString', 'GetFibroidString',
        'GetFibroidSummaryString', 'GetFibroidsString',
        'cbFibroidNumberOnChange', 'GetFibroidWarning',
        'GetFibroidAvg', 'GetFibroidConcl', 'GetFibroidCount',
        'GetFibroidDesc', 'GetLargestFibroid',
        'GetSingleFibroid', 'GetSingleFibroidCavity',
        'GetSingleFibroidDimensions', 'GetCavDistortionCount',
        'cbFibroidsTypeOnChange', 'cbFibroidsVisualisedOnClick',
        'spFibroidCountOnChange', 'ToggleCloseToCervixFibroid',
        'getFibroid',
    ]),
    ('Biometry and Growth', [
        'getBiometryPercentiles', 'getEFW', 'getEFWPer',
        'CalcFetalScore', 'GetBioPhysicalConc',
        'btnCalGrowthPer1OnClick', 'btnGeneratePercentilesOnClick',
        'GetGraphData', 'GetGraphXValue', 'GetPerGraph',
        'GetMoMRange',
    ]),
    ('Doppler / Vascular', [
        'GetNormalCPRRange', 'GetNormalUAPIRange', 'GetNormalMCAPIRange',
        'GetUAPI', 'GetMCAPI', 'GetDuctusVenosusWarning',
    ]),
    ('Anatomy and Fetal Checks', [
        'GetAnatomy', 'SetAnatomyChecks', 'SetAbnormalCheckes',
        'cbFetalAnatomyNormal1OnClick',
        'getAnatomyChecked', 'getAnatomyWarning',
    ]),
    ('Placenta', [
        'GetPlacenta', 'GetPlacenta1InvertPosition', 'GetPlacenta1Measure',
        'getPlacentaBeyond', 'getPlacentaConclusion', 'getPlacentalPosition',
    ]),
    ('Cervix', [
        'getCervix', 'getCervixConclusion', 'getCervixDetailed',
        'getCervixWarning', 'getCervicalSuture',
        'getFunnelingMembranes', 'getFunnellingMembrane',
    ]),
    ('Liquor / Amniotic Fluid', [
        'GetLiquor5Centile', 'GetLiquor95Centile',
    ]),
    ('Ovaries', [
        'GetOvary', 'GetOvaryConc', 'getOvaryWarning',
    ]),
    ('IVF / Embryo Transfer', [
        'GetEmbryoTransferCount', 'GetFrozen',
        'seTransferDayOnChange',
    ]),
    ('Report Generation', [
        'ProduceMergeFieldData', 'ProduceMergeOrder',
        'getConclusionWarnings', 'getReportHeading',
    ]),
    ('Script Lifecycle', [
        'InitializeScreen', 'StartScript',
    ]),
])


def normalize_body(body: str) -> str:
    """Normalize a function body for comparison by stripping trailing whitespace
    from each line and collapsing multiple blank lines."""
    lines = body.split('\n')
    lines = [line.rstrip() for line in lines]
    return '\n'.join(lines)


def strip_whitespace_for_comparison(body: str) -> str:
    """Strip all whitespace variations for detecting purely cosmetic diffs."""
    lines = body.split('\n')
    # Strip trailing whitespace, normalize leading whitespace to single spaces
    stripped = []
    for line in lines:
        s = line.strip()
        if s:
            stripped.append(s)
    return '\n'.join(stripped)


def classify_diff(bodies: dict) -> str:
    """Classify the difference status of function variants.

    Returns: 'IDENTICAL', 'MINOR_DIFF', or 'DIVERGENT'
    """
    normalized = {k: normalize_body(v) for k, v in bodies.items()}
    unique_normalized = set(normalized.values())

    if len(unique_normalized) == 1:
        return 'IDENTICAL'

    # Check if differences are only whitespace
    stripped = {k: strip_whitespace_for_comparison(v) for k, v in bodies.items()}
    unique_stripped = set(stripped.values())

    if len(unique_stripped) == 1:
        return 'MINOR_DIFF'

    # Check if differences are minor (small edit distance relative to size)
    variants = list(unique_stripped)
    ref = variants[0]
    ref_lines = ref.split('\n')

    all_minor = True
    for v in variants[1:]:
        v_lines = v.split('\n')
        diff = list(difflib.unified_diff(ref_lines, v_lines, lineterm=''))
        # Count actual change lines (not headers)
        changed = sum(1 for d in diff if d.startswith('+') or d.startswith('-'))
        changed -= sum(1 for d in diff if d.startswith('+++') or d.startswith('---'))
        total_lines = max(len(ref_lines), len(v_lines))
        if total_lines > 0 and changed / total_lines > 0.3:
            all_minor = False
            break

    if all_minor:
        return 'MINOR_DIFF'

    return 'DIVERGENT'


def get_unified_diff(body_a: str, body_b: str, label_a: str, label_b: str) -> str:
    """Generate a unified diff between two function bodies."""
    lines_a = normalize_body(body_a).split('\n')
    lines_b = normalize_body(body_b).split('\n')
    diff = difflib.unified_diff(
        lines_a, lines_b,
        fromfile=label_a, tofile=label_b,
        lineterm=''
    )
    return '\n'.join(diff)


def is_cosmetic_diff(body_a: str, body_b: str) -> bool:
    """Check if the difference between two bodies is purely cosmetic (whitespace)."""
    return strip_whitespace_for_comparison(body_a) == strip_whitespace_for_comparison(body_b)


def get_category(func_name: str) -> str:
    """Get the category for a function name."""
    for cat, funcs in CATEGORIES.items():
        if func_name in funcs:
            return cat
    return 'Other Shared'


def main():
    # Parse all exam files
    all_functions = {}  # exam_name -> {func_name -> FuncDef}

    for exam_name, filename in EXAM_FILES.items():
        filepath = os.path.join(BASE_DIR, filename)
        with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
            source = f.read()
        result = parse(source)
        func_dict = {}
        for func in result.functions:
            func_dict[func.name] = func
        all_functions[exam_name] = func_dict
        print(f"Parsed {exam_name}: {len(func_dict)} functions", file=sys.stderr)

    # Find shared functions (appearing in 2+ exams)
    func_exams = defaultdict(list)  # func_name -> [exam_name, ...]
    for exam_name, funcs in all_functions.items():
        for func_name in funcs:
            func_exams[func_name].append(exam_name)

    shared_funcs = {name: exams for name, exams in func_exams.items() if len(exams) >= 2}
    print(f"\nFound {len(shared_funcs)} shared functions", file=sys.stderr)

    # Categorize shared functions
    categorized = defaultdict(list)
    for func_name in shared_funcs:
        cat = get_category(func_name)
        categorized[cat].append(func_name)

    # Sort functions within each category
    for cat in categorized:
        categorized[cat].sort()

    # Build ordered categories list (predefined order first, then 'Other Shared')
    ordered_cats = []
    for cat in CATEGORIES:
        if cat in categorized:
            ordered_cats.append(cat)
    if 'Other Shared' in categorized:
        ordered_cats.append('Other Shared')

    # Generate the report
    out = []
    out.append('# Shared Function Audit')
    out.append('')
    out.append('Comprehensive analysis of every function appearing in 2 or more of the 6 exam scripts.')
    out.append('Generated from the original Pascal source files in `Scripts/originals/`.')
    out.append('')
    out.append('## Summary')
    out.append('')
    out.append(f'| Metric | Count |')
    out.append(f'|--------|-------|')
    out.append(f'| Total unique functions across all exams | {sum(len(f) for f in all_functions.values())} |')
    out.append(f'| Functions appearing in 2+ exams | {len(shared_funcs)} |')

    # Count by status
    status_counts = defaultdict(int)
    for func_name, exams in shared_funcs.items():
        bodies = {e: all_functions[e][func_name].body for e in exams}
        status = classify_diff(bodies)
        status_counts[status] += 1

    out.append(f'| IDENTICAL across all containing exams | {status_counts["IDENTICAL"]} |')
    out.append(f'| MINOR_DIFF (whitespace/cosmetic only or small changes) | {status_counts["MINOR_DIFF"]} |')
    out.append(f'| DIVERGENT (significant logic differences) | {status_counts["DIVERGENT"]} |')
    out.append('')

    # Exam function counts
    out.append('### Functions per Exam')
    out.append('')
    out.append('| Exam | Total Functions | Shared Functions |')
    out.append('|------|---------------|-----------------|')
    for exam_name in EXAM_FILES:
        total = len(all_functions[exam_name])
        shared = sum(1 for fn in all_functions[exam_name] if fn in shared_funcs)
        out.append(f'| {exam_name} | {total} | {shared} |')
    out.append('')

    # Category TOC
    out.append('## Table of Contents')
    out.append('')
    for cat in ordered_cats:
        anchor = re.sub(r'[^a-z0-9 -]', '', cat.lower()).replace(' ', '-')
        count = len(categorized[cat])
        plural = 'function' if count == 1 else 'functions'
        out.append(f'- [{cat}](#{anchor}) ({count} {plural})')
    out.append(f'- [Recommendations](#recommendations)')
    out.append('')
    out.append('---')
    out.append('')

    # Track recommendations
    normalize_list = []
    keep_per_exam_list = []
    investigate_list = []

    # Generate detail for each category
    for cat in ordered_cats:
        out.append(f'## {cat}')
        out.append('')

        for func_name in categorized[cat]:
            exams = shared_funcs[func_name]
            bodies = {e: all_functions[e][func_name].body for e in exams}
            status = classify_diff(bodies)

            # Get a representative signature
            rep_exam = exams[0]
            sig = all_functions[rep_exam][func_name].signature
            kind = all_functions[rep_exam][func_name].kind

            out.append(f'### `{func_name}`')
            out.append('')
            out.append(f'**Signature:** `{sig}`')
            out.append('')
            out.append(f'**Present in:** {", ".join(exams)} ({len(exams)} exams)')
            out.append('')
            out.append(f'**Status:** `{status}`')
            out.append('')

            if status == 'IDENTICAL':
                out.append(f'Identical across all {len(exams)} exams.')
                out.append('')
                # Show the body once
                out.append('<details>')
                out.append(f'<summary>View function body (from {exams[0]})</summary>')
                out.append('')
                out.append('```pascal')
                out.append(normalize_body(bodies[exams[0]]))
                out.append('```')
                out.append('')
                out.append('</details>')
                out.append('')

            elif status == 'MINOR_DIFF':
                # Determine if purely cosmetic or has minor functional diffs
                normalized = {k: normalize_body(v) for k, v in bodies.items()}
                unique_normalized = list(set(normalized.values()))

                # Check cosmetic vs functional
                all_cosmetic = True
                stripped = {k: strip_whitespace_for_comparison(v) for k, v in bodies.items()}
                unique_stripped = set(stripped.values())
                if len(unique_stripped) > 1:
                    all_cosmetic = False

                if all_cosmetic:
                    out.append('Differences are **cosmetic only** (whitespace/formatting). No functional changes.')
                    out.append('')
                else:
                    out.append('Minor differences detected. See diff below for details.')
                    out.append('')

                # Group exams by their variant
                variant_groups = defaultdict(list)
                for exam, body in normalized.items():
                    variant_groups[body].append(exam)

                if len(variant_groups) > 1:
                    variant_list = list(variant_groups.items())
                    ref_body, ref_exams = variant_list[0]

                    out.append(f'**Variant groups:**')
                    for i, (vbody, vexams) in enumerate(variant_list):
                        out.append(f'- Variant {i+1}: {", ".join(vexams)}')
                    out.append('')

                    # Show diffs between variants
                    for i in range(1, len(variant_list)):
                        other_body, other_exams = variant_list[i]
                        label_a = f'{ref_exams[0]}'
                        label_b = f'{other_exams[0]}'
                        diff_text = get_unified_diff(ref_body, other_body, label_a, label_b)
                        if diff_text.strip():
                            out.append(f'<details>')
                            out.append(f'<summary>Diff: {label_a} vs {label_b}</summary>')
                            out.append('')
                            out.append('```diff')
                            out.append(diff_text)
                            out.append('```')
                            out.append('')
                            out.append('</details>')
                            out.append('')

                # Classify for recommendations
                if all_cosmetic:
                    normalize_list.append((func_name, 'Whitespace-only differences'))
                else:
                    investigate_list.append((func_name, 'Minor differences - verify if intentional'))

            elif status == 'DIVERGENT':
                # Group by variant
                normalized = {k: normalize_body(v) for k, v in bodies.items()}
                variant_groups = defaultdict(list)
                for exam, body in normalized.items():
                    variant_groups[body].append(exam)

                variant_list = list(variant_groups.items())
                out.append(f'**{len(variant_list)} distinct variants found.**')
                out.append('')

                # Analyze what's different
                stripped = {k: strip_whitespace_for_comparison(v) for k, v in bodies.items()}

                # Show variant groups
                for i, (vbody, vexams) in enumerate(variant_list):
                    out.append(f'**Variant {i+1}** ({", ".join(vexams)}):')
                    out.append('')
                    out.append('<details>')
                    out.append(f'<summary>View full body</summary>')
                    out.append('')
                    out.append('```pascal')
                    out.append(vbody)
                    out.append('```')
                    out.append('')
                    out.append('</details>')
                    out.append('')

                # Show diffs between first variant and others
                if len(variant_list) > 1:
                    ref_body, ref_exams = variant_list[0]
                    for i in range(1, len(variant_list)):
                        other_body, other_exams = variant_list[i]
                        label_a = f'{ref_exams[0]}'
                        label_b = f'{other_exams[0]}'
                        diff_text = get_unified_diff(ref_body, other_body, label_a, label_b)
                        if diff_text.strip():
                            out.append(f'<details>')
                            out.append(f'<summary>Diff: {label_a} vs {label_b}</summary>')
                            out.append('')
                            out.append('```diff')
                            out.append(diff_text)
                            out.append('```')
                            out.append('')
                            out.append('</details>')
                            out.append('')

                # Try to explain the differences
                out.append('**Analysis:**')
                out.append('')
                _explain_divergence(out, func_name, bodies, variant_list)
                out.append('')

        out.append('---')
        out.append('')

    # Recommendations section
    out.append('## Recommendations')
    out.append('')

    # Re-classify all shared functions for recommendations
    normalize_list = []
    keep_per_exam_list = []
    investigate_list = []

    for func_name, exams in sorted(shared_funcs.items()):
        bodies = {e: all_functions[e][func_name].body for e in exams}
        status = classify_diff(bodies)

        if status == 'IDENTICAL':
            normalize_list.append((func_name, f'Identical across {len(exams)} exams - extract to shared module'))
        elif status == 'MINOR_DIFF':
            stripped = {k: strip_whitespace_for_comparison(v) for k, v in bodies.items()}
            unique_stripped = set(stripped.values())
            if len(unique_stripped) == 1:
                normalize_list.append((func_name, f'Whitespace-only differences across {len(exams)} exams'))
            else:
                investigate_list.append((func_name, f'Minor differences across {len(exams)} exams - verify if intentional'))
        elif status == 'DIVERGENT':
            # Check if divergence is due to exam-specific control names
            all_bodies = '\n'.join(bodies.values())
            has_exam_specific_controls = any(
                ctrl in all_bodies for ctrl in [
                    'cbPresentation', 'cbLiquor', 'cbPlacenta', 'cbCervix',
                    'edBPD', 'edHC', 'edAC', 'edFL', 'edCRL',
                    'cbFibroid', 'pnlFibroid',
                ]
            )
            if has_exam_specific_controls:
                keep_per_exam_list.append((func_name, f'References exam-specific controls/fields ({len(exams)} exams)'))
            else:
                investigate_list.append((func_name, f'Significant differences across {len(exams)} exams'))

    out.append('### Normalize to One Version')
    out.append('')
    out.append('These functions are identical or have only cosmetic differences and should be extracted into a shared module:')
    out.append('')
    if normalize_list:
        out.append('| Function | Reason |')
        out.append('|----------|--------|')
        for name, reason in sorted(normalize_list):
            out.append(f'| `{name}` | {reason} |')
    else:
        out.append('*None identified.*')
    out.append('')

    out.append('### Keep Per-Exam')
    out.append('')
    out.append('These functions have genuinely different logic per exam that cannot be easily unified:')
    out.append('')
    if keep_per_exam_list:
        out.append('| Function | Reason |')
        out.append('|----------|--------|')
        for name, reason in sorted(keep_per_exam_list):
            out.append(f'| `{name}` | {reason} |')
    else:
        out.append('*None identified.*')
    out.append('')

    out.append('### Needs Investigation')
    out.append('')
    out.append('These functions have differences that may or may not be intentional and need manual review:')
    out.append('')
    if investigate_list:
        out.append('| Function | Reason |')
        out.append('|----------|--------|')
        for name, reason in sorted(investigate_list):
            out.append(f'| `{name}` | {reason} |')
    else:
        out.append('*None identified.*')
    out.append('')

    return '\n'.join(out)


def _explain_divergence(out, func_name, bodies, variant_list):
    """Try to explain why variants of a function differ."""
    # Look for patterns that indicate exam-specific differences

    # Check for different control name references
    control_patterns = re.compile(r'\b(cb|ed|pnl|lbl|btn|rb|memo|grp)\w+', re.IGNORECASE)

    all_controls = {}
    for exam, body in bodies.items():
        controls = set(control_patterns.findall(body))
        all_controls[exam] = controls

    # Check for different string literals
    string_pattern = re.compile(r"'([^']*)'")
    all_strings = {}
    for exam, body in bodies.items():
        strings = set(string_pattern.findall(body))
        all_strings[exam] = strings

    # Determine likely reason
    reasons = []

    # Check if different exams reference different controls
    all_ctrl_sets = list(all_controls.values())
    if len(set(frozenset(s) for s in all_ctrl_sets)) > 1:
        reasons.append('Different form control names referenced across exams')

    # Check for different measurement fields
    measurements = ['BPD', 'HC', 'AC', 'FL', 'CRL', 'NT', 'NB', 'TCD', 'CM']
    for exam, body in bodies.items():
        found = [m for m in measurements if m.lower() in body.lower()]
        if found:
            reasons.append(f'{exam} references measurements: {", ".join(found)}')
            break

    # Check for exam-type specific terms
    exam_terms = {
        'earlyT1Singleton': ['CRL', 'NT', 'first trimester', 'early'],
        '20week': ['anomaly', 'morphology', '20 week', 'anatomy'],
        'gynae': ['gynae', 'ovary', 'uterus', 'endometri'],
        'pe12week': ['pre-eclampsia', 'PE', 'PAPP', 'uterine artery'],
        't3Singleton': ['third trimester', 'growth', 'biometry'],
        't3twins': ['twin', 'Twin 1', 'Twin 2', 'dichorionic', 'monochorionic'],
    }

    exam_specific = []
    for exam, body in bodies.items():
        terms = exam_terms.get(exam, [])
        found_terms = [t for t in terms if t.lower() in body.lower()]
        if found_terms:
            exam_specific.append(f'{exam} has exam-specific terms: {", ".join(found_terms)}')

    if exam_specific:
        reasons.extend(exam_specific)

    if not reasons:
        # Generic analysis: count line differences
        variant_sizes = [(len(body.split('\n')), exams) for body, exams in variant_list]
        size_range = max(s for s, _ in variant_sizes) - min(s for s, _ in variant_sizes)
        if size_range > 10:
            reasons.append(f'Significant size difference: variants range from {min(s for s, _ in variant_sizes)} to {max(s for s, _ in variant_sizes)} lines')
        else:
            reasons.append('Logic differences present but structure is similar')

    for r in reasons:
        out.append(f'- {r}')


if __name__ == '__main__':
    report = main()

    # Write to docs/shared-function-audit.md
    docs_dir = os.path.join(SCRIPT_DIR, '..', '..', 'docs')
    os.makedirs(docs_dir, exist_ok=True)
    output_path = os.path.join(docs_dir, 'shared-function-audit.md')

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(report)

    print(f"\nReport written to {output_path}", file=sys.stderr)
    print(f"Report size: {len(report)} characters, {len(report.split(chr(10)))} lines", file=sys.stderr)
