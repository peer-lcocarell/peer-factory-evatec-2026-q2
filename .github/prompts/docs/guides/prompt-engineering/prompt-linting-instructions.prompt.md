---
mode: ask
description: "Prompt for prompt-linting-instructions."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Prompt Linting Guide

***

## Purpose

Ensure all prompts are clear, consistent, reusable, and optimized for GitHub Copilot. This helps maintain high-quality outputs and reduces ambiguity when prompts are used across the workspace.

***

## Linting Rules

### Structure Requirements

Every prompt must include:

* Goal
* Input
* Constraints
* Expected Output

Optional but recommended:

* Examples
* Notes or edge cases

***

### Clarity and Precision

* Use explicit instructions
* Avoid vague wording such as "handle this" or "improve it"
* Clearly define what success looks like

***

### Output Expectations

* Specify format explicitly (bullet points, steps, code, schema)
* Include a structured response schema when applicable
* Avoid open-ended outputs unless intentional

***

### Scope Control

* Keep prompts focused on one primary objective
* Avoid mixing unrelated tasks in a single prompt
* Split or consolidate prompts based on logical boundaries

***

### Consistency

* Use consistent terminology across prompts
* Standardize phrasing for repeated concepts
* Align with repository naming and structure conventions

***

### Reusability

* Replace hardcoded values with placeholders
* Ensure prompts work across multiple contexts
* Avoid environment-specific assumptions unless required

***

## Common Issues

* Missing expected output structure
* Overly broad or vague prompts
* Too many responsibilities in one prompt
* Inconsistent naming or terminology
* Lack of constraints or boundaries

***

## Linting Checklist

Before finalizing a prompt, verify:

* Goal is clearly stated
* Input is defined
* Constraints are included
* Output format is specified
* Prompt is focused and not overloaded
* Wording is clear and unambiguous
* No unnecessary duplication
* Prompt is reusable

***

## Prompt Quality Levels

### High Quality

* Clear structure and constraints
* Predictable output
* Easily reusable
* Copilot produces consistent results

***

### Medium Quality

* Mostly clear but missing structure
* Some ambiguity in output
* Limited reuse

***

### Low Quality

* Vague instructions
* No output format
* Hard to reuse
* Leads to inconsistent results

***

## Workflow Integration

* Apply linting when creating or updating prompts
* Re-lint prompts after refactoring or splitting files
* Review prompts before adding them to the library
* Periodically audit prompt quality across the repository

***

## Expected Result

* Consistent prompt structure
* Higher quality Copilot outputs
* Reduced ambiguity and rework
* Easier maintenance and scaling of prompt library

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
