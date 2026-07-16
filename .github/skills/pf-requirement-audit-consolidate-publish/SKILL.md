---
name: pf-requirement-audit-consolidate-publish
description: 'Audit requirement-level markdown test cases against requirement text, prioritize updating and consolidating existing tests, create new tests only when clearly justified, update req-*-audit.md coverage mapping, and optionally run safe ADO publish with numeric file filtering and dry-run first. Use for requirement coverage audits, test suite minimization, consolidation, and controlled republish.'
argument-hint: 'Requirement folder path, optional PlanId, optional SuiteId, and whether to publish'
user-invocable: true
disable-model-invocation: false
---

# PF Requirement Audit Consolidate Publish

## Outcome
Produce a requirement-scoped QA result with minimal test-suite growth:
- Existing test cases are updated first
- Overlapping cases are consolidated where practical
- New test cases are created only when coverage cannot be maintained cleanly in existing files
- req-*-audit.md is updated with clause mapping, gaps, and recommendations
- Optional ADO publish is performed safely with deterministic file targeting

## When to Use
- Requirement folder contains numbered test cases and an audit markdown file
- User asks to audit against requirement text and close coverage gaps
- User asks to reduce duplicate or out-of-scope test cases
- User asks to republish updated tests safely to ADO

## Inputs
- Requirement folder path
- Requirement text source, usually inside req-*-audit.md
- Optional PlanId
- Optional SuiteId
- Publish mode: dry-run only or dry-run then live publish

## Procedure
1. Pre-execution estimate
- Provide realistic estimates for token usage, files searched, files read, and credit impact
- Provide at least three cost reduction options
- Recommend model tiers with brief reasons

2. Inventory and traceability scan
- Read all markdown files in the requirement folder
- Separate numbered test case files from req-*-audit.md
- Identify out-of-scope or overlapping test cases

3. Requirement clause extraction
- Parse requirement text into explicit clauses
- Capture mandatory fields, permissions, side effects, and history/audit expectations

4. Coverage mapping
- Map each clause to current test cases with status Full, Partial, or Missing
- Record evidence at scenario level, not title level

5. Consolidation-first rewrite
- Update existing test cases before creating any new files
- Repurpose out-of-scope tests when they can be converted to missing required coverage
- Merge overlapping flows by improving steps and expected results
- Keep titles unless explicit rename is requested

6. New test case decision gate
- Create a new test file only if all are true:
  - Required coverage cannot be added to an existing case without excessive complexity
  - The scenario is a distinct workflow, risk area, or validation class
  - Traceability and maintainability improve by separation
- If gate fails, update existing files instead

7. Audit file update
- Update req-*-audit.md with:
  - Status
  - Existing Test Cases summary
  - Requirement Clause Mapping
  - Coverage Gaps
  - Recommendations
  - Notes
- Explicitly state whether coverage is design-time only or execution-validated

8. Optional safe publish
- If publish is requested, run dry-run first
- Enforce numeric filter to exclude audit and non-test markdown
- Use explicit plan and suite when provided
- Stop on first publish failure and ask user before retrying

9. Publish command pattern
- Dry-run:
  - ./scripts/ado/invoke-ado-suite-publish-from-folder.ps1 -Path "<requirement-folder>" -Filter "0*.md" -PlanId <plan-id> -SuiteId <suite-id> -WhatIf
- Live:
  - ./scripts/ado/invoke-ado-suite-publish-from-folder.ps1 -Path "<requirement-folder>" -Filter "0*.md" -PlanId <plan-id> -SuiteId <suite-id>

10. Completion checks
- No unnecessary new test files were created
- Every requirement clause maps to at least one test case
- Audit file is updated and internally consistent
- If published, results include per-file status and test case IDs

## Decision Logic
- If a current file can be updated to cover a missing clause without becoming brittle, update it
- If two files cover the same intent with minor variation, consolidate one by repurposing the other
- If a scenario introduces a separate permission boundary, cancellation path, or cross-entity propagation, keep it as a distinct case only when needed for clarity
- If PlanId and SuiteId are provided for publish, force target to those values

## Quality Criteria
- Steps are measurable and deterministic
- Expected results validate observable behavior and required data tokens
- Permissions and negative paths are covered where required
- History or audit statements validate required fields and details
- No semicolons in test case prose

## Output Contract
- Pre-Execution Estimate
- Cost Reduction Plan
- Recommended Model
- QA Audit Output
- Optional Publish Result Summary

## Related Skills
- ../pf-test-case-rewrite-preserve-title/SKILL.md
- ../pf-ado-suite-publish-safe/SKILL.md
