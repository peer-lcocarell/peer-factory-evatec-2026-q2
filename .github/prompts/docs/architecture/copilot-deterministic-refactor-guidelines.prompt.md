---
mode: ask
description: "Prompt for copilot-deterministic-refactor-guidelines."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Copilot Refactor Project AI Usage

## Overview

- Refactor this project to prioritize efficiency, determinism, and minimal reliance on AI or agent-based processing.

## Objective

Refactor this project to prioritize efficiency, determinism, and minimal reliance on AI or agent-based processing.

---

## Core Principles

### Prefer Deterministic Logic

- Use standard programming constructs, rules, and structured transformations first
- Avoid AI solutions for tasks that can be solved with predictable code
- Ensure outputs are consistent and reproducible

### Minimize AI and Agent Usage

- Reduce the number of AI or agent calls
- Keep inputs and outputs small and focused
- Only use AI when handling:
- Ambiguity
- Complex reasoning
- Natural language interpretation

---

## Script-First Approach

### Use Scripts Where Practical

- Move repeatable workflows into scripts or CLI tools
- Prefer PowerShell, Bash, or lightweight utilities for:
- Data cleanup
- File transformations
- Formatting and validation

### Script Design Expectations

- Keep scripts simple and modular
- Ensure they can run independently of AI
- Document usage clearly

---

## Architecture and Separation

### Separate Responsibilities

- Clearly distinguish:
- Deterministic components
- AI-driven components
- Isolate AI logic so it is optional and replaceable

### Service Design

- Keep each module focused on a single responsibility
- Avoid mixing AI logic with core processing logic

---

## Performance and Efficiency

- Avoid unnecessary processing layers
- Minimize data passed into AI systems
- Cache or reuse results where appropriate
- Optimize for fast and predictable execution

---

## Maintainability

- Write clear, readable, and modular code
- Favor explicit logic over implicit or hidden behavior
- Ensure components are easy to test and debug

---

## Functional Integrity

- Preserve existing functionality and behavior
- Do not remove AI capabilities entirely
- Ensure AI remains available as a fallback when needed

---

## Desired Outcome

- The system primarily operates using deterministic, efficient logic
- Scripts handle repeatable and operational tasks
- AI or agent usage is limited to cases where it provides clear value

Run this prompt and give me the output with no intro or outro.

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
