---
mode: ask
description: "Prompt for qa-prompt-create-prompt-file-from-source."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Prompt Generator and Validator

can you create a prompt file for this md and put it in prompts dir

## Purpose

Convert an existing Markdown document into a structured AI prompt and validate the resulting prompt against repository prompt standards.

## Goal

Given a Markdown file, generate a high-quality reusable prompt that can be used by GitHub Copilot, Copilot Chat, Cursor, Claude, ChatGPT, or other AI systems.

The generated prompt should:

- Capture the intent of the source document
- Preserve important requirements
- Follow a consistent structure
- Be reusable across contexts
- Produce predictable outputs

After generation, perform a prompt quality review and identify any issues.

## Input

A selected Markdown file.

The file may contain:

- Requirements
- Specifications
- Design documents
- Process documentation
- Standards
- Guides
- Workflows
- Instructions

## Responsibilities

### Phase 1: Analyze

Review the source Markdown and identify:

- Primary objective
- Key requirements
- Constraints
- Required outputs
- Domain-specific terminology
- Success criteria

### Phase 2: Generate

Create a prompt using the following structure:

```md
# Purpose

...

# Goal

...

# Context

...

# Input

...

# Constraints

...

# Instructions

...

# Expected Output

...

# Acceptance Criteria

...

## Constraints
- Be explicit and deterministic.
- Do not assume missing facts.

## Expected Output
- Format: bullet list
- Include actionable results
