---
mode: ask
description: "Prompt for qa-bug-prompt-style-guide."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Bug Prompt Style Guide

## Overview

- __Use Plain Professional Wording__

### Purpose

- Provide a consistent structure for creating Azure DevOps bugs
- Ensure clarity, precision, and QA-friendly language
- Improve reproducibility and triage efficiency

### Core Writing Rules

__Use Plain Professional Wording__

- Maintain a professional tone
- Do not use emojis or emoticons
- Avoid overly casual language
- Keep wording direct and readable

__Clarity and Structure__

- Use short, clear sentences
- Use concise, precise wording
- Remove redundancy and filler
- Keep all content actionable

__Restrictions__

- Do not use arrow symbols
- Do not use decorative dividers
- Do not use semicolons
- Avoid the word "like"
- Avoid phrases such as "is successful"

__Expected Behavior Description__

- Describe observable system behavior only
- Avoid vague or subjective wording

__No Summary Sections__

- Do not add recap sections
- Provide complete content directly

### Conciseness Guidelines

- Reduce redundancy while preserving meaning
- Condense without losing key details
- Remove repetition and filler
- Maintain clarity and completeness

### Azure DevOps Bug Template

__Title__

- Clear and specific description of the issue

__Area Path__ -

__Iteration Path__ -

__Severity__

- Critical
- High
- Medium
- Low

__Repro Rate__

- Always
- Intermittent
- Rare

__Environment__

- Build version
- Tool or system used
- Configuration details
- Setup details

__Preconditions__

- Only required setup steps
- Use simple bullet points

__Steps to Reproduce__

- Write from tester perspective
- Use clear and direct actions
- Do not combine steps

__Expected Result__

- Describe intended system behavior
- Keep wording precise

__Actual Result__

- Describe exact observed behavior
- Include error messages or incorrect states

__Attachments__

- Logs
- Screenshots
- Recordings

__Notes__

- Optional
- Include relevant observations only
- Avoid speculation

### Severity Guidelines

- Critical: crash, startup failure, data loss, blocked workflow
- High: repeated failure, timeout blocking workflow, connection failure
- Medium: recoverable issue, retry required, degraded behavior
- Low: warning, expected fallback, minor issues

### Mandatory Fields

- Title
- Severity
- Source
- Build
- Found In Build

### Bug Form Reference

__Top-Level Fields__

- Title
- State
- Reason
- Area
- Iteration
- Assigned To

__Description Sections__

- Repro Steps
- Symptom
- System Info
- Fix
- Triage Comments
- Root Cause Analysis
- Discussion

__Planning__

- Priority
- Severity
- Effort Level
- Committed

__Effort Tracking__

- Original Estimate
- Remaining Work
- Completed Work

__Classification__

- Discipline
- Root Cause
- Test Case Required

__Source__

- Source
- Requested By
- Requested Release
- Customer ID

__Build Information__

- Build
- Found In Build
- Integrated In
- Tested In

__Development__

- Related repos
- Pull requests
- Branches

__Related Work__

- Linked work items

### Optional Refinement Prompt

- Edit for conciseness and precision
- Remove repetition and filler
- Preserve all key facts and meaning

### Log Analysis Extension

__Expected Report Output__

- Files analyzed
- Exception groups
- Timeline
- Parsed exception table
- Repeated patterns
- QA follow-up recommendations
- Parsing assumptions

__Post-Processing Guidance__

- Explain how to run the parser
- Identify output file locations
- Describe how to adjust patterns for project-specific logs

__Formatting Requirements__

- Do not use markdown headers
- Use bold and underlined section titles only
- Keep all sections the same size
- Use bullet points for all content
- Avoid long paragraphs

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
