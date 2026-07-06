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
description: "Generate a structured high-level project summary document from provided project details."
---

Generate a clean, structured, high-level project summary document suitable for stakeholder communication, release notes, and status updates.

# Goal

Given a set of project details, produce a complete high-level project summary that follows the `project-summary-high-level-standard`. The output must be clear, scannable, and understandable by both technical and non-technical audiences in under a few minutes.

# Context

This prompt applies to:

- Feature deliveries
- System updates
- Integrations
- Release summaries

The summary should capture purpose, scope, key changes, risks, and outcomes without including implementation-level detail unless required for context.

# Input

Provide any or all of the following:

- `[PROJECT_NAME]` — Clear and descriptive name aligned with internal naming conventions
- `[VERSION_OR_RELEASE]` — Version or release identifier, if applicable
- `[DATE]` — Date in YYYY-MM-DD format
- `[PROBLEM_STATEMENT]` — What problem is being solved and why it matters
- `[SCOPE_IN]` — Features, components, or systems included
- `[SCOPE_OUT]` — Explicitly excluded items
- `[KEY_CHANGES]` — List of changes grouped by category (configuration, features, bugs, performance)
- `[DEPENDENCIES]` — Required systems, tools, services, or version constraints
- `[ASSUMPTIONS]` — Conditions assumed to be true
- `[RISKS]` — Potential issues, limitations, or operational concerns
- `[VALIDATION_APPROACH]` — High-level QA coverage (functional, regression, integration)
- `[IMPACT]` — How changes affect users, workflows, or system behavior
- `[EXPECTED_OUTCOME]` — Measurable or observable result after implementation
- `[OPTIONAL_METRICS]` — Success criteria or KPIs, if available
- `[ROLLOUT_STRATEGY]` — Deployment approach and rollback considerations, if applicable

# Constraints

- Be explicit and deterministic.
- Do not assume missing facts. If a required field is missing, state what is absent and request it.
- Use plain and professional language.
- Avoid vague terms such as "improved" or "fixed" without specific context.
- Do not include implementation-level detail unless essential for stakeholder understanding.
- Use consistent terminology throughout the document.
- Keep bullet points concise and informative.

# Instructions

1. Analyze the provided input and map each value to the appropriate section.
2. Apply the structure below exactly.
3. Omit optional sections only if no input was provided for them.
4. Replace all placeholders with the supplied values.
5. If input is ambiguous or insufficient, ask a clarifying question before generating output.

## Required Structure

```md
# [PROJECT_NAME]

**Version:** [VERSION_OR_RELEASE]
**Date:** [DATE]

## Executive Overview

[Concise description of the project, what problem it solves, why it matters, and the high-level outcome.]

## Project Purpose

- Primary objective: ...
- Problem being addressed: ...
- Expected value or impact: ...

## Scope

### In Scope

- ...

### Out of Scope

- ...

## Key Changes

### [Category 1]

- ...

### [Category 2]

- ...

## Dependencies

- ...

## Assumptions

- ...

## Risks and Considerations

- ...

## Validation Approach

- ...

## Impact Assessment

- ...

## Outcome

- ...
```

# Expected Output

- A complete Markdown document following the required structure above.
- All sections populated with the provided input.
- Format: structured Markdown with headers and bullet lists.
- Tone: plain, professional, scannable.
- No filler text, no placeholder labels remaining in the output.
- Ready for use as a status update, release note, or stakeholder communication without further editing.

# Acceptance Criteria

- All provided input values are accurately reflected in the output.
- No section contains vague language without supporting detail.
- Scope section clearly distinguishes in-scope and out-of-scope items.
- Key changes are grouped into logical categories.
- Risks and assumptions are explicit and testable where possible.
- Output matches the `project-summary-high-level-standard` structure.
- Document is readable by a non-technical stakeholder without additional context.
