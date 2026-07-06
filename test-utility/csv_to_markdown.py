"""
Convert a CSV file exported from Excel into GitHub-Flavored Markdown.
Splits wide tables into multiple sub-tables keyed on ID for readability.
Usage: py csv_to_markdown.py <input.csv> <output.md>
"""
from __future__ import annotations

import csv
import re
import sys
from pathlib import Path


DATE_RE = re.compile(
    r"^(\d{1,2})/(\d{1,2})/(\d{4})\s+(\d{1,2}):(\d{2}):(\d{2})\s*(AM|PM)?$",
    re.IGNORECASE,
)


def format_date(value: str) -> str:
    """Convert common date formats to ISO YYYY-MM-DD or YYYY-MM-DD HH:MM:SS."""
    v = value.strip()
    m = DATE_RE.match(v)
    if m:
        month, day, year = int(m.group(1)), int(m.group(2)), int(m.group(3))
        hour, minute, second = int(m.group(4)), int(m.group(5)), int(m.group(6))
        ampm = m.group(7)
        if ampm:
            ampm = ampm.upper()
            if ampm == "PM" and hour != 12:
                hour += 12
            elif ampm == "AM" and hour == 12:
                hour = 0
        return f"{year:04d}-{month:02d}-{day:02d} {hour:02d}:{minute:02d}:{second:02d}"
    return v


def escape_md(text: str) -> str:
    """Escape Markdown-special chars inside a table cell."""
    # Normalize line endings -> space (table cells can't contain newlines)
    text = text.replace("\r\n", " ").replace("\r", " ").replace("\n", " ")
    # Escape pipe characters
    text = text.replace("|", "\\|")
    return text


def build_table(headers: list[str], rows: list[list[str]]) -> str:
    """Render a GFM Markdown table from headers + rows."""
    col_count = len(headers)
    # Pad / trim every row to exactly col_count
    padded_rows = [(r + [""] * col_count)[:col_count] for r in rows]

    # Escape all cells
    esc_headers = [escape_md(h) for h in headers]
    esc_rows = [[escape_md(c) for c in r] for r in padded_rows]

    # Column widths for alignment (optional cosmetic step)
    widths = [len(h) for h in esc_headers]
    for r in esc_rows:
        for i, c in enumerate(r):
            widths[i] = max(widths[i], len(c))

    def fmt_row(cells: list[str]) -> str:
        return "| " + " | ".join(c.ljust(widths[i]) for i, c in enumerate(cells)) + " |"

    separator = "| " + " | ".join("-" * w for w in widths) + " |"

    lines = [fmt_row(esc_headers), separator]
    for r in esc_rows:
        lines.append(fmt_row(r))
    return "\n".join(lines)


# Column groups for splitting the 19-column table
# Each group always starts with ID so tables can be joined.
COLUMN_GROUPS = [
    # Part 1 – Core identification
    ["ID", "Work Item Type", "Title", "Assigned To", "State", "Priority", "Severity"],
    # Part 2 – Effort & resolution
    ["ID", "Original Estimate", "Remaining Work", "Completed Work",
     "Sales Budget PG", "Timekeeping PG", "Resolved By", "Resolved Date", "Reason"],
    # Part 3 – Classification & detail
    ["ID", "Tags", "Description", "Iteration Path", "Area Path"],
]

# Columns that often contain date/time values
DATE_COLUMNS = {"Resolved Date"}


def csv_to_markdown(csv_path: Path, md_path: Path) -> None:
    with csv_path.open(encoding="utf-8-sig", newline="") as fh:
        reader = csv.DictReader(fh)
        headers = reader.fieldnames or []
        all_rows: list[dict] = list(reader)

    row_count = len(all_rows)
    col_count = len(headers)
    workbook_name = csv_path.stem

    lines: list[str] = []
    lines.append(f"# {workbook_name}")
    lines.append("")

    # Section heading (single sheet from CSV)
    sheet_name = csv_path.stem
    lines.append(f"## {sheet_name}")
    lines.append("")
    lines.append(f"Rows: {row_count}")
    lines.append(f"Columns: {col_count}")
    lines.append("")

    # Decide whether to split
    if col_count > 10:
        lines.append("*Wide table split into parts for readability. Tables share the ID column.*")
        lines.append("")
        for part_idx, group in enumerate(COLUMN_GROUPS, start=1):
            # Only include columns that actually exist in the CSV
            active_cols = [c for c in group if c in headers]
            if not active_cols:
                continue
            lines.append(f"### Part {part_idx}: {' - '.join(active_cols[1:] if active_cols[0] == 'ID' else active_cols)}")
            lines.append("")
            col_rows: list[list[str]] = []
            for row in all_rows:
                cells = []
                for col in active_cols:
                    val = row.get(col, "") or ""
                    if col in DATE_COLUMNS:
                        val = format_date(val)
                    cells.append(val)
                col_rows.append(cells)
            lines.append(build_table(active_cols, col_rows))
            lines.append("")
    else:
        # Narrow enough — single table
        all_col_rows: list[list[str]] = []
        for row in all_rows:
            cells = []
            for col in headers:
                val = row.get(col, "") or ""
                if col in DATE_COLUMNS:
                    val = format_date(val)
                cells.append(val)
            all_col_rows.append(cells)
        lines.append(build_table(list(headers), all_col_rows))
        lines.append("")

    md_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Written: {md_path}  ({row_count} rows, {col_count} columns)")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: py csv_to_markdown.py <input.csv> <output.md>")
        sys.exit(1)
    csv_to_markdown(Path(sys.argv[1]), Path(sys.argv[2]))
