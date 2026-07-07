# PEER Factory Evatec — QA Hub (R10.2 / 2026 Q2)

[![Release](https://img.shields.io/badge/Release-R10.2-blue)]()
[![ADO Project](https://img.shields.io/badge/ADO-PFEvatec-0078d7)]()
[![Playwright](https://img.shields.io/badge/E2E-Playwright-45ba4b)]()
[![PowerShell](https://img.shields.io/badge/Scripts-PowerShell%205.1%2B-5391FE)]()

---

## Overview

This repository is the QA and test-planning hub for **PEER Factory Evatec Phase 2**, Release R10.2 (2026 Q2).

It centralizes:

- Manual test case authoring in Markdown
- Automated publishing of test cases into Azure DevOps Test Plans
- Playwright-based end-to-end regression automation
- Release documentation, change request tracking, and traceability
- Bug trend analysis and QA reporting
- QA environment and operations guidance

**Customer:** Evatec AG, Hauptstrasse 1a, 9477 Trübbach, Switzerland
**ADO Organization:** `https://ops1.peergroup.com/DefaultCollection`
**ADO Project:** `PFEvatec`

---

## Current Release — R10.2

| CR | Ticket | Description | Priority |
|----|--------|-------------|----------|
| 286067 | #35008 | Tracking of Magnet Systems in Evatec Fabric | P1 — Highest Risk |
| 285729 | #34951 | Search HW Components | P2 |
| 286836 | #34948 | Article Import | P3 |
| 284111 | #34682 | WBS Element for Self-Service Boxes | P4 |
| 290161 | #35623 | PDT Tool Definition Patch | Pre-validated |

Release documentation: [docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/release-documentation/](docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/release-documentation/)

---

## Repository Structure

```text
peer-factory-evatec-2026-q2/
├── .github/
│   ├── copilot-instructions.md          # Copilot QA authoring standards
│   ├── agents/                          # Custom Copilot agent definitions
│   ├── prompts/                         # Reusable Copilot prompt files
│   ├── skills/                          # QA skill definitions
│   └── workflows/                       # Workflow definitions
├── docs/
│   └── qa-documents/
│       └── pf-evatec-phase-2/
│           ├── 00-project-overview/     # Domain reference, kickoff summary
│           ├── 01-requirements/         # Scope and change summaries
│           ├── 02-planning/             # CR plan, STP outline, estimates
│           ├── 03-testing/
│           │   ├── estimates/           # QA effort estimates
│           │   ├── test-cases/          # Historical test plans (R6–R10)
│           │   ├── test-plans/          # Test plan documents
│           │   └── test-assets/         # Supporting test assets
│           ├── 04-environment/          # IIS, DB, Playwright setup guides
│           ├── 05-operations/           # PTO ops, release deployment
│           ├── 06-automation/           # Converter guides and tools
│           ├── 07-references/           # ADO publishing guide, source files
│           ├── 08-releases/
│           │   └── r10/r10.2/
│           │       ├── change-requests/ # Per-CR test cases (by CR ID)
│           │       ├── release-documentation/
│           │       └── project-logs/
│           ├── 09-templates/            # Reusable document templates
│           └── 10-bug-audit/            # Bug trend reports and analysis
├── scripts/
│   └── ado/                             # ADO publishing PowerShell scripts
│       ├── pf-evatec-ado-publisher.psm1
│       ├── invoke-ado-test-case-publish-from-markdown.ps1
│       ├── invoke-ado-suite-publish-from-folder.ps1
│       ├── suite-map.json
│       └── README.md
├── test-utility/                        # Python Excel-to-Markdown converter
├── tests/
│   └── automated-tests/PFEvatec.E2E/   # Playwright E2E regression suite
└── README.md
```

---

## Prerequisites

| Tool | Version | Purpose |
|------|---------|---------|
| Node.js | 18+ | Playwright test runner |
| Python | 3.9+ | Excel test plan converter |
| PowerShell | 5.1+ | ADO publishing scripts |
| Azure DevOps PAT | — | Publishing to ADO |

---

## Installation

### 1. Clone the repository

```powershell
git clone <repository-url>
cd peer-factory-evatec-2026-q2
```

### 2. Install Playwright dependencies

```powershell
npm ci
npx playwright install
```

### 3. Install Python converter dependency

```powershell
py -m pip install openpyxl
```

### 4. Configure ADO credentials

```powershell
$env:AZURE_DEVOPS_PAT = '<your-pat>'
```

The PAT requires:
- Work Items — Read, write & manage
- Test Management — Read & write

---

## Configuration

### ADO Publishing defaults (`scripts/ado/suite-map.json`)

```json
{
  "planId": 291616,
  "defaultSuiteId": 291617,
  "crSuiteIds": {
    "286067": null,
    "285729": null,
    "286836": null,
    "284111": null
  }
}
```

Update `crSuiteIds` values with the actual child suite IDs before bulk publishing.

### Playwright E2E configuration

Edit `tests/automated-tests/PFEvatec.E2E/configuration/config.json` to set:
- `testingUrl` — target application URL
- `environmentTesting` — environment name
- `userNameQA3` — test user credentials

---

## Running Tests

### Playwright E2E Regression Suite

```powershell
cd tests/automated-tests/PFEvatec.E2E
npx playwright test
```

Run a specific spec:

```powershell
npx playwright test e2e-tests/create-new-box.spec.js
```

View the HTML report after a run:

```powershell
npx playwright show-report
```

### Root-level Playwright (smoke)

```powershell
npx playwright test
```

---

## Authoring Test Cases

Test cases are authored as Markdown and published directly to Azure DevOps.

### Test case format

```markdown
# [CR-ID] Feature - Scenario

## Requirement

CR: 286067  Ticket: 35008

## Preconditions

- Logged in as Tech User
- Magnet System Type "Standard" exists

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1    | Open Magnet Systems page | List loads |
| 2    | Click "New Magnet"       | Create dialog opens |

## Expected Outcome

A new Magnet record is created and visible in the list.
```

Store test cases under:

```text
docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/<CR-ID>/test-cases/
```

Naming convention:

```text
001-create-magnet.md
002-install-magnet.md
003-return-magnet.md
```

---

## Publishing Test Cases to Azure DevOps

### Publish a single test case

```powershell
cd scripts/ado
.\invoke-ado-test-case-publish-from-markdown.ps1 `
  -MarkdownPath "..\..\docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\change-requests\286067\test-cases\001-create-magnet.md"
```

### Bulk publish a folder

```powershell
cd scripts/ado
.\invoke-ado-suite-publish-from-folder.ps1 `
  -FolderPath "..\..\docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\change-requests\286067\test-cases"
```

See [scripts/ado/README.md](scripts/ado/README.md) for full parameter reference.

---

## Converting Excel Test Plans to Markdown

```powershell
py .\test-utility\convert_excel_testplans_to_markdown.py
```

Output is written to the configured output path. See the converter guide:
[docs/qa-documents/pf-evatec-phase-2/06-automation/converters/](docs/qa-documents/pf-evatec-phase-2/06-automation/converters/)

---

## Bug Trend Analysis

Generate an HTML bug trend report from the bug data file:

```powershell
cd scripts/ado
.\generate-bug-trend-html.ps1
```

Source data and reports: [docs/qa-documents/pf-evatec-phase-2/10-bug-audit/](docs/qa-documents/pf-evatec-phase-2/10-bug-audit/)

---

## Documentation Index

| Document | Purpose |
|----------|---------|
| [Project Overview](docs/qa-documents/pf-evatec-phase-2/00-project-overview/project-overview.md) | Project context and purpose |
| [Domain Reference](docs/qa-documents/pf-evatec-phase-2/00-project-overview/domain-reference.md) | Business domain terminology |
| [Change Request Plan](docs/qa-documents/pf-evatec-phase-2/02-planning/change-request-plan.md) | CR estimates and QA approach |
| [Mini STP Outline](docs/qa-documents/pf-evatec-phase-2/02-planning/mini-stip-outline.md) | Simplified test plan |
| [QA Environment Setup](docs/qa-documents/pf-evatec-phase-2/04-environment/qa-environment-setup.md) | IIS, SQL, PF Evatec setup |
| [Playwright Setup](docs/qa-documents/pf-evatec-phase-2/04-environment/playwright-setup.md) | E2E test environment setup |
| [Infrastructure and Links](docs/qa-documents/pf-evatec-phase-2/04-environment/infrastructure-and-links.md) | VMs, URLs, system access |
| [Release Deployment](docs/qa-documents/pf-evatec-phase-2/05-operations/release-deployment.md) | Deployment procedures |
| [PTO Operations](docs/qa-documents/pf-evatec-phase-2/05-operations/pto-operations.md) | PTO operational guidance |
| [ADO Publishing Guide](docs/qa-documents/pf-evatec-phase-2/07-references/ado-publishing-guide-r10.02.md) | Full ADO publishing reference |
| [R10.2 Release Docs](docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/release-documentation/) | Requirements, change requests |
| [Bug Audit](docs/qa-documents/pf-evatec-phase-2/10-bug-audit/) | Historical bugs, trend reports |
| [ADO Scripts README](scripts/ado/README.md) | Publishing script reference |

---

## QA Workflow

```text
1. Review CR requirements
      ↓
2. Author Markdown test cases (Copilot-assisted)
      ↓
3. Store under change-requests/<CR-ID>/test-cases/
      ↓
4. Validate format (preconditions + steps table)
      ↓
5. Publish to ADO (single or bulk)
      ↓
6. Execute tests in ADO Test Plan 291616
      ↓
7. Log defects in Azure DevOps
      ↓
8. Run Playwright E2E regression
      ↓
9. Generate bug trend report
```

---

## Copilot Integration

This repository includes custom GitHub Copilot instructions tuned for QA authoring:

- [.github/copilot-instructions.md](.github/copilot-instructions.md) — primary QA standards
- [.github/agents/](.github/agents/) — custom agent definitions
- [.github/prompts/](.github/prompts/) — reusable prompt files

Ask Copilot to generate test cases by specifying the CR ID. Copilot will:
- Match the established test case style
- Generate ADO-publishable Markdown
- Cover happy path, negative, and edge case scenarios
- Assign correct suite mapping

---

## Support

- QA Lead: see [Infrastructure and Links](docs/qa-documents/pf-evatec-phase-2/04-environment/infrastructure-and-links.md)
- ADO Project: [https://ops1.peergroup.com/DefaultCollection/PFEvatec](https://ops1.peergroup.com/DefaultCollection/PFEvatec)
- VM Inventory: https://vmlist.peergroup.com/

---

## License

Internal use only. See project effort code `3631EV-P PF Eng Hours`.
