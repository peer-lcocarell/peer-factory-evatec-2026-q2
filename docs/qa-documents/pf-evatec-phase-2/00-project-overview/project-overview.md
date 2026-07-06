# PEER Factory Evatec Q2 2026

## Purpose

This repository is a working hub for PEER Factory Evatec Phase 2 QA and test-plan conversion activities.

It combines:

- Test-plan conversion utilities and generated outputs.
- Environment setup and operations notes.
- QA and PTO operational guidance.

## Project Context

- Customer: Evatec AG, Hauptstrasse 1a, 9477 Truebbach, Switzerland
- Time zone: Central European Summer Time (GMT+2)
- Primary effort code: 3631EV-P PF Eng Hours

## Workspace Contents

- resources/test-cases/
  - Source Excel test plans (.xlsx)
- resources/test-cases-parsed/
  - Generated markdown test plans
- test-utility/
  - Conversion script: convert_excel_testplans_to_markdown.py
- docs/
  - Documentation split by topic
- .github/agents/
  - Custom QA agent definitions
- pf-2026-q2.code-workspace
  - VS Code workspace file

## Quick Start

1. Install converter dependency:

```powershell
py -m pip install openpyxl
```

2. Run conversion:

```powershell
py .\test-utility\convert_excel_testplans_to_markdown.py
```

3. Read focused docs from this folder:

- test-plan-converter.md
- release-deployment.md
- qa-environment-setup.md
- pto-operations.md
- domain-reference.md
- playwright-setup.md
