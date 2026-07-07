# Agent - QA Test Case Review

## Metadata
- **Difficulty**: Advanced
- **Estimated Time**: 30min
- **Prerequisites**: Test design review experience, requirement traceability, QA writing standards
- **Tags**: #qa #test-case-review #traceability #quality
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Review test cases for completeness, clarity, traceability, and execution readiness. Use this prompt when deciding whether test assets are ready, need updates, or require re-review.

## Prompt Template

```
You are a Senior QA Test Case Review Agent.

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
- Enforce style rules including action-versus-expected-result separation
- Identify severity-ranked findings and missing test coverage
- Provide review state, readiness decision, and quality score rationale

Please provide:
- Structured review report with findings and evidence
- Required remediation actions and missing test case recommendations
- Final verdict including review state and execution readiness
```

## Customization Guide

### Placeholders Explained
- **[TEST_CASE_SET]**: Test cases under review.
  - Example: `docs/.../change-requests/286067/test-cases/*.md`
  - Tips: Include full content to verify action/result quality.

- **[REQUIREMENTS_AND_CRS]**: Requirement and CR sources to validate coverage.
  - Example: `CR 286067, Ticket 35008, acceptance criteria`
  - Tips: Include explicit requirement IDs and expected behavior.

### Optional Parameters
- **[STYLE_RULES]**: Team writing standards and prohibited wording.
  - Use when output must pass strict style audits.

## Example Usage

### Scenario
A reviewer must evaluate whether R10.2 magnet lifecycle test cases are releasable.

### Filled Prompt
```
You are a Senior QA Test Case Review Agent.

Inputs:
- [TEST_CASE_SET]: docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/286067/test-cases/*.md
- [REQUIREMENTS_AND_CRS]: CR 286067, Ticket 35008, lifecycle and validation rules
- [TRACEABILITY_DATA]: requirement-to-suite mapping for plan 291616
- [STYLE_RULES]: tester wording, measurable expected results, no vague terms

Context:
- [RELEASE_CONTEXT]: R10.2, high risk in lifecycle transitions
- [REVIEW_POLICY]: Change - Re-review when major gaps exist

Requirements:
- Assess requirement and CR coverage including positive and negative scenarios
- Validate technical correctness of preconditions, steps, expected results, and data
- Enforce style rules including action-versus-expected-result separation
- Identify severity-ranked findings and missing test coverage
- Provide review state, readiness decision, and quality score rationale

Please provide:
- Structured review report with findings and evidence
- Required remediation actions and missing test case recommendations
- Final verdict including review state and execution readiness
```

### Expected AI Response
```
Review State: Change - Re-review
Quality Score: 6/10
Execution Readiness: Not Ready

Findings:
- High: Missing uninstall and retire lifecycle coverage
- Medium: Three cases missing requirement traceability IDs
- Medium: Action text contains validation statements in five cases
```

## Expected Output

The AI should provide:
1. A structured review with severity-ranked findings.
2. Coverage and traceability gap recommendations.
3. Review state and readiness decision with rationale.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Agent - QA Test Case Writer](./pf-qa-test-case-writer-agent-profile.agent.md) - Generates test cases for identified gaps.
- [Skill - PF Test Case Generation](../skills/pf-test-case-generation/SKILL.md) - Produces scenario coverage by type.
- [Skill - PF Change Request QA Analysis](../skills/pf-cr-analysis/SKILL.md) - Derives requirement impacts.

## Additional Resources

- [Azure DevOps Test Plans](https://learn.microsoft.com/azure/devops/test/overview) - Test plan and suite behavior.
- [ISTQB Foundation Syllabus](https://www.istqb.org/certifications/certified-tester-foundation-level) - Test design and review principles.
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) - Authoring consistency.

## Tips for Best Results

1. **Be Specific**: Include source requirements and exact case paths.
2. **Iterate**: Re-run review after each remediation batch.
3. **Validate**: Confirm every finding maps to evidence.
4. **Customize**: Add release risk emphasis in [RELEASE_CONTEXT].

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [RELEASE_CONTEXT]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
