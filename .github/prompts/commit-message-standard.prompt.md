---
mode: ask
description: "Prompt for commit-message-standard-prompt."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Commit Message Standard Prompt

## Overview

- Write a concise and professional Git commit message that summarizes the changes in the current staged files.

Write a concise and professional Git commit message that summarizes the changes in the current staged files.

Requirements:

- Use a clear title line under 72 characters
- Use imperative mood such as Add, Fix, Update
- Include a short body with bullet points describing key changes
- Focus on what changed and why, not how
- Group related changes logically
- Avoid unnecessary detail

If applicable, include:

- Bug fixes
- New features
- Refactoring
- Test updates
- Configuration changes

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
