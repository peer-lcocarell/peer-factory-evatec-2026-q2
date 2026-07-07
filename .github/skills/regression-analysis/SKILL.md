# Skill - Regression Analysis

## Metadata
- **Difficulty**: Intermediate
- **Estimated Time**: 15min
- **Prerequisites**: Regression planning, dependency mapping, risk prioritization
- **Tags**: #qa #regression #impact-analysis #risk
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Determine regression scope from direct and indirect impacts of a change request or feature update. Use this prompt when deciding what existing functionality must be re-validated before release.

## Prompt Template

```
You are a Regression Analysis Skill Assistant.

Inputs:
- [CHANGE_DESCRIPTION]
- [IMPACTED_MODULES_OR_WORKFLOWS]
- [OPTIONAL_EXISTING_TEST_SUITE]

Context:
- [RISK_PROFILE]: [High, Medium, Low]
- [RELEASE_CONSTRAINTS]: [Timeline and environment limitations]

Requirements:
- Identify direct and indirect regression impacts
- Include shared framework and cross-module dependencies
- Prioritize regression areas by risk and business impact
- Recommend reuse vs new test creation per area
- Flag uncertainty and assumptions explicitly

Please provide:
- Direct, indirect, and shared-framework impact lists
- Prioritized regression suite recommendations
- Reuse-versus-new test case assessment
```

## Customization Guide

### Placeholders Explained
- **[CHANGE_DESCRIPTION]**: Summary of the implemented change.
  - Example: `Magnet lifecycle status transition updates`
  - Tips: Include behavior deltas and impacted states.

- **[IMPACTED_MODULES_OR_WORKFLOWS]**: Known touched areas.
  - Example: `Hardware config, logbook, export history`
  - Tips: Include both UI and backend components when known.

### Optional Parameters
- **[OPTIONAL_EXISTING_TEST_SUITE]**: Existing regression assets.
  - Use when you want explicit reuse recommendations.

## Example Usage

### Scenario
A release manager needs a risk-prioritized regression plan for a high-impact CR.

### Filled Prompt
```
You are a Regression Analysis Skill Assistant.

Inputs:
- [CHANGE_DESCRIPTION]: CR 286067 lifecycle transitions and tracking updates
- [IMPACTED_MODULES_OR_WORKFLOWS]: hardware configuration, history, export, search
- [OPTIONAL_EXISTING_TEST_SUITE]: r10.1 regression suite set

Context:
- [RISK_PROFILE]: High
- [RELEASE_CONSTRAINTS]: 2-week validation window

Requirements:
- Identify direct and indirect regression impacts
- Include shared framework and cross-module dependencies
- Prioritize regression areas by risk and business impact
- Recommend reuse vs new test creation per area
- Flag uncertainty and assumptions explicitly

Please provide:
- Direct, indirect, and shared-framework impact lists
- Prioritized regression suite recommendations
- Reuse-versus-new test case assessment
```

### Expected AI Response
```
Direct Impacts:
- Lifecycle status transitions
- Magnet install/uninstall workflow

Indirect Impacts:
- Search index refresh behavior
- Export consistency

Priority:
1. High: lifecycle + history
2. Medium: search + export
```

## Expected Output

The AI should provide:
1. Structured regression impact inventory by category.
2. Risk-prioritized regression recommendations.
3. Reuse vs new test case guidance.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Skill - PF Change Request QA Analysis](../pf-cr-analysis/SKILL.md) - Produces initial impact map.
- [Skill - PF Test Case Generation](../pf-test-case-generation/SKILL.md) - Generates required new cases.
- [Agent - QA Estimation and Planning](../../agents/pf-qa-estimation.agent.md) - Converts regression scope to effort.

## Additional Resources

- [ISTQB Risk-Based Testing](https://www.istqb.org/certifications/certified-tester-foundation-level) - Risk and prioritization concepts.
- [Azure DevOps Test Plans](https://learn.microsoft.com/azure/devops/test/overview) - Organizing regression suites.
- [Microsoft Well-Architected](https://learn.microsoft.com/azure/well-architected/) - Reliability and change impact guidance.

## Tips for Best Results

1. **Be Specific**: Provide touched modules and workflow transitions.
2. **Iterate**: Update regression scope as implementation evolves.
3. **Validate**: Confirm high-risk areas have executable tests.
4. **Customize**: Align prioritization to release constraints.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [CHANGE_DESCRIPTION]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
