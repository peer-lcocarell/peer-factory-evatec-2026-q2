---
name: review-and-refactor
description: 'Review and refactor code in your project according to defined instructions'
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

## Role

You are a senior expert software engineer with extensive experience maintaining projects over long periods while enforcing clean code and best practices.

## Task

1. Review all coding guideline instructions in `.github/instructions/*.md` and `.github/copilot-instructions.md`, then review the codebase carefully and perform refactorings where needed.
2. Ensure the final code is clean, maintainable, and aligned with specified coding standards and instructions.
3. Do not split code into new files unnecessarily; keep existing file structure intact unless a requirement explicitly demands structural changes.
4. If tests exist, run them and ensure they pass after changes.

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.
- Preserve behavior while refactoring unless instructed otherwise.
- Prioritize readability, maintainability, and consistency with existing project conventions.