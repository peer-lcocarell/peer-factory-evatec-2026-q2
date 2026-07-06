---
mode: ask
description: "Prompt for qa-bug-rater."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Bug Reviewer and Rating Prompt

***

```
Review the following Azure DevOps bug and evaluate its quality.

Requirements:

1. Provide a rating from 1 to 10 based on:
   - Clarity
   - Completeness
   - Reproducibility
   - Structure
   - Professional wording

2. Identify issues:
   - Missing sections
   - Unclear or vague wording
   - Incorrect formatting
   - Weak Expected vs Actual separation
   - Steps that are not actionable

3. Provide specific improvements:
   - Rewrite the Title if needed
   - Improve Preconditions
   - Fix Steps and Expected Results
   - Clarify Actual Result
   - Improve Expected Outcome

4. Output format:

Rating: X/10

Issues:
-

Improvements:
-

Rewritten Bug:

Title:

Preconditions:
-

Steps & Expected Results:

| Step | Action | Expected Result |
|------|--------|----------------|

Actual Result:

Expected Outcome:

Notes:

Rules:
- Use "tester"
- No semicolons
- No vague phrases
- Keep steps as simple actions
- Each step must have a clear expected result

Input:
[paste bug here]
```

***

## Optional Strict Mode (for higher QA standards)

Use this when you want tougher evaluation:

```
Apply strict QA review standards.

Additional rules:
- Deduct points for any ambiguity
- Deduct points if steps are not fully reproducible
- Deduct points for missing edge considerations
- Ensure bug can be executed by a new tester without assumptions
```

***

## Quick Rating-Only Version

```
Rate this Azure DevOps bug from 1 to 10.

Criteria:
- Clarity
- Reproducibility
- Completeness
- Formatting

Provide:
- Score
- Top 3 issues
- One key improvement

Input:
[paste bug]
```

***

## When to use

* Before submitting bugs to ADO
* During QA peer reviews
* For improving older bugs in backlog
* For training consistency across testers

***

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
