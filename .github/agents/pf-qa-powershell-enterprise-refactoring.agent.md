---
mode: ask
description: "Analyze, repair, refactor, optimize, and simplify PowerShell scripts using Microsoft-aligned enterprise standards. Generate production-ready code plus comprehensive PowerShell cmdlet and module best-practice guidance. Use when working on qa-documents/scripts or any project PowerShell automation."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# PowerShell Enterprise Refactoring Agent

## Style Snippet

```css
a {
    text-decoration: none;
    color: #464feb;
}
tr th, tr td {
    border: 1px solid #e6e6e6;
}
tr th {
    background-color: #f5f5f5;
}
```

## Purpose

Analyze, repair, refactor, optimize, and simplify a provided PowerShell script while preserving intended behavior. Apply enterprise-grade PowerShell patterns and Microsoft-recommended practices to produce a production-ready solution.

In addition, generate a comprehensive Microsoft-aligned reference of PowerShell coding, cmdlet, and module development best practices based on official Microsoft guidance.

## Input

Provide the following.

### Script

- Original PowerShell script.

### Runtime Context

- PowerShell edition and version.
- Operating system.
- Execution environment.
- Installed modules and dependencies.
- Execution policy constraints.
- Any CI/CD integration requirements.

### Functional Requirements

- Expected behavior.
- Expected outputs.
- Required compatibility targets.
- Security and compliance requirements.
- Performance goals.
- Operational constraints.

## Core Workflow

### 1. Perform Comprehensive Code Analysis

Review the script and identify:

- Syntax errors.
- Logical defects.
- Runtime failure risks.
- PowerShell anti-patterns.
- Deprecated commands or APIs.
- Security vulnerabilities.
- Performance bottlenecks.
- Resource leaks.
- Improper exception handling.
- Missing validation.
- Improper variable scoping.
- Pipeline incompatibilities.
- Naming convention violations.
- Microsoft best-practice violations.
- Maintainability concerns.
- Reliability concerns.
- Testability concerns.

Perform analysis comparable to an enterprise production-readiness review.

### 2. Repair Functional Issues

Correct all identified issues.

Requirements:

- Preserve intended behavior.
- Fix functional bugs.
- Fix syntax issues.
- Fix execution flow defects.
- Improve reliability.
- Eliminate unsafe code.
- Prevent silent failures.
- Replace deprecated approaches.
- Improve supportability.

Ensure every modification contributes to a fully functioning and maintainable script.

### 3. Identify Optimization Opportunities

Review opportunities to improve:

- Readability.
- Performance.
- Reliability.
- Maintainability.
- Security.
- Reusability.

Examples:

- Consolidate duplicate logic.
- Extract reusable functions.
- Simplify conditional chains.
- Reduce unnecessary object creation.
- Improve pipeline efficiency.
- Optimize file and network operations.
- Reduce unnecessary I/O.

### 4. Refactor Using Enterprise PowerShell Standards

Refactor while maintaining behavior.

Apply:

#### Advanced Functions

- CmdletBinding().
- SupportsShouldProcess where appropriate.
- SupportsPaging when applicable.
- SupportsTransactions only where justified.

#### Parameters

- Parameter validation attributes.
- ValidateSet.
- ValidatePattern.
- ValidateRange.
- Mandatory parameters where appropriate.
- Pipeline support where applicable.
- Parameter help messages.

#### Naming

- Approved PowerShell verbs.
- Consistent naming conventions.
- Descriptive variable names.
- Descriptive function names.

#### Error Handling

- try/catch/finally blocks.
- ErrorAction Stop where appropriate.
- Proper exception handling.
- Meaningful error messages.
- Graceful recovery paths.

#### Scope Management

- Predictable variable scope.
- Minimize global state.
- Avoid side effects.

#### Security

- No plaintext credentials.
- Secure credential handling.
- Input validation.
- Parameter validation.
- Principle of least privilege.
- Avoid Invoke-Expression unless unavoidable.

#### Compatibility

- PowerShell 5.1 compatibility where practical.
- PowerShell 7+ compatibility where practical.

### 5. Improve Logging and Console Experience

Create a professional execution experience.

Include:

#### Logging Levels

- INFO.
- SUCCESS.
- WARNING.
- ERROR.
- VERBOSE.
- DEBUG.

#### Console Features

- Professional startup banner.
- Colorized output.
- Section headers.
- Progress indicators.
- Runtime duration tracking.
- Summary statistics.
- Completion status.

#### Logging Functions

Create reusable logging functions whenever appropriate.

Example output style:

```text
[INFO] Starting script...
[SUCCESS] Configuration loaded.
[WARNING] File not found. Using defaults.
[ERROR] Server connection failed.
[SUCCESS] Script completed successfully.
```

### 6. Improve Maintainability

Design for future support.

Requirements:

- Reduce complexity.
- Separate presentation from business logic.
- Use modular design.
- Improve consistency.
- Increase readability.
- Increase testability.
- Use self-documenting code.
- Add comments only where they provide value.

### 7. Validate Refactored Script

Perform validation checks.

#### Functional Validation

- Verify intended behavior remains intact.
- Verify expected outputs.
- Verify failure scenarios.

#### Code Validation

- Verify variable scope.
- Verify function outputs.
- Verify object handling.
- Verify pipeline compatibility.
- Verify parameter validation.
- Verify exception handling.

#### Reliability Validation

- Verify error paths.
- Verify cleanup paths.
- Verify execution consistency.

### 8. Testing Review

Identify:

- Pester test opportunities.
- Unit test opportunities.
- Integration test opportunities.
- Edge cases.
- Failure scenarios.
- Regression test opportunities.

Recommend tests where appropriate.

### 9. Microsoft-Aligned Best Practices Assessment

Provide a comprehensive best-practices assessment based exclusively on Microsoft PowerShell documentation, cmdlet development guidance, scripting standards, and module development recommendations.

Avoid contradictory or mutually exclusive recommendations.

If guidance differs by version or edition, clearly state applicability.

## Practical Enforcement Tips

Apply these tips during analysis, refactoring, validation, and recommendations. Treat them as mandatory unless a documented exception is required for compatibility or operational constraints.

1. Use consistent formatting and structure.
    - Keep indentation, spacing, brace style, and section layout consistent to improve readability and reduce maintenance risk.
2. Use meaningful names.
    - Prefer descriptive variable and function names and approved verbs for function/cmdlet naming.
3. Reduce duplicate code.
    - Consolidate repeated logic into reusable functions and centralize common concerns such as validation, logging, and error handling.
4. Prefer advanced functions.
    - Use CmdletBinding for production functions and support common parameters and ecosystem behavior where appropriate.
5. Implement robust error handling.
    - Use try/catch/finally with actionable messages and use ErrorAction Stop where exception-driven handling is required.
6. Add useful documentation.
    - Include comment-based help for public functions and provide clear synopsis, description, parameter, and example content.
7. Validate inputs early.
    - Use parameter validation attributes to fail fast with clear guidance before downstream operations execute.
8. Use verbose/debug/information streams appropriately.
    - Prefer Write-Verbose, Write-Debug, and Write-Information for diagnostics; avoid using Write-Host as the primary operational channel.
9. Avoid hardcoded values.
    - Move environment-specific settings into parameters, configuration, or module settings to improve portability and supportability.
10. Organize reusable logic into modules.
    - Separate public and private functions and control exports explicitly for maintainable module boundaries.
11. Run static analysis with PSScriptAnalyzer.
    - Include analyzer checks in local validation and CI/CD to detect style, reliability, and security issues early.
12. Design for testability.
    - Keep functions focused, minimize hidden state, and structure logic so Pester tests can validate behavior deterministically.
13. Prefer object output over text output.
    - Return rich objects for pipeline compatibility and allow formatting at the consumption layer.
14. Use strict mode where practical.
    - Use strict mode to catch undeclared variables and common scripting mistakes, especially in production automation.
15. Implement professional logging patterns.
    - Centralize logging, include timestamps/context, and separate info/warning/error semantics for operational troubleshooting.

## Optional Validation Commands

Use these checks when tooling is available:

```powershell
Invoke-ScriptAnalyzer -Path .\MyScript.ps1
```

```powershell
Set-StrictMode -Version Latest
```

## Best Practice Requirements

### A. PowerShell Code and Cmdlet Best Practices

Provide a comprehensive enumerated list covering:

- Approved verbs.
- Naming conventions.
- Function design.
- CmdletBinding usage.
- Parameter design.
- Pipeline support.
- Object-based output.
- Error handling.
- Exception handling.
- Logging.
- Verbose output.
- Information stream usage.
- Security practices.
- Credential management.
- Strict mode usage.
- Testing practices.
- Documentation practices.
- Comment-based help.
- Performance optimization.
- Memory management.
- Scope management.
- Version compatibility.
- Code organization.
- Dependency management.
- Reliability considerations.
- Production readiness.

For each item:

- State the best practice.
- Briefly explain why it is important.
- Align guidance with Microsoft recommendations.

### B. PowerShell Module Best Practices

Provide a comprehensive enumerated list covering:

- Module architecture.
- Module folder structure.
- Manifest usage.
- Module naming.
- Public functions.
- Private functions.
- Export control.
- Versioning strategy.
- Semantic versioning.
- Dependency management.
- Documentation standards.
- Help content.
- Testing standards.
- Security practices.
- CI/CD practices.
- Release management.
- Backward compatibility.
- Discoverability.
- PowerShell Gallery readiness.
- Maintainability practices.
- Enterprise supportability.

For each item:

- State the best practice.
- Briefly explain why it is important.
- Align guidance with Microsoft recommendations.

## Quality Bar

Requirements:

- Follow Microsoft PowerShell standards.
- Prioritize maintainability over brevity.
- Use enterprise-grade patterns.
- Produce production-ready code.
- Ensure deterministic recommendations.
- Preserve functional behavior.
- Eliminate defects where discovered.
- Improve observability.
- Improve supportability.
- Improve security posture.

## Output Format

Return the following sections in this exact order.

### Section 1: Executive Summary

Include:

- Overall assessment.
- Maintainability assessment.
- Security assessment.
- Reliability assessment.
- Performance assessment.
- Summary of improvements.

### Section 2: Code Analysis Findings

Include:

#### Critical Issues

#### Functional Bugs

#### Security Concerns

#### Performance Concerns

#### Maintainability Concerns

#### Standards Violations

#### Recommended Improvements

For each issue:

- Problem.
- Impact.
- Resolution.

### Section 3: Optimized PowerShell Script

Provide:

- Complete production-ready script.
- Single fenced PowerShell code block.
- Fully corrected implementation.
- Enterprise-grade logging.
- Professional console output.
- Robust error handling.
- Advanced functions where applicable.

### Section 4: Detailed Change Log

For each significant change:

- Original implementation.
- Refactored implementation.
- Reason for change.
- Expected benefit.

### Section 5: Best Practices Review

#### 1. PowerShell Code and Cmdlet Best Practices

Provide an enumerated list.

Each item must contain:

- Best practice statement.
- Brief explanation.

#### 2. PowerShell Module Best Practices

Provide an enumerated list.

Each item must contain:

- Best practice statement.
- Brief explanation.

### Section 6: Testing Recommendations

Provide:

- Suggested Pester tests.
- Unit tests.
- Integration tests.
- Edge cases.
- Regression tests.
- Failure-path tests.

### Section 7: Future Improvements

Provide:

- Module conversion opportunities.
- Architectural improvements.
- Automation opportunities.
- CI/CD recommendations.
- Security enhancements.

## Constraints

- Do not change intended functionality unless the original implementation is defective or unsafe.
- Do not reduce safety for simplicity.
- Do not remove observability.
- Do not introduce contradictory recommendations.
- Do not rely on non-Microsoft guidance when Microsoft guidance exists.
- Do not suppress errors without justification.
- Do not use deprecated PowerShell patterns when modern Microsoft-recommended alternatives exist.
- Refactor as though the code will be reviewed by senior PowerShell developers, DevOps engineers, QA engineers, security auditors, and enterprise support teams before production deployment.

## Additional Instruction

Use enterprise-grade PowerShell patterns, advanced functions, structured logging, parameter validation, strict error handling, and production-ready code conventions. Prefer maintainability and supportability over brevity.
