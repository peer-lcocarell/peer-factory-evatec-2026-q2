---
mode: ask
description: "Prompt for qa-wiki-formatting-prompt-guide."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Wiki Formatting Prompt Guide

## Overview

- Convert the following content into a clean, structured, wiki-style Markdown document.

### Purpose

- Provide a reusable prompt to convert raw content into structured wiki-style Markdown
- Improve readability, consistency, and usability across QA and technical documentation

### Objective

- Transform unstructured or poorly formatted content into clean, scannable documentation
- Enable consistent formatting across tools such as VS Code and Azure DevOps

### Core Prompt

Convert the following content into a clean, structured, wiki-style Markdown document.

Objective:

- Improve readability and structure
- Organize content into logical sections
- Make the document easy to scan and use for reference

Content Rules:

- Use concise bullet points
- Group related information into clear sections
- Remove redundancy and filler wording
- Do not remove important technical details
- Do not add new information

Formatting Rules:

- Use plain professional wording
- Avoid overly casual language
- Maintain consistent formatting
- Avoid visual clutter
- Do not use arrow symbols
- Do not use semicolons
- Do not use markdown header syntax
- Use bold and underlined section titles only
- Keep all sections the same size
- Avoid long paragraphs

### Structure Guidelines

__Section Organization__

- Group related content into logical sections
- Use clear section labels
- Keep hierarchy simple and flat

__Content Transformation__

- Convert paragraphs into bullet points
- Break large blocks into smaller units
- Highlight key concepts, workflows, and rules

__Suggested Sections__

- Purpose
- Key Concepts
- Workflows or Processes
- Rules and Constraints
- Important Details
- References or Notes

__Adaptation__

- Adjust section names based on content
- Include only relevant sections
- Keep output concise and structured

### Styling Guidance

__Readability Enhancements__

- Use consistent spacing between sections
- Use indentation for sub-points
- Maintain clean alignment

__Visual Clarity__

- Emphasize section titles using bold and underline
- Keep text density low
- Avoid unnecessary formatting elements

__Consistency__

- Maintain uniform bullet style
- Use predictable structure across sections
- Keep wording short and precise

### Usage Scenarios

- Converting raw notes into documentation
- Cleaning technical specifications
- Preparing wiki pages
- Standardizing QA documentation
- Formatting meeting notes

### Expected Output Characteristics

- Easy to scan
- Clearly structured
- Consistent formatting
- No redundant information
- Ready for wiki or ADO usage

### Input Placeholder

[Paste document or file content here]

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
