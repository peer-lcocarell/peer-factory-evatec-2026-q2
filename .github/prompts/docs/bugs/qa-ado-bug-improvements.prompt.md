---
mode: ask
description: "Prompt for qa-ado-bug-improvements."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Prompt Templates for Azure DevOps Bug Reporting

***

```md

This document provides reusable prompts to standardize and improve bug reports for Azure DevOps.

---

## 1. Bug Refinement Prompt

Use this to convert rough notes into a clean ADO bug.

```

Rewrite the following issue into an Azure DevOps bug using QA standards.

Requirements:

* Clear, specific title
* Simple Preconditions in bullet form
* Steps and Expected Results in table format
* Each step must have a corresponding expected result
* Use "tester" instead of operator
* No semicolons
* No vague terms
* Include Actual Result
* Include Expected Outcome summary
* Keep wording concise and professional

Input:
\[paste raw bug notes here]

```

---

## 2. Title Improvement Prompt

```

Improve this bug title for Azure DevOps.

Requirements:

* Format: \[Component] Short Action + Failure
* Be specific and testable
* Avoid generic words such as "issue" or "problem"
* Maximum 12 words

Input:
\[paste title]

```

---

## 3. Steps Standardization Prompt

```

Convert these steps into QA test steps.

Requirements:

* Use numbered steps
* Each step must be a single action
* No semicolons
* Use "tester"
* Pair each step with an Expected Result
* Avoid vague terms

Input:
\[paste messy steps]

```

---

## 4. Missing Detail Enhancer Prompt

```

Identify missing QA details in this bug and improve it.

Requirements:

* Add Preconditions if missing
* Clarify environment or setup assumptions
* Ensure reproducibility
* Add Expected Outcome summary
* Keep formatting aligned with ADO bug structure

Input:
\[paste bug]

```

---

## 5. Regression Clarity Prompt

```

Enhance this bug to clearly indicate regression impact.

Requirements:

* Add section: Regression
* State whether behavior worked previously
* Mention baseline version if known
* Highlight risk to existing functionality

Input:
\[paste bug]

```

---

## 6. Edge Case Expansion Prompt

```

Expand this bug with edge cases for QA coverage.

Requirements:

* Identify related edge scenarios
* Add validation points
* Keep each point concise
* Do not rewrite the full bug

Input:
\[paste bug]

```

---

## 7. Expected vs Actual Correction Prompt

```

Fix the Expected and Actual Results.

Requirements:

* Expected Result must describe correct system behavior
* Actual Result must describe observed behavior only
* No overlap between sections
* Keep both precise and testable

Input:
\[paste section]

```

---

## 8. Full ADO Bug Template Prompt

```

Generate a complete Azure DevOps bug.

Structure:

Title:

## Preconditions:

Steps & Expected Results:

| Step | Action | Expected Result |
| ---- | ------ | --------------- |

Actual Result:

Expected Outcome:

Notes:

Rules:

* Use "tester"
* No semicolons
* No filler words
* Clear and simple wording

Input:
\[paste raw description]

```

---

## 9. QA Style Enforcement Prompt

```

Rewrite this bug following strict QA writing standards.

Rules:

* No semicolons
* No arrows
* No vague phrases
* Use "tester"
* Clear point form
* Keep steps as simple actions
* Keep Expected Results specific

Input:
\[paste bug]

```

---

## 10. Quick Cleanup Prompt

```

Clean and standardize this bug for Azure DevOps.

Requirements:

* Fix grammar
* Improve clarity
* Standardize formatting
* Keep concise
* Do not add new assumptions

Input:
\[paste bug]

```

---

## Usage Guidance

- Use Prompt 1 for full rewrites
- Use Prompt 3 when steps are unclear or inconsistent
- Use Prompt 7 when Expected vs Actual needs correction
- Use Prompt 9 to enforce QA standards
- Combine prompts as needed for best results
```

***

I

## Goal

- Define the primary objective clearly.

## Input

- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.

## Expected Output

- Format: bullet list
- Include actionable results
