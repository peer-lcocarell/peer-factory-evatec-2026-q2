---
mode: ask
name: qa-requirement-test-coverage-audit
description: "Audit requirements against test cases for coverage, gaps, quality, traceability, redundancy, and consolidation opportunities while keeping output concise and actionable."
---

# QA Requirement-Test Coverage Audit

## Objective

Review requirements against existing test cases and produce a concise, deterministic coverage assessment.

The audit should:

- Validate requirement coverage at the clause level.
- Identify coverage gaps.
- Identify orphaned test cases.
- Identify redundant or overlapping tests.
- Recommend updates to existing tests before proposing new tests.
- Minimize unnecessary test suite growth.
- Focus on findings rather than documentation.

---

## Core Principles

### Traceability First

- Evaluate coverage at the individual requirement clause level.
- Every requirement clause must be assessed.
- Every test case must map to one or more requirements or be flagged as orphaned.
- Do not assume coverage that is not explicitly present in the test steps or expected results.

### Test Suite Growth Control

Before recommending a new test case:

1. Review all existing tests mapped to the requirement.
2. Determine whether missing coverage can be added to an existing test.
3. Prefer updating existing tests when:
   - Preconditions are similar.
   - Workflow already exists.
   - Additional validation adds minimal complexity.
4. Recommend a new test only when:
   - Workflow differs substantially.
   - Permissions differ substantially.
   - State transitions differ substantially.
   - Adding coverage would make an existing test excessively complex.

### Deterministic Analysis

- Be explicit and evidence-based.
- Do not assume missing facts.
- Do not infer requirement coverage.
- Explain gaps clearly and succinctly.
- Keep recommendations actionable.

---

## Requirement Decomposition Rules

Break every requirement into discrete, testable clauses.

Example:

Requirement:

> A user can upload one or more documents, view uploaded documents, and remove them without confirmation.

Clauses:

1. Upload single document.
2. Upload multiple documents.
3. View uploaded documents.
4. Remove uploaded documents.
5. Remove uploaded documents without confirmation.

Do not treat broad requirements as a single behavior.

---

## Coverage Status Definitions

### Yes

Use only when:

- Every acceptance criterion is validated.
- Expected results verify required behavior.
- No significant gaps remain.

### Partial

Use when:

- Some behaviors are covered.
- One or more clauses remain untested.
- State conditions, permissions, boundaries, workflow paths, or validations are missing.

### No

Use when:

- No test directly validates the requirement behavior.
- Coverage is assumed rather than demonstrated.
- Requirement wording exists but is not explicitly tested.

---

## Mandatory Coverage Gap Review

For every Partial or No finding:

Identify:

- Missing behavior
- Missing validation
- Missing workflow coverage
- Missing negative testing
- Missing boundary testing
- Missing permission testing
- Missing state-dependent testing
- Missing persistence validation
- Missing navigation validation
- Missing error handling

For each gap:

- Reference the requirement clause.
- Explain exactly what is missing.
- Determine whether an existing test can be expanded.
- Recommend a new test only when expansion is not practical.

---

## Overlap Analysis

For every test case:

Identify:

- Duplicate setup
- Duplicate workflow
- Duplicate validation
- Significant overlap with other tests

Recommendations:

- Consolidate redundant tests where practical.
- Do not classify complementary positive and negative tests as duplicates.
- Explain consolidation rationale briefly.

---

## Risk-Based Review

Determine whether the requirement contains:

- Permission-based behavior
- Role-based visibility
- State-dependent behavior
- Lifecycle transitions
- Navigation requirements
- Add/remove operations
- Data persistence requirements
- Error handling requirements
- Boundary conditions

Only report uncovered risk areas.

---

## Inputs

### Requirements

```text
[INSERT_REQUIREMENTS_HERE]
```

### Test Cases

```text
[INSERT_TEST_CASES_HERE]
```

### Optional Context

```text
[INSERT_CONTEXT_HERE]
```

### Optional Setting

```text
STRICT_MODE = ON | OFF
```

STRICT_MODE behavior:

- Mark a requirement as fully covered only when every acceptance criterion is directly validated.
- Do not infer coverage from similar workflows.

---

## Output Rules

Keep the audit concise.

Maximum Output:

- One coverage row per test case.
- Report only meaningful findings.
- Report only Partial and No coverage gaps.
- Maximum 3 recommendation bullets per requirement.
- Report overlap only when meaningful duplication exists.
- Report risk findings only when gaps exist.
- Do not restate requirement text.
- Do not explain fully covered requirements.
- Prioritize findings over documentation.

Focus on:

1. Uncovered requirements
2. Partial coverage
3. Orphaned test cases
4. Redundancy
5. High-risk gaps

---

## Required Output

### Coverage Audit Table

| Test Case ID | Requirement ID(s) | Coverage (Yes/Partial/No) | Key Gap(s) | Recommended Action |
| --- | --- | --- | --- | --- |

---

### Uncovered Requirements

List only requirements or clauses with insufficient coverage.

Example:

- REQ-101: Missing validation for unauthorized access.
- REQ-105: Missing boundary condition testing.

---

### Orphaned Test Cases

List only test cases with no requirement mapping.

Example:

- TC-210
- TC-315

---

### Consolidation Opportunities

List only meaningful overlaps.

Example:

- TC-110 and TC-112 validate the same workflow and can be merged.
- TC-205 can absorb validation currently duplicated in TC-209.

---

### High-Risk Gaps

Report only uncovered risk areas.

Example:

- Missing permission validation.
- Missing lifecycle transition testing.
- Missing data persistence verification.

---

### Summary Metrics

- Total Requirements:
- Total Requirement Clauses:
- Total Test Cases:
- Covered Clauses:
- Partial Clauses:
- Uncovered Clauses:
- Orphaned Test Cases:
- Consolidation Opportunities:

---

### Final Audit Verdict

Coverage Health:

- Good
- Moderate Risk
- High Risk

Reason:

- 1-3 concise bullets explaining the primary risks or strengths.

---

## Quality Checklist

Verify:

- [ ] Every requirement is assessed.
- [ ] Every requirement clause is assessed.
- [ ] Every test case is mapped or flagged orphaned.
- [ ] Coverage decisions are evidence-based.
- [ ] Recommendations prioritize updating existing tests.
- [ ] New test recommendations are justified.
- [ ] Redundancy findings identify meaningful overlap.
- [ ] Risk-based review is completed.
- [ ] Output remains concise and focused on findings.
- [ ] Summary metrics are internally consistent.
