---
mode: ask
description: "Prompt for converting Word documents to Markdown with diagram and image text extraction."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# qa-word-docx-to-markdown-with-diagram-extraction

## Purpose

- Convert a Microsoft Word document into structured Markdown.
- Preserve document meaning, section hierarchy, and references.
- Extract text from embedded images and diagrams.
- Reconstruct diagram logic in text without inventing missing information.

## Inputs

- Source file: [SOURCE_DOCX]
- Optional context: [BUSINESS_CONTEXT]
- Optional conversion requirements: [FORMAT_PREFERENCES]

## Scope

- In scope:
  - Headings, paragraphs, lists, tables, links, notes, captions.
  - Embedded images and screenshots.
  - Diagram photos and exported flow/state/workflow graphics.
- Out of scope:
  - Pixel-perfect Word styling replication.
  - Recreating editable native diagram objects from photos.

## Core Rules

1. Preserve all meaningful content from the source document.
2. Do not summarize unless explicitly requested.
3. Preserve exact wording when legible.
4. Mark unreadable or ambiguous text as [UNCERTAIN].
5. Never invent missing content.
6. Keep section order aligned with the source document.
7. Keep all image and diagram references traceable.

## Conversion Workflow

1. Extract document structure.
   - Capture title, headings, subheadings, body text, lists, and tables.
2. Convert structure to Markdown.
   - Use stable heading levels and valid Markdown table syntax.
3. Process images and diagrams.
   - Assign a stable ID for each visual: IMG-001, IMG-002, DIA-001, DIA-002.
   - Capture caption, source section, and nearby context.
4. OCR and visual text extraction.
   - Extract all readable text from each image/diagram.
   - Record confidence notes when text is partially unreadable.
5. Diagram logic reconstruction.
   - For each diagram, extract states, decisions, transitions, loops, and error paths.
6. QA second pass.
   - Verify no section, table, visual, or connector path is omitted.

## Diagram Extraction Rules

For each detected diagram:

1. Capture all visible nodes and connectors.
2. Capture labels, decision guards, events, and annotations.
3. Identify start and end points.
4. Identify branch outcomes and loopback paths.
5. Record uncertain items with [UNCERTAIN].

## Required Output Format

Return one Markdown document with the following sections in order.

1. # Document Overview
2. # Markdown Conversion
3. # Visual Asset Inventory
4. # OCR and Extracted Visual Text
5. # Diagram State Inventory
6. # Diagram Transition Inventory
7. # Diagram Workflow Reconstruction
8. # Diagram Decision Logic
9. # Diagram Loops and Cycles
10. # Diagram Error and Exception Paths
11. # Missing or Unclear Elements
12. # QA Completeness Review
13. # Potential Requirements and Test Scenarios

## Visual Asset Inventory Template

- Visual ID:
- Type: Image | Diagram | Screenshot
- Source Section:
- Caption/Label:
- File Reference or Position:
- Notes:

## OCR and Extracted Visual Text Template

- Visual ID:
- Extracted Text:
- Unreadable Segments:
- Confidence Notes:

## Diagram State Inventory Template

- Diagram ID:
- State ID:
- State Name:
- Description:
- Incoming Transitions:
- Outgoing Transitions:

## Diagram Transition Inventory Template

- Diagram ID:
- Source State:
- Trigger/Event:
- Condition/Guard:
- Action:
- Destination State:

## Diagram Decision Logic Template

- Diagram ID:
- Decision:
- Available Outcomes:
- Condition for Each Outcome:

## Diagram Loop and Cycle Template

- Diagram ID:
- Loop Name:
- Entry Point:
- Exit Condition:
- States In Loop:

## Diagram Exception Path Template

- Diagram ID:
- Trigger:
- Error State:
- Recovery State:

## Diagram Workflow Reconstruction Format

Use sequential flow text for each diagram.

Example:

Start
-> Submit Request
-> Validate Request
   [Valid]
   -> Process Request
   -> Complete
   [Invalid]
   -> Return Error
   -> Submit Request

## QA Completeness Review Checklist

- Every source section was converted.
- Every table was represented in Markdown.
- Every visual asset appears in inventory.
- Every diagram node and connector is accounted for.
- Every decision outcome is captured.
- Every start and end state is captured.
- No transition appears orphaned.

## Test Scenario Requirements

In # Potential Requirements and Test Scenarios, include:

- Happy paths
- Alternate paths
- Error paths
- Boundary transitions
- Recovery paths
- Invalid state transitions
