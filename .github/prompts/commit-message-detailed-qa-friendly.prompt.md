---
mode: ask
description: "Generate a detailed QA-friendly Git commit message."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA-Friendly Commit Message Generator

## Objective

Generate a detailed Git commit message that clearly describes the change, its impact, and any testing considerations. The output should help QA, developers, and reviewers understand what was changed and what areas require validation.

## Inputs

- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]

## Rules

- Use only facts present in the provided input.
- Do not infer requirements, intent, or functionality not explicitly stated.
- Be concise but sufficiently detailed for traceability.
- Focus on observable behavior and implementation changes.
- Highlight potential regression areas when applicable.
- Mention modified components, modules, services, or UI areas when identifiable.

## Required Output Structure

### Summary

- Single-line commit summary
- Imperative tense
- Maximum 72 characters

### Functional Changes

- Describe user-facing or system behavior changes
- Explain what was added, updated, fixed, or removed

### Technical Changes

- List affected files, classes, methods, modules, services, or components
- Describe notable implementation details

### Validation and Error Handling

- Added validations
- Error handling improvements
- Boundary conditions addressed
- Edge cases covered

### QA Impact

- Areas requiring regression testing
- New test scenarios introduced
- Existing functionality potentially affected

### Risk Assessment

- Risk Level: Low | Medium | High
- Brief justification

## Expected Output Example

Summary:
- Fix configuration comparison handling for empty host item lists

Functional Changes:
- Added comparison support when target configuration contains no host items
- Correctly identifies newly added host item entries

Technical Changes:
- Updated configuration comparison logic for list-based nodes
- Modified host item comparison workflow

Validation and Error Handling:
- Added handling for empty target collections
- Prevented false-negative comparison results

QA Impact:
- Verify compare results with empty source and target lists
- Verify added host items are detected correctly
- Regression test other list-based comparison features

Risk Assessment:
- Risk Level: Medium
- Change affects shared list comparison logic