---
name: pf-test-case-rewrite-preserve-title
description: "Rewrite PF QA markdown test cases for clarity and measurable validation. Preserve the current title unless renaming is explicitly requested."
argument-hint: "Markdown test case path and rewrite constraints"
user-invocable: true
disable-model-invocation: false
---

# PF Test Case Rewrite

## Objective
Rewrite an existing PF manual QA test case for clarity, consistency, and measurable validation while preserving the current title by default.

## Use When
- Rewriting or improving an existing markdown test case.
- Keeping the current title unchanged.
- Maintaining Azure DevOps markdown compatibility.
- Improving readability, precision, and testability without changing intent.

## Inputs
- Markdown file path.
- Title policy:
  - `locked`
  - `preserve`
  - `rename`
- Optional style constraints.
- Optional title suggestion count.

## Rules

### General
- Read the file once.
- Preserve functional intent.
- Keep edits focused on clarity and validation quality.
- Avoid rewriting content that does not need improvement.
- Flag uncertainty instead of inventing behavior.

### Title Handling
- `locked`
  - Heading must remain exactly unchanged.
- `preserve`
  - Keep the heading unchanged unless renaming is explicitly requested.
- `rename`
  - Apply a new title only when the user explicitly requests a rename.
- Title suggestions are advisory only and returned in chat.

### Structure
Preserve this section order:

1. Requirement
2. Tags (if present)
3. Preconditions
4. Steps
5. Expected Outcome

If a required section is missing, add only the missing section.

### Traceability
Preserve existing traceability fields, including:
- CR
- Ticket
- Requirement ID

### Steps
Use the exact table header:

```markdown
| Step | Action | Expected Result |
```

Rewrite steps using:
- One tester action per step.
- One observable result per step.
- Clear pass/fail validation.
- Measurable outcomes where possible.

Add save/reopen persistence validation when applicable.

## Validation Checklist
- Title follows the selected title policy.
- Functional intent is unchanged.
- Section order is preserved.
- Traceability fields remain intact.
- Steps use the required 3-column format.
- Expected results are observable and testable.
- No scope drift.
- ADO markdown compatibility is maintained.

## Output
- Save the updated file.
- Return a brief summary of changes.
- Optionally provide advisory title suggestions.

## Example Prompts
- /pf-test-case-rewrite-preserve-title docs/test-cases/001.md
- Rewrite this test case and keep the title unchanged.
- Improve this markdown test case without renaming it.
- Rewrite this test case, keep the title, and suggest 3 stronger alternatives.

## Related Skills
- ../pf-test-case-generation/SKILL.md
- ../ado-markdown-generation/SKILL.md

## Success Criteria
- Improved clarity and validation quality.
- Original scenario intent preserved.
- User constraints satisfied.
- Title policy enforced.
- ADO markdown remains valid.
