---
mode: ask
description: "Prompt for default-rule-and-exceptions."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Default Rule Set and Exceptions

## Goal

- Define default prompt and formatting rules for QA documentation.

## Input

- Any QA prompt response unless explicit exception is provided.
- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]
## Constraints

- Apply all formatting, wording, and structure standards by default.
- Deviate only when an explicit exception is requested.
- Keep outputs reusable across testing workflows.

## Expected Output

- Consistent, standards-aligned output across prompts and documentation.
- Format: bullet list
