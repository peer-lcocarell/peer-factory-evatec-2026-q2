---
mode: ask
description: "Deterministic naming standard for prompts, agents, docs, and QA artifacts."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# qa-file-naming-copilot-prompt-guide

## Overview
Provide a deterministic naming standard for QA assets, prompt files, agent profiles, automation files, and documentation.

The goal is to make names predictable, searchable, and stable over time.

## Objectives
- Improve repository organization and discoverability
- Establish consistent naming conventions
- Reduce ambiguity and duplicate naming patterns
- Make file purpose immediately recognizable
- Improve onboarding for new team members
- Support long-term repository scalability

## Canonical Pattern

Use this ordered pattern when applicable:

`domain-context-purpose[.qualifier].ext`

Examples:

```text
qa-test-case-writer-agent-profile.prompt.md
qa-prompt-formatting-structure-basics.prompt.md
project-summary-high-level.prompt.md
playwright-dotnet-qa-agent-profile.prompt.md
```

## Deterministic Prompt Naming Standard

For prompt assets, use:

`<domain>-<topic>-<intent>.prompt.md`

Where:

- `<domain>` is one of: `qa`, `ado`, `docs`, `playwright`, `automation`, `prompt`, `project`, `release`
- `<topic>` is the feature or subject area
- `<intent>` is the output type, such as `guide`, `template`, `profile`, `review`, `refactor`, `checklist`, `standards`

Validation regex:

```text
^[a-z0-9]+(?:-[a-z0-9]+)*\.prompt\.md$
```

## Prompt File Suffix Rules

- Use `.prompt.md` for reusable Copilot prompt files.
- Use `.agent.md` only for agent mode definitions.
- Use plain `.md` for non-prompt reference docs.
- Do not mix prompt and document semantics in one file name.

## Repository Alignment Rules

- Keep all prompt files in lowercase kebab-case.
- Keep naming vocabulary consistent across sibling folders.
- Prefer existing terminology in this repository over new synonyms.
- Avoid duplicate meaning such as `guide-rules-reference` in one name.
- Keep maximum filename length under 80 characters when possible.

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

#### Prompt Files
Use `kebab-case.prompt.md`:

```text
qa-prompt-style-guide-master.prompt.md
review-and-refactor.prompt.md
qa-file-naming-copilot-prompt-guide.prompt.md
```

#### Agent Definition Files
Use `kebab-case.agent.md`:

```text
pf-qa-test-case-review.agent.md
pf-qa-orchestrator.agent.md
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

## Terms to Standardize

Prefer one canonical term per concept:

- Use `guide` (not both `guide` and `manual` for same concept)
- Use `profile` for role definitions
- Use `template` for reusable fill-in structures
- Use `standards` for normative rules
- Use `review` for evaluation workflows

Avoid inconsistent pairs across related files:

- `test-case` vs `testcase`
- `dotnet` vs `.net`
- `copilot` vs `github-copilot`

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

Recommended pattern:

```text
<domain>-<capability>-agent-profile.prompt.md
```

Examples:

```text
playwright-dotnet-qa-agent-profile.prompt.md
qa-test-case-writer-agent-profile.prompt.md
pf-qa-test-case-review.agent.md
```

## Copilot Prompt

### Task
Refactor file names to improve clarity, consistency, and maintainability.

### Requirements
- Use repository naming standards
- Use kebab-case for Markdown documentation
- Use `.prompt.md` for prompt files
- Use `.agent.md` for agent mode files
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
- Prompt files must end with `.prompt.md`
- Agent mode files must end with `.agent.md`

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

If the file is a prompt, enforce `.prompt.md`.

If the file is an agent definition, enforce `.agent.md`.

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

Include a short reason for each rename:

```text
playwright-qa-agent.md → playwright-dotnet-qa-agent-profile.prompt.md
Reason: Aligns with prompt suffix convention and clarifies scope (.NET QA agent profile).
```

## Current Prompt Folder Normalization Targets

Apply the convention to known outliers:

```text
playwright-qa-agent.md → playwright-dotnet-qa-agent-profile.prompt.md
universal-prompt-template-normalizer.md → universal-prompt-template-normalizer.prompt.md
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
