# Skill: PF Test Case Generation

## Description

Generate detailed, executable manual test cases for PF Evatec requirements. Produces test cases covering positive, negative, boundary, validation, integration, regression, data integrity, and traceability scenarios following the PEER Group QA writing standard.

## Triggers

Use this skill when the user asks to:

- Generate test cases
- Create QA scenarios
- Create test coverage
- Write test cases for a CR or requirement

---

## Inputs

- CR number
- Requirement analysis output (from PF CR Analysis skill) or inline requirement details
- Risk level assessment
- Scope boundaries

---

## Steps

### 1. Review Input Material

- Read requirement analysis or provided requirement details.
- Confirm CR number and in-scope features.
- Note risk level to calibrate test depth.

### 2. Generate Scenario Set

For each requirement area, generate applicable scenarios from:

- Happy Path
- Negative
- Boundary
- Validation
- Integration
- Regression
- Data Integrity
- Traceability

### 3. Write Each Test Case

Every test case must include:

**Title**

Clear functional objective using the format:

```
R<Release> Update for CR <CR Number> - <Requirement Name>: <Test Description> (<Test Type>)
```

**Preconditions**

Minimal setup items as a bullet list.

**Steps and Expected Results**

| Step | Action | Expected Result |
|------|--------|-----------------|

Each step must have a corresponding expected result. Use specific, observable outcomes.

**Expected Outcome**

Single statement describing successful completion.

### 4. Apply Coverage Rules for PF Requirement Types

When a requirement introduces new fields, filters, or validation rules, ensure tests exist for:

- Visibility (shown, hidden, enabled, disabled)
- Validation (required, format, length, invalid values)
- Persistence (save, reload, edit, database storage)
- Cross-screen consistency (create, edit, view, list)
- Filtering (single, combined, empty results)

---

## Outputs

- Titled and numbered test case list
- Full test case detail for each scenario
- Coverage summary by type

---

## Constraints

- Use "tester" not "operator".
- Do not use semicolons.
- Do not use arrows.
- Do not use emojis.
- Do not use vague phrases such as "works correctly", "is successful", or "functions properly".
- Do not assume undocumented behavior.
- Do not invent requirements.
- Use observable, verifiable expected results.
- Format output in Markdown.
