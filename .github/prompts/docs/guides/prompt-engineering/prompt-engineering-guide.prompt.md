---
mode: ask
description: "Prompt for prompt-guide."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# High-Quality Prompt Template (Production Ready)

***

## Prompt

```
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

***

# Why This Template Scores High

## Strengths

* Strong goal definition
* Explicit input and context
* Clear constraints
* Strict output schema
* Includes examples
* Controls scope to a single task
* Reusable with placeholders
* Predictable Copilot behavior

***

# Minimal High-Score Variant

Use this when you need a shorter version that still performs well:

```
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

***

# Common Enhancements

## For Code Review

Add:

```
Focus on:
- bugs
- performance
- readability
```

***

## For Testing

Add:

```
Requirements:
- Include positive, negative, edge cases
- Use framework best practices
```

***

## For Refactoring

Add:

```
Goal:
Improve readability and modularity without changing behavior
```

***

# Usage Guidelines

* Always fill every section
* Keep the goal single-purpose
* Add constraints to control output quality
* Include at least one example for complex prompts
* Reuse structure across all prompts in the repo

***

# Expected Outcome

Using this template:

* Prompts consistently score 40-45
* Outputs are structured and predictable
* Copilot produces higher quality results
* Prompts are reusable across projects

***
