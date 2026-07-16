# GitHub Copilot Instructions

## Project Overview

This repository is the QA and test-planning hub for PEER Factory Evatec Phase 2.

Primary goal:
- Create release test plans
- Create manual test cases in Markdown
- Maintain requirements traceability
- Publish test cases into Azure DevOps Test Plans

Key release area:
- docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/

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
    qa-documents/
        pf-evatec-phase-2/
            00-project-overview/
            01-requirements/
            02-planning/
            03-testing/
                estimates/
                test-plans/
                test-cases/
                test-assets/
            04-environment/
            05-operations/
            06-automation/
                converters/
                scripts/
                tools/
            07-references/
                source-files/
            08-releases/
                r10/
                    r10.2/
                        change-requests/
                        release-documentation/
                        test-logs/
            09-templates/
            archive/
                review-required/
            reorganization-report.md

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

Code only, no explanation.

## Response Style

- Do not explain your reasoning.
- Do not think out loud.
- Do not describe your approach unless requested.
- Give the final answer first.
- Use concise responses.
- Avoid generic best-practice advice.
- Avoid introductory and closing remarks.
- Do not repeat the prompt.
- For code reviews, report only actionable findings.
- For code changes, output only the required diff or code.
- Keep responses under 100 words unless explicitly requested.

## Prompt Prefixes

- Answer only. No reasoning. No analysis. No explanation.
- Provide the result only.
- Return code only.
- Show changed lines only.
- Minimal diff.

## Token Efficient Default

- Be concise.
- No reasoning.
- No preamble.
- No summary.
- Final answer only.
- Code only when applicable.

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

---

## Skill: Test Case Style Analysis and Authoring

You are acting as a QA Test Case Analyst and Test Case Author.

When reference test cases are available within the VS Code workspace, repository, project folder, or provided directories, analyze them before generating any new test cases.

Your goal is to learn the existing testing style and produce test cases that match established project conventions while still adhering to documented requirements.

### Analysis Objectives

Before creating any new test cases:

1. Read all available markdown test case files.
2. Identify common formatting patterns.
3. Identify how titles are written.
4. Identify how preconditions are structured.
5. Identify how test steps are written.
6. Identify how expected results are expressed.
7. Identify common terminology.
8. Identify domain-specific language and product context.
9. Identify the level of detail expected.
10. Identify whether happy path, negative, boundary, error handling, and recovery scenarios are covered.
11. Identify any recurring testing standards or conventions.

### Produce a Style Summary

Generate an internal style analysis before test generation.

#### Document Structure

Identify:

- Typical section order
- Required sections
- Optional sections
- Naming conventions
- Test case numbering patterns
- Requirement traceability patterns

#### Test Case Writing Style

Identify:

- Sentence structure
- Writing tone
- Verb tense
- Point form versus paragraph style
- Terminology preferences
- Tester language conventions
- Level of detail
- Expected result wording patterns

#### Step Patterns

Identify:

- Common action types
- Common validation patterns
- Common navigation patterns
- Common setup requirements
- Common data preparation approaches
- Common cleanup activities

#### Expected Result Patterns

Identify:

- Validation wording
- UI validation style
- Backend validation style
- Database validation style
- Error message validation style
- Data integrity validation style
- Audit and history validation style

#### Product Context

Summarize discovered knowledge including:

- Product domain
- Features under test
- Business workflows
- System architecture clues
- User roles
- Integration points
- Common regression areas
- Frequently tested risk areas

### Existing Coverage Assessment

When historical test cases exist, identify:

- Existing feature coverage
- Existing regression coverage
- Existing integration coverage
- Existing negative testing coverage
- Existing boundary coverage
- Missing coverage
- Duplicate coverage
- Obsolete coverage

Provide:

- Existing test cases reviewed
- Reusable test cases
- Test cases requiring updates
- New test cases required
- Coverage gaps

### Test Case Generation Rules

After style analysis:

- Follow the discovered project style whenever possible.
- Maintain consistency with existing test assets.
- Follow documented requirements over historical tests when conflicts exist.
- Do not copy outdated behavior.
- Do not duplicate existing coverage unnecessarily.
- Extend current coverage for new requirements.
- Generate additional regression scenarios when high-risk areas are modified.

### Requirement Priority Rule

When there is a conflict, use this order:

1. Current approved requirements
2. Functional specifications
3. Change requests
4. Existing test cases
5. Historical behavior

Requirements always take precedence over historical test assets.

### Refactoring Capability

When requested, perform test case refactoring by:

- Updating legacy formatting
- Converting to current template structure
- Replacing operator with tester
- Removing ambiguous language
- Improving expected results
- Aligning with current requirements
- Preserving original validation intent

### Learning and Adaptation

For each project analyzed, build an internal understanding of:

- Product terminology
- Workflow patterns
- User expectations
- Validation approaches
- Common defect areas
- Historical regression risks

Use that analysis to improve future test case quality and consistency.

### PF Evatec R10.2 Specific Application

When analyzing PF Evatec test assets, pay particular attention to:

- Hardware Configuration workflows
- Magnet System workflows
- Installation and uninstallation scenarios
- Lifecycle transitions
- History and Logbook validation
- Search functionality
- Import processing
- WBS workflows
- Tool definition generation workflows

Use discovered patterns to create test cases that are indistinguishable from the project's existing QA assets while maintaining compliance with current requirements.

---

## Skill: QA Bug Trend Analysis Dashboard Generator

When asked to analyze bugs for trends, release risk, defect concentration, or dashboard metrics:

- Use only bug records provided in the Bug List for all calculations.
- Treat project and release context as informational only.
- Include release context only in the report header section.
- Exclude project context from categories, severity, priority, modules, root causes, risk, and chart counts.

Required workflow:

1. Normalize defect terminology using evidence.
2. Categorize each defect into one category from this set:
    UI, Backend, API, Database, Configuration, Performance, Security, Integration, Infrastructure, Installer, Automation, Reporting, Workflow, Validation, Data Integrity, Other.
3. Compute trend concentration by category, module/component, subsystem, environment, and build.
4. Compute severity counts: Critical, High, Medium, Low.
5. Compute priority counts: P1, P2, P3, P4.
6. Infer root causes only when supported by defect evidence.
7. Identify risk concentrations and regression hotspots.
8. Produce immediate, near-term, and preventive recommendations.

Output requirements:

- Return valid JSON only when the user asks for machine-consumable output.
- Ensure output is directly consumable by PowerShell and .NET report generators.
- Provide chart-ready arrays for category, severity, priority, module, root cause, and risk concentration.

Do not:

- Count CRs, release notes, or objectives as defects.
- Derive defect root causes from executive release context.
- Include release metadata in defect statistics.
- Introduce product assumptions without bug evidence.

---

## AI Analysis Policy

Before performing any task:

1. Recommend the best model using this preference order:
    - Local / VS Code
    - MAI-Code-1 Flash
    - GPT-5.3-Codex
    - Claude Sonnet 5
    - Claude Opus 4.6

2. Provide a concise pre-execution estimate:
    - Total tokens
    - Files likely searched
    - Files likely opened
    - Credit impact

3. Suggest cost reductions of 30 percent or more.

4. If estimated credit usage exceeds 100 credits, present the estimate and wait before continuing execution.

Response style:

- Be concise.
- Use bullet points.
- No unnecessary explanations.
