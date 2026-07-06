---
mode: ask
description: "Prompt for qa-parser-prompt-guide."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Parser Prompt Guide

## Overview

- __Summarize Iteration Work Items__
- Define how skills and agents are used in AI workflows
- Standardize usage patterns across the team
- Improve consistency, reliability, and output quality

### Core Concepts

__Skills__

- Focused, reusable instruction sets for a single task
- Designed to be predictable and repeatable
- Narrow in scope
- Used as building blocks in workflows

__Agents__

- Orchestrate multiple skills
- Apply decision logic and workflow rules
- Handle multi-step processes and coordination

__Key Differences__

- Instructions define tone and global behavior
- Skills define how a task is executed
- Agents define how multiple tasks are combined

### Why Skills Matter

- Reduce prompt repetition
- Improve output consistency
- Lower context size requirements
- Make processes reusable and explicit
- Support team onboarding and standardization

### Observed Outcomes from Meeting

- Test case quality improved with structured logic
- Wiki updates were automated successfully
- Markdown inputs improved output quality
- Large context reduced output reliability
- Human review required for all write actions
- VS Code and CLI more effective than Visual Studio for workflows

### When to Use Skills

- Task is repeated frequently
- Inputs and outputs are clearly defined
- Output quality needs to be consistent
- Same corrections are applied repeatedly

### When Not to Use Skills

- Task is exploratory or one-time
- Inputs are unclear or unstable
- Process is not yet standardized
- No agreed rules exist

### Skill Design Principles

- Single responsibility per skill
- Clear and explicit purpose
- Deterministic behavior
- Constrained scope
- Reusable across workflows

### Skill Anatomy

__Purpose__

- Define exactly what the skill does

__Input Contract__

- Task objective
- Scope limits
- Required data sources
- Allowed tools
- Prohibited actions
- Output format requirements

__Output Contract__

- Required sections
- Level of detail
- Tone and style
- Traceability requirements
- Explicit unknowns when data is missing

__Constraints__

- Define what the skill must not do
- Prevent scope expansion or assumptions

__Validation Checklist__

- Ensure completeness
- Ensure formatting consistency
- Ensure correctness of output

__Examples__

- Provide usage examples for clarity

### How to Build a Skill

- Start with one narrow use case
- Test using realistic inputs
- Identify failure cases
- Tighten constraints
- Add validation checks
- Integrate into agent workflows only after validation

### Example Skills

__Generate QA Test Cases__

- Converts requirements into structured test cases
- Output includes preconditions, steps, expected results, negative paths
- No invented UI elements
- Validates coverage of edge cases and failures

__Summarize Iteration Work Items__

- Summarizes backlog or sprint data
- Outputs grouped summary with risks and blockers
- Does not fabricate status or ownership
- Validates counts and missing data

__Update Wiki Draft__

- Converts notes into structured wiki content
- Outputs draft and change summary
- Does not publish automatically
- Validates links and section completeness

__Convert Source to Markdown__

- Normalizes content for better readability
- Preserves structure without reinterpretation
- Validates section integrity

### Skill and Agent Workflow

- Agent receives a request
- Agent selects relevant skills
- Skills execute individual tasks
- Agent merges outputs
- Human approves final result before any write action

__Example Workflow__

- Request: release readiness summary
- Fetch work items using skill
- Summarize blockers using skill
- Draft test updates using skill
- Present output for approval

### Prompt Examples

- Generate test cases from this requirement
- Summarize iteration and include blockers
- Convert notes to Markdown with structure preserved
- Draft wiki update and stop before publishing
- Compare reporting periods and highlight differences

### Quality Controls

- Require source references for facts
- Include unknowns when data is missing
- Include risk identification
- Enforce consistent output format
- Include self-check before output

### Governance Controls

- Separate read-only and write skills
- Default to read-only execution
- Require approval for external updates
- Log actions before execution
- Restrict high-risk operations
- Maintain approval checkpoints

### Model and Context Strategy

- Use stronger models for reasoning tasks
- Use lighter models for structured output
- Keep context focused and minimal
- Reset sessions when context becomes large
- Load only required skills

### Common Failure Modes

__Vague Output__

- Fix with stricter input and output contracts

__Hallucinated Details__

- Fix with source-bound constraints and unknowns

__Inconsistent Formatting__

- Fix with enforced templates

__Unsafe Execution__

- Fix with approval gates and restrictions

### Adoption Plan

__Week 1__

- Identify top 3 repeatable tasks
- Create one skill per task

__Week 2__

- Test with real data
- Capture and fix error patterns

__Week 3__

- Combine stable skills into one agent
- Document usage guidelines

__Week 4__

- Measure effectiveness
- Decide what to scale

### Metrics

- Time saved per task
- Rework rate
- Error rate
- Approval success rate
- Adoption across team

### Key Takeaways

- Skills represent standardized task execution
- Agents manage workflows across skills
- Structured inputs improve output quality
- Governance and validation are required for reliability
- Next step is formalizing shared templates and controls

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
