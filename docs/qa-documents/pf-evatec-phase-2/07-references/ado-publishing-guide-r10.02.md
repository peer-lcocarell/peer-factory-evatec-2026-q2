# PF Evatec R10.02 - Azure DevOps Test Case Publishing Guide

## Overview

This document describes how to create, organize, validate, and publish PF Evatec Phase 2 (R10.02) test cases from the VS Code repository into Azure DevOps Test Plans.

Current Azure DevOps configuration:

Organization: [https://ops1.peergroup.com/DefaultCollection](https://ops1.peergroup.com/DefaultCollection)
Project: PFEvatec

Test Plan:
291616

Root Test Suite:
291617

Plan Name:
PF Evatec - R10.02 - 2026 Q2

---

## Repository Structure

Recommended project structure:

```text
peer-factory-evatec-2026-q2
|
|-- docs
|   `-- qa-documents
|       `-- pf-evatec-phase-2
|           `-- 08-releases
|               `-- r10
|                   `-- r10.2
|                       |-- release-documentation
|                       |   |-- r10.2-change-requests.md
|                       |   `-- r10.2-requirements.md
|                       `-- change-requests
|                           |-- 284111
|                           |   |-- cr-284111.md
|                           |   `-- test-cases
|                           |       |-- TC001.md
|                           |       |-- TC002.md
|                           |       `-- TC003.md
|                           |-- 285729
|                           |   `-- test-cases
|                           |-- 286067
|                           |   `-- test-cases
|                           `-- 286836
|                               `-- test-cases
|
|-- scripts
|   `-- ado
|       |-- invoke-ado-test-case-publish-from-markdown.ps1
|       |-- invoke-ado-suite-publish-from-folder.ps1
|       |-- pf-evatec-ado-publisher.psm1
|       `-- suite-map.json
|
`-- tests
```

---

## Mapping CRs to Test Suites

Current requirements visible in Azure DevOps:

### CR 286067

Tracking of magnet systems in Evatec Fabric  
Ticket #35008

### CR 285729

Search HW components  
Ticket #34951

### CR 286836

Article import  
Ticket #34948

### CR 284111

WBS Element for self-service boxes  
Ticket #34682

### Regression

Regression Test Suite

---

## Creating Test Cases

Every test case should be stored as a markdown file.

Example:

TC001-Verify-WBS-Element-Creation.md

Example content:

```markdown
# TC001 Verify WBS Element Creation

## Preconditions

- Tester is logged into PF Evatec
- Required permissions exist
- Test environment is available

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to Service Request page | Service Request page opens |
| 2 | Create a request | Request is created |
| 3 | Save request | Request is saved |
| 4 | Verify WBS element | Correct WBS element appears |
```

---

## Recommended Naming Convention

### Folder

<CR Number>-test-cases

Examples:

- 284111-test-cases
- 285729-test-cases
- 286067-test-cases
- 286836-test-cases

### File

TC001-Description.md  
TC002-Description.md  
TC003-Description.md

Example:

- TC001-Verify-Article-Import.md
- TC002-Verify-Duplicate-Article-Handling.md
- TC003-Verify-Import-Validation.md

---

## Configuring suite-map.json

Create or update:

scripts/ado/suite-map.json

Template:

```json
{
  "project": "PFEvatec",
  "planId": 291616,
  "rootSuiteId": 291617,
  "suites": {
    "284111": {
      "name": "WBS Element for self-service boxes"
    },
    "285729": {
      "name": "Search HW components"
    },
    "286067": {
      "name": "Tracking of magnet systems in Evatec Fabric"
    },
    "286836": {
      "name": "Article import"
    },
    "Regression": {
      "name": "Regression"
    }
  }
}
```

Once individual suite IDs are known, update:

```json
{
  "284111": {
    "suiteId": 123456
  }
}
```

---

## Publishing a Single Test Case

Navigate to:

```powershell
cd scripts\ado
```

Run:

```powershell
.\invoke-ado-test-case-publish-from-markdown.ps1 `
    -TestCaseMarkdownPath "..\..\docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\change-requests\284111\test-cases\TC001-Verify-WBS-Element-Creation.md"
```

---

## Publishing an Entire CR

Example:

```powershell
.\invoke-ado-suite-publish-from-folder.ps1 `
    -ScenarioFolder "..\..\docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\change-requests\284111\test-cases"
```

---

## Dry Run

Always verify before publishing:

```powershell
.\invoke-ado-suite-publish-from-folder.ps1 `
    -ScenarioFolder "..\..\docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\change-requests\284111\test-cases" `
    -WhatIf
```

Expected outcome:

- No changes published
- Test cases discovered: TC001, TC002, TC003
- Target Plan: 291616
- Target Suite: xxxxx

---

## Recommended Release Workflow

For each CR:

### Step 1

Review CR documentation:

docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/<CR>

### Step 2

Create test cases in:

test-cases

### Step 3

Peer review test cases using checklist:

- Requirement coverage complete
- Preconditions defined
- Expected results included
- Naming follows standard

### Step 4

Dry run validation with -WhatIf.

### Step 5

Publish to ADO.

### Step 6

Validate in Test Plans:

- Test Plan = 291616
- Correct requirement suite
- Correct title
- Correct steps
- Correct expected results

### Step 7

Execute testing.

### Step 8

Update execution status.

Possible outcomes:

- Passed
- Failed
- Blocked
- Not Run

---

## Regression Suite Process

Store regression tests separately.

Example:

```text
docs
`-- qa-documents
    `-- regression
        |-- REG001.md
        |-- REG002.md
        `-- REG003.md
```

Publish to:

Regression Suite

within:

PF Evatec - R10.02 - 2026 Q2

---

## Recommended VS Code Tasks

Create:

.vscode/tasks.json

Example:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Publish CR 284111",
            "type": "shell",
            "command": "powershell",
            "args": [
                "-ExecutionPolicy",
                "Bypass",
                "-File",
                "scripts/ado/invoke-ado-suite-publish-from-folder.ps1",
                "-ScenarioFolder",
                "docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/284111/test-cases"
            ]
        }
    ]
}
```

Run from:

Terminal -> Run Task -> Publish CR 284111

---

## Release Readiness Checklist

- [ ] CR documentation reviewed
- [ ] Requirements mapped
- [ ] Test cases created
- [ ] Test cases reviewed
- [ ] Dry run completed
- [ ] ADO publish completed
- [ ] Test cases visible in Test Plan 291616
- [ ] Execution complete
- [ ] Results reviewed
- [ ] Regression suite executed
- [ ] Release sign-off complete

This structure aligns your Phase 2 repository, markdown test cases, ADO publishing scripts, and Azure DevOps Test Plan 291616 into a repeatable workflow that can be used for all future R10.02 CRs.
