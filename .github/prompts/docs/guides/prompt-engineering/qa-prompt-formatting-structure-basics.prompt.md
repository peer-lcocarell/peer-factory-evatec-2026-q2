---
mode: ask
description: "Prompt for qa-prompt-formatting-structure-basics."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Formatting and Structure Basics

## Goal

- Keep all QA prompt outputs clear, readable, and consistent.

## Input

- Prompt responses, test documentation, and markdown content.
- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]
## Constraints

- Remove stylized headers and decorative dividers.
- Remove arrow characters.
- Avoid long paragraphs and visual clutter.
- Keep structure predictable for ADO and markdown tools.

## Expected Output

- Clean markdown with short sections and consistent bullet usage.
- No decorative symbols that can break rendering.
