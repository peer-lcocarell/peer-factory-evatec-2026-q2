---
mode: ask
description: "Prompt for qa-prompt-style-guide-quick-reference."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Prompt Style Guide Quick Reference

## Overview

- Rewrite the following content to improve clarity, structure, and professionalism.

### Purpose

- Provide consistent rules for writing and refining QA-related prompts and content
- Improve clarity, readability, and professionalism
- Ensure compatibility with systems such as AO

### Usage Scope

- Test cases
- QA notes
- Bug reports
- Requirement reviews
- Verification steps
- Planning documentation
- AI-generated responses

### Prompt Template

Rewrite the following content to improve clarity, structure, and professionalism.

Requirements:

- Use concise, plain language
- Use bullet points for readability
- Remove redundancy and vague wording
- Make timelines, outcomes, and responsibilities explicit when possible
- Do not add new information

Structure content into:

__Objective__ -

__Current Status__ -

__Key Changes or Progress__ -

__Risks or Issues__ -

__Next Steps__ -

Content to improve: [Paste text here]

### Core Writing Rules

__Use Plain Professional Wording__

- Maintain a professional tone
- Do not use emojis or emoticons
- Avoid overly casual language
- Keep responses direct and readable

__Keep Formatting Clean and Simple__

- Use consistent formatting
- Avoid excessive styling
- Ensure compatibility with systems such as ADO
- Keep spacing and structure readable

__No Decorative Dividers__

- Do not use repeated symbols for separation
- Avoid visual clutter

__Formatting Requirements__

- Do not use markdown header styles
- Use bold and underlined section titles only
- Keep all sections and subsections the same size
- Use bullet points for all content
- Avoid long paragraphs

### General Writing Rules

__No Arrows__

- Avoid arrow symbols in all content

Use:

- A changes to B
- A transitions to B

__No Semicolons__

- Use short, direct sentences
- Separate steps clearly

__No Summary Sections__

- Do not add recap sections
- Provide complete content directly

__Avoid the Word "Like"__

- Use precise wording instead of comparisons

__Avoid "Is Successful"__

- Describe observable results instead

__Use Tester-Friendly Language__

- Use "tester" instead of "operator"
- Write clear, direct actions

__Focus on Observable Results__

- Describe visible system behavior
- Avoid vague statements

### Concise Writing Guidance

- Keep content short and clear
- Preserve all important technical details
- Remove filler and repetition

Example prompts:

- Rewrite this to be more concise while preserving meaning
- Condense this without losing important information
- Edit for clarity and precision

### Recommended Characteristics

- Clear
- Concise
- Action-oriented
- Easy to scan
- Technically accurate
- Consistent

__Avoid__

- Long paragraphs
- Redundant wording
- Ambiguous phrases
- Informal tone

### Example Rewrite

Original: Tester opens the configuration screen and changes the value. Verify it is successful.

Improved: Tester opens the configuration screen Tester changes the value Verify the updated value is displayed after saving and reopening the screen

### Suggested Review Prompt

Review this content using the QA Prompt Style Guide

Check for:

- Clear tester actions
- Concise wording
- Observable expected results
- Consistent formatting
- Grammar or spelling issues
- Redundant content
- Ambiguous statements

Constraints:

- Do not use semicolons
- Do not use arrows
- Do not use emojis
- Do not add summaries

### Workspace Analysis Prompt

Objective: Provide a structured summary of a VS Code workspace based on observable evidence

Instructions:

- Scan source files, configs, README, and tests
- Base all findings on actual content
- Avoid assumptions

__Project Summary__

- Purpose of the project
- Problem it solves
- Core technologies used

__Progress__

- Implemented features
- Completed modules
- Partial work

__Test Suite Updates__

- Test structure and coverage
- Recent changes
- Missing coverage areas

__Goals__

- Identified from TODOs or comments
- Planned improvements

__Take Aways__

- Key insights on structure and quality
- Risks and strengths

Constraints:

- Use bullet points only
- Avoid long explanations
- Do not speculate

### QA Analysis Prompt

Objective: Provide a QA-focused assessment of the workspace

Instructions:

- Focus on risks, coverage, and regression areas
- Use only observable evidence

__Project Summary__

- System type
- Key technologies

__Progress__

- Implemented features affecting behavior
- Completed modules needing regression testing
- Partial implementations

__Test Coverage Assessment__

- Existing test types
- Covered modules
- Missing or weak areas

__Test Suite Updates__

- Recent changes
- Duplicate or outdated tests
- Stability concerns

__Quality Risks__

- Complex logic areas
- Lack of testing
- External dependencies
- Error handling gaps

__Regression Impact Areas__

- Shared logic and dependencies
- Tightly coupled components

__Goals__

- QA-relevant future work
- Areas needing test expansion

__Take Aways__

- Key QA insights
- Immediate testing priorities
- Critical risks

Constraints:

- Use bullet points only
- Keep content concise
- Focus on actionable QA insights

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
