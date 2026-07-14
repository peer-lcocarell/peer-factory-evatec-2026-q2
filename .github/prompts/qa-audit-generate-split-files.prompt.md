---
name: QA Audit - Generate Split Markdown Files
description: >-
  Use when you want the QA Requirements-to-Test Case Audit agent to output each
  test case as its own individual Markdown file. Performs a full coverage audit,
  identifies gaps, refactors existing tests, and generates new test cases.
  Each result is written to a separate file following the requirement-<ID> folder
  convention ready for Git, ADO bulk import, or the PowerShell publisher.
mode: ask
---

Analyze the supplied requirements and existing test cases.

For every new, updated, or refactored test case that you generate, output the results as separate Markdown files.

**Requirements Source:**
$REQUIREMENTS_LOCATION

**Test Cases Source:**
$TEST_CASES_LOCATION

---

## Instructions

1. Review all supplied requirements.
2. Review all supplied test cases.
3. Perform a complete coverage audit.
4. Identify:
   - Fully covered requirements
   - Partially covered requirements
   - Uncovered requirements
   - Missing acceptance criteria
   - Missing negative scenarios
   - Missing boundary scenarios
   - Missing edge cases
   - Missing error handling scenarios
   - Missing recovery scenarios
   - Missing persistence scenarios
   - Missing permission/security scenarios

5. Generate new test cases for all identified coverage gaps.

6. Refactor existing test cases when required to meet QA standards.

7. Create a separate Markdown file for every requirement and every generated test case.

---

## Output Format

**Folder:**
`requirement-<RequirementID>/`

**Files:**

```
req-<RequirementID>.md
001-<short-test-name>.md
002-<short-test-name>.md
003-<short-test-name>.md
...
```

**Example:**

```
requirement-290758/
├── req-290758.md
├── 001-view-and-upload-document-happy-path.md
├── 002-upload-invalid-document-negative.md
├── 003-upload-multiple-documents.md
├── 004-remove-document-without-confirmation.md
└── 005-verify-document-removal-persistence.md
```

---

## Test Case File Format

```markdown
# <Test Case Title>

## Requirement
CR:
Ticket:
Requirement ID:
Requirement:

## Preconditions

<preconditions>

| Step | Action | Expected Result |
|------|----------|----------------|

## Expected Outcome

<expected outcome>
```

---

## Requirement File Format

```markdown
# <Requirement ID> REQUIREMENT

<requirement text>

## QA Audit Notes

- Coverage status
- Covered test cases
- Coverage gaps
- Risks
- Recommended additions
- Clarifications
```

---

## Output Structure

Return output exactly in this structure:

```
FILE: req-<RequirementID>.md
<content>

FILE: 001-<name>.md
<content>

FILE: 002-<name>.md
<content>
```

Continue until all files are generated.

Do not combine multiple test cases into a single Markdown file.

Each test case must be placed in its own Markdown file.

---

## QA Standards (Strict Mode: ON)

- Tester actions only in step Action column
- Observable, measurable expected results only
- Use "tester" not "operator"
- No semicolons in step text
- No ambiguous wording
- Complete traceability on every test case (CR, Ticket, Requirement ID)
- Risk-based coverage where applicable
- Include negative testing where applicable
- Include persistence testing where applicable
- Include recovery testing where applicable
- Prohibited expected result wording: "works correctly", "works as expected", "functions correctly", "behaves properly", "successful", "appropriate"
