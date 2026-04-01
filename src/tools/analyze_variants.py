#!/usr/bin/env python3
"""Analyze shared function variants across 6 exam scripts.

For every function appearing in 2+ scripts, compares bodies after normalization
and classifies as functionally identical or having variants.

Outputs a detailed markdown report to docs/shared-function-variants.md.
"""

import sys
import os
import re
import difflib
from collections import defaultdict
from pathlib import Path

# Add tools dir to path so we can import the parser
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from pascal_parser import parse, FuncDef

# --- Configuration ---

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent  # Contrast One/
ORIGINALS_DIR = PROJECT_ROOT / "Scripts" / "originals"
OUTPUT_FILE = PROJECT_ROOT / "docs" / "shared-function-variants.md"

EXAM_FILES = {
    "earlyT1Singleton": "earlyT1Singleton.pas",
    "20week": "20week.pas",
    "gynae": "gynae.pas",
    "pe12week": "pe12week.pas",
    "t3Singleton": "t3Singleton.pas",
    "t3twins": "t3twins.pas",
}

# Canonical display order
EXAM_ORDER = ["earlyT1Singleton", "20week", "gynae", "pe12week", "t3Singleton", "t3twins"]


def normalize_body(body: str) -> str:
    """Normalize a function body for comparison.

    - Strip trailing whitespace from each line
    - Collapse multiple blank lines to single blank lines
    - Strip leading/trailing blank lines from the body
    - Do NOT normalize indentation or case
    """
    lines = body.split('\n')
    lines = [line.rstrip() for line in lines]
    collapsed = []
    prev_blank = False
    for line in lines:
        if line.strip() == '':
            if not prev_blank:
                collapsed.append('')
            prev_blank = True
        else:
            collapsed.append(line)
            prev_blank = False
    while collapsed and collapsed[0].strip() == '':
        collapsed.pop(0)
    while collapsed and collapsed[-1].strip() == '':
        collapsed.pop()
    return '\n'.join(collapsed)


def is_functionally_identical(body_a: str, body_b: str) -> bool:
    """Two normalized bodies are functionally identical if, after stripping
    leading whitespace from each line, every line matches exactly.
    (In Pascal, indentation is not significant.)
    """
    if body_a == body_b:
        return True
    lines_a = body_a.split('\n')
    lines_b = body_b.split('\n')
    if len(lines_a) != len(lines_b):
        return False
    return all(la.strip() == lb.strip() for la, lb in zip(lines_a, lines_b))


def cosmetic_description(bodies: list) -> str:
    """Describe cosmetic differences between functionally-identical bodies."""
    ref = bodies[0].split('\n')
    indent_diffs = 0
    for body in bodies[1:]:
        lines = body.split('\n')
        for la, lb in zip(ref, lines):
            if la != lb and la.strip() == lb.strip():
                indent_diffs += 1
    if indent_diffs > 0:
        return f"Indentation differs on {indent_diffs} line(s)"
    return "Exact match"


def group_variants(bodies_by_exam: dict) -> list:
    """Group exams by their normalized function body variant.

    Returns list of (normalized_body, [exam_names]) sorted by first exam in EXAM_ORDER.
    """
    groups = []  # [(norm_body, [exams])]
    for exam in EXAM_ORDER:
        if exam not in bodies_by_exam:
            continue
        norm = normalize_body(bodies_by_exam[exam])
        found = False
        for g_body, g_exams in groups:
            if is_functionally_identical(norm, g_body):
                g_exams.append(exam)
                found = True
                break
        if not found:
            groups.append((norm, [exam]))
    return groups


def sorted_exams(exams):
    """Sort exam names in canonical order."""
    return sorted(exams, key=lambda e: EXAM_ORDER.index(e) if e in EXAM_ORDER else 99)


def get_differing_lines(body_a: str, body_b: str) -> list:
    """Return list of (line_idx, line_a_stripped, line_b_stripped) for lines that differ."""
    lines_a = body_a.split('\n')
    lines_b = body_b.split('\n')
    max_len = max(len(lines_a), len(lines_b))
    diffs = []
    for i in range(max_len):
        la = lines_a[i].strip() if i < len(lines_a) else '<missing>'
        lb = lines_b[i].strip() if i < len(lines_b) else '<missing>'
        if la != lb:
            diffs.append((i, la, lb))
    return diffs


def extract_string_literals(body: str) -> list:
    """Extract all Pascal string literals from a body."""
    results = []
    i = 0
    while i < len(body):
        if body[i] == "'":
            j = i + 1
            lit = ""
            while j < len(body):
                if body[j] == "'":
                    if j + 1 < len(body) and body[j + 1] == "'":
                        lit += "'"
                        j += 2
                    else:
                        j += 1
                        break
                else:
                    lit += body[j]
                    j += 1
            results.append(lit)
            i = j
        else:
            i += 1
    return results


def analyze_variants_detailed(func_name: str, variants: list, all_raw_bodies: dict) -> tuple:
    """Produce a detailed (summary, example) for a function with variants.

    variants: [(norm_body, [exam_names]), ...]
    all_raw_bodies: {exam_name: raw_body}

    Returns (summary: str, example: str)
    """
    n_variants = len(variants)
    bodies = [v[0] for v in variants]
    exam_groups = [v[1] for v in variants]
    line_counts = [len(b.split('\n')) for b in bodies]

    # --- Detect exam-specific functions (all unique, 6 variants) ---
    all_unique_6 = n_variants == 6 and all(len(eg) == 1 for eg in exam_groups)

    fn_lower = func_name.lower()

    # --- Known inherently exam-specific functions ---
    exam_specific_funcs = {
        'checkformcomplete', 'initializescreen', 'startscript',
        'producemergeorder', 'producemergefielddata',
    }
    if fn_lower in exam_specific_funcs:
        summary = (
            f"Inherently exam-specific: each exam has its own version referencing "
            f"exam-specific UI controls, merge fields, and validation logic. "
            f"Line counts: {', '.join(f'{eg[0]}={lc}' for eg, lc in zip(exam_groups, line_counts))}."
        )
        return summary, ""

    # --- For 2 variants, do detailed line diff ---
    if n_variants == 2:
        return _analyze_two_variants(func_name, variants)

    # --- For 3+ variants, do pairwise summary ---
    return _analyze_multi_variants(func_name, variants)


def _analyze_two_variants(func_name: str, variants: list) -> tuple:
    """Detailed analysis for exactly 2 variants."""
    body_a, exams_a = variants[0]
    body_b, exams_b = variants[1]
    lines_a = body_a.split('\n')
    lines_b = body_b.split('\n')

    ea = ", ".join(sorted_exams(exams_a))
    eb = ", ".join(sorted_exams(exams_b))

    # If same number of lines, show line-by-line diff
    if len(lines_a) == len(lines_b):
        diffs = get_differing_lines(body_a, body_b)
        if not diffs:
            return "Only indentation differences (functionally identical).", ""

        diff_lines = []
        for idx, la, lb in diffs:
            diff_lines.append(f"  - Line {idx+1}: `{la}` vs `{lb}`")

        summary_parts = [f"Same structure ({len(lines_a)} lines), differs on {len(diffs)} line(s):"]
        summary_parts.extend(diff_lines)

        # Try to characterize the nature of diffs
        nature = _characterize_diffs(diffs)
        if nature:
            summary_parts.append(f"\n**Nature:** {nature}")

        example = _generate_example(func_name, diffs, body_a, body_b, exams_a, exams_b)

        return "\n".join(summary_parts), example

    else:
        # Different lengths -- use unified diff to show key differences
        diff = list(difflib.unified_diff(
            lines_a, lines_b,
            fromfile=f"Variant A ({ea})",
            tofile=f"Variant B ({eb})",
            lineterm='',
            n=1,
        ))

        # Count added/removed lines
        added = sum(1 for l in diff if l.startswith('+') and not l.startswith('+++'))
        removed = sum(1 for l in diff if l.startswith('-') and not l.startswith('---'))

        summary = (
            f"Variant A ({ea}): {len(lines_a)} lines. "
            f"Variant B ({eb}): {len(lines_b)} lines. "
            f"Diff: {removed} line(s) removed, {added} line(s) added."
        )

        # Extract the actual changed lines for characterization
        changed_removed = [l[1:].strip() for l in diff if l.startswith('-') and not l.startswith('---')]
        changed_added = [l[1:].strip() for l in diff if l.startswith('+') and not l.startswith('+++')]

        nature = _characterize_line_sets(changed_removed, changed_added)
        if nature:
            summary += f"\n\n**Nature:** {nature}"

        # Show a compact diff
        if len(diff) <= 40:
            compact = "\n".join(diff)
            example = f"```diff\n{compact}\n```"
        else:
            compact = "\n".join(diff[:40])
            example = f"```diff\n{compact}\n... ({len(diff) - 40} more lines)\n```"

        return summary, example


def _analyze_multi_variants(func_name: str, variants: list) -> tuple:
    """Analysis for 3+ variants."""
    n = len(variants)
    bodies = [v[0] for v in variants]
    exam_groups = [v[1] for v in variants]
    line_counts = [len(b.split('\n')) for b in bodies]

    parts = []
    parts.append(f"{n} distinct variants with line counts: " +
                 ", ".join(f"{chr(65+i)}={lc}" for i, lc in enumerate(line_counts)) + ".")

    # Check if some variants are close to each other
    close_pairs = []
    for i in range(n):
        for j in range(i+1, n):
            li = bodies[i].split('\n')
            lj = bodies[j].split('\n')
            if len(li) == len(lj):
                diffs = get_differing_lines(bodies[i], bodies[j])
                if len(diffs) <= 5:
                    close_pairs.append((i, j, diffs))

    if close_pairs:
        for i, j, diffs in close_pairs:
            ei = ", ".join(sorted_exams(exam_groups[i]))
            ej = ", ".join(sorted_exams(exam_groups[j]))
            if not diffs:
                parts.append(f"\nVariants {chr(65+i)} and {chr(65+j)} differ only in indentation.")
            else:
                diff_desc = "; ".join(f"L{d[0]+1}: `{d[1]}` vs `{d[2]}`" for d in diffs[:5])
                parts.append(f"\nVariants {chr(65+i)} ({ei}) vs {chr(65+j)} ({ej}) differ on {len(diffs)} line(s): {diff_desc}")

    # For variants that are very different in length, note that
    very_different = []
    for i in range(n):
        for j in range(i+1, n):
            if abs(line_counts[i] - line_counts[j]) > 10:
                very_different.append((i, j))

    if very_different and not close_pairs:
        parts.append("\nVariants have substantially different structure/length, indicating different logic or scope of functionality.")

    # Characterize what kinds of things differ
    all_strings = []
    for body in bodies:
        all_strings.append(set(extract_string_literals(body)))

    common_strings = set.intersection(*all_strings) if all_strings else set()
    for i, (body, exams) in enumerate(zip(bodies, exam_groups)):
        unique = all_strings[i] - common_strings
        if unique:
            sample = sorted(unique)[:5]
            parts.append(f"\nVariant {chr(65+i)} unique strings: {sample}")

    return "\n".join(parts), ""


def _characterize_diffs(diffs: list) -> str:
    """Given line diffs, characterize the nature of differences."""
    categories = set()
    for idx, la, lb in diffs:
        # String literal difference
        if "'" in la and "'" in lb:
            str_a = re.findall(r"'([^']*)'", la)
            str_b = re.findall(r"'([^']*)'", lb)
            if str_a != str_b:
                categories.add("string literals")

        # Control name difference
        if re.search(r'\bcb\w+|cxcc\w+|de\w+|sp\w+|btn\w+|edt\w+|lbl\w+|pnl\w+|memo\w+', la) and \
           re.search(r'\bcb\w+|cxcc\w+|de\w+|sp\w+|btn\w+|edt\w+|lbl\w+|pnl\w+|memo\w+', lb):
            # Check if the control names themselves differ
            ctrls_a = set(re.findall(r'\b(?:cb|cxcc|de|sp|btn|edt|lbl|pnl|memo)\w+', la))
            ctrls_b = set(re.findall(r'\b(?:cb|cxcc|de|sp|btn|edt|lbl|pnl|memo)\w+', lb))
            if ctrls_a != ctrls_b:
                categories.add("UI control names")

        # Variable name difference
        # Numeric constant difference
        nums_a = re.findall(r'\b\d+\.?\d*\b', la)
        nums_b = re.findall(r'\b\d+\.?\d*\b', lb)
        if nums_a != nums_b:
            categories.add("numeric values")

        # Function call difference
        calls_a = re.findall(r'(\w+)\s*\(', la)
        calls_b = re.findall(r'(\w+)\s*\(', lb)
        if calls_a != calls_b:
            categories.add("function calls")

    if categories:
        return "Differences in: " + ", ".join(sorted(categories)) + "."
    return ""


def _characterize_line_sets(removed: list, added: list) -> str:
    """Characterize differences between removed and added line sets."""
    categories = set()

    all_lines = removed + added
    for line in all_lines:
        if re.search(r'\bcb\w+|cxcc\w+|de\w+|sp\w+|btn\w+|edt\w+|lbl\w+', line):
            categories.add("UI control references")
        if "'" in line:
            categories.add("string literals")
        if re.search(r'if\b|then\b|else\b|case\b', line, re.IGNORECASE):
            categories.add("conditional logic")
        if re.search(r':=', line):
            categories.add("assignments")

    if categories:
        return "Changed lines involve: " + ", ".join(sorted(categories)) + "."
    return ""


def _generate_example(func_name: str, diffs: list, body_a: str, body_b: str,
                      exams_a: list, exams_b: list) -> str:
    """Try to generate a concrete input/output example for 2-variant functions."""
    fn_lower = func_name.lower()

    # AddFullStop: we can trace this
    if fn_lower == 'addfullstop':
        # Find the string literal difference
        for idx, la, lb in diffs:
            if "'.  '" in la or "'. '" in la or "'.  '" in lb or "'. '" in lb:
                # One uses '.  ' and the other '. '
                ea = ", ".join(sorted_exams(exams_a))
                eb = ", ".join(sorted_exams(exams_b))
                return (
                    f"- Input: `'Normal anatomy'`\n"
                    f"- Variant A output: `'Normal anatomy.  '` (period + 2 spaces)\n"
                    f"- Variant B output: `'Normal anatomy. '` (period + 1 space)"
                )
        return ""

    if fn_lower == 'addfullstoptoend':
        for idx, la, lb in diffs:
            if "'.  '" in la or "'. '" in la or "'.'" in la:
                return (
                    f"- Input: `'Normal anatomy'`\n"
                    f"- Variants differ in trailing space count after appended period"
                )
        return ""

    return ""


def generate_report(analysis: list, detailed_summaries: dict, detailed_examples: dict) -> str:
    """Generate the full markdown report."""
    out = []
    out.append("# Shared Function Variant Analysis\n")
    out.append("Analysis of all functions shared across 2+ of the 6 exam scripts,")
    out.append("comparing normalized bodies to identify functional differences.\n")
    out.append("**Normalization applied:** strip trailing whitespace per line, collapse multiple")
    out.append("blank lines to one, strip leading/trailing blank lines. Indentation and case")
    out.append("are preserved (they could be functional in some contexts).\n")
    out.append("**Functional identity test:** after normalization, if every line matches after")
    out.append("stripping leading whitespace (since Pascal indentation is not significant),")
    out.append("the function is marked as **Functionally Identical**.\n")

    variant_funcs = [a for a in analysis if not a['is_identical']]
    identical_funcs = [a for a in analysis if a['is_identical']]

    # --- Summary ---
    out.append("## Summary\n")
    out.append(f"- **Total shared functions** (in 2+ scripts): {len(analysis)}")
    out.append(f"- **Functionally identical:** {len(identical_funcs)}")
    out.append(f"- **With variants:** {len(variant_funcs)}\n")

    out.append("### Functions With Variants\n")
    out.append("| Function | # Variants | Exams | Nature of Difference |")
    out.append("|---|---|---|---|")

    for item in sorted(variant_funcs, key=lambda x: x['name'].lower()):
        name = item['name']
        nv = len(item['variants'])
        exams_str = ", ".join(sorted_exams(item['exams']))
        summary = detailed_summaries.get(name, "Has functional differences")
        # Take first meaningful line for table
        short = summary.split('\n')[0].strip()
        if len(short) > 120:
            short = short[:117] + "..."
        # Escape pipes in summary for markdown table
        short = short.replace('|', '\\|')
        out.append(f"| {name} | {nv} | {exams_str} | {short} |")

    out.append("")

    out.append("### Functionally Identical Functions\n")
    out.append("| Function | Exams | Cosmetic Note |")
    out.append("|---|---|---|")

    for item in sorted(identical_funcs, key=lambda x: x['name'].lower()):
        name = item['name']
        exams_str = ", ".join(sorted_exams(item['exams']))
        note = item['cosmetic_note'] if item['cosmetic_note'] else "Exact match"
        out.append(f"| {name} | {exams_str} | {note} |")

    out.append("")

    # --- Detailed analysis ---
    out.append("## Detailed Variant Analysis\n")

    for item in sorted(variant_funcs, key=lambda x: x['name'].lower()):
        name = item['name']
        variants = item['variants']
        summary = detailed_summaries.get(name, "")
        example = detailed_examples.get(name, "")

        out.append(f"### {name}\n")
        out.append(f"**Variant count:** {len(variants)}\n")

        out.append("| Variant | Exams |")
        out.append("|---|---|")
        for i, (body, exams) in enumerate(variants):
            label = chr(65 + i)
            exams_str = ", ".join(sorted_exams(exams))
            out.append(f"| {label} | {exams_str} |")
        out.append("")

        if summary:
            out.append(f"**Summary:** {summary}\n")

        if example:
            out.append(f"**Example output difference:**\n{example}\n")

        for i, (body, exams) in enumerate(variants):
            label = chr(65 + i)
            exams_str = ", ".join(sorted_exams(exams))
            display_body = '\n'.join(line.rstrip() for line in body.split('\n'))
            out.append(f"<details>")
            out.append(f"<summary>Variant {label} ({exams_str})</summary>\n")
            out.append("```pascal")
            out.append(display_body)
            out.append("```\n")
            out.append("</details>\n")

        out.append("---\n")

    return '\n'.join(out)


def main():
    # --- Parse all 6 scripts ---
    all_functions = {}
    for exam_name, filename in EXAM_FILES.items():
        filepath = ORIGINALS_DIR / filename
        source = filepath.read_text(encoding='utf-8', errors='replace')
        result = parse(source)
        all_functions[exam_name] = {}
        for func in result.functions:
            all_functions[exam_name][func.name] = func

    # --- Find shared functions ---
    func_exams = defaultdict(list)
    for exam_name in EXAM_ORDER:
        for func_name in all_functions[exam_name]:
            func_exams[func_name].append(exam_name)

    shared_funcs = {name: exams for name, exams in func_exams.items() if len(exams) >= 2}

    # --- Analyze each shared function ---
    analysis = []
    detailed_summaries = {}
    detailed_examples = {}

    for func_name in sorted(shared_funcs.keys(), key=str.lower):
        exams = shared_funcs[func_name]

        bodies_by_exam = {}
        for exam in exams:
            bodies_by_exam[exam] = all_functions[exam][func_name].body

        variants = group_variants(bodies_by_exam)

        if len(variants) == 1:
            # Functionally identical
            norm_bodies = [normalize_body(b) for b in bodies_by_exam.values()]
            has_cosmetic = len(set(norm_bodies)) > 1
            note = ""
            if has_cosmetic:
                note = cosmetic_description(norm_bodies)

            analysis.append({
                'name': func_name,
                'exams': exams,
                'variants': variants,
                'is_identical': True,
                'cosmetic_note': note,
            })
        else:
            analysis.append({
                'name': func_name,
                'exams': exams,
                'variants': variants,
                'is_identical': False,
                'cosmetic_note': '',
            })

            summary, example = analyze_variants_detailed(
                func_name, variants, bodies_by_exam
            )
            detailed_summaries[func_name] = summary
            detailed_examples[func_name] = example

    # --- Generate report ---
    md = generate_report(analysis, detailed_summaries, detailed_examples)

    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_FILE.write_text(md, encoding='utf-8')

    print(f"Report written to {OUTPUT_FILE}")
    print(f"Total shared functions: {len(shared_funcs)}")
    identical = sum(1 for a in analysis if a['is_identical'])
    variant = sum(1 for a in analysis if not a['is_identical'])
    print(f"Functionally identical: {identical}")
    print(f"With variants: {variant}")


if __name__ == '__main__':
    main()
