<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Purpose

---
mode: ask
description: "Generate a structured high-level unit testing assessment and improvement summary from provided project details."
---

Generate a clean, structured, high-level unit testing assessment document suitable for development teams, QA teams, technical leads, and stakeholders.

# Goal

Given a set of project details, source code information, and existing unit tests, produce a complete testing improvement summary that identifies strengths, weaknesses, risks, coverage gaps, and recommendations.

The output should help teams improve test quality, maintainability, regression protection, and confidence in future code changes.

# Context

This prompt applies to:
- Existing .NET projects
- New feature development
- Legacy code modernization
- Test suite audits
- Regression stabilization efforts
- CI/CD quality improvement initiatives

The summary should focus on unit testing effectiveness rather than implementation details.

# Input

Provide any or all of the following:
- `[PROJECT_NAME]` — Project or solution name
- `[VERSION_OR_RELEASE]` — Release or branch identifier
- `[DATE]` — Date in YYYY-MM-DD format
- `[BUSINESS_PURPOSE]` — High-level business objective
- `[CODE_AREAS_REVIEWED]` — Components, services, domains, or modules reviewed
- `[EXISTING_TEST_FRAMEWORK]` — xUnit, NUnit, MSTest, etc.
- `[CURRENT_TEST_OBSERVATIONS]` — Summary of existing test suite characteristics
- `[KNOWN_GAPS]` — Missing tests, known risks, or uncovered functionality
- `[TEST_SMELLS]` — Examples of duplication, over-mocking, fragile tests, poor naming, etc.
- `[HIGH_RISK_AREAS]` — Critical paths requiring stronger protection
- `[DEPENDENCIES]` — External dependencies used by the codebase
- `[VALIDATION_APPROACH]` — Review methodology used
- `[RECOMMENDED_IMPROVEMENTS]` — Specific improvements identified
- `[TECHNICAL_RISKS]` — Testing-related risks and concerns
- `[OPTIONAL_METRICS]` — Coverage statistics, test counts, execution times, flakiness metrics

# Constraints

- Be explicit and deterministic.
- Do not assume missing facts.
- Focus on business behavior validation.
- Do not recommend increasing coverage solely to improve percentages.
- Prioritize maintainability, reliability, readability, and defect detection.
- Avoid implementation-level details unless necessary for understanding risk.
- Prefer outcome-focused recommendations.
- Use concise and professional language.

# Instructions

1. Analyze the provided information.
2. Assess the effectiveness of the current unit test suite.
3. Identify gaps in coverage and risk areas.
4. Highlight maintainability concerns.
5. Provide prioritized recommendations.
6. Apply the structure below exactly.
7. Omit optional sections if no data is provided.
8. Replace all placeholders with supplied values.
9. If required information is missing, explicitly state what is unavailable.

## Required Structure

```md
# [PROJECT_NAME]

**Version:** [VERSION_OR_RELEASE]
**Date:** [DATE]

## Executive Overview

[High-level assessment of the current unit testing landscape and overall confidence level.]

## Business Context

- Business purpose: ...
- Critical functionality reviewed: ...
- Expected value of testing improvements: ...

## Areas Reviewed

- ...

## Current Test Suite Assessment

### Strengths

- ...

### Weaknesses

- ...

### Coverage Gaps

- ...

## Identified Test Quality Issues

### Maintainability Concerns

- ...

### Reliability Concerns

- ...

### Readability Concerns

- ...

### Test Smells

- ...

## High-Risk Areas

- ...

## Testing Risks and Considerations

- ...

## Improvement Recommendations

### High Priority

- ...

### Medium Priority

- ...

### Low Priority

- ...

## Validation Approach

- ...

## Success Metrics

- ...

## Expected Outcome

- ...
```

# Review Focus Areas

When assessing the test suite, prioritize identifying:

## Missing Coverage

- Business rules
- Validation logic
- Error handling
- Boundary conditions
- Regression scenarios
- High-complexity paths

## Weak Assertions

Flag tests that:
- Only validate non-null results
- Verify implementation details
- Fail to validate business outcomes

## Over-Mocking

Identify:
- Excessive mock setup
- Numerous Verify statements
- Tests coupled to internal implementation

## Duplicate Coverage

Identify:
- Repeated scenarios
- Copy-paste tests
- Redundant validations

## Fragile Tests

Identify tests relying on:
- Call counts
- Internal execution order
- Timing assumptions
- Shared state

## Excessive Setup

Identify opportunities for:
- Builders
- Factories
- Shared fixtures
- Cleaner AAA patterns

# Expected Output

- A complete Markdown document following the required structure.
- A balanced assessment of current test health.
- Explicit risk identification.
- Actionable recommendations prioritized by value.
- Suitable for technical planning, backlog refinement, and engineering review.

# Acceptance Criteria

- Clearly identifies strengths and weaknesses.
- Highlights meaningful testing risks.
- Identifies missing business-critical coverage.
- Flags maintainability and reliability concerns.
- Prioritizes recommendations by impact.
- Uses clear and professional language.
- Produces actionable output without requiring additional interpretation.
- Readable by developers, QA, technical leads, and stakeholders.
