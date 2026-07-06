---
mode: ask
description: "Prompt for qa-prompt-style-guide-master."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Prompt Style Guide Master

## Overview

- Rewrite the following project summary or update to improve clarity, structure, and professionalism.

Prompt: Rewrite the following project summary or update to improve clarity, structure, and professionalism. Requirements:

Use concise, plain language Organize content into clear sections:

Objective Current Status Key Changes or Progress Risks or Issues Next Steps

Use bullet points for readability Remove redundancy and vague wording Make timelines, outcomes, and responsibilities explicit where possible Keep the tone professional and direct Do not add new information that is not present

Content to improve: [Paste your text here]

dont use header styles just bolded underlined sections and subsections ,same size

## Core Writing Rules

### Use Plain Professional Wording

- Maintain a professional tone
- Do not use emojis or emoticons
- Avoid overly casual language
- Keep responses direct and readable

### Keep Formatting Clean and Simple

- Use consistent formatting
- Avoid excessive styling
- Ensure compatibility with systems such as ADO
- Keep spacing and structure readable

### No Decorative Dividers

- Do not use repeated symbols for separation
- Avoid visual clutter

## Introduction

This guide is intended to help QA team members create cleaner, more consistent prompts and responses when working with AI tools such as Copilot or ChatGPT.

The goal is to improve:

- Test case readability
- Requirement clarity
- QA workflow consistency
- ADO compatibility
- Professional communication
- Concise technical writing

Use these rules when reviewing, rewriting, generating, or formatting:

- Test cases
- QA notes
- Bug reports
- Requirement reviews
- Verification steps
- Planning documentation
- AI-generated responses

## Example Prompt

```text
Look at my test case following these rules and suggest improvements.
```

Additional prompt examples:

```text
Rewrite this using the QA Prompt Style Guide.
```

```text
Make this more concise while preserving all key details.
```

```text
Review this test case for clarity, wording, and QA consistency.
```

```text
Rewrite this using tester-friendly language and clean formatting.
```

## Core Writing Rules

### Use Plain Professional Wording

- Maintain a professional tone
- Do not use emojis or emoticons
- Avoid overly casual language
- Keep responses direct and readable

### Keep Formatting Clean and Simple

- Use consistent formatting
- Avoid excessive styling
- Ensure compatibility with systems such as ADO
- Keep spacing and structure readable

### No Decorative Dividers

- Do not use repeated symbols for separation
- Avoid visual clutter

Avoid:

```text
====================
--------------------
********************
```

### No Stylized Headers

Avoid decorative or non-standard section headers.

Avoid:

```text
### ~~~ Test Case ~~~
```

Use:

```text
### Test Case
```

### No Arrows or Arrow Characters

Do not use arrows in steps, notes, or formatting.

Avoid:

```text
A -> B
A => B
```

Use:

```text
A changes to B
A transitions to B
```

### No Semicolons

Use short, direct sentences.

Avoid combining multiple thoughts into one sentence.

Avoid:

```text
Tester opens PTC; tester updates the value.
```

Use:

```text
Tester opens PTC.
Tester updates the value.
```

### No Summary Sections

- Do not add recap sections
- Provide complete content directly
- Avoid unnecessary concluding summaries

## Concise Writing Guidance

Use concise wording while preserving important technical details.

Recommended prompt examples:

```text
Rewrite this to be more concise while preserving all key facts and meaning.
```

```text
Condense this content without losing important information.
```

```text
Streamline this text for brevity while keeping all meaningful details.
```

```text
Shorten this while maintaining completeness and clarity.
```

```text
Edit for conciseness and precision.
```

## QA Writing Rules

### Avoid the Word "Like"

Use precise wording instead of comparisons.

Avoid:

```text
Errors like this may occur.
```

Use:

```text
Communication, timeout, or configuration errors may occur.
```

### Avoid Phrases Such as "Is Successful"

Describe observable behavior instead.

Avoid:

```text
Verify save is successful.
```

Use:

```text
Verify the configuration is saved and displayed after reopening the screen.
```

### Use Tester-Friendly Language

- Write steps from the tester perspective
- Use direct actions
- Keep instructions simple and easy to follow

Avoid:

```text
Operator validates process execution.
```

Use:

```text
Tester validates the process execution.
```

### Focus on Observable Results

Expected results should describe visible system behavior.

Avoid vague wording.

Avoid:

```text
System works correctly.
```

Use:

```text
System displays the updated value in the configuration table.
```

## Recommended QA Style

### Preferred Characteristics

- Clear
- Concise
- Action-oriented
- Easy to scan
- Technically accurate
- Consistent across test cases

### Avoid

- Filler wording
- Redundant statements
- Long paragraphs
- Ambiguous phrases
- Informal language

## Excel Export Formatting

When generating Excel output:

- Use bold headers with gray background
- Apply auto-fit to all columns
- Enable word wrap
- Use top-aligned text
- Apply thin borders
- Freeze the top row
- Use Calibri size 11

## Example QA Rewrite

### Original

```text
Tester opens the configuration screen and changes the value; verify the update is successful and looks correct.
```

### Improved

```text
Tester opens the configuration screen.
Tester changes the value.
Verify the updated value is displayed after saving and reopening the screen.
```

## Suggested AI Review Prompt

```text
Review this test case using the QA Prompt Style Guide.

Check for:
- Clear tester actions
- Concise wording
- Observable expected results
- Consistent formatting
- Grammar or spelling issues
- Redundant wording
- Ambiguous statements
- Compliance with ADO-friendly formatting

Do not add summaries.
Do not use semicolons, arrows, emojis, or decorative formatting.
```

You are analyzing a full VS Code workspace.

Objective: Provide a clear, concise, and structured summary of the project based on the codebase, configuration files, and folder structure. Avoid assumptions not supported by evidence in the repository.

QA Prompt Style Guide

__Core Writing Rules__

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

Formatting Requirements:

- Do not use markdown header styles
- Use bolded and underlined section titles only
- Keep all sections and subsections the same size
- Use bullet points for all content
- Avoid long paragraphs

Instructions:

- Scan the entire workspace including source files, README, configs, and test files
- Identify the core purpose of the application
- Prioritize clarity and brevity
- Base all statements on observable evidence in the repository

Output Format:

__Project Summary__

- Describe the main purpose of the project
- Identify the primary problem it solves or function it provides
- Note the core technologies or frameworks used

__Progress__

- Highlight implemented features or completed components
- Identify major modules or systems already built
- Mention any partially completed areas if visible

__Test Suite Updates__

- Describe current test coverage and structure
- Note any recent or visible updates to test files
- Identify gaps or missing test areas if obvious

__Goals__

- Infer short-term and long-term goals based on TODOs, comments, or roadmap mentions
- Identify intended future features or improvements
- Keep goals grounded in evidence from the codebase

__Take Aways__

- Provide key insights about code quality, structure, and design approach
- Call out strengths and potential risks
- Mention any patterns, architecture style, or technical decisions worth noting

Constraints:

- Keep each section concise using bullet points
- Avoid long paragraphs
- Do not speculate beyond what is observable in the workspace
- Focus on actionable and meaningful insights

You are analyzing a full VS Code workspace from a QA perspective.

Objective: Provide a structured, evidence-based QA assessment of the project. Focus on quality risks, test coverage, regression impact, and gaps. Do not describe the project at a high level only. Prioritize QA-relevant insights that can guide testing decisions.

QA Prompt Style Guide

__Core Writing Rules__

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

Formatting Requirements:

- Do not use markdown header styles
- Use bolded and underlined section titles only
- Keep all sections and subsections the same size
- Use bullet points for all content
- Avoid long paragraphs

Analysis Instructions:

- Scan source code, test files, configs, pipelines, and documentation
- Prioritize testability, reliability, and system behavior
- Base all findings strictly on observable evidence
- Do not speculate without indicators such as TODOs, missing tests, or incomplete logic

Output Format:

__Project Summary__

- Identify system type and purpose in one or two bullets
- List core technologies and key components relevant to testing

__Progress__

- Identify implemented features that impact system behavior
- Highlight completed modules that require regression testing
- Note partially implemented logic or TODO areas

__Test Coverage Assessment__

- List existing test types (unit, integration, e2e, etc.)
- Identify modules with test coverage
- Identify modules with missing or weak coverage
- Call out absence of critical test categories if applicable

__Test Suite Updates__

- Identify recent additions or modifications to test files
- Note patterns such as duplicated tests, outdated tests, or inconsistent structure
- Highlight unstable or brittle test indicators

__Quality Risks__

- Identify high-risk areas based on:
- Complex logic
- Lack of tests
- External dependencies
- Configuration-heavy components
- Call out error handling gaps
- Highlight potential failure points

__Regression Impact Areas__

- Identify modules most likely to break with future changes
- Highlight shared utilities or core logic dependencies
- Note tightly coupled components

__Goals__

- Extract QA-relevant goals from comments, TODOs, or structure
- Identify areas intended for expansion or refactoring
- Highlight planned features that require future test coverage

__Take Aways__

- Summarize key QA insights
- Identify immediate testing priorities
- Call out strengths in testability or design
- Highlight critical risks that should be addressed before release

Constraints:

- Keep all sections concise using bullet points
- Avoid long explanations
- Do not speculate beyond code evidence
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
