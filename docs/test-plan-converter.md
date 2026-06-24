# Test Plan Converter Guide

## What It Does

The converter reads Excel test-plan workbooks and emits one markdown file per workbook.

Input:

- resources/test-cases/*.xlsx

Output:

- resources/test-cases-parsed/*.md

Script:

- test-utility/convert_excel_testplans_to_markdown.py

## Prerequisites

- Windows PowerShell (recommended)
- Python 3.10+
- openpyxl

Install dependency:

```powershell
py -m pip install openpyxl
```

## Run

From repository root:

```powershell
py .\test-utility\convert_excel_testplans_to_markdown.py
```

## Conversion Behavior

For each workbook, the converter:

1. Reads all worksheets.
2. Detects metadata/header/content regions.
3. Writes structured markdown sections.
4. Preserves data-oriented output for traceability.

Typical section layout per worksheet:

- Overview
- Metadata (when detected)
- Content section such as Test Cases, Requirements, Test Execution, or Data
- Notes (if Excel comments exist)
- Merged Cells (if present)

## Naming Convention

Output names are normalized to:

- <WorkbookName>-TestPlan.md

with cleanup of common suffix patterns.

## Troubleshooting

- python not found:
  - Use py on Windows.
- Missing dependency:
  - Re-run py -m pip install openpyxl.
- No files converted:
  - Verify .xlsx files exist under resources/test-cases/.

## Typical Workflow

1. Add or update source workbooks in resources/test-cases/.
2. Run converter script.
3. Review markdown output in resources/test-cases-parsed/.
4. Commit source and regenerated output together when appropriate.
