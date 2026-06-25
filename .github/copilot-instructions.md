# GitHub Copilot Instructions

## Project Overview

This repository is the QA and test-planning hub for PEER Factory Evatec Phase 2.

Primary goal:
- Create release test plans
- Create manual test cases in Markdown
- Maintain requirements traceability
- Publish test cases into Azure DevOps Test Plans

Key release area:
- docs/pf-evatec-phase-2/r10/r10-2/

Current Release:
- R10.2

Primary CRs:

- 286067 - Tracking of Magnet Systems in Evatec Fabric
- 285729 - Search HW Components
- 286836 - Article Import
- 284111 - WBS Element for Self-Service Boxes
- 290161 - PDT Tool Definition Patch (already validated

Highest QA risk:
- CR 286067 Magnet Systems

---

## Repository Structure

docs/
    overview.md
    pf-evatec-phase-2/
        r10/
            r10-2/
                r102-crs.md

resources/
    mini-software-test-plans/

testdata/
    Scenarios/

scripts/
    ado/

test-utility/

---

## Test Case Authoring Standards

When generating test cases:

- Write from a tester perspective.
- Use clear business language.
- Avoid implementation details unless required.
- Focus on customer workflows and validation.
- Cover happy path, negative path, validation, permissions, and data integrity scenarios.
- Ensure full requirement traceability.

Always include:

# Test Case Title

## Requirement

Requirement ID or CR reference.

## Preconditions

- Item
- Item

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Action | Expected Result |

## Expected Outcome

Short summary.

---

## Markdown Format Requirements

The ADO publishing utility relies on strict Markdown parsing.

Required sections:

1. First heading must be:

# Test Case Title

2. Preconditions section:

## Preconditions

- Condition 1
- Condition 2

3. Steps table:

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Perform action | Verify result |

Do not generate alternative table formats.

Do not omit headers.

Do not use HTML tables.

---

## Azure DevOps Publishing

Test cases are authored as Markdown and then published to Azure DevOps.

Publishing flow:

Markdown Test Case
    ->
PowerShell Publisher
    ->
ADO Publish Utility
    ->
Azure DevOps Test Plan
    ->
Azure DevOps Test Suite

The publisher converts the Markdown table into Azure DevOps step XML.

Copilot should always generate Markdown compatible with automated publishing.

---

## Azure DevOps Metadata

Default values:

Org URL:
[https://ops1.peergroup.com/DefaultCollection](https://ops1.peergroup.com/DefaultCollection)

Project:
PFEvatec

API Version:
7.1

Publishing utility should support:

- Create Test Case
- Update Existing Test Case
- Add Test Case to Suite
- Bulk Publish Folder

---

## Test Case Naming

Use names that begin with:

[CR ID] Feature Name - Scenario

Examples:

286067 Magnet Systems - Create New Magnet
286067 Magnet Systems - Return Installed Magnet
286067 Magnet Systems - Prevent Duplicate Article Number
285729 Hardware Search - Search by Serial Number

---

## Requirement Traceability

Every test case should reference:

- CR ID
- Ticket Number
- Requirement Identifier (if available)

Example:

CR: 286067
Ticket: 35008

---

## Magnet Systems Guidance

For CR 286067 generate coverage for:

Lifecycle:
- Create
- Checkout
- Return
- Install
- Uninstall
- Retire

Validation:
- Unique article numbers
- Required fields
- Invalid status transitions

History:
- Audit records
- Export data
- Searchability

Migration:
- Existing hardware components
- Legacy records

Promotion:
- Standard to Prototype
- Prototype to Standard

Cross-module validation:
- Hardware Configuration
- Logbook
- History
- Export

This CR has the highest testing priority.

---

## Search Component Guidance

For CR 285729 generate coverage for:

- Search by name
- Search by serial number
- Search by partial value
- Search after edits
- Search after refresh
- No results handling
- Performance validation

---

## Article Import Guidance

For CR 286836 generate coverage for:

- Valid import
- Invalid import
- Duplicate records
- Missing required fields
- BOM import
- Work Order import
- HW Component import
- Partial import disabled validation

---

## WBS Element Guidance

For CR 284111 generate coverage for:

- Create self-service box
- Edit WBS element
- Save validation
- Display validation
- Search/filter behavior
- Reporting impact

---

## Copilot Behavior

When asked to create tests:

1. Identify the CR.
2. Generate requirement coverage.
3. Create Markdown following the required publishable format.
4. Ensure ADO compatibility.
5. Include positive and negative tests.
6. Avoid duplicate coverage.
7. Prefer business workflows over UI-only validation.

When asked to create a suite:

- Generate one Markdown file per test case.
- Suggest filename format:

001-create-magnet.md
002-install-magnet.md
003-return-magnet.md

Files should be sortable by numeric prefix for bulk publishing.

---

## Future Publishing Utility

Assume scripts under:

scripts/ado/

Expected commands:

- invoke-ado-test-case-publish-from-markdown.ps1
- invoke-ado-suite-publish-from-folder.ps1

Generated Markdown must remain compatible with these scripts.

---

## Azure DevOps Test Management

Project:
PFEvatec

Default Org URL:
https://ops1.peergroup.com/DefaultCollection

Default Test Plan:
291616

Default Target Suite:
291617 (Requirements)

Requirement Suites:

- 286067 | Ticket #35008 | Tracking of magnet systems in Evatec Fabric
- 285729 | Ticket #34951 | Search HW components
- 286836 | Ticket #34948 | Article import
- 284111 | Ticket #34682 | WBS Element for self-service boxes

When generating test cases:

- Identify the correct CR.
- Associate the test case with the matching requirement suite.
- Generate ADO-ready markdown.
- Ensure titles are unique.
- Include requirement traceability.
- Cover positive and negative scenarios.
- Generate one markdown file per test case.

Test Case Title Format:

[CR-ID] Feature - Scenario

Examples:

286067 Magnet Systems - Create Magnet Record
286067 Magnet Systems - Install Magnet
286067 Magnet Systems - Retire Magnet
285729 Search HW Components - Search By Serial Number
286836 Article Import - Import Valid Article
284111 Self-Service Box - Update WBS Element

---

## ADO Publishing Workflow

Test cases are created in Markdown.

Markdown files must be compatible with:

- scripts/ado/invoke-ado-test-case-publish-from-markdown.ps1
- scripts/ado/invoke-ado-suite-publish-from-folder.ps1

The publishing process should:

1. Create or update Azure DevOps Test Cases.
2. Add Test Cases to Test Plan 291616.
3. Add Test Cases to the appropriate requirement suite.
4. Preserve title, preconditions, steps, and expected results.

---

## Requirement-to-Suite Mapping

CR 286067 - Tracking of Magnet Systems in Evatec Fabric

Coverage Areas:
- Create magnet
- Checkout magnet
- Return magnet
- Install magnet
- Uninstall magnet
- Retire magnet
- Standard to Prototype
- Prototype to Standard
- Article number validation
- History tracking
- Export validation
- Migration validation

CR 285729 - Search HW Components

Coverage Areas:
- Search by name
- Search by article number
- Search by serial number
- Partial search
- No-match search
- Search after modification

CR 286836 - Article Import

Coverage Areas:
- Valid import
- Invalid import
- Duplicate import
- BOM import
- Work order import
- Missing required fields

CR 284111 - WBS Element for Self-Service Boxes

Coverage Areas:
- Create box
- Edit WBS element
- Save validation
- Display validation
- Reporting validation
