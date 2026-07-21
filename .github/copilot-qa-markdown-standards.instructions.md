---
applyTo: '**/*.md'
---

# QA Test Case and Repository Standards

## Purpose

Analyze Markdown files in this repository and treat established repository patterns as the authoritative source for formatting, writing style, terminology, and QA standards.

## Core Responsibilities

- Maintain consistency across prompts, agents, instruction files, templates, and test cases.
- Detect and follow existing repository conventions.
- Apply repository standards when creating or modifying content.
- Recommend corrections when files deviate from established standards.

## Repository Consistency Rules

When analyzing Markdown files:

1. Identify and learn:
   - Heading structures
   - Section ordering
   - Naming conventions
   - Terminology
   - Table formats
   - Requirement traceability patterns
   - Test case structures
   - QA standards
2. Treat commonly occurring patterns as the repository standard.
3. When conflicts exist:
   - Prefer the newest documented standard.
   - Prefer dedicated QA standards documents over examples.
   - Prefer explicit instructions over inferred patterns.
4. Ensure generated content aligns with repository conventions.

## Markdown Formatting Standards

Maintain consistent:

- Heading hierarchy
- Bullet formatting
- Numbering styles
- Table formatting
- Section naming
- Capitalization
- Requirement references
- Work item references

Use existing repository formatting whenever possible.

## QA Test Case Standards

Every functional requirement or change request must have one or more linked test cases unless explicitly marked as:

`Test Case Required = No`

If marked as not requiring a test case, QA verification comments must document how testing was performed.

## Test Coverage Expectations

Consider testing beyond the specification where appropriate.

Include:

- Functional testing
- Positive testing
- Negative testing
- Boundary testing
- Regression testing
- Risk-based testing
- Stress testing
- Scenario testing

## Action and Expected Result Separation

Actions:

- Contain only tester actions.
- Describe what the tester performs.
- Do not include validation.
- Do not include expected behavior.

Expected Results:

- Contain only observable outcomes.
- Describe what the tester sees.
- Describe system responses.
- Describe data or UI changes.

Rule:

- Actions are things the tester does.
- Expected Results are things the tester observes.

## Writing Standards

Always:

- Use "tester" instead of "operator"
- Use clear wording
- Use observable results
- Use concise language
- Maintain consistency with repository terminology

Never:

- Use semicolons
- Use arrows
- Use emojis
- Use the word "like" when avoidable
- Use phrases such as "is successful"
- Append "(Negative)" to test case titles
- Use ambiguous terms such as:
  - could
  - should
  - might
  - may

Title convention:

- Do not use "(Negative)" in test case titles in this repository.
- Use "Unhappy Path" or "Validation" wording when needed.

## Test Case Structure

Follow dominant repository format.

When creating test cases:

- Include title
- Include requirement traceability
- Include preconditions when required
- Use a steps and expected results table
- Include expected outcome
- Link required files or supporting artifacts

## Quality Review Expectations

When reviewing test cases, validate:

- Requirement coverage
- Traceability
- Clarity
- Completeness
- Test coverage
- Action and expected result separation
- Consistent formatting
- Terminology compliance

Identify:

- Missing test coverage
- Missing requirements
- Ambiguous wording
- Duplicate testing
- Formatting inconsistencies
- Missing risk, stress, or scenario testing

## Repository-Wide Goal

All Markdown files, prompts, agent instructions, templates, standards documents, and test cases should appear to use one consistent style guide, terminology set, structure, and formatting convention.

When modifying existing files, preserve intent while aligning to repository standards.
