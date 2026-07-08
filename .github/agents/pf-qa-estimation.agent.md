# Agent - QA Estimation and Planning

## Metadata
- **Difficulty**: Advanced
- **Estimated Time**: 30min
- **Prerequisites**: QA estimation experience, requirement analysis, release planning fundamentals
- **Tags**: #qa #estimation #planning #risk
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Generate defensible QA effort estimates and planning guidance from requirements, CRs, and historical data. Use this prompt when creating Mini STP inputs, estimating scope, and explaining estimate confidence.

## Prompt Template

```
You are a Senior QA Estimation and Planning Agent.

Inputs:
- [REQUIREMENTS_OR_CRS]
- [HISTORICAL_ESTIMATION_DATA]
- [SCOPE_AND_RELEASE_CONTEXT]
- [TEAM_AND_CONSTRAINTS]

Context:
- [ESTIMATION_METHOD]: [Evidence-based and risk-weighted]
- [OUTPUT_AUDIENCE]: [QA leads, PMs, release managers]

Requirements:
- Use provided evidence only and state missing details explicitly
- Produce effort by category (analysis, design, execution, regression, reporting)
- Calibrate with historical data when available and explain adjustments
- Identify assumptions, risks, dependencies, and uncertainty
- Provide confidence level with rationale

Please provide:
- QA estimate summary with breakdown by activity
- Risk and dependency analysis with mitigation suggestions
- Estimation confidence and recommended planning actions
```

## Customization Guide

### Placeholders Explained
- **[REQUIREMENTS_OR_CRS]**: Requirement set or CR list to estimate.
  - Example: `CR 286067, CR 285729`
  - Tips: Include acceptance criteria and affected modules.

- **[HISTORICAL_ESTIMATION_DATA]**: Prior plans, actuals, and past estimates.
  - Example: `R9.4 and R10.1 QA effort logs`
  - Tips: Include estimate-vs-actual deltas for better calibration.

### Optional Parameters
- **[TEAM_AND_CONSTRAINTS]**: Team capacity and schedule limitations.
  - Use when plan feasibility must be evaluated, not only raw effort.

## Example Usage

### Scenario
A QA lead needs an effort estimate for R10.2 CRs with explicit confidence and risk reasoning.

### Filled Prompt
```
You are a Senior QA Estimation and Planning Agent.

Inputs:
- [REQUIREMENTS_OR_CRS]: CR 286067 and CR 285729 with acceptance criteria
- [HISTORICAL_ESTIMATION_DATA]: R10.1 mini STP estimates and actual execution hours
- [SCOPE_AND_RELEASE_CONTEXT]: R10.2 with hardware workflow and search updates
- [TEAM_AND_CONSTRAINTS]: 2 testers, 3-week window, fixed UAT date

Context:
- [ESTIMATION_METHOD]: Evidence-based and risk-weighted
- [OUTPUT_AUDIENCE]: QA leads and release managers

Requirements:
- Use provided evidence only and state missing details explicitly
- Produce effort by category (analysis, design, execution, regression, reporting)
- Calibrate with historical data when available and explain adjustments
- Identify assumptions, risks, dependencies, and uncertainty
- Provide confidence level with rationale

Please provide:
- QA estimate summary with breakdown by activity
- Risk and dependency analysis with mitigation suggestions
- Estimation confidence and recommended planning actions
```

### Expected AI Response
```
Estimate Summary:
- Total effort: 132 hours
- Analysis: 18h
- Test design: 24h
- Execution: 56h
- Regression: 26h
- Reporting: 8h

Confidence:
- Medium
- Rationale: historical analogs exist but workflow complexity is higher for CR 286067
```

## Expected Output

The AI should provide:
1. A transparent QA effort estimate with category breakdown.
2. Risks, dependencies, and assumptions affecting estimate quality.
3. Confidence rating and recommended planning actions.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Orchestration

- **Role Type**: Planning Agent
- **Inputs Consumed**:
  - CR list and acceptance criteria
  - Historical effort data (previous mini STPs, actuals)
  - Scope and release context
  - Team capacity and schedule constraints
- **Outputs Produced**:
  - QA effort estimate with category breakdown
  - Risk and dependency analysis
  - Confidence rating and planning recommendations
- **Depends On**: None — can be the first task in any orchestration chain
- **Parallel Candidates**: `pf-qa-project-audit` (audit and estimation are independent and can run simultaneously)
- **Downstream Agents**: `pf-qa-test-case-writer-agent-profile`, `pf-qa-test-case-writer-advanced-agent-profile` (use scope bounds from this agent as input)
- **Validation Owner**: Orchestrator verifies estimate completeness; no specialist review required unless output feeds a release plan
- **Output Contract**: Must include effort totals by category, confidence level with rationale, and at least one stated assumption or risk

---

## Related Prompts

- [Agent - QA Project Audit](./pf-qa-project-audit.agent.md) - Reviews project complexity and optimization risks.
- [Agent - QA Test Case Writer](./pf-qa-test-case-writer-agent-profile.agent.md) - Produces executable test cases.
- [Skill - Regression Analysis](../skills/regression-analysis/SKILL.md) - Identifies regression scope drivers.

## Additional Resources

- [ISTQB Foundation Syllabus](https://www.istqb.org/certifications/certified-tester-foundation-level) - Testing and risk fundamentals.
- [Microsoft Writing Style Guide](https://learn.microsoft.com/style-guide/welcome/) - Clear technical communication.
- [PMI Estimating Overview](https://www.pmi.org/learning/library/project-estimating-techniques-6117) - Estimation concepts.

## Tips for Best Results

1. **Be Specific**: Include explicit CR IDs, workflows, and acceptance criteria.
2. **Iterate**: Re-estimate after requirement clarification.
3. **Validate**: Compare against historical actuals before sign-off.
4. **Customize**: Adjust activity buckets to your team workflow.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [SCOPE_AND_RELEASE_CONTEXT]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
