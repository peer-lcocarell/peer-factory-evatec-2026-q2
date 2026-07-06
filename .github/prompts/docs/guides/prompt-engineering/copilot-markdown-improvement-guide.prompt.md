---
mode: ask
description: "Prompt for copilot-markdown-improvement-guide."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# copilot-markdown-improvement-guide

## Goal

- Improve a markdown document so it is clear, consistent, and AI-friendly.
- Keep formatting predictable for GitHub Copilot and QA workflows.

## Input

- Source markdown: [SOURCE_MARKDOWN]
- Optional style baseline: [STYLE_GUIDE_PATH]

## Constraints

- Keep original meaning and intent.
- Use concise and professional wording.
- Use clear heading hierarchy: #, ##, ###.
- Prefer bullet points for scanability.
- Use numbered lists only for ordered steps.
- Use fenced code blocks with language tags.
- Remove filler text, vague wording, and redundant lines.
- Do not add project-specific assumptions.

## Expected Output

- Return markdown only.
- Output format:
	- Title and section headings are preserved or improved.
	- Content is grouped into short, readable sections.
	- Lists are normalized and consistent.
	- Code blocks are valid and language-tagged.
	- No malformed markdown syntax.

## Example

Input placeholder:

- [SOURCE_MARKDOWN]

Output format example:

```markdown
# Document Title

## Purpose
- One clear statement of intent.

## Instructions
- Step 1
- Step 2

## Example
```bash
npm install
npm run build
```
