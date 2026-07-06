---
mode: ask
description: "Prompt for markdown-llm-clean-up."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Markdown Modernization Prompt (LLM-Optimized)

## Goal

- Transform markdown content into a clean, structured, and LLM-friendly format.
- Improve readability, consistency, and retrieval quality without changing intent.

## Input

- Source markdown document: [SOURCE_MARKDOWN]
- Optional style baseline: [STYLE_GUIDE_PATH]
- Optional target audience: [TARGET_AUDIENCE]

## Constraints

- Do not remove important information.
- Preserve original meaning and technical accuracy.
- Use clear heading hierarchy: #, ##, ###.
- Prefer concise bullets over dense paragraphs.
- Keep terminology and tense consistent.
- Avoid vague references and filler wording.
- Use tables only when they improve clarity.

## Expected Output

- Return markdown only.
- Output format:
	- `## Overview` with a short summary.
	- Organized sections with descriptive headings.
	- Concise bullet points and numbered steps where needed.
	- Code blocks with language tags for commands or structured data.
	- Optional `## Key Concepts` and `## Examples` when relevant.

## Task

Rewrite [SOURCE_MARKDOWN] so it is easier to read and optimized for LLM parsing.

Apply the following rules:

- Keep each section self-contained and explicit.
- Expand acronyms on first use when needed.
- Use explicit labels such as Definition, Steps, Inputs, Outputs, and Examples when helpful.
- Standardize naming conventions and list style.

## Example

Input placeholder:

- [SOURCE_MARKDOWN]

Expected output shape:

```markdown
# [TITLE]

## Overview
- [SHORT_SUMMARY]

## Key Concepts
- [CONCEPT_1]

## Steps
1. [STEP_1]
2. [STEP_2]

## Examples
```bash
[COMMAND_EXAMPLE]
```
