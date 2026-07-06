---
mode: ask
description: "Prompt for qa-html-report-guide."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA HTML Report Guide

## Overview

- __Alerts and Highlight Blocks__

### Purpose

- Provide a reusable reference for building QA dashboard-style HTML reports
- Ensure consistency in layout, styling, and interaction patterns
- Support readable, structured, and interactive reporting

### Design Concept

- Single-page dashboard report
- Fully self-contained HTML file
- Inline CSS and JavaScript
- Focus on readability and structure
- Visual status indicators for quick scanning
- Expandable sections for detailed analysis
- Card-based layout with collapsible sections

### Core Layout Structure

__Sidebar Navigation__

- Fixed on the left side
- Collapsible
- Auto-generated from content sections

__Main Content__

- Constrained maximum width
- Adjusts padding when sidebar is open

__Sections__

- Built using details and summary elements
- Collapsible by default

### CSS Architecture

__Design Tokens__

- Defined in root
- Includes:
- Colors for background, panels, borders
- Status colors for success, failure, warning, info
- Typography settings
- Spacing and radius values
- Shadow definitions
- Transition timing
- Enables centralized theming and reuse

__Base Styling__

- Global reset applied
- System UI font stack
- Neutral light background
- Compact font sizing

### Component System

__Cards and Panels__

- Reusable containers such as panel, summary panel, card, metric
- White background with rounded corners
- Subtle shadows and hover effects

__Collapsible Sections__

- Built with native details elements
- Custom toggle indicators
- Supports nested sections

__Metrics Grid__

- Grid layout for KPIs and summaries
- Responsive column sizing

__Status Indicators__

- Includes badges, pills, and labels
- Color-coded by status
- Rounded shapes with bold text

__Alerts and Highlight Blocks__

- Used for important messages and failures
- Left border accent with color coding
- Light background for emphasis

__Tables__

- Sticky headers
- Zebra striping
- Hover highlighting
- Compact spacing

__Logs and Code Blocks__

- Dark background with monospace font
- Scrollable containers
- Log level highlighting

__Timeline Visualization__

- Vertical and card-based formats
- Color-coded states for status tracking

__Comparison Blocks__

- Side-by-side layout
- Used for expected versus actual comparisons

__Diagnostic Grids__

- Signal and breakdown grids
- Categorize issues by severity and ownership

### Navigation System

__Sidebar Behavior__

- Dynamically generated from report sections
- Supports nested structure
- Highlights active section based on scroll position

__Toggle Behavior__

- Sidebar hidden by default
- Activated via body class toggle

### Interactive Behavior

__Supported Features__

- Copy to clipboard
- Expand all sections
- Collapse all sections
- Sidebar toggle
- Dynamic navigation generation
- Scroll tracking

__Implementation Patterns__

- Scan sections to build navigation
- Extract titles dynamically
- Convert headings into collapsible sections

### Responsive Design

- Breakpoint around tablet width
- Sidebar becomes inline
- Grids collapse to single column
- Reduced spacing for smaller screens

### Accessibility

- Skip to content option
- Semantic HTML structure
- Keyboard accessible interactions
- Navigation labels for assistive tools

### Visual Style Principles

- Neutral and minimal palette
- Strong spacing and grouping
- Clear hierarchy of information
- Color-coded status indicators

### Implementation Guidelines

__Structure__

- Include header, toolbar, and collapsible sections
- Use cards within sections

__Styling__

- Define reusable variables and tokens
- Build consistent component classes

__Layout__

- Use grid for metrics and comparisons
- Use flexbox for headers and controls

__Interaction__

- Use details elements for collapsibility
- Add lightweight scripts for navigation and controls

__Content Patterns__

- Provide summary at the top
- Include key metrics
- Show failure breakdowns
- Include logs and evidence
- Provide actionable next steps

### Core Writing Rules

__Use Plain Professional Wording__

- Maintain a professional tone
- Do not use emojis or emoticons
- Avoid overly casual language
- Keep responses direct and readable

__Keep Formatting Clean and Simple__

- Use consistent formatting
- Avoid excessive styling
- Ensure compatibility with systems such as ADO
- Keep spacing and structure readable

__No Decorative Dividers__

- Do not use repeated symbols for separation
- Avoid visual clutter

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
