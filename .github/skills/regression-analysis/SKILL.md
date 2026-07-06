# Skill: Regression Analysis

## Description

Analyze a change request or feature modification and identify the full regression testing scope. Produces a structured regression suite recommendation covering direct impacts, indirect impacts, shared framework impacts, and a prioritized regression suite list.

## Triggers

Use this skill when the user asks to:

- Generate regression coverage
- Analyze regression impact
- Identify regression scope
- Determine what regression tests are needed

---

## Inputs

- CR number and title
- List of changed modules, screens, or workflows
- Risk level assessment (optional)
- Previous test plan or test case list (optional)

---

## Steps

### 1. Identify Direct Impacts

List modules, screens, workflows, and data entities that are directly modified by the change.

### 2. Identify Indirect Impacts

Identify components that are not directly changed but may be affected due to:

- Shared data models
- Shared business logic
- Common UI components
- Linked workflows
- Cross-module integrations

### 3. Identify Shared Framework Impacts

Identify framework-level components affected such as:

- Import processing logic
- History and audit mechanisms
- Logbook generation
- Label generation
- Search indexing
- Export logic
- Lifecycle state machine

### 4. Produce Regression Suite Recommendation

For each identified area produce:

- Area name
- Reason for inclusion
- Suggested test scenarios
- Risk level (High, Medium, Low)
- Whether existing test cases can be reused or new ones are required

### 5. Produce Prioritized Regression List

Order regression areas by risk:

1. High-risk direct impacts
2. High-risk indirect impacts
3. Medium-risk areas
4. Low-risk areas

---

## Outputs

- Direct Impact List
- Indirect Impact List
- Shared Framework Impact List
- Regression Suite Recommendation per area
- Prioritized Regression Test List
- Reuse vs New test case assessment

---

## Constraints

- Use "tester" not "operator".
- Do not use semicolons.
- Do not use arrows.
- Do not assume unchanged behavior without evidence.
- Flag areas of uncertainty explicitly.
- Format output in Markdown.
