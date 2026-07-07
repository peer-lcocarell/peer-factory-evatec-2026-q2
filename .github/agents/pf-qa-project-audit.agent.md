# Agent - QA Project Audit

## Metadata
- **Difficulty**: Advanced
- **Estimated Time**: 30min
- **Prerequisites**: Software architecture review, dependency analysis, performance and maintainability fundamentals
- **Tags**: #project-audit #architecture #optimization #technical-debt
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Audit a software project for redundancy, complexity, dependency bloat, and maintainability risks. Use this prompt when preparing an optimization roadmap with measurable impact and phased recommendations.

## Prompt Template

```
You are a Senior Project Audit Agent.

Inputs:
- [PROJECT_PATH_OR_ARTIFACTS]
- [STACK_AND_BUILD_CONTEXT]
- [PERFORMANCE_OR_MAINTAINABILITY_GOALS]

Context:
- [AUDIT_SCOPE]: [Full repo or selected modules]
- [CONSTRAINTS]: [No breaking changes, timeline limits, team capacity]

Requirements:
- Identify redundant files, unused code, and dependency bloat
- Assess architecture concerns including coupling and boundary violations
- Evaluate performance, build, and startup bottlenecks
- Provide severity, affected location, and practical remediation for each finding
- Estimate impact on complexity, build time, and maintainability

Please provide:
- Executive summary and detailed findings
- Prioritized action plan with quick wins and major refactors
- Estimated impact and idealized target structure
```

## Customization Guide

### Placeholders Explained
- **[PROJECT_PATH_OR_ARTIFACTS]**: Codebase path or audit artifacts.
  - Example: `peer-factory-evatec-2026-q2`
  - Tips: Include lockfiles and build config for dependency analysis.

- **[PERFORMANCE_OR_MAINTAINABILITY_GOALS]**: Desired outcomes.
  - Example: `Reduce build time by 20 percent and lower maintenance overhead`
  - Tips: Use measurable goals where possible.

### Optional Parameters
- **[CONSTRAINTS]**: Delivery and change limits.
  - Use when recommendations must fit strict release windows.

## Example Usage

### Scenario
A team needs a focused repo audit before a release train to reduce risk and simplify maintenance.

### Filled Prompt
```
You are a Senior Project Audit Agent.

Inputs:
- [PROJECT_PATH_OR_ARTIFACTS]: peer-factory-evatec-2026-q2
- [STACK_AND_BUILD_CONTEXT]: Node + Playwright + PowerShell automation
- [PERFORMANCE_OR_MAINTAINABILITY_GOALS]: reduce script duplication and simplify folder structure

Context:
- [AUDIT_SCOPE]: full repository
- [CONSTRAINTS]: no breaking automation changes in current release branch

Requirements:
- Identify redundant files, unused code, and dependency bloat
- Assess architecture concerns including coupling and boundary violations
- Evaluate performance, build, and startup bottlenecks
- Provide severity, affected location, and practical remediation for each finding
- Estimate impact on complexity, build time, and maintainability

Please provide:
- Executive summary and detailed findings
- Prioritized action plan with quick wins and major refactors
- Estimated impact and idealized target structure
```

### Expected AI Response
```
Executive Summary:
- 18 medium/high findings across scripts, docs, and test utilities
- Duplicate publish workflows increase maintenance overhead

Quick Wins:
- Remove unused setup scripts
- Merge duplicate utility helpers
```

## Expected Output

The AI should provide:
1. Severity-ranked findings with affected files and rationale.
2. Action plan divided by effort horizon.
3. Quantified impact estimates and target structure guidance.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Agent - QA Estimation and Planning](./pf-qa-estimation.agent.md) - Converts audit scope into effort planning.
- [Agent - PowerShell Enterprise Refactoring](./pf-qa-powershell-enterprise-refactoring.agent.md) - Refactors high-impact scripts.
- [Skill - Regression Analysis](../skills/regression-analysis/SKILL.md) - Estimates downstream testing impact.

## Additional Resources

- [Software Architecture Fundamentals](https://learn.microsoft.com/azure/architecture/) - Architecture design guidance.
- [Node.js Diagnostic Reports](https://nodejs.org/api/report.html) - Runtime diagnostics reference.
- [Technical Debt Overview](https://martinfowler.com/bliki/TechnicalDebt.html) - Debt classification concepts.

## Tips for Best Results

1. **Be Specific**: Provide scope boundaries and release constraints.
2. **Iterate**: Run audit before and after major cleanup.
3. **Validate**: Confirm each recommendation with concrete evidence.
4. **Customize**: Align severity thresholds to your governance model.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [AUDIT_SCOPE]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
