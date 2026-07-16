---
mode: ask
name: qa-requirement-coverage-audit
description: "Audit requirements against test cases for coverage, traceability, gaps, orphaned tests, redundancy, and consolidation opportunities while minimizing unnecessary test suite growth."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Requirement Coverage Audit

## Metadata

- **Difficulty:** Intermediate
- **Estimated Time:** 15–30 min
- **Prerequisites:** Requirement IDs and test case IDs are available
- **Tags:** #qa #requirements #coverage #traceability #test-cases #audit
- **Version:** 2.0
- **Focus:** Coverage accuracy, coverage efficiency, risk identification, and controlled test suite growth

---

# Objective

Review requirements against existing test cases and provide a deterministic audit of:

- Requirement coverage
- Coverage gaps
- Traceability
- Test quality
- Redundancy
- Consolidation opportunities
- Risk-based coverage gaps

The goal is to maximize coverage while minimizing unnecessary test suite growth.

---

# Core Audit Principles

## Traceability First

- Every requirement must be decomposed into testable clauses.
- Every clause must be assessed independently.
- Every test case must map to one or more requirement clauses or be flagged as orphaned.
- Do not assume coverage.
- Coverage must be supported by explicit test actions and expected results.

---

## Test Suite Growth Control

Default assumption:

- Existing tests should be updated before new tests are recommended.
- Consolidation should be preferred over creating additional tests.
- New tests should be recommended only when coverage cannot reasonably be added to existing tests.

Before recommending a new test:

1. Review all mapped test cases.
2. Determine whether the gap can be addressed within an existing test.
3. Determine whether overlap exists with another test.
4. Determine whether consolidation is possible.

Only recommend a new test when:

- Workflow differs significantly.
- Permissions differ significantly.
- Lifecycle behavior differs significantly.
- Risk profile differs significantly.
- Adding coverage would make an existing test excessively complex.

Every recommended new test must include justification.

---

## Deterministic Assessment Rules

- Be explicit.
- Be evidence-based.
- Do not infer missing behavior.
- Do not assume hidden validations.
- Report findings concisely.
- Focus on actionable recommendations.

---

# Requirement Decomposition Rules

Before performing the audit:

1. Break each requirement into discrete testable clauses.
2. Number each clause.
3. Evaluate coverage at the clause level.

Example:

Requirement:

```text
A user can upload one or more documents, view uploaded documents,
and remove them without confirmation.
```

Audit Clauses:

```text
1. Upload single document.
2. Upload multiple documents.
3. View uploaded documents.
4. Remove uploaded documents.
5. Remove uploaded documents without confirmation.
```

Do not assess broad requirements as a single item.

---

# Coverage Status Definitions

## Yes

Use only when:

- All clauses and acceptance criteria are validated.
- Expected results verify the behavior.
- No significant gaps remain.

## Partial

Use when:

- Some clauses are covered.
- One or more clauses remain untested.
- One or more validations are missing.

## No

Use when:

- No test directly validates the behavior.
- Coverage is assumed rather than demonstrated.
- No mapped test exists.

---

# Requirement-Level Status Rules

## Covered

- All clauses are covered.

## Partially Covered

- At least one clause is covered.
- At least one clause is partially covered or uncovered.

## Not Covered

- No clauses are covered.

---

# Coverage Gap Analysis

For every Partial or No finding identify:

- Missing functionality
- Missing workflow coverage
- Missing validation
- Missing negative testing
- Missing error handling
- Missing boundary testing
- Missing permissions testing
- Missing state-dependent testing
- Missing persistence validation
- Missing navigation validation
- Missing audit/history validation

For every gap:

- Reference the clause.
- Explain what is missing.
- State whether an existing test can be updated.
- Recommend a new test only when necessary.

---

# Coverage Efficiency Review

For every uncovered clause classify the preferred remediation:

## Existing Test Can Be Updated

Use when:

- Workflow already exists.
- Only additional validation is required.
- Preconditions are already present.

## Existing Tests Can Be Consolidated

Use when:

- Coverage exists across overlapping tests.
- Duplicate setup or validation is present.

## New Test Required

Use only when:

- Workflow differs materially.
- User role differs materially.
- Application state differs materially.
- Risk area differs materially.

---

# Overlap and Redundancy Analysis

For every test case:

Identify:

- Duplicate setup
- Duplicate workflow
- Duplicate validation
- Significant overlap

Recommendations:

- Consolidate where practical.
- Do not classify complementary positive and negative tests as duplicates.
- Explain overlap rationale briefly.

---

# Risk-Based Review

Evaluate coverage for:

- Security and authorization
- Permission-based behavior
- Role-based visibility
- State-dependent behavior
- Lifecycle transitions
- Navigation behavior
- Create/Edit/Delete operations
- Data persistence
- Audit/history tracking
- Error handling
- Boundary conditions

Only report uncovered risks.

---

# Inputs

## Requirements

```text
[INSERT_REQUIREMENTS_HERE]
```

## Test Cases

```text
[INSERT_TEST_CASES_HERE]
```

## Optional Context

```text
[INSERT_CONTEXT_HERE]
```

## Optional Settings

```text
STRICT_MODE = ON | OFF
```

When STRICT_MODE is ON:

- All acceptance criteria must be explicitly validated.
- Do not infer coverage from similar workflows.
- Mark coverage as Partial or No if any clause lacks validation.

---

# Output Rules

Keep output concise.

Focus on findings, not documentation.

Do not:

- Repeat requirement text unnecessarily.
- Explain fully covered functionality.
- Produce requirement-by-requirement essays.

Prioritize:

1. Uncovered requirements
2. Partial coverage
3. High-risk gaps
4. Orphaned tests
5. Redundancy

Maximum Output:

- One row per test case
- One row per uncovered clause
- Maximum 3 recommendation bullets per requirement
- Maximum 5 next-step bullets
- Report overlap only when meaningful

---

# Required Output

## Requirement Audit Summary

### Status

- Covered
- Partially Covered
- Not Covered

---

## Coverage Assessment

### Existing Test Cases

| Test Case | Coverage Status | Covered Clauses |
| --- | --- | --- |

---

### Coverage Gaps

| Clause | Coverage Status | Gap Description |
| --- | --- | --- |

Only include Partial and No findings.

---

### Recommendations

Maximum 3 bullets.

Preference order:

1. Update existing tests
2. Consolidate tests
3. Create new tests

For new tests provide justification.

---

## Notes

### Overlap Findings

Only report meaningful overlap.

### Risk-Based Gaps

Only report uncovered risks.

### Summary Metrics

- Total Requirement Clauses:
- Covered Clauses:
- Partially Covered Clauses:
- Uncovered Clauses:
- Existing Tests Reviewed:
- Existing Tests Recommended for Update:
- New Tests Recommended:
- Consolidation Opportunities:

---

## Next Steps

### Priority 1

Highest-risk uncovered functionality.

### Priority 2

Recommended updates to existing tests.

### Priority 3

New tests only when justified.

Include:

```text
Current Test Case Count:
Recommended New Test Count:
```

Provide rationale.

---

## Final Audit Verdict

### Coverage Health

- Good
- Moderate Risk
- High Risk

### Reason

Maximum 3 concise bullets.

### Release Recommendation

- Ready for QA Signoff
- Additional Coverage Recommended
- Significant Coverage Gaps Remain

---

# Quality Checklist

Verify:

- [ ] Every requirement was decomposed into clauses.
- [ ] Every clause was assessed.
- [ ] Every test case was mapped or flagged orphaned.
- [ ] Coverage decisions are evidence-based.
- [ ] Existing test updates were prioritized.
- [ ] Consolidation opportunities were considered.
- [ ] New test recommendations were justified.
- [ ] Risk-based review was completed.
- [ ] Output remains concise.
- [ ] Summary metrics are internally consistent.
