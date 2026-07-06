---
mode: ask
description: "Prompt for prompt-quality-playbook."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Prompt Quality Playbook

## Purpose

- Combine prompt template, linting guidance, and scoring rubric into one reusable reference.
- Standardize prompt quality for consistent GitHub Copilot outputs.

## Inputs

- Prompt drafts
- Prompt updates or refactors
- Prompt library entries under review

## Expected Outputs

- Structured prompt with clear goal and constraints
- Linting checklist pass/fail criteria
- Numeric quality score and improvement actions

***

## High-Quality Prompt Template (Production Ready)

### Prompt

```text
## Goal
[Clearly state the single objective in one sentence]

## Context
- Language/framework: [specify]
- Environment: [optional]
- Relevant files or code:
[paste here]

## Input
[Describe exactly what the AI receives. Use placeholders if needed]
- Example: function, class, requirement description

## Constraints
- Do not change existing behavior unless specified
- Follow [coding/testing/review] best practices
- Keep output concise and structured
- Handle edge cases and error scenarios
- [Add task-specific constraints]

## Task
[Describe the task precisely. Keep it single-purpose]

## Expected Output
Provide output using the following structure:
- Format: bullet list
### Summary
[Brief explanation]

### Analysis
- Key observations
- Issues or insights

### Solution
- Step-by-step approach
- Clear reasoning

### Implementation
[Code or structured output]

### Edge Cases
- [case 1]
- [case 2]

### Improvements (Optional)
- [suggestions]

## Examples

### Input Example
[Sample input]

### Expected Output Example
[Short structured example showing expected format]
```

### Why This Template Scores High

- Strong goal definition
- Explicit input and context
- Clear constraints
- Strict output schema
- Includes examples
- Controls scope to a single task
- Reusable with placeholders
- Predictable Copilot behavior

### Minimal High-Score Variant

```text
Goal:
[one clear objective]

Input:
[code or requirement]

Constraints:
- follow best practices
- handle edge cases
- keep output structured

Output format:
- Summary
- Analysis
- Solution
- Implementation
```

### Common Enhancements

#### For Code Review

```text
Focus on:
- bugs
- performance
- readability
```

#### For Testing

```text
Requirements:
- Include positive, negative, edge cases
- Use framework best practices
```

#### For Refactoring

```text
Goal:
Improve readability and modularity without changing behavior
```

### Usage Guidelines

- Fill every section
- Keep goal single-purpose
- Add constraints to control output quality
- Include at least one example for complex prompts
- Reuse structure across prompts in the repository

### Expected Outcome

- Prompts consistently score 40 to 45
- Outputs are structured and predictable
- Copilot produces higher quality results
- Prompts are reusable across projects

***

## Prompt Linting Guide

### Purpose

- Ensure prompts are clear, consistent, reusable, and optimized for GitHub Copilot.

### Linting Rules

#### Structure Requirements

Every prompt must include:

- Goal
- Input
- Constraints
- Expected Output

Optional but recommended:

- Examples
- Notes or edge cases

#### Clarity and Precision

- Use explicit instructions
- Avoid vague wording such as perform the requested task or improve the specified content
- Define success clearly

#### Output Expectations

- Specify format explicitly (bullet points, steps, code, schema)
- Include a structured response schema when applicable
- Avoid open-ended outputs unless intentional

#### Scope Control

- Keep prompts focused on one primary objective
- Avoid mixing unrelated tasks
- Split or consolidate based on logical boundaries

#### Consistency

- Use consistent terminology across prompts
- Standardize repeated phrasing
- Align with repository naming and structure conventions

#### Reusability

- Replace hardcoded values with placeholders
- Ensure prompts work across contexts
- Avoid environment-specific assumptions unless required

### Common Issues

- Missing expected output structure
- Overly broad or vague prompt
- Too many responsibilities in one prompt
- Inconsistent naming or terminology
- Missing constraints or boundaries

### Linting Checklist

- Goal is clearly stated
- Input is defined
- Constraints are included
- Output format is specified
- Prompt is focused and not overloaded
- Wording is clear and unambiguous
- No unnecessary duplication
- Prompt is reusable

### Prompt Quality Levels

#### High Quality

- Clear structure and constraints
- Predictable output
- Easily reusable
- Copilot produces consistent results

#### Medium Quality

- Mostly clear but missing structure
- Some ambiguity in output
- Limited reuse

#### Low Quality

- Vague instructions
- No output format
- Hard to reuse
- Inconsistent results

### Workflow Integration

- Apply linting during creation and updates
- Re-lint after refactoring or splitting
- Review prompts before adding to library
- Periodically audit prompt quality

### Expected Result

- Consistent prompt structure
- Higher quality Copilot outputs
- Reduced ambiguity and rework
- Easier maintenance and scaling

***

## Prompt Scoring Rubric

### Purpose

- Provide a consistent method to score prompt quality by clarity, structure, reusability, and AI effectiveness.

### Scoring Overview

Each criterion uses 0 to 5:

- 0 = Missing or unusable
- 1 = Very poor
- 2 = Needs significant improvement
- 3 = Acceptable
- 4 = Strong
- 5 = Excellent

### Evaluation Criteria

#### 1. Goal Definition

- Measures how clearly the prompt objective is stated

Scoring:

- 0: No goal
- 3: General goal, lacks precision
- 5: Clear, specific, actionable

#### 2. Input Clarity

- Measures how explicitly required inputs are defined

Scoring:

- 0: No input defined
- 3: Input mentioned but vague
- 5: Explicit and structured inputs

#### 3. Constraints

- Measures limits, requirements, and boundaries

Scoring:

- 0: No constraints
- 3: Some constraints but incomplete
- 5: Clear, enforceable constraints

#### 4. Output Specification

- Measures structure and format definition

Scoring:

- 0: No output guidance
- 3: General expectation only
- 5: Strict, structured output schema

#### 5. Clarity and Wording

- Measures readability and instruction precision

Scoring:

- 0: Unclear or confusing
- 3: Understandable but ambiguous
- 5: Clear, direct, unambiguous

#### 6. Scope Control

- Measures whether the prompt stays focused

Scoring:

- 0: Multiple unrelated tasks
- 3: Some overlap
- 5: Single clear focus

#### 7. Reusability

- Measures portability across contexts

Scoring:

- 0: Hardcoded and specific
- 3: Some generalization
- 5: Fully reusable with placeholders

#### 8. Example Usage

- Measures quality and usefulness of examples

Scoring:

- 0: No examples
- 3: Basic example
- 5: Clear, helpful examples

#### 9. AI Compatibility

- Measures predictability with Copilot and LLMs

Scoring:

- 0: Poor AI usability
- 3: Works but inconsistent
- 5: Highly predictable outputs

### Scoring Summary

- Total possible score: 45

Quality bands:

- 40 to 45: Production-ready prompt
- 30 to 39: Good, minor improvements needed
- 20 to 29: Medium quality, requires refinement
- 10 to 19: Poor, major issues
- 0 to 9: Not usable

### Example Scoring

- Goal: 5
- Input: 4
- Constraints: 3
- Output: 5
- Clarity: 4
- Scope: 5
- Reusability: 4
- Examples: 2
- AI Compatibility: 4

Total: 36
Rating: Good quality, improvement needed in examples and constraints

### Usage Workflow

- Score prompts during creation
- Re-score after refactoring or splitting
- Prioritize improving prompts under score 30
- Use scores to maintain consistency across library

### Improvement Guidelines

If score is low:

- Add missing structure sections
- Define strict output schema
- Simplify wording
- Reduce scope
- Add examples
- Replace hardcoded values with placeholders

### Expected Result

- Standardized prompt quality
- Consistent and predictable AI outputs
- Easier maintenance and scaling
- Improved productivity with GitHub Copilot
