---
mode: ask
name: qa-audit-test-cases-against-requirements
description: "Audit test cases against requirements for coverage, gaps, quality, and redundancy."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA - Audit Test Cases Against Requirements

## Metadata
- **Difficulty**: Intermediate
- **Estimated Time**: 15-30min
- **Prerequisites**: Requirement IDs and test case IDs are available
**Tags:** #intermediate #qa #test-cases #traceability #analysis #copilot
- **Last Updated**: 2026-07-10
- **Version**: 1.0

## Objective
Review test cases against requirements and return deterministic, actionable findings on coverage, gaps, clarity, and overlap.

## Prompt Template

```text
You are acting as an experienced QA lead auditing test cases for alignment with stated requirements.

Task:
For each test case, evaluate and document:
1. Coverage Status (Yes/Partial/No)
2. Identified Gaps (missing conditions, edge cases, unclear steps)
3. Improvement Actions (specific recommendations)
4. Overlap Notes (duplicate or significant overlap with another test)

Inputs:
Requirements:
[INSERT_REQUIREMENTS_HERE]

Test Cases:
[INSERT_TEST_CASES_HERE]

Optional Context:
[INSERT_CONTEXT_HERE]

Constraints:
- Be explicit and deterministic.
- Do not assume missing facts.
- If a requirement has no mapped test case, report it explicitly as uncovered.
- If a test case has no mapped requirement, report it as orphaned.
- Keep findings concise, specific, and actionable.

Output format:
1. Coverage Audit Table
Columns: Test Case ID | Requirement ID(s) | Coverage Status (Yes/Partial/No) | Gaps/Issues | Recommended Improvements | Overlap Notes

2. Uncovered Requirements
- List requirement IDs that have no sufficient test coverage.

3. Orphaned Test Cases
- List test case IDs that do not map to any requirement.

4. Summary Metrics
- Total requirements
- Total test cases
- Covered requirements
- Uncovered requirements
- Redundant test cases
```

## Ready-To-Use Table Template

```md
| Test Case ID | Requirement ID(s) | Coverage Status (Yes/Partial/No) | Gaps/Issues | Recommended Improvements | Overlap Notes |
| --- | --- | --- | --- | --- | --- |
| TC-001 | REQ-001 | Yes | None | None | None |
| TC-002 | REQ-002 | Partial | Missing boundary validation for invalid input | Add boundary-focused negative test with explicit expected error | Overlaps with TC-005 setup |
```

## Customization Guide

### Placeholders Explained
- **[INSERT_REQUIREMENTS_HERE]**: Source requirements with stable IDs.
  - Example: REQ-101, REQ-102 with acceptance criteria
  - Tips: Include business rules and boundary constraints.

- **[INSERT_TEST_CASES_HERE]**: Test cases with IDs, preconditions, steps, and expected results.
  - Example: TC-101 through TC-130 from test management export
  - Tips: Include both manual and automated cases.

### Optional Parameters
- **[STRICT_MODE]**: If enabled, mark Coverage as No unless every acceptance criterion is directly validated.

## Example Usage

### Scenario
A QA lead wants to verify if a sprint test suite accurately covers all acceptance criteria without duplication.

### Filled Prompt
```text
Requirements:
REQ-201: User can reset password with valid email.
REQ-202: Invalid email format is rejected with validation error.

Test Cases:
TC-901: Reset password using valid email and verify confirmation message.
TC-902: Submit malformed email and verify inline validation.
TC-903: Repeat malformed email flow with same preconditions as TC-902.
```

### Expected AI Response
```text
Returns:
- A row-by-row coverage table with Yes/No coverage,
- gap and improvement notes per test case,
- uncovered and orphaned items,
- summary metrics.
```

## Expected Output

The AI should provide:
1. A structured coverage table for each test case.
2. A clear list of uncovered requirements and orphaned tests.
3. Actionable remediation suggestions.

**Quality Indicators**:
- [ ] Every test case is mapped to one or more requirements or flagged orphaned.
- [ ] Every requirement is reported as covered or uncovered.
- [ ] Gaps and suggestions are specific and testable.
- [ ] Redundancy findings identify overlap rationale.

## Related Prompts

- [qa-test-case-and-repository-standards-assistant.prompt.md](qa-test-case-and-repository-standards-assistant.prompt.md) - Standards-aligned test case generation and review.
- [ado-test-case-formatting.prompt.md](ado-test-case-formatting.prompt.md) - Format and normalize ADO test cases.
- [breakdown-test.prompt.md](breakdown-test.prompt.md) - Build broader QA planning artifacts.

---

**Note**: Always review and validate AI-generated content before using in production environments.
