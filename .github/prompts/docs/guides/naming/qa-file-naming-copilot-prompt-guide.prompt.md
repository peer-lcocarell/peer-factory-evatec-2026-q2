---
mode: ask
description: "Prompt for qa-file-naming-copilot-prompt-guide."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# qa-file-naming-guidelines

## Overview
Provide a reusable GitHub Copilot prompt and naming standard for QA, automation, documentation, AI agents, prompts, and development artifacts. The goal is to create clear, consistent, scalable, and maintainable file naming conventions across repositories.

## Objectives
- Improve repository organization and discoverability
- Establish consistent naming conventions
- Reduce ambiguity and duplicate naming patterns
- Make file purpose immediately recognizable
- Improve onboarding for new team members
- Support long-term repository scalability

## File Naming Requirements

### General Principles
- Names must clearly describe the file purpose
- Names must be unique within their folder
- Names should be concise but meaningful
- Names should be easy to search and understand
- Prefer descriptive names over abbreviations
- Maintain consistency across the repository

### Naming Convention by File Type

#### Markdown Documentation
Use `kebab-case.md`:
```text
qa-test-case-writing-guide.md
playwright-dotnet-agent-profile.md
automation-release-workflow.md
```

#### Source Code Files
Follow language conventions.

C#:
```text
PlaywrightAutomationAgent.cs
LoginPage.cs
TestExecutionService.cs
```

TypeScript:
```text
login-page.ts
test-execution-service.ts
```

React:
```text
LoginPage.tsx
TestExecutionService.tsx
```

#### Configuration Files
Follow framework or tool conventions:
```text
playwright.config.ts
package.json
global.json
```

## Naming Strategy

### Recommended Pattern
Use `domain-context-purpose`:
```text
qa-test-case-template
playwright-api-testing-guide
automation-release-workflow
markdown-formatting-rules
```

### Domain Prefixes
Use when they provide additional clarity:
```text
qa  automation  playwright  copilot  markdown  dev  tooling  release  api  ui
```

### Purpose Keywords
Choose purpose-driven naming:
```text
guide  rules  workflow  template  checklist  specification  profile  reference  examples  standards
```

### Optional Qualifiers
Add qualifiers only when they improve understanding:
```text
playwright-api-testing-guide
playwright-ui-testing-guide
qa-log-analysis-workflow
automation-release-readiness-checklist
```

## Naming Rules

### Allowed Characters
Use lowercase letters, numbers, and hyphens:
```text
playwright-test-generation-guide.md
```

### Avoid
- Spaces
- Underscores
- Special characters
- Excessive abbreviations

Bad:
```text
My Notes.md
Regression_Test_Guide.md
misc.md
items.md
temp.md
```

Good:
```text
qa-regression-testing-guide.md
playwright-best-practices.md
automation-release-checklist.md
```

## Industry Best Practices

### Microsoft Naming Guidance
- Use descriptive names
- Avoid vague terminology
- Make names meaningful to new team members
- Improve discoverability through consistent naming
- Maintain uniqueness within a folder
- Prefer clarity over brevity

Good:
```text
qa-test-case-writing-guide.md
playwright-dotnet-agent-profile.md
release-readiness-checklist.md
```

Poor:
```text
notes.md  other.md  misc.md  items.md
```

### GitHub Documentation Practices
- Use kebab-case and lowercase file names
- Use hyphens as separators
- Keep names URL-friendly and human-readable
- Keep naming consistent across the repository

Good:
```text
playwright-api-testing-guide.md
markdown-formatting-standards.md
automation-regression-strategy.md
```

Poor:
```text
PlaywrightAPITestingGuide.md
automation_regression_strategy.md
My Random Notes.md
```

### Documentation-as-Code Practices
Documentation should:
- Mirror repository structure
- Be easy to find through search
- Follow predictable naming patterns
- Align with documentation titles
- Support long-term maintenance

Use `domain-context-purpose`:
```text
qa-test-case-template.md
automation-release-workflow.md
playwright-ui-testing-guide.md
```

### Scalability Guidelines
Avoid:
```text
checklist-final.md
checklist-final-final.md
notes-v2.md
new-guide.md
```

Prefer:
```text
release-readiness-checklist.md
automation-deployment-guide.md
```

### Repository Maintainability Checklist
1. Is the file purpose immediately clear?
2. Is the name searchable?
3. Is the name unique?
4. Is the name consistent with nearby files?
5. Would a new team member understand it?
6. Will the name still make sense in a year?

If "No" to any question, consider renaming the file.

## AI Agent Naming Recommendations
Agent profiles should clearly describe specialization and responsibility.

Good:
```text
playwright-dotnet-qa-agent-profile.md
qa-test-case-generation-agent-profile.md
api-test-automation-agent-profile.md
release-readiness-review-agent-profile.md
```

Avoid:
```text
agent.md  qa-agent.md  playwright-agent.md  test-agent.md
```

## Copilot Prompt

### Task
Refactor file names to improve clarity, consistency, and maintainability.

### Requirements
- Use repository naming standards
- Use kebab-case for Markdown documentation
- Follow language-specific conventions for source code files
- Make names unique and descriptive
- Remove duplicate naming patterns
- Eliminate ambiguous names
- Preserve existing file intent

### Validation Rules
- No spaces
- No unnecessary abbreviations
- No special characters
- No generic names
- No duplicate names
- Names should be easy to understand

## Refactoring Process

### Step 1
Analyze the file content. Identify:
- Domain
- Audience
- Purpose
- Primary functionality

### Step 2
Extract key descriptive keywords.

### Step 3
Build a proposed filename using `domain-context-purpose` when applicable.

### Step 4
Validate:
- Clarity
- Uniqueness
- Consistency
- Compliance with repository standards

### Step 5
Update references if necessary:
- Markdown links
- Documentation references
- Imports
- Build scripts
- Configuration references

## Output Format
Provide a filename mapping:
```text
parser.md → qa-log-parser-specification.md
cleanPromptGuide.md → qa-prompt-formatting-rules.md
notes.md → automation-release-notes.md
```

## Quality Standards

### Good Names
```text
playwright-dotnet-agent-profile.md
qa-regression-testing-guide.md
automation-test-data-reference.md
api-validation-workflow.md
```

### Poor Names
```text
guide.md  test.md  notes.md  misc.md  items.md
```

### File Naming Quality Checklist
- Human-readable
- Descriptive
- Consistent
- Purpose-driven
- Scalable
- Searchable
- Repository-friendly

## Best Practices
- Establish naming standards early
- Use consistent prefixes where valuable
- Standardize terminology across teams
- Document naming conventions
- Perform periodic naming reviews
- Refactor ambiguous names promptly
- Prefer stable naming over temporary naming
- Keep naming predictable and discoverable

## Expected Outcome
- Improved file discoverability
- Cleaner repository structure
- Consistent naming conventions
- Reduced ambiguity
- Easier navigation
- Better onboarding experience
- Improved repository maintainability

## Goal
Standardize file naming conventions across the repository.

## Input
- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]

## Constraints

- Be explicit and deterministic
- Do not assume missing information
- Preserve file intent
- Follow repository standards
- Maintain consistency across related files

## Expected Output

- File rename recommendations
- Old-to-new filename mappings
- Naming rationale when necessary
- Actionable refactoring results
- Validation of naming consistency
- Format: bullet list
