# Skill - PF Change Request QA Analysis

## Metadata
- **Difficulty**: Intermediate
- **Estimated Time**: 15min
- **Prerequisites**: Requirement analysis, CR interpretation, QA risk assessment
- **Tags**: #qa #change-request #analysis #risk
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Analyze change requests and requirements to produce QA impact, risk, and coverage recommendations. Use this prompt when scoping test strategy before test case authoring.

## Prompt Template

```
You are a PF Change Request QA Analysis Skill Assistant.

Inputs:
- [CR_OR_REQUIREMENT_SOURCE]
- [OPTIONAL_SUPPORTING_DOCS]
- [RELEASE_CONTEXT]

Context:
- [ANALYSIS_DEPTH]: [Light, standard, deep]
- [OUTPUT_CONSUMERS]: [QA, PM, release lead]

Requirements:
- Extract requirement impacts, workflows, modules, and integrations
- Distinguish current behavior from changed behavior
- Identify QA focus areas and risk level with rationale
- Recommend scenario coverage categories and priorities
- Highlight unclear or missing requirement details explicitly

Please provide:
- Executive summary and impacted areas
- Requirement-by-requirement QA analysis
- Risk assessment and coverage recommendations
```

## Customization Guide

### Placeholders Explained
- **[CR_OR_REQUIREMENT_SOURCE]**: Primary input document(s).
  - Example: `CR 284111 and linked requirement notes`
  - Tips: Include acceptance criteria and known constraints.

- **[OPTIONAL_SUPPORTING_DOCS]**: Additional context docs.
  - Example: `Functional spec, user guide, work items`
  - Tips: Label inferred points if source detail is incomplete.

### Optional Parameters
- **[ANALYSIS_DEPTH]**: Determines breadth of output.
  - Use `deep` when multiple modules and integrations are affected.

## Example Usage

### Scenario
A QA analyst must understand CR scope and risk before creating test cases.

### Filled Prompt
```
You are a PF Change Request QA Analysis Skill Assistant.

Inputs:
- [CR_OR_REQUIREMENT_SOURCE]: CR 284111 WBS Element for self-service boxes
- [OPTIONAL_SUPPORTING_DOCS]: requirements markdown and acceptance criteria notes
- [RELEASE_CONTEXT]: R10.2

Context:
- [ANALYSIS_DEPTH]: standard
- [OUTPUT_CONSUMERS]: QA and release lead

Requirements:
- Extract requirement impacts, workflows, modules, and integrations
- Distinguish current behavior from changed behavior
- Identify QA focus areas and risk level with rationale
- Recommend scenario coverage categories and priorities
- Highlight unclear or missing requirement details explicitly

Please provide:
- Executive summary and impacted areas
- Requirement-by-requirement QA analysis
- Risk assessment and coverage recommendations
```

### Expected AI Response
```
Executive Summary:
- CR affects box creation, WBS edit workflow, and reporting consistency

Risk:
- Medium due to persistence and cross-screen behavior impacts

Coverage Recommendations:
- Validation, boundary, regression, and reporting checks
```

## Expected Output

The AI should provide:
1. Structured impact analysis from source requirements.
2. Risk level with evidence-based rationale.
3. Coverage recommendations grouped by scenario type.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Skill - PF Test Case Generation](../pf-test-case-generation/SKILL.md) - Converts analysis into executable tests.
- [Skill - Regression Analysis](../regression-analysis/SKILL.md) - Expands regression scope.
- [Agent - QA Test Case Writer](../../agents/pf-qa-test-case-writer-agent-profile.agent.md) - Produces final cases.

## Additional Resources

- [Azure DevOps Work Items](https://learn.microsoft.com/azure/devops/boards/work-items/about-work-items) - Work item and requirement tracking.
- [ISTQB Risk-Based Testing](https://www.istqb.org/certifications/certified-tester-foundation-level) - Risk prioritization concepts.
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) - Formatting reference.

## Tips for Best Results

1. **Be Specific**: Include exact CR and requirement identifiers.
2. **Iterate**: Re-run analysis when requirements change.
3. **Validate**: Ensure every recommendation maps to source evidence.
4. **Customize**: Tailor depth for release risk and timeline.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [CR_OR_REQUIREMENT_SOURCE]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
