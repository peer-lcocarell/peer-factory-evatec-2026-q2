# Skill: PF Change Request QA Analysis

## Description

Analyze a Product Framework (PF) Change Request, Functional Specification, User Story, or Requirement Document. Produce a structured QA analysis package including executive summary, requirement analysis, risk assessment, QA focus areas, and test coverage recommendations.

## Triggers

Use this skill when the user asks to:

- Analyze a CR
- Analyze a change request
- Analyze a requirement
- Create a QA assessment
- Perform QA analysis on a feature

---

## Inputs

- Change Request document (Markdown, plain text, Word, or PDF)
- Functional Specification (optional)
- User Guide (optional)
- Work Items or Requirements List (optional)
- Acceptance Criteria (optional)

---

## Steps

### 1. Extract Requirement Information

- Identify CR number and title.
- Extract impacted requirements and work items.
- Identify affected modules, screens, workflows, integrations, and database changes.
- Distinguish new functionality from modifications to existing functionality.

### 2. Generate Executive Summary

- Write a concise High-Level Summary.
- Explain business value.
- Summarize user impact.
- Identify affected application areas.

### 3. Analyze Each Requirement

For every impacted requirement produce:

- Requirement ID
- Requirement Name
- Difference Introduced by the Change
- Previous Behavior
- New Behavior
- Impact
- QA Considerations

### 4. Identify QA Focus Areas

Evaluate:

- New fields
- Validation rules
- Auto-population logic
- Workflow changes
- Data persistence
- Filtering and searching
- Reporting impacts
- Cross-screen consistency
- Security impacts
- Integration impacts

### 5. Assess Risk Level

Assign Low, Medium, or High.

Consider:

- Database changes
- Workflow modifications
- Business rule complexity
- Integration points
- Shared framework changes
- Migration requirements

Include written rationale for the assigned level.

### 6. Generate Test Coverage Recommendations

List recommended scenarios by category:

- Happy Path
- Negative
- Validation
- Boundary
- Regression
- Integration

### 7. Generate Example Test Case Titles

Use this format:

```
R<Release> Update for CR <CR Number> - <Requirement Name>: <Test Description> (<Test Type>)
```

Examples:

- R10.2 Update for CR 284111 - New Box: Verify tester can create a Self-Service box with a valid WBS Element (Happy Path)
- R10.2 Update for CR 284111 - New Box: Verify save is blocked when WBS Element is blank (Negative)
- R10.2 Update for CR 284111 - Boxes: Verify tester can filter boxes using multiple status values simultaneously (Validation)

---

## Outputs

- High-Level Summary
- Business Value
- Key Areas Impacted
- QA Focus Areas
- Risk Assessment with rationale
- Requirements Impacted
- Requirement Analysis per requirement
- Test Coverage Recommendations
- Example Test Case Titles
- Regression Testing Recommendations

---

## Error Handling

If requirement details are missing, state:

> No requirement details provided. Generating baseline Happy Path, Negative, Validation, and Regression coverage.

If impacted requirements are not identified:

- Extract candidate requirements from the specification.
- Label them as inferred requirements.

If business rules are unclear:

- Generate reasonable QA assumptions.
- Label all assumptions explicitly.

---

## Special Rules for PF Requirements

When requirements introduce new fields, filters, search capability, validation rules, auto-generated values, or integration logic, always generate coverage for:

**Visibility**
- Field shown and hidden
- Field enabled and disabled

**Validation**
- Required field enforcement
- Format validation
- Maximum length
- Invalid values

**Persistence**
- Save, edit, reload, and database storage

**Cross-Screen Consistency**
- Create, edit, view, and list screens

**Filtering**
- Single filter
- Multiple filters combined
- Boundary conditions
- Empty result sets

---

## Constraints

- Use "tester" not "operator".
- Do not use semicolons.
- Do not use arrows.
- Do not use vague phrases such as "works correctly", "is successful", or "functions properly".
- Use observable and verifiable expected outcomes.
- Focus on risk-based testing.
- Prioritize regression impacts.
- Format all output in Markdown.
