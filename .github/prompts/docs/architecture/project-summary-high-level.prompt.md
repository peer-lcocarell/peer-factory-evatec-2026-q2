---
mode: ask
description: "Prompt for project-summary-high-level."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# project-summary-high-level-standard

## Overview

- Purpose: Provide a clear, structured, and high-level summary of a project
- Goal: Enable fast understanding of purpose, scope, and impact for both technical and non-technical audiences
- Scope: Applies to feature deliveries, system updates, integrations, and release summaries
- The idea is to get a snap shot of the project and the next goals clearly defined. This is a high-level summary of the project and should be used to communicate with stakeholders, team members, and other interested parties. And give me a clear understanding of the project and its goals. The summary should be concise, clear, and easy to understand. It should provide a high-level overview of the project, its purpose, scope, and impact. It should also include any relevant metrics or success criteria, as well as any risks or considerations that may impact the project. The summary should be structured in a way that is easy to read and understand, with clear headings and bullet points where appropriate.

## Document Principles

- Focus on clarity and brevity
- Present only essential information
- Use plain and professional language
- Ensure content is scannable and logically structured
- Avoid implementation-level detail unless required for context

## Project Identification

- Project Name
  - Clear and descriptive
  - Aligned with internal naming conventions
- Version or Release Identifier
  - Include if applicable
- Date
  - Use standard format such as YYYY-MM-DD

## Executive Overview

- Provide a concise description of the project
- Define what problem is being solved
- Explain why the project matters
- Describe the high-level outcome or improvement

## Project Purpose

- Define the primary objective
- Identify the business or technical problem being addressed
- Describe expected value or impact
  - Efficiency improvements
  - Risk reduction
  - User experience gains
  - System reliability or performance

## Scope Definition

- In Scope
  - List included features, components, or systems
  - Group related areas logically
- Out of Scope
  - Clearly state excluded items
  - Prevent ambiguity for stakeholders

## Key Changes

- Group updates into logical categories
- Describe changes in terms of observable behavior or system impact
- Avoid internal implementation detail

### Example Change Categories

- Configuration Changes
  - Updates to system parameters
  - Environment standardization
- Feature Enhancements
  - Improvements to workflows or usability
  - Added validations or controls
- Bug Fixes
  - Issues impacting accuracy, stability, or performance
- Performance Improvements
  - Optimizations affecting speed or resource usage

## Dependencies

- List required systems, tools, or services
- Identify integration points
- Note any version constraints or compatibility requirements

## Assumptions

- Define conditions assumed to be true
- Include environment, configuration, or usage expectations
- Ensure assumptions are explicit and testable where possible

## Risks and Considerations

- Identify potential issues or limitations
- Highlight areas requiring monitoring
- Note known gaps or constraints
- Include operational or deployment risks

## Validation Approach

- Describe how the project was or should be validated
- Include high-level QA coverage such as:
  - Functional validation
  - Regression testing
  - Integration checks
- Reference test artifacts if applicable

## Impact Assessment

- Describe how changes affect:
  - Users
  - Existing workflows
  - System behavior
- Identify any required user actions or adjustments
- Note backward compatibility considerations

## Outcome

- Define the expected result after implementation
- Confirm alignment with project purpose
- Describe measurable improvements if available

## Optional Sections

### Metrics and Success Criteria

- Define how success is measured
- Include quantitative or observable indicators

### Rollout Strategy

- Describe deployment approach
  - Phased rollout
  - Full release
- Note rollback considerations

### Notes

- Include additional context if necessary
- Capture important clarifications
- Keep entries concise and specific

## Writing Rules

- Use consistent terminology throughout
- Avoid vague terms such as improved or fixed without context
- Ensure each bullet delivers a clear piece of information
- Keep structure uniform across all project summaries

## Output Expectations

- Clean and structured document
- Easy to scan and understand in under a few minutes
- Suitable for status updates, release notes, and stakeholder communication
- Ready for use without additional editing

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
