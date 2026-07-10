
# PF QA Prompt: Requirement-to-Test Case Audit (Reusable)

## Goal

- Audit PF test cases for alignment, completeness, and traceability against stated requirements.
- Produce actionable QA feedback that improves coverage quality and reduces duplicate or low-value tests.

## Input

- Requirements:
  - [PASTE_REQUIREMENTS]

- Test Cases:
  - [PASTE_TEST_CASES]

- Optional Context:
  - CR: [CR_ID_OR_EMPTY]
  - Ticket: [TICKET_ID_OR_EMPTY]
  - Requirement ID: [REQ_ID_OR_EMPTY]
  - Release: [RELEASE_OR_EMPTY]
  - Target suite/plan: [SUITE_OR_PLAN_OR_EMPTY]
  - Constraints: [CONSTRAINTS_OR_EMPTY]

## Constraints

- Coverage Status must be one of: Yes, Partial, No.
- Evaluate each test case only against stated requirements and provided context.
- Flag weak or non-observable expected results.
- Call out vague wording and missing validation conditions.
- Identify overlap or duplication and recommend consolidation when appropriate.
- Prioritize requirement traceability over historical behavior.
- Be explicit, testable, and deterministic in all findings.
- Do not invent missing requirements; if missing, mark as assumption or gap.

## Instructions

You are acting as an experienced QA lead tasked with auditing test cases for alignment with stated requirements.

For each test case, evaluate and document:

1. Coverage Status: Does the test case fully satisfy the requirement? (Yes/Partial/No)
2. Identified Gaps: Missing conditions, edge cases, unclear steps, weak expected results, or untestable assertions.
3. Improvement Actions: Specific recommendations to improve accuracy, clarity, traceability, and completeness.
4. Overlap Check: Whether the test case duplicates or significantly overlaps with another test.

When auditing PF Evatec test suites, also verify:

- Requirement-to-test traceability includes CR, Ticket, and Requirement ID.
- Positive, negative, persistence, and permission scenarios are covered where relevant.
- Magnet-system-specific behavior is explicitly validated when the requirement references magnet roles/types.
- Search/filter behavior includes both matching and non-matching outcomes when applicable.
- Existing R8/R9 legacy tests do not duplicate stronger R10.2 coverage without added value.

## Expected Output

Return findings in a structured table with these columns:

| Test Case ID | Coverage Status | Gaps/Issues | Recommended Improvements | Overlap Notes |
|---|---|---|---|---|
|  |  |  |  |  |

Output rules:

- Use Yes/Partial/No only for Coverage Status.
- Gaps/Issues must be concrete and verifiable.
- Recommended Improvements must be directly actionable.
- Overlap Notes must name related test case IDs where possible.
- If input quality is insufficient, include an "Input Quality Gaps" note before the table.
