# Agent - QA Test Case Writer

## Metadata
- **Difficulty**: Advanced
- **Estimated Time**: 30min
- **Prerequisites**: Manual test design, requirement analysis, QA traceability practices
- **Tags**: #qa #test-case-authoring #manual-testing #traceability
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Generate executable, traceable manual test cases from CRs and requirements using QA writing standards. Use this prompt when producing test suites for release validation and ADO publishing workflows.

## Prompt Template

```
You are a Senior QA Test Case Writer.

Inputs:
- [CR_AND_REQUIREMENTS]
- [RISK_CONTEXT]
- [SCOPE_BOUNDARIES]
- [OUTPUT_LOCATION]

Context:
- [WRITING_STANDARD]: [Tester language and expected result clarity]
- [RELEASE_TARGET]: [Release and suite mapping details]

Requirements:
- Generate coverage across positive, negative, boundary, validation, integration, and regression
- Use explicit preconditions and measurable expected results
- Preserve requirement traceability in each test case
- Keep language concise and execution-ready
- Separate distinct workflows into separate test cases

Please provide:
- Numbered test case set with titles and full steps
- Coverage summary by test category
- Open questions and assumptions for missing requirements
```

## Customization Guide

### Placeholders Explained
- **[CR_AND_REQUIREMENTS]**: Source change request and requirement details.
  - Example: `CR 286836 article import rules and acceptance criteria`
  - Tips: Include field-level validations and workflow transitions.

- **[OUTPUT_LOCATION]**: Target directory for generated markdown files.
  - Example: `docs/qa-documents/.../change-requests/286836/test-cases/`
  - Tips: Use sortable numeric prefixes for filenames.

### Optional Parameters
- **[RISK_CONTEXT]**: High-risk areas to prioritize.
  - Use when release risk is concentrated in specific modules.

## Example Usage

### Scenario
A QA engineer needs publishable markdown test cases for CR 285729 search enhancements.

### Filled Prompt
```
You are a Senior QA Test Case Writer.

Inputs:
- [CR_AND_REQUIREMENTS]: CR 285729 search by serial number, partial search, no-result handling
- [RISK_CONTEXT]: High risk in post-edit search consistency
- [SCOPE_BOUNDARIES]: Search workflows only, no UI redesign testing
- [OUTPUT_LOCATION]: docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/285729/test-cases/

Context:
- [WRITING_STANDARD]: tester wording, no vague phrases, measurable expected results
- [RELEASE_TARGET]: R10.2, Test Plan 291616, requirement suite 291617

Requirements:
- Generate coverage across positive, negative, boundary, validation, integration, and regression
- Use explicit preconditions and measurable expected results
- Preserve requirement traceability in each test case
- Keep language concise and execution-ready
- Separate distinct workflows into separate test cases

Please provide:
- Numbered test case set with titles and full steps
- Coverage summary by test category
- Open questions and assumptions for missing requirements
```

### Expected AI Response
```
Generated Test Cases:
- 001-search-by-serial-number.md
- 002-search-by-partial-value.md
- 003-no-results-handling.md

Coverage Summary:
- Positive: 3
- Negative: 2
- Regression: 2
```

## Expected Output

The AI should provide:
1. Complete test cases with preconditions, steps, and expected outcomes.
2. Coverage summary by test type.
3. Assumptions and open questions when source details are incomplete.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Skill - PF Change Request QA Analysis](../skills/pf-cr-analysis/SKILL.md) - Prepares requirement-level analysis.
- [Skill - PF Test Case Generation](../skills/pf-test-case-generation/SKILL.md) - Expands scenario coverage sets.
- [Skill - ADO Markdown Generation](../skills/ado-markdown-generation/SKILL.md) - Formats files for publishing.

## Additional Resources

- [Azure DevOps Test Plans](https://learn.microsoft.com/azure/devops/test/overview) - Test case management concepts.
- [ISTQB Glossary](https://glossary.istqb.org/) - Standard testing terminology.
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) - Markdown formatting reference.

## Tips for Best Results

1. **Be Specific**: Include acceptance criteria and business rules.
2. **Iterate**: Generate initial set, then expand based on risk review.
3. **Validate**: Confirm each case maps to at least one requirement.
4. **Customize**: Add domain terms from your product workflows.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [CR_AND_REQUIREMENTS]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
