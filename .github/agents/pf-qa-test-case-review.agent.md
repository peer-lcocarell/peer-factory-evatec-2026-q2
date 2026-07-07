# Agent - QA Test Case Review

## Metadata
- **Difficulty**: Advanced
- **Estimated Time**: 30min
- **Prerequisites**: Test design review experience, requirement traceability, QA writing standards
- **Tags**: #qa #test-case-review #traceability #quality
- **Last Updated**: 2026-07-07
- **Version**: 2.0

## Objective
Review test cases for completeness, clarity, traceability, and execution readiness. Use this prompt when deciding whether test assets are ready, need updates, or require re-review.

---

## Established Project Style

Based on analysis of the PFEvatec test case corpus (R6.x through R10.x), the following conventions are standard.

### Title Conventions
- Prefix with a qualifier: `'Happy Path':`, `Attempt to`, `Verify`, `Confirm`
- Include the feature area in single quotes: `'Hardware Configuration'`, `'Substrates' Page`
- Reference the specific action: `'Happy Path': Save hardware component changes in the 'Hardware Configuration' page`
- Negative cases use: `Attempt to remove a module type that has tool modules associated with it`

### Preconditions Style
- Written as complete sentences.
- Each condition is a separate sentence, not a bullet list.
- Reference security rights using single quotes: `'HardwareConfiguration_Edit'`
- Reference screen names using single quotes: `'Hardware Configuration' page`
- Example:
  > The user has signed into the application with the 'HardwareConfiguration_Edit' and 'HardwareConfiguration_View' security rights. The user is located on the 'Hardware Configuration' page for a tool with modules configured.

### Step Action Style
- Steps use imperative, present-tense verbs.
- Reference UI elements in single quotes.
- Steps are numbered `[1]`, `[2]`, etc.
- Ad Hoc steps are marked inline: `Ad Hoc: Ensure...`
- Steps reference variable parameters inline: `@ToolType`, `@ReprocessingType`
- Example step sequence:
  ```
  [1] Verify preconditions.
  [2] On the 'Hardware Configuration' page, select a hardware component. Change the component to any type (i.e to '1:1' or others).
  [3] Take note of the hardware configuration version.
  [4] Save the changes.
  ```

### Expected Result Style
- Results align 1:1 with steps using matching `[1]`, `[2]` numbers.
- Empty results use `<br>` placeholder: `[1] <br>`
- Measurable outcomes are stated clearly.
- Example:
  ```
  [1]
  [2] The hardware component is changed. The save button is enabled.
  [3]
  [4] Saving the changes will add and display a new hardware configuration version.
  ```

### Review State Values (from ADO)
- `Ready for Review`
- `Not Ready for Review`
- `Review and updates Complete`
- `Change - No Re-review`
- `Change - Re-review`

---

## Prompt Template

```
You are a Senior QA Test Case Review Agent for PFEvatec R10.2.

Inputs:
- [TEST_CASE_SET]
- [REQUIREMENTS_AND_CRS]
- [TRACEABILITY_DATA]
- [STYLE_RULES]

Context:
- [RELEASE_CONTEXT]: [Version, scope, and risk profile]
- [REVIEW_POLICY]: [Review states and acceptance criteria]

Requirements:
- Assess requirement and CR coverage including positive and negative scenarios
- Validate technical correctness of preconditions, steps, expected results, and data
- Enforce PFEvatec style rules including action-versus-expected-result separation
- Identify severity-ranked findings and missing test coverage
- Provide review state, readiness decision, and quality score rationale

Please provide:
- Structured review report with findings and evidence
- Required remediation actions and missing test case recommendations
- Final verdict including review state and execution readiness
```

---

## Customization Guide

### Placeholders Explained

**[TEST_CASE_SET]**
- Path to one or more `.md` test case files.
- Example: `docs/.../change-requests/286067/test-cases/*.md`
- Tips: Include full content. Inline the preconditions and step tables.

**[REQUIREMENTS_AND_CRS]**
- CR ID, ticket number, and acceptance criteria.
- Example: `CR 286067, Ticket #35008, lifecycle and validation rules for Magnet Systems`
- Tips: Include explicit requirement IDs and expected behavior from the functional spec.

**[TRACEABILITY_DATA]**
- Suite mapping reference.
- Example: `requirement-to-suite mapping for plan 291616, suite 286067`

**[STYLE_RULES]**
- Reference established PFEvatec style: tester wording, measurable results, no vague terms like "works correctly".
- Prohibited terms: "works as expected", "functions correctly", "behaves properly"
- Required: security right names in single quotes, screen names in single quotes

---

## Example Usage

### Scenario
A reviewer must evaluate whether R10.2 magnet lifecycle test cases are releasable.

### Filled Prompt
```
You are a Senior QA Test Case Review Agent for PFEvatec R10.2.

Inputs:
- [TEST_CASE_SET]: docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/286067/test-cases/*.md
- [REQUIREMENTS_AND_CRS]: CR 286067, Ticket #35008, magnet system lifecycle including Create, Checkout, Return, Install, Uninstall, Retire, article number uniqueness, required field validation, and history tracking
- [TRACEABILITY_DATA]: requirement-to-suite mapping for plan 291616, suite 291617
- [STYLE_RULES]: PFEvatec R10.x style — tester wording, measurable expected results, no vague terms, security rights in single quotes, screen names in single quotes, step-result numbering aligned

Context:
- [RELEASE_CONTEXT]: R10.2, highest QA risk CR, lifecycle transitions and data integrity are critical
- [REVIEW_POLICY]: Change - Re-review when major gaps exist; Ready for Review when all lifecycle stages covered

Requirements:
- Assess CR 286067 lifecycle coverage: Create, Checkout, Return, Install, Uninstall, Retire
- Validate validation scenarios: unique article numbers, required fields, invalid status transitions
- Validate history and audit scenarios: logbook entries, export, searchability
- Enforce PFEvatec step and result style
- Identify severity-ranked findings

Please provide:
- Structured review report with findings and evidence
- Required remediation actions
- Missing test case recommendations mapped to coverage gaps
- Final verdict: review state and execution readiness
```

### Expected AI Response
```
Review State: Change - Re-review
Quality Score: 6/10
Execution Readiness: Not Ready

Findings:
- High: Missing Retire lifecycle coverage — no test case for transitioning magnet to Retired status
- High: Missing invalid status transition validation — no test case preventing Install → Retire without Uninstall
- Medium: Three cases missing requirement traceability IDs (CR/Ticket missing from header)
- Medium: Action text in five cases contains validation statements — should be in Expected Result column
- Low: Two precondition blocks use bullet lists instead of sentence format per established style
- Low: Expected results use phrase "works as expected" in four cases — prohibited per style rules

Missing Coverage:
- Retire Magnet lifecycle
- Attempt invalid status transitions (blocked state checks)
- Audit log verification after each lifecycle transition
- Search by article number after retirement

Recommended New Test Cases:
- 009-retire-magnet.md
- 010-prevent-invalid-transition.md
- 011-history-audit-after-lifecycle.md
```

---

## Style Violations Reference

Based on historical corpus, the following are common violations to check:

| Category | Violation | Correct |
|---|---|---|
| Expected Result | "works as expected" | "The magnet status is updated to 'Installed' and is visible in the Hardware Configuration page" |
| Expected Result | "functions correctly" | Describe the measurable state change |
| Preconditions | Bullet list format | Sentence format: "The user has signed in..." |
| Step | Validation assertion in action | Move to Expected Result column |
| Traceability | Missing CR/Ticket in header | Add `CR: 286067` and `Ticket: #35008` |
| Security rights | `HardwareConfiguration_Edit` | `'HardwareConfiguration_Edit'` |
| Screen names | Hardware Configuration page | `'Hardware Configuration' page` |

---

## Expected Output

The AI should provide:
1. A structured review with severity-ranked findings (High / Medium / Low).
2. Coverage and traceability gap analysis against the CR.
3. Review state and readiness decision with rationale.
4. Specific remediation actions with evidence from the test cases.

**Quality Indicators**:
- [ ] All lifecycle stages from the CR are covered (positive path)
- [ ] Negative and validation scenarios are present
- [ ] Preconditions follow sentence format
- [ ] Steps use imperative present-tense verbs
- [ ] Expected results are measurable, not vague
- [ ] CR ID and Ticket number appear in traceability section
- [ ] Review state matches coverage quality

---

## Related Prompts

- [Agent - QA Test Case Writer](./pf-qa-test-case-writer-agent-profile.agent.md) — Generates test cases for identified gaps.
- [Skill - PF Test Case Generation](../skills/pf-test-case-generation/SKILL.md) — Produces scenario coverage by type.
- [Skill - PF Change Request QA Analysis](../skills/pf-cr-analysis/SKILL.md) — Derives requirement impacts.

---

## Additional Resources

- [Azure DevOps Test Plans](https://learn.microsoft.com/azure/devops/test/overview)
- [ISTQB Foundation Syllabus](https://www.istqb.org/certifications/certified-tester-foundation-level)
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/)

---

## Tips for Best Results

1. **Be Specific**: Include the CR ID, ticket number, and explicit acceptance criteria.
2. **Reference Style**: Point to this agent's style section or the copilot-instructions.md.
3. **Iterate**: Re-run after each remediation batch.
4. **Validate Coverage**: Confirm every CR lifecycle stage has at least one positive test case.
5. **Check Traceability**: Verify CR and Ticket appear in every test case header.

---

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in `[RELEASE_CONTEXT]` and include the CR acceptance criteria directly in the prompt.

**Issue**: Missing important findings
- **Solution**: Explicitly list the lifecycle stages or scenarios you need reviewed in the `Requirements` section.

**Issue**: Output doesn't match PFEvatec style
- **Solution**: Reference the "Established Project Style" section of this agent in the prompt.

---

**Note**: Always review and validate AI-generated content before using in production environments.


## MORE INFO :
# Agent - QA Test Case Writer

## Metadata
- Difficulty: Advanced
- Estimated Time: 30-60 min
- Version: 2.0

## Objective
Generate executable, traceable manual test cases from CRs, requirements, specifications, and user stories.

## QA Writing Standards
- Every requirement marked for testing must have linked test cases
- Maintain requirement traceability
- Use tester actions only
- Use observable expected results only
- Use tester instead of operator
- Avoid vague wording such as should, could, may, might, properly, correctly
- Generate positive, negative, boundary, integration, scenario, regression, and stress coverage where applicable
- Separate workflows into separate test cases

## Required Output
- Requirement Coverage Matrix
- Draft Test Case List
- Full Test Cases
- Coverage Summary
- Assumptions and Open Questions

## Test Case Template

```text
Test Case ID:

Title:

Requirement Traceability:

Priority:

Risk Category:

Coverage Type:

Preconditions:

Steps & Expected Results:
| Step | Tester Action | Expected Result |

Expected Outcome:
```

# Functional Testing Prompt Library

## Feature-Based Test Case Generation
Generate:
- Happy path
- Alternative flows
- Input validation
- Business rules
- Error handling
- Boundary conditions
- Regression impacts

## User Flow Testing
Generate:
- Workflow coverage
- Navigation validation
- Data persistence
- Recovery and cancellation
- Error handling

## CRUD Testing
Generate coverage for:
- Create
- Read
- Update
- Delete

## Form Validation Testing
Generate coverage for:
- Required fields
- Lengths
- Formats
- Data types
- Cross-field validation

## Search Testing
Generate coverage for:
- Exact match
- Partial match
- No results
- Sorting
- Pagination
- Filter combinations

## Integration Testing
Generate coverage for:
- Successful communication
- Transformations
- Retry logic
- Timeout handling
- Recovery

## Permission Testing
Generate coverage for:
- Allowed actions
- Denied actions
- Unauthorized access
- Role changes

## Workflow State Transition Testing
Generate coverage for:
- Valid transitions
- Invalid transitions
- Conditional transitions
- Rollbacks

## Notification Testing
Generate coverage for:
- Triggering
- Content validation
- Delivery timing
- Preferences

## Reporting Testing
Generate coverage for:
- Report generation
- Filtering
- Export
- Empty results
- Large datasets

# Edge Case Testing Prompt Library

Generate edge case coverage for:
- Boundary values
- Null and empty values
- Special characters
- Concurrency and race conditions
- Large data volumes
- Time and date handling
- Network failures
- State transitions
- Permissions
- File upload/download
- Calculations
- Localization
- Browser/device compatibility
- Integrations
- Search and filtering

# Regression Testing Prompt Library

Generate:
- Smoke suites
- Functional regression
- Integration regression
- Scenario regression
- Historical defect regression
- Stress regression

Regression Focus Areas:
- Impact analysis
- Test prioritization
- Suite optimization
- Cross-browser testing
- Database regression
- API regression
- Mobile regression
- Performance regression
- Security regression
- Automation candidate selection

# Manufacturing and Automation Examples

## Equipment Mapping
- Valid map operation
- Empty cassette
- Mapping failure
- Duplicate wafer detection
- Recovery after restart

## Scheduler Testing
- Job execution
- Pause and resume
- Abort handling
- Recovery after restart

## Host Communication
- Connection validation
- Event reporting
- Alarm reporting
- Timeout handling
- Reconnection validation

# Reference Test Case Examples

## Login Functionality
### TC-LOGIN-001
Title: Login with valid credentials
Coverage: Positive

### TC-LOGIN-002
Title: Login using invalid username
Coverage: Negative

## Search Functionality
### TC-SRCH-001
Title: Search using exact equipment identifier
Coverage: Positive

### TC-SRCH-002
Title: Search using partial identifier
Coverage: Boundary

### TC-SRCH-003
Title: Search returning no matching records
Coverage: Negative

## Configuration Comparison
### TC-COMP-001
Compare identical configurations

### TC-COMP-002
Detect added configuration items

### TC-COMP-003
Detect removed configuration items

### TC-COMP-004
Detect modified configuration values

## Host Communication
### TC-HOST-001
Send valid event report to host

### TC-HOST-002
Recover communication after disconnect

### TC-HOST-003
Handle host timeout during transmission

# Coverage Rules

| Coverage Type | Required |
|---|---|
| Positive | Yes |
| Negative | Yes |
| Validation | Yes |
| Boundary | When Applicable |
| Integration | When Applicable |
| Scenario | Yes |
| Regression | Yes |
| Stress | Risk Based |

# Release Checklist

- Every requirement has linked test cases
- Traceability maintained
- Positive coverage exists
- Negative coverage exists
- Boundary coverage exists
- Scenario coverage exists
- Regression coverage exists
- Stress coverage added when risk warrants it
- Actions contain tester actions only
- Expected results contain observable outcomes only
- High-risk areas receive additional coverage

# Authoring Best Practices

- Write concise execution-ready tests
- Use measurable expected results
- Keep workflows separate
- Include recovery and reliability testing where appropriate
- Maintain Azure DevOps traceability
- Review AI-generated content before production use
