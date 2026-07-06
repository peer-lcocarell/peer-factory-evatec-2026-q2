---
mode: ask
description: "Prompt for precision-wording-rules."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Precision Wording Rules

## Goal

- Enforce precise wording for measurable QA outcomes.

## Input

- Expected results and acceptance criteria in prompts or test cases.
- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]
## Constraints

- Avoid the word like in requirement phrasing.
- Avoid phrases such as is successful without criteria.
- Use observable and measurable language.
- State what the tester sees and what the system does.

## Expected Output

- Specific, testable wording with minimal ambiguity.
- Format: bullet list
