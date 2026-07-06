---
mode: ask
description: "High-level project summary plus deep .NET architecture and code audit in one prompt."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# project-summary-and-audit-comprehensive

## Purpose

- Generate one output that is readable by stakeholders and technically actionable for engineers.
- Combine high-level project summary with deep repository, architecture, code, and cleanup analysis.

## Goal

Given repository evidence and project context, produce:

- A concise project summary that explains structure, purpose, direction, goals, and expected outcomes.
- A comprehensive .NET audit with consolidation, cleanup, maintainability, and modernization recommendations.

## Context

Use this prompt for:

- Release or milestone reviews
- Architecture and technical debt assessments
- Repository simplification and cleanup planning
- Cross-team status communication where both executive and engineering views are required

## Input

Provide what is available. If required inputs are missing, list them and continue only with evidence-backed findings.

### Project Summary Inputs

- [PROJECT_NAME]
- [VERSION_OR_RELEASE]
- [DATE]
- [PROBLEM_STATEMENT]
- [SCOPE_IN]
- [SCOPE_OUT]
- [KEY_CHANGES]
- [DEPENDENCIES]
- [ASSUMPTIONS]
- [RISKS]
- [VALIDATION_APPROACH]
- [IMPACT]
- [EXPECTED_OUTCOME]
- [OPTIONAL_METRICS]
- [ROLLOUT_STRATEGY]

### Technical Audit Inputs

- [REPOSITORY_ROOT]
- [SOLUTION_FILES]
- [PROJECT_FILES]
- [SOURCE_PATHS]
- [TEST_PATHS]
- [BUILD_AND_CI_FILES]
- [CONFIG_FILES]
- [PACKAGE_MANIFESTS]
- [KNOWN_ACTIVE_WORK]
- [COMPLIANCE_OR_RETENTION_NOTES]

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.
- Use repository evidence for every non-trivial finding.
- Mark uncertain findings as review-required.
- Do not recommend deletion without evidence and risk notes.
- Prioritize maintainability, simplicity, consolidation, and modern .NET practices.
- Keep executive sections concise and plain-language.

## Instructions

1. Build the executive summary first for quick stakeholder consumption.
2. Perform deep technical audit across structure, architecture, code, dependencies, tests, config, and cleanup.
3. Tie each recommendation to evidence, expected benefit, effort, and risk.
4. Separate confirmed findings from hypotheses.
5. End with a prioritized action roadmap and target-state structure.

## Required Output Structure

```md
# [PROJECT_NAME]

## Executive Summary

- Project purpose: ...
- Direction: ...
- Primary goals: ...
- Current status: ...
- Expected outcome: ...

## High-Level Project Summary

### Scope
- In Scope: ...
- Out of Scope: ...

### Key Changes
- ...

### Dependencies
- ...

### Risks and Assumptions
- Risks: ...
- Assumptions: ...

### Validation and Impact
- Validation approach: ...
- User/system impact: ...

## Technical Audit

### Repository Structure Review
- Findings
- Cleanup and consolidation opportunities

### .NET Architecture Review
- Findings
- Simplification opportunities

### Code Quality and Dead Code Review
- Findings
- Confidence levels (High, Medium, Low)

### Dependency and Build Review
- Findings
- Package/project reduction opportunities

### Test Architecture Review
- Findings
- Maintainability improvements

### Configuration Review
- Findings
- Drift and duplication risks

### Naming and Conventions Review
- Findings
- Standardization opportunities

## Repository Cleanup Assessment

### Recommended Deletions
- [path] | reason | evidence | risk | confidence

### Recommended Archives
- [path] -> [archive path] | reason | retrieval need | risk

### Required Retained Files
- [path] | active/compliance reason

## Recommendation Blocks

For each major recommendation include:
- Current State
- Suggested Improvement
- Reasoning
- Expected Benefits
- Priority (High/Medium/Low)
- Estimated Effort (Small/Medium/Large)
- Risk (Low/Medium/High)

## Scores

- Repository Health: X/10
- Directory Structure: X/10
- Architecture: X/10
- Maintainability: X/10
- Scalability: X/10
- Technical Debt: X/10

## Consolidation Assessment

1. Can the repository be simplified?
2. Can projects be merged?
3. Can files be removed?
4. Can duplicate implementations be consolidated?
5. Can dependencies be reduced?
6. Can architecture be simplified?
7. What realistic complexity reduction percentage is achievable?

## Prioritized Action Plan

### Immediate Actions
- ...

### Short-Term Actions
- ...

### Medium-Term Actions
- ...

### Long-Term Actions
- ...

## Final Streamlined Repository Structure

- [top-level folder]
  - [key retained folders/files]
```

## Acceptance Criteria

- Executive summary explains structure, purpose, direction, and goals in plain language.
- Technical sections include evidence-backed code and architecture findings.
- Cleanup recommendations distinguish delete, archive, and retain decisions.
- Recommendations are prioritized with effort and risk.
- Output is usable for both stakeholder review and engineering implementation.

## Expected Output

- Format: structured Markdown with concise sections and bullet lists.
- Include: summary view, technical audit view, cleanup decisions, risk notes, and roadmap.
- Tone: professional, specific, and actionable.
