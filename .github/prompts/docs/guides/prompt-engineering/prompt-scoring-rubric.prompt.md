---
mode: ask
description: "Prompt for prompt-scoring-rubric."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Prompt Scoring Rubric

***

## Purpose

Provide a consistent method to evaluate prompt quality based on clarity, structure, reusability, and effectiveness with GitHub Copilot.

***

## Scoring Overview

Each prompt is evaluated across criteria and assigned a score from 0 to 5 per category.

* 0 = Missing or unusable
* 1 = Very poor
* 2 = Needs significant improvement
* 3 = Acceptable
* 4 = Strong
* 5 = Excellent

***

## Evaluation Criteria

### 1. Goal Definition

* Clearly states what the prompt is trying to achieve

* 0: No goal
* 3: General goal, lacks precision
* 5: Clear, specific, actionable

***

### 2. Input Clarity

* Defines what information is required from the user

* 0: No input defined
* 3: Input mentioned but vague
* 5: Explicit and structured inputs

***

### 3. Constraints

* Defines limits, requirements, or boundaries

* 0: No constraints
* 3: Some constraints but incomplete
* 5: Clear, enforceable constraints

***

### 4. Output Specification

* Defines expected structure and format of output

* 0: No output guidance
* 3: General expectations only
* 5: Strict, structured output schema

***

### 5. Clarity and Wording

* Readability and precision of instructions

* 0: Unclear or confusing
* 3: Understandable but ambiguous
* 5: Clear, direct, unambiguous

***

### 6. Scope Control

* Focus on a single task or cohesive objective

* 0: Multiple unrelated tasks
* 3: Some scope overlap
* 5: Single clear focus

***

### 7. Reusability

* Ability to reuse prompt across contexts

* 0: Hardcoded and specific
* 3: Some generalization
* 5: Fully reusable with placeholders

***

### 8. Example Usage

* Includes examples to guide outputs

* 0: No examples
* 3: Basic example
* 5: Clear, helpful examples

***

### 9. AI Compatibility

* Optimized for GitHub Copilot or LLM behavior

* 0: Poor AI usability
* 3: Works but inconsistent
* 5: Highly predictable outputs

***

## Scoring Summary

Total possible score: 45

### Quality Bands

* 40-45: Production-ready prompt
* 30-39: Good, minor improvements needed
* 20-29: Medium quality, requires refinement
* 10-19: Poor, major issues
* 0-9: Not usable

***

## Example Scoring

Prompt evaluated:

* Goal: 5
* Input: 4
* Constraints: 3
* Output: 5
* Clarity: 4
* Scope: 5
* Reusability: 4
* Examples: 2
* AI Compatibility: 4

Total: 36
Rating: Good quality, improvement needed in examples and constraints

***

## Usage Workflow

* Score prompts during creation
* Re-score after refactoring or splitting
* Prioritize improving prompts under score 30
* Use scores to maintain consistency across prompt library

***

## Improvement Guidelines

If score is low:

* Add missing structure sections
* Define a strict output schema
* Simplify wording
* Reduce scope
* Add examples
* Replace hardcoded values with placeholders

***

## Expected Result

* Standardized prompt quality
* Consistent and predictable AI outputs
* Easier maintenance and scaling
* Improved productivity with GitHub Copilot

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
