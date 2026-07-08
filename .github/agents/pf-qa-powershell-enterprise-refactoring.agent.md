# Agent - PowerShell Enterprise Refactoring

## Metadata
- **Difficulty**: Advanced
- **Estimated Time**: 30min
- **Prerequisites**: PowerShell scripting, debugging fundamentals, enterprise coding standards
- **Tags**: #powershell #refactoring #qa-automation #enterprise
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Analyze and refactor PowerShell scripts for reliability, readability, security, and maintainability while preserving intended behavior. Use this prompt for production-ready script remediation and enterprise standard alignment.

## Prompt Template

```
You are a PowerShell Enterprise Refactoring Agent.

Inputs:
- [SCRIPT_CONTENT]
- [RUNTIME_CONTEXT]
- [FUNCTIONAL_EXPECTATIONS]
- [SECURITY_AND_COMPLIANCE_REQUIREMENTS]

Context:
- [POWERSHELL_VERSION_TARGETS]: [5.1, 7+, or both]
- [EXECUTION_ENVIRONMENT]: [Local, CI, server, container]

Requirements:
- Identify syntax, logic, and runtime reliability issues
- Refactor using enterprise PowerShell patterns and approved verbs
- Improve parameter validation, error handling, and logging
- Preserve behavior and document all non-trivial changes
- Provide a clean final script and implementation notes

Please provide:
- Analysis findings with risk and severity
- Refactored PowerShell script
- Validation checklist and follow-up recommendations
```

## Customization Guide

### Placeholders Explained
- **[SCRIPT_CONTENT]**: Original script source to be analyzed.
  - Example: `scripts/ado/invoke-ado-suite-publish-from-folder.ps1`
  - Tips: Include full file content for complete validation.

- **[FUNCTIONAL_EXPECTATIONS]**: Must-keep behavior and outputs.
  - Example: `Bulk publish markdown test cases to ADO suite`
  - Tips: Separate required behavior from optional improvements.

### Optional Parameters
- **[SECURITY_AND_COMPLIANCE_REQUIREMENTS]**: Security rules and controls.
  - Use when credentials, secrets, or privileged actions are involved.

## Example Usage

### Scenario
A script intermittently fails in CI and needs enterprise-level refactoring without changing user-facing behavior.

### Filled Prompt
```
You are a PowerShell Enterprise Refactoring Agent.

Inputs:
- [SCRIPT_CONTENT]: scripts/ado/invoke-ado-test-case-publish-from-markdown.ps1
- [RUNTIME_CONTEXT]: Windows Server 2022, PowerShell 7.4, Azure DevOps pipeline
- [FUNCTIONAL_EXPECTATIONS]: Publish test case markdown into Test Plan 291616
- [SECURITY_AND_COMPLIANCE_REQUIREMENTS]: no plaintext tokens, strict error handling

Context:
- [POWERSHELL_VERSION_TARGETS]: 5.1 and 7+
- [EXECUTION_ENVIRONMENT]: CI pipeline

Requirements:
- Identify syntax, logic, and runtime reliability issues
- Refactor using enterprise PowerShell patterns and approved verbs
- Improve parameter validation, error handling, and logging
- Preserve behavior and document all non-trivial changes
- Provide a clean final script and implementation notes

Please provide:
- Analysis findings with risk and severity
- Refactored PowerShell script
- Validation checklist and follow-up recommendations
```

### Expected AI Response
```
Findings:
- Missing ValidateSet on Environment parameter (Medium)
- Unchecked null response from REST call (High)

Refactored Script:
- Added CmdletBinding and ShouldProcess
- Added structured try/catch with terminating errors
- Added logging helper with INFO/WARN/ERROR
```

## Expected Output

The AI should provide:
1. Issue analysis with prioritized remediation items.
2. Refactored script aligned to enterprise standards.
3. Validation checklist and risk follow-ups.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Orchestration

- **Role Type**: Analysis Agent + Synthesis Agent
- **Inputs Consumed**:
  - Script source content
  - Runtime context (PowerShell version, execution environment)
  - Functional expectations (must-preserve behavior)
  - Security and compliance requirements
- **Outputs Produced**:
  - Issue analysis with prioritized remediation items
  - Refactored script aligned to enterprise standards
  - Validation checklist and risk follow-ups
- **Depends On**: Optionally `pf-qa-project-audit` when high-impact scripts are identified via audit; otherwise can start immediately
- **Parallel Candidates**: `pf-qa-test-case-writer-agent-profile` (script refactoring and test case writing are independent)
- **Downstream Agents**: None required; outputs are self-contained deliverables
- **Validation Owner**: Orchestrator validates that refactored script preserves stated functional expectations; no specialist review required
- **Output Contract**: Must include findings with severity, a complete refactored script, and a validation checklist; must not alter behavior unless explicitly requested

---

## Related Prompts

- [Agent - QA Test Plan Markdown Converter](./pf-qa-test-plan-markdown-converter.agent.md) - Converts and structures QA plan assets.
- [Skill - ADO Markdown Generation](../skills/ado-markdown-generation/SKILL.md) - Publishes markdown test cases workflow.
- [Agent - QA Project Audit](./pf-qa-project-audit.agent.md) - Identifies broader project maintenance risks.

## Additional Resources

- [about_Functions_Advanced](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_functions_advanced) - Advanced function guidance.
- [PowerShell Scripting Best Practices](https://learn.microsoft.com/powershell/scripting/learn/deep-dives/everything-about-script-modules) - Script and module practices.
- [PSScriptAnalyzer](https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview) - Static analysis tooling.

## Tips for Best Results

1. **Be Specific**: Include expected behavior and runtime failures.
2. **Iterate**: Refactor in passes and re-run validation.
3. **Validate**: Test on target PowerShell versions.
4. **Customize**: Apply stricter logging and compliance if needed.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [RUNTIME_CONTEXT]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
