---
mode: ask
description: "Prompt for qa-html-report-template-reference."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA HTML Report Template Reference

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
- Single-page QA dashboard report
- Fully self-contained HTML file
- Inline CSS
- Inline JavaScript
- Focus on:
- Readability
- Clear hierarchy
- Visual status indicators
- Expandable deep-dive sections
- Uses a **card-based layout + collapsible sections**

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

### High-level HTML layout

### Key layout concepts

- **Sidebar navigation**
- Fixed left
- Collapsible
- Auto-generated from sections
- **Main content**
- Max-width constrained
- Left padding increases when sidebar opens
- **Sections**
- Built using `<details>` and `<summary>`
- Collapsible by default

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

### A. Design Tokens (CSS Variables)

Defined in `:root`

Categories:

- Colors
- Background, panel, borders
- Status colors: success, danger, warning, info
- Typography
- Base font
- Monospace font
- Spacing + radius
- Shadows
- Transitions

Example:

```css
:root {
  --bg: #f5f7fa;
  --panel: #ffffff;
  --text: #1f2937;

  --primary: #3b82f6;
  --danger: #dc2626;
  --success: #15803d;

  --radius: 12px;
  --shadow: 0 1px 3px rgba(0,0,0,.06);
}
```

Design intent:

- Centralized theming
- Easy reuse across components

***

### B. Base Styling

- CSS reset applied to all elements
- System UI font stack
- Neutral, light background
- Small font size (14px)

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

## 4.1 Cards and Panels

Reusable container styles:

- `.panel`
- `.summary-panel`
- `.card`
- `.metric`

Design:

- White background
- Rounded corners
- Soft shadows
- Hover elevation

***

## 4.2 Collapsible Sections

Built with native HTML:

Enhancements:

- Custom toggle icon (+ / - via CSS)
- Smooth hover styling
- Nested sections supported

***

## 4.3 KPI / Metrics Grid

Grid layout:

```css
display: grid;
grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
```

Used for:

- Metrics
- Summary cards
- Failure stats

***

## 4.4 Status Indicators

### Types

- Badges
- Pills
- Status labels

Examples:

- `.badge-pass`
- `.badge-fail`
- `.status-pill`
- `.verdict-pill`

Design pattern:

- Rounded pill shapes
- Color-coded backgrounds
- Uppercase or bold text

***

## 4.5 Alerts and Highlight Blocks

Used for emphasis:

- `.summary-alert`
- `.fail-block`
- `.qa-block`
- `.insight-block`

Pattern:

- Left border accent (color-coded)
- Light background tint
- Compact padding

***

## 4.6 Tables

Features:

- Sticky headers
- Zebra striping
- Hover highlight
- Compact spacing

Use cases:

- Configuration
- Logs summary
- Results tables

***

## 4.7 Logs / Code Blocks

```css
pre.code-block
```

Design:

- Dark background
- Monospace font
- Scrollable
- Highlighted log levels

***

## 4.8 Timeline Visualization

Two formats:

- Vertical timeline (line + dots)
- Card-based timeline (`.tl-events`)

Styles:

- Color-coded states:
- OK
- Warning
- Critical

***

## 4.9 Comparison Blocks

Side-by-side layout:

```css
.compare-grid {
  grid-template-columns: 1fr 1fr;
}
```

Used for:

- Expected vs Actual

***

## 4.10 Signal and Breakdown Grids

Grid-based diagnostic sections:

- `.signals-grid`
- `.breakdown-grid`

Purpose:

- Categorize issues by severity
- Separate systems responsibility

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

### Sidebar

- Dynamically built from sections
- Supports nested depth
- Highlights active section during scroll

### Toggle behavior

- Sidebar hidden by default
- Body gets `nav-open` class when expanded

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

## Features implemented

- Copy-to-clipboard buttons
- Expand all sections
- Collapse all sections
- Sidebar toggle
- Auto navigation generation
- Scroll spy (active section highlight)

## Key logic patterns

### Build navigation from sections

- Scan all `.report-section`
- Extract titles
- Generate links dynamically

### Convert headings to collapsible sections

- Wrap `<h3>` blocks into `<details>`

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

Breakpoint at 900px

Adjustments:

- Sidebar becomes inline
- Grid layouts collapse to single column
- Padding reduced

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
- Skip-to-content link
- Semantic HTML (`main`, `nav`, `header`)
- Keyboard-friendly collapsible sections
- ARIA labels on nav

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
- Neutral, minimal color palette
- Strong use of spacing and grouping
- Clear hierarchy:
- Page header
- Section summaries
- Detailed drill-downs
- Status-driven color usage:
- Red for failure
- Green for success
- Yellow for warnings
- Blue for info

***

## Overview

- grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));

To replicate this design:

### Structure

- Use:
- Header
- Toolbar
- Collapsible sections
- Cards inside sections

### Styling

- Define a token system in `:root`
- Build reusable classes:
- Panels
- Cards
- Badges
- Grids

### Layout

- Use CSS Grid for:
- Metrics
- Cards
- Comparison views
- Use flexbox for:
- Headers
- toolbars

### Interaction

- Use `<details>` for collapsible UI
- Add lightweight JS for:
- Navigation
- Copy actions
- Section control

### Content patterns

Always include:

- Summary at top
- Visual KPIs
- Failure breakdown
- Logs and evidence
- Actionable next steps

***

If you want, I can convert this into a **template starter (HTML + CSS skeleton)** or a **React/Blazor component structure** based on this design.

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
