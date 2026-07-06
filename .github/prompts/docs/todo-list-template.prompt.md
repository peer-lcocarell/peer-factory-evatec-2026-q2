---
mode: ask
description: "Generate a structured Markdown To-Do list template for daily or weekly task tracking."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# To-Do List Template Generator

## Purpose

Generate a clean, structured Markdown To-Do list template suitable for daily or weekly task tracking.
Populate sections from [SOURCE_TEXT] if provided; otherwise output placeholder text.

## Parameters

| Parameter     | Type   | Required | Description                                      |
|---------------|--------|----------|--------------------------------------------------|
| SOURCE_TEXT   | text   | No       | Raw task list or notes to populate the template  |
| CONTEXT       | text   | No       | Scope: daily, weekly, sprint, or project         |

## Template Structure

Produce a Markdown file with exactly these sections in this order:

```markdown
# To-Do List

## Today
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

## This Week
- [ ] Task A
- [ ] Task B
- [ ] Task C

## In Progress
- [ ] Task description
  - Notes:
  - Deadline:

## Completed
- [x] Completed task example

## Upcoming / Backlog
- [ ] Future Task 1
- [ ] Future Task 2

## Priorities

**High:**
- [ ] High-priority task

**Medium:**
- [ ] Medium-priority task

**Low:**
- [ ] Low-priority task

## Notes
- General notes or reminders.
```

## Example Input

```
SOURCE_TEXT: Review test plan 286264, write regression cases for Zendesk notifications, update daily log
CONTEXT: daily
```

## Example Output

```markdown
# To-Do List

## Today
- [ ] Review test plan 286264
- [ ] Write regression cases for Zendesk notifications
- [ ] Update daily log

## This Week
- [ ] (no items provided)

## In Progress
- [ ] Zendesk notification regression cases
  - Notes: Covers automated notification triggers
  - Deadline:

## Completed
- [x] (none)

## Upcoming / Backlog
- [ ] (no items provided)

## Priorities

**High:**
- [ ] Write regression cases for Zendesk notifications

**Medium:**
- [ ] Review test plan 286264

**Low:**
- [ ] Update daily log

## Notes
- Scope: daily
```

## Rules

- Use standard Markdown checkboxes (`- [ ]` and `- [x]`).
- Use `##` for all section headings; use `###` only for subsections within a section.
- Do not include project-specific content unless [SOURCE_TEXT] is provided.
- Maintain a flat list structure; limit nesting to one sub-level maximum.
- Keep all items as placeholder text when no input is supplied.

## Simplification Rules

- One task per line.
- Keep task descriptions concise — no full sentences.
- Use Notes and Deadline sub-items only when deadlines or context are available.
- Remove or mark empty sections as `(none)` rather than omitting them.

## Accuracy Rules

- Do not invent tasks or deadlines.
- Populate only from [SOURCE_TEXT] when provided.
- Classify tasks into priority sections based on explicit signals in [SOURCE_TEXT] only.
- State clearly when scope or context is not provided.

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.

## Expected Output

- A complete Markdown To-Do template matching the Template Structure above.
- All sections present; mark empty sections as `(none)`.
- Placeholder text used when no input is provided.
