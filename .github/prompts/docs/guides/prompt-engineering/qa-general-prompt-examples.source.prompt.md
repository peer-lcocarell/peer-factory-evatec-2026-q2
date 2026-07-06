---
mode: ask
description: "Prompt for qa-general-prompt-examples.source."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA General Prompt Examples

## Overview

- This rule ensures every response stays clear and readable. Removing arrows, stylized headers, summaries, and decorative dividers avoids clutter and keeps formatting consistent acro...

===============

Explanation of Each Rule ========================

- Clean and simple formatting --------------------------- This rule ensures every response stays clear and readable.
- Removing arrows, stylized headers, summaries, and decorative dividers avoids clutter and keeps formatting consistent across tools.
- A clean structure also prevents formatting issues when content is copied into systems such as ADO.

Plain professional wording -------------------------- Responses must avoid emojis and emoticons. These elements can introduce unprofessional tone and may not render properly in all systems. Plain wording maintains consistency and avoids distracting symbols.

- Excel export formatting ----------------------- Excel output must follow a consistent professional style.
- The header row must be bold with a gray background to separate it from data.
- Auto-fit ensures no content is hidden.
- Word wrap keeps long values visible.
- Top-aligned text improves readability.
- Thin borders maintain clear structure.
- Freezing the top row helps navigation.
- Calibri 11 provides a clean and standard appearance.

No summaries ------------ Summaries can remove detail and cause confusion in test cases and instructions. Each response should provide complete content without a condensed recap at the end.

No arrows or arrow characters ------------------------------ Arrows can introduce formatting issues in documentation systems. This rule keeps the structure clean by removing symbols that may not appear consistently across applications.

No stylized headers -------------------- Headers containing decorative characters or unusual formatting can disrupt reading and make content difficult to copy into technical systems. Using plain text headers improves compatibility.

No decorative dividers ----------------------- Decorative divider lines made from repeated symbols may not render consistently and can interfere with formatting. Removing them keeps the document clean.

Clean structure and plain wording --------------------------------- Content should remain simple and direct. Using plain wording avoids ambiguity and ensures instructions are easy for testers and readers to follow.

Tester friendly language ------------------------ Instructions should be written from the tester's point of view using clear, actionable phrasing. This helps maintain consistency across all test cases and QA documentation.

No semicolons -------------- Semicolons can create long statements and reduce clarity. Breaking content into shorter, clear sentences or line items keeps instructions readable.

Avoid the word "like" --------------------- This avoids ambiguous comparisons. Test cases require exact and direct phrasing, and removing this word increases clarity.

Avoid phrases such as "is successful" ------------------------------------- These phrases are vague and do not describe measurable or observable system behavior. Expected results should always state what the tester sees or what the system does in clear terms.

No emojis --------- Repeating this rule reinforces the requirement for professional and clean communication across all responses.

Direct formatting for ADO test cases ------------------------------------ ADO requires predictable formatting. Direct and readable text ensures that test steps and expected results paste cleanly without manual adjustments.

Simple and clear steps and expected results ------------------------------------------- Every step should be focused and unambiguous. Expected results must describe exactly what happens so testers can validate behavior efficiently.

Follow these rules unless explicitly stated otherwise ------------------------------------------------------ These rules form the default communication standard. Any deviation should only occur if you explicitly request an exception.

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
