---
name: update-markdown-file-index
description: 'Update a markdown file section with an index/table of files from a specified folder.'
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Update Markdown File Index

Update markdown file `${file}` with an index or table of files from folder `${input:folder}`.

## Process

1. Scan: Read the target markdown file `${file}` and understand current structure.
2. Discover: List files in `${input:folder}` matching `${input:pattern}`.
3. Analyze: Detect whether an existing index section already exists.
4. Structure: Choose table or list format based on content and file types.
5. Update: Replace existing index section or add a new one.
6. Validate: Ensure markdown syntax and formatting consistency.

## File Analysis

For each file, extract:

- Name
- Type
- Description
- Size (optional)
- Modified date (optional)

## Table Structure Options

Choose output format based on context.

### Option 1: Simple List

```markdown
## Files in ${folder}

- [filename.ext](path/to/filename.ext) - Description
- [filename2.ext](path/to/filename2.ext) - Description
```

### Option 2: Detailed Table

```markdown
| File | Type | Description |
|------|------|-------------|
| [filename.ext](path/to/filename.ext) | Extension | Description |
| [filename2.ext](path/to/filename2.ext) | Extension | Description |
```

### Option 3: Categorized Sections

Group files by type or category with separate sections.

## Update Strategy

- Update existing section when an index is present.
- Add new section when no index exists.
- Preserve heading levels and surrounding document flow.
- Use repository-relative links.

## Section Identification

Look for:

- Headings containing index, files, contents, directory, list
- Tables with file-oriented columns
- Lists containing file links
- HTML comment anchors marking generated sections

## Requirements

- Preserve existing markdown structure and formatting.
- Use relative paths for links.
- Include descriptions when available.
- Sort files alphabetically by default.
- Handle special characters in filenames.
- Validate markdown syntax.
