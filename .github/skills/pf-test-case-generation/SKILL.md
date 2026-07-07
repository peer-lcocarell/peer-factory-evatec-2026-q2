# Skill - PF Test Case Generation

## Metadata
- **Difficulty**: Intermediate
- **Estimated Time**: 15min
- **Prerequisites**: Manual test design, requirement mapping, QA writing standards
- **Tags**: #qa #test-cases #coverage #manual-testing
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Generate executable manual test cases for PF requirements with balanced scenario coverage and clear expected outcomes. Use this prompt when converting analyzed requirements into implementation-ready test assets.

## Prompt Template

```
You are a PF Test Case Generation Skill Assistant.

Inputs:
- [CR_NUMBER]
- [REQUIREMENT_ANALYSIS]
- [RISK_LEVEL]
- [SCOPE_BOUNDARIES]

Context:
- [TEST_CASE_NAMING_STANDARD]: [Release + CR + requirement + scenario type]
- [WRITING_RULES]: [Tester wording, observable outcomes]

Requirements:
- Generate scenarios for positive, negative, boundary, validation, integration, and regression
- Produce clear preconditions and step-by-step actions
- Pair each action with measurable expected results
- Preserve requirement traceability in each test case
- Flag assumptions when source behavior is incomplete

Please provide:
- Numbered test case set with full details
- Coverage summary by scenario type
- Assumptions and open questions
```

## Customization Guide

### Placeholders Explained
- **[REQUIREMENT_ANALYSIS]**: Structured requirement impact output.
  - Example: `PF CR analysis output for CR 286836`
  - Tips: Include behavior deltas and validation rules.

- **[SCOPE_BOUNDARIES]**: What is in and out of scope.
  - Example: `Include import validation, exclude UI theme checks`
  - Tips: Define boundaries early to avoid coverage drift.

### Optional Parameters
- **[RISK_LEVEL]**: Priority weighting for scenario depth.
  - Use `High` when workflow or data integrity risks dominate.

## Example Usage

### Scenario
A QA engineer needs detailed markdown test cases for article import behavior changes.

### Filled Prompt
```
You are a PF Test Case Generation Skill Assistant.

Inputs:
- [CR_NUMBER]: 286836
- [REQUIREMENT_ANALYSIS]: import validation and duplicate handling summary
- [RISK_LEVEL]: High
- [SCOPE_BOUNDARIES]: include BOM, work order, and duplicate import checks

Context:
- [TEST_CASE_NAMING_STANDARD]: R10.2 Update for CR <CR> - <Requirement>: <Scenario> (<Type>)
- [WRITING_RULES]: tester wording and measurable expected outcomes

Requirements:
- Generate scenarios for positive, negative, boundary, validation, integration, and regression
- Produce clear preconditions and step-by-step actions
- Pair each action with measurable expected results
- Preserve requirement traceability in each test case
- Flag assumptions when source behavior is incomplete

Please provide:
- Numbered test case set with full details
- Coverage summary by scenario type
- Assumptions and open questions
```

### Expected AI Response
```
Generated Cases:
- Happy path import with valid data
- Duplicate import rejection
- Missing required field validation
- Regression for existing import pipeline

Coverage Summary:
- Positive: 2
- Negative: 3
- Boundary: 1
```

## Expected Output

The AI should provide:
1. Full manual test cases with traceable titles and measurable outcomes.
2. Coverage summary across required scenario categories.
3. Assumptions and open questions for unresolved details.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Skill - PF Change Request QA Analysis](../pf-cr-analysis/SKILL.md) - Provides requirement impact baseline.
- [Skill - ADO Markdown Generation](../ado-markdown-generation/SKILL.md) - Formats for ADO publication.
- [Agent - QA Test Case Review](../../agents/pf-qa-test-case-review.agent.md) - Reviews generated quality.

## Additional Resources

- [ISTQB Test Design Techniques](https://www.istqb.org/certifications/certified-tester-foundation-level) - Coverage strategy guidance.
- [Azure DevOps Test Plans](https://learn.microsoft.com/azure/devops/test/overview) - Test management context.
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) - Output formatting reference.

## Tips for Best Results

1. **Be Specific**: Include requirement IDs and acceptance criteria.
2. **Iterate**: Expand or trim cases after risk review.
3. **Validate**: Ensure each case maps to at least one requirement.
4. **Customize**: Adjust naming standard for your release process.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [REQUIREMENT_ANALYSIS]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
