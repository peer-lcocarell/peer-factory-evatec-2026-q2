<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

---
mode: ask
description: "Generate a QA-friendly commit message for tracking and validation."
---

# QA Prompt: Commit QA Friendly

## Base

Apply shared rules from:

- `.github/prompts/qa-prompt-commit-base.prompt.md`

## Variant Constraints

- Clear summary line in imperative mood
- Add bullets for functional changes
- Mention affected components/modules when present
- Highlight validations, edge cases, and error handling when present
- Mention regression risk if applicable

## Expected Output

- Summary line
- Bullet points for behavior changes, test impact, and system interactions
- No intro or outro

## Prompt

Write a detailed Git commit message suitable for QA tracking.

Context:
[PASTE_GIT_STATUS_OR_DIFF]

## Goal

- Define the primary objective clearly.

## Input

- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.
