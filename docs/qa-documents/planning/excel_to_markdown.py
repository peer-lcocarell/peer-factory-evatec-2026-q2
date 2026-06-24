"""
Mini STP Excel → Markdown Converter
QA-focused formatter for Peer Factory / Evatec Mini STPs and Test Plans.

Features:
- Front matter with title, source, version, and document_type
- Table of contents
- Section detection (Scope, Objectives, Preconditions, etc.)
- GitHub-flavoured markdown tables
- Merged-cell value propagation
- Empty row/column pruning
- Kebab-case output filenames

Usage:
    python excel_to_markdown.py [--input-dir DIR] [--output-dir DIR]

Dependencies: Python standard library only (no third-party packages required).
"""

import argparse
import re
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

DEFAULT_INPUT_DIR = Path(".")
DEFAULT_OUTPUT_DIR = Path("./markdown_output")

# Known QA section keywords (case-insensitive prefix match)
QA_SECTION_KEYWORDS = [
    "scope",
    "objective",
    "precondition",
    "risk",
    "test environment",
    "environment",
    "feature",
    "test case",
    "test scenario",
    "assumption",
    "exclusion",
    "entry criteria",
    "exit criteria",
    "deliverable",
    "schedule",
    "resource",
    "reference",
    "glossary",
    "approver",
    "approval",
    "revision",
    "change",
]

VERSION_RE = re.compile(r"(\d+\.\d+[\.\d]*)")

DOCTYPE_KEYWORDS = [
    ("Mini STP", "Mini STP"),
    ("STP", "STP"),
    ("Test Plan", "Test Plan"),
    ("STTD", "STTD"),
]

# OOXML namespace strings
NS_MAIN = "http://schemas.openxmlformats.org/spreadsheetml/2006/main"
NS_REL  = "http://schemas.openxmlformats.org/package/2006/relationships"
NS_R    = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"


# ---------------------------------------------------------------------------
# xlsx parsing  (stdlib only — zipfile + xml.etree)
# ---------------------------------------------------------------------------


def _tag(ns: str, local: str) -> str:
    return f"{{{ns}}}{local}"


def _col_index(col_str: str) -> int:
    """Column letters → 0-based index: A→0, Z→25, AA→26."""
    result = 0
    for ch in col_str.upper():
        result = result * 26 + (ord(ch) - ord("A") + 1)
    return result - 1


def _parse_ref(ref: str):
    """'AB12' → (col_idx, row_idx) both 0-based."""
    m = re.match(r"([A-Za-z]+)(\d+)", ref)
    if not m:
        return 0, 0
    return _col_index(m.group(1)), int(m.group(2)) - 1


def _read_shared_strings(zf: zipfile.ZipFile) -> list:
    strings = []
    if "xl/sharedStrings.xml" not in zf.namelist():
        return strings
    root = ET.parse(zf.open("xl/sharedStrings.xml")).getroot()
    for si in root.findall(_tag(NS_MAIN, "si")):
        parts = [e.text or "" for e in si.iter(_tag(NS_MAIN, "t"))]
        strings.append("".join(parts).strip())
    return strings


def _read_workbook_sheets(zf: zipfile.ZipFile) -> list:
    """Return [(sheet_name, rId), ...]."""
    root = ET.parse(zf.open("xl/workbook.xml")).getroot()
    sheets = []
    sheets_elem = root.find(_tag(NS_MAIN, "sheets"))
    if sheets_elem is not None:
        for sheet in sheets_elem.findall(_tag(NS_MAIN, "sheet")):
            name = sheet.get("name", "")
            rid  = sheet.get(_tag(NS_R, "id"), "")
            sheets.append((name, rid))
    return sheets


def _read_rels(zf: zipfile.ZipFile) -> dict:
    root = ET.parse(zf.open("xl/_rels/workbook.xml.rels")).getroot()
    return {rel.get("Id"): rel.get("Target")
            for rel in root.findall(_tag(NS_REL, "Relationship"))}


def _read_sheet(zf: zipfile.ZipFile, sheet_path: str, shared: list) -> list:
    """Parse one worksheet; return list-of-rows (list of str)."""
    if sheet_path not in zf.namelist():
        return []

    root = ET.parse(zf.open(sheet_path)).getroot()
    grid: dict = {}

    sheet_data = root.find(_tag(NS_MAIN, "sheetData"))
    if sheet_data is not None:
        for row_elem in sheet_data.findall(_tag(NS_MAIN, "row")):
            row_idx = int(row_elem.get("r", 1)) - 1
            for cell in row_elem.findall(_tag(NS_MAIN, "c")):
                ref = cell.get("r", "")
                col_idx, _ = _parse_ref(ref)
                cell_type = cell.get("t", "")
                value = ""

                v_elem  = cell.find(_tag(NS_MAIN, "v"))
                is_elem = cell.find(_tag(NS_MAIN, "is"))

                if is_elem is not None:
                    parts = [e.text or "" for e in is_elem.iter(_tag(NS_MAIN, "t"))]
                    value = "".join(parts).strip()
                elif v_elem is not None and v_elem.text:
                    raw = v_elem.text.strip()
                    if cell_type == "s":
                        idx = int(raw)
                        value = shared[idx] if idx < len(shared) else ""
                    else:
                        value = raw

                grid[(row_idx, col_idx)] = value

    # Propagate merged-cell top-left value across the whole range
    mc_elem = root.find(_tag(NS_MAIN, "mergeCells"))
    if mc_elem is not None:
        for mc in mc_elem.findall(_tag(NS_MAIN, "mergeCell")):
            ref = mc.get("ref", "")
            if ":" not in ref:
                continue
            start_ref, end_ref = ref.split(":")
            sc, sr = _parse_ref(start_ref)
            ec, er = _parse_ref(end_ref)
            tl_val = grid.get((sr, sc), "")
            for r in range(sr, er + 1):
                for c in range(sc, ec + 1):
                    if (r, c) != (sr, sc):
                        grid[(r, c)] = tl_val

    if not grid:
        return []

    max_row = max(r for r, _ in grid) + 1
    max_col = max(c for _, c in grid) + 1
    return [[grid.get((r, c), "") for c in range(max_col)] for r in range(max_row)]


def read_xlsx(path: Path) -> list:
    """Return [(sheet_name, rows), ...] for every sheet in the workbook."""
    with zipfile.ZipFile(path, "r") as zf:
        shared       = _read_shared_strings(zf)
        sheets_info  = _read_workbook_sheets(zf)
        rid_to_target = _read_rels(zf)
        results = []
        for sheet_name, rid in sheets_info:
            target = rid_to_target.get(rid, "")
            if not target:
                continue
            sheet_path = f"xl/{target}" if not target.startswith("/") else target.lstrip("/")
            rows = _read_sheet(zf, sheet_path, shared)
            results.append((sheet_name, rows))
    return results


# ---------------------------------------------------------------------------
# Markdown table builder
# ---------------------------------------------------------------------------


def _escape_cell(text: str) -> str:
    return text.replace("|", "\\|").replace("\n", " ").replace("\r", " ")


def rows_to_markdown_table(rows: list) -> str:
    if not rows:
        return ""
    rows = [r for r in rows if any(c.strip() for c in r)]
    if not rows:
        return ""

    max_cols = max(len(r) for r in rows)
    rows = [r + [""] * (max_cols - len(r)) for r in rows]

    non_empty_cols = [c for c in range(max_cols)
                      if any(rows[ri][c].strip() for ri in range(len(rows)))]
    if not non_empty_cols:
        return ""

    rows = [[row[c] for c in non_empty_cols] for row in rows]
    n = len(non_empty_cols)

    lines = [
        "| " + " | ".join(_escape_cell(c) for c in rows[0]) + " |",
        "| " + " | ".join(["---"] * n) + " |",
    ]
    for row in rows[1:]:
        lines.append("| " + " | ".join(_escape_cell(c) for c in row) + " |")

    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Name / metadata helpers
# ---------------------------------------------------------------------------


def kebab_case(name: str) -> str:
    name = Path(name).stem
    name = name.replace("&", " and ")
    name = re.sub(r"[_.]", " ", name)
    name = re.sub(r"([a-z])([A-Z])", r"\1 \2", name)
    name = re.sub(r"\bupdated\b", "", name, flags=re.IGNORECASE)
    name = re.sub(r"[^a-zA-Z0-9]+", "-", name)
    name = re.sub(r"-+", "-", name)
    return name.strip("-").lower()


def slug_to_anchor(header: str) -> str:
    s = header.lower()
    s = re.sub(r"[^a-z0-9\s-]", "", s)
    s = re.sub(r"\s+", "-", s.strip())
    return s


def detect_version(filename: str) -> str:
    m = VERSION_RE.search(filename)
    return m.group(1) if m else ""


def detect_doctype(filename: str) -> str:
    for keyword, label in DOCTYPE_KEYWORDS:
        if keyword.lower() in filename.lower():
            return label
    return "Excel Document"


def human_title(stem: str) -> str:
    return re.sub(r"\s*-\s*[Uu]pdated\s*$", "", stem).strip()


def is_qa_section_header(text: str) -> bool:
    t = text.strip().lower()
    return any(t.startswith(kw) for kw in QA_SECTION_KEYWORDS)


# ---------------------------------------------------------------------------
# Sheet rows → Markdown blocks
# ---------------------------------------------------------------------------


def rows_to_markdown_blocks(rows: list) -> list:
    blocks = []
    table_rows: list = []

    def flush_table():
        if not table_rows:
            return
        md = rows_to_markdown_table(list(table_rows))
        if md:
            blocks.append(md)
        table_rows.clear()

    for row in rows:
        non_empty = [c for c in row if c.strip()]
        if not non_empty:
            flush_table()
            continue
        if len(non_empty) == 1 and is_qa_section_header(non_empty[0]):
            flush_table()
            blocks.append(f"### {non_empty[0].strip()}")
            blocks.append("")
        else:
            table_rows.append(row)

    flush_table()
    return blocks


# ---------------------------------------------------------------------------
# Workbook → Markdown file
# ---------------------------------------------------------------------------


def workbook_to_markdown(workbook_path: Path, output_dir: Path) -> None:
    stem    = workbook_path.stem
    title   = human_title(stem)
    version = detect_version(stem)
    doctype = detect_doctype(stem)

    sheets = read_xlsx(workbook_path)

    fm = ["---", f"title: {title}", f"source: {workbook_path.name}"]
    if version:
        fm.append(f"version: {version}")
    fm += [f"document_type: {doctype}", "---", ""]

    header = [f"# {title}", "", f"> Source: `{workbook_path.name}`", ""]

    sheet_sections = []
    for sheet_name, rows in sheets:
        blocks = rows_to_markdown_blocks(rows)
        if any(b.strip() for b in blocks):
            sheet_sections.append((sheet_name, blocks))

    toc: list = []
    if sheet_sections:
        toc = ["## Contents", ""]
        for sheet_name, _ in sheet_sections:
            toc.append(f"- [{sheet_name}](#{slug_to_anchor(sheet_name)})")
        toc += ["", "---", ""]

    body: list = []
    for sheet_name, blocks in sheet_sections:
        body += [f"## {sheet_name}", ""] + blocks + ["", "---", ""]

    output_file = output_dir / f"{kebab_case(workbook_path.name)}.md"
    output_file.write_text("\n".join(fm + header + toc + body), encoding="utf-8")
    print(f"  Created : {output_file.relative_to(output_dir.parent)}")


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Convert Mini STP Excel workbooks to QA-focused Markdown."
    )
    parser.add_argument(
        "--input-dir",
        type=Path,
        default=DEFAULT_INPUT_DIR,
        help="Directory containing *.xlsx files (default: current directory)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT_DIR,
        help="Directory to write *.md files into (default: ./markdown_output)",
    )
    args = parser.parse_args()

    input_dir: Path = args.input_dir.resolve()
    output_dir: Path = args.output_dir.resolve()

    output_dir.mkdir(parents=True, exist_ok=True)

    excel_files = sorted(input_dir.glob("*.xlsx"))
    if not excel_files:
        print(f"No *.xlsx files found in {input_dir}")
        return

    print(f"Converting {len(excel_files)} workbook(s) → {output_dir}\n")
    for excel_file in excel_files:
        print(f"Processing: {excel_file.name}")
        try:
            workbook_to_markdown(excel_file, output_dir)
        except Exception as exc:  # noqa: BLE001
            print(f"  ERROR    : {exc}")

    print("\nCompleted.")


if __name__ == "__main__":
    main()
