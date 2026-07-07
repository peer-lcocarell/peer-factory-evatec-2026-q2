# PEER Factory Evatec Q2 2026

## Purpose

This repository is the working hub for PEER Factory Evatec Phase 2 QA planning, test authoring, and publication support.

It combines:

- QA planning and release documentation
- Manual test cases in publish-ready Markdown
- Azure DevOps publishing scripts and utilities
- Environment setup and operations notes

## Project Context

- Customer: Evatec AG, Hauptstrasse 1a, 9477 Truebbach, Switzerland
- Time zone: Central European Summer Time (GMT+2)
- Primary effort code: 3631EV-P PF Eng Hours
- Current release focus: R10.2

## Scope Focus (R10.2)

Primary change requests:

- 286067 - Tracking of Magnet Systems in Evatec Fabric
- 285729 - Search HW Components
- 286836 - Article Import
- 284111 - WBS Element for Self-Service Boxes
- 290161 - PDT Tool Definition Patch (validated)

Highest QA risk area:

- CR 286067 (Magnet Systems)

## Magnet Systems Summary

Magnet Systems are modeled similarly to Target Types:

- Magnet System Type: configuration definition
- Magnet System: actual item using a Magnet System Type
- Multiple Magnet Systems can reference the same Standard or Prototype type

Core user functionality includes:

- Create, view, edit, delete
- List view and document management
- Security permissions and read-only behavior
- Checkout and return workflows
- Install, uninstall, and replace in Hardware Configuration

Prototype behavior includes:

- New types default to Standard
- Prototypes can be created from Standard or existing Prototype types
- Prototypes use temporary unique article numbers in External ID
- Prototype article numbers must not match existing Hardware Component article numbers
- Variant codes are used (for example V01, V02, V03)
- Promotion Prototype -> Standard does not create a new type

Hardware and history impacts include:

- New Hardware Component Role Type: Magnet System
- Requires Serial Number is always Yes and not editable
- New Magnet System logbook category/filter
- Installation creates Magnet System history records
- Hardware Component used for Magnet System Type must not remain available as Target Type

## Key QA Use Case

- Convert an existing Hardware Component already installed/associated with tools into a Magnet System flow and validate end-to-end behavior:
  - associations
  - install/uninstall behavior
  - history/logbook entries
  - export behavior
  - hardware configuration integrity

## Domain Reference (Core Objects)

Predefined Types:

- Used for key entities such as boxes, modules, and tool-related types
- Typical rights: PredefinedValue_View, PredefinedValue_Edit

Boxes:

- Create/edit, print labels, upload documents, controlled remove reasons
- Typical rights: Boxes_View, Boxes_Edit

Substrates:

- History review, stage matching, collections, exports
- Typical rights: Substrates_View

Stage Matching:

- Automatic or manual matching
- Tool and metrology sequence dependent
- Requires meaningful processing and/or measurement history

## Repository Pointers

- QA documents: `docs/qa-documents/pf-evatec-phase-2/`
- Test plans and test cases: `docs/qa-documents/pf-evatec-phase-2/03-testing/`
- Release assets (R10.2): `docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/`
- ADO scripts: `scripts/ado/`
- Conversion utilities: `test-utility/`

## Quick Start

1. Install converter dependency:

```powershell
py -m pip install openpyxl
```

2. Run conversion utility:

```powershell
py .\test-utility\convert_excel_testplans_to_markdown.py
```

3. Review detailed references:

- `domain-reference.md`
- `project-kickoff-summary.md`
- `qa-environment-setup.md`
- `playwright-setup.md`
- `release-deployment.md`


