---
mode: ask
description: "Prompt for qa-standard-report-html."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# qa-html-report-design-standard

## Overview

- Define a reusable structure for a single-page QA dashboard report
- Focus on readability, clear hierarchy, and visual status indicators
- Use a card-based layout with collapsible sections

## Layout

- Sidebar navigation
  - Fixed, collapsible, auto-generated from sections
- Main content
  - Centered, max-width, responsive padding
- Sections
  - Use `<details>` and `<summary>` for collapsible content

## Styling

- Use CSS variables (`:root`) for:
  - Colors (including status: success, warning, error, info)
  - Typography
  - Spacing, radius, shadows
- Base styling
  - Light background
  - System font (14px-16px)
  - Clean, minimal design

## Components

- Panels / Cards
  - White background, rounded corners, soft shadows
- Metrics grid
  - CSS Grid with responsive columns
- Status indicators
  - Badges and pills (color-coded)
- Alerts
  - Left-border highlight blocks for key messages
- Tables
  - Sticky headers, zebra rows, hover states
- Logs / Code blocks
  - Dark theme, monospace, scrollable
- Comparison views
  - Side-by-side grid
- Timelines
  - Vertical or card-based, color-coded states

## Interaction

- Use native `<details>` for expand/collapse
- Add lightweight JavaScript for:
  - Sidebar toggle
  - Expand/collapse all
  - Copy-to-clipboard
  - Auto-generated navigation
  - Scroll tracking (active section)

## Responsiveness

- Collapse sidebar for small screens
- Stack grids into single column
- Reduce spacing and padding

## Accessibility

- Use semantic HTML (`main`, `nav`, `header`)
- Include ARIA labels where needed
- Ensure keyboard navigation works
- Provide skip-to-content link

## Content Structure

Include:

- High-level summary
- KPI / metrics section
- Key findings or failures
- Detailed breakdown
- Logs or evidence
- Actionable next steps

## Design Principles

- Keep layout clean and scannable
- Use color only to indicate status
- Maintain consistent spacing and typography
- Prioritize clarity over visual complexity

## Output Expectations

- Fully self-contained HTML (inline CSS + JS)
- Clean, reusable, and easy to extend
- Ready for QA reporting without modification

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
