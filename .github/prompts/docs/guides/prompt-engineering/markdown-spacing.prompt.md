---
mode: ask
description: "Prompt for markdown-spacing."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Markdown Spacing

Review the selected Markdown (*.md) file and improve formatting for readability and consistency.

Goals:

- Keep the document clean, professional, and easy to scan.
- Add enough whitespace to improve readability without making the document feel sparse.
- Preserve all existing content, meaning, links, code blocks, and headings.
- Do not rewrite content unless required for formatting consistency.

Formatting rules:

- Ensure a single blank line before and after headings.
- Ensure a single blank line between paragraphs.
- Add a blank line before and after bullet lists.
- Add a blank line before and after numbered lists.
- Add a blank line before and after tables.
- Add a blank line before and after code blocks.
- Remove excessive blank lines and reduce them to a single blank line.
- Do not add blank lines between list items unless required by Markdown formatting.
- Maintain consistent spacing throughout the file.

Markdown structure:

- Preserve the existing heading hierarchy.
- Ensure lists use consistent indentation.
- Ensure nested lists are properly aligned.
- Preserve blockquotes, tables, links, and code formatting.

Whitespace guidance:

- Improve readability with moderate spacing.
- Avoid dense walls of text.
- Avoid excessive whitespace that makes the document feel fragmented.
- Keep related content visually grouped.

Validation:

- Verify the Markdown still renders correctly.
- Confirm no content, links, tables, or code blocks were altered unintentionally.
- Limit changes to formatting and spacing improvements only.

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
