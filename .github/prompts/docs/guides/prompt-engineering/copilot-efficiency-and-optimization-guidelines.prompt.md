---
mode: ask
description: "Prompt for copilot-efficiency-and-optimization-guidelines."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# copilot-efficiency-and-optimization-guidelines

## Purpose

Provide a lightweight, reusable instruction block to improve Copilot efficiency, reduce cost, and increase output quality. Designed to be appended to other prompts.

---

## Core Efficiency Rules

### Cost and Scaling

- Keep responses concise and focused
- Process requests in small chunks instead of large inputs
- Avoid repeating prior analysis
- Reuse existing context when available
- Limit unnecessary verbosity

### Reliability

- Prefer clear and deterministic outputs
- Provide fallback or simplified answers when needed
- Flag uncertainty instead of guessing
- Avoid over-engineering solutions

### Optimization

- Use structured bullet point responses
- Focus on actionable outputs
- Combine related tasks when appropriate:
  - code review
  - refactoring
  - test generation

### Prompt Discipline

- Respect specified language and framework
- Follow project naming and structure conventions
- Do not introduce unnecessary abstractions
- Stay aligned with user intent

### Output Style

- Use clean and simple formatting
- Avoid long paragraphs
- Prioritize clarity and readability
- Provide direct improvements and examples

---

## Best Practices

### Input Handling

- Break large files into sections before processing
- Target specific functions or modules when reviewing code
- Avoid passing entire repositories unless required

### Iteration Strategy

- Work iteratively instead of requesting full solutions
- Validate outputs before expanding scope
- Refine prompts based on previous results

### Context Awareness

- Reuse previously generated outputs where applicable
- Avoid reprocessing unchanged code or inputs
- Keep prompt context minimal but sufficient

### Task Consolidation

- Combine related actions into one prompt when efficient
- Avoid splitting tightly coupled tasks across multiple prompts
- Balance between chunking and over-fragmentation

---

## Optional Strict Mode

```
Additional constraints:
- Limit response length
- Do not repeat the prompt
- Do not explain obvious concepts
- Focus only on high-impact issues
- Skip low-value suggestions
```

---

## Usage Example

Append this block to any Copilot prompt to enforce:

- lower token usage
- faster responses
- consistent output quality

Applicable to:

- code reviews
- QA audits
- refactoring tasks
- test generation

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
