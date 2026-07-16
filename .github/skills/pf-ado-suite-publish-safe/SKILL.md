---
name: pf-ado-suite-publish-safe
description: "Safely publish markdown test cases from a requirement folder to Azure DevOps Test Plans and Suites using deterministic file selection, validation, dry-run support, and publish reporting."
argument-hint: "Requirement folder path plus PlanId and SuiteId"
user-invocable: true
disable-model-invocation: false
---

# Skill - PF ADO Suite Publish Safe

## Objective

Publish requirement-scoped markdown test cases to Azure DevOps with:

- Deterministic file targeting
- Minimum risk
- Audit file exclusion
- Dry-run validation support
- Clear created/updated reporting
- Safe republish behavior

---

# Core Principles

## Safety First

Always validate before publishing.

Never publish:

- Audit files
- Coverage reports
- Notes files
- Requirement markdown
- Temporary files
- Backup files

Only publish approved test case files.

---

# Recommended File Selection

Default filter:

```powershell
0*.md
```

Additional exclusions:

```text
req-*-audit.md
*_audit.md
notes.md
READM*.md
```

Validation Rule:

- File *ust start with a numeric identifie*.
- File must contain a valid test*case title.
- File must contain re*uirement mapping.
- File must cont*in test steps.

Files failing vali*ation must be reported and exclude*.

---

# Inputs

Required:

- Req*irement folder path
- PlanId
- Sui*eId

Optional:

- Publish Mode
  -*DryRun
  - Live

- Error Mode
 *- StopOn*rror
  - ContinueOnError

Default:*
```text
Publish Mode: Live
Error *ode: ContinueOnError
```

---

# P*e-Publish Validation

Before publi*hing:

## Folder Validation

Verif*:

- Folder exists
- Folder is acc*ssible
- Folder contains markdown *iles

If validation fails:

- Stop*immediately
- Report root cause

-*-

## Test File Validation

Identify:

### Eligible Files

Files matching:

```text
0*.md
```

### Excluded Files

Files matching:

```text
req-*-audit.md
*_audit.md
README.md
not*s.md
```

Report:

```text
Eligibl* Files: X
Excluded Files:*Y
```

---

## Content Validation
*Verify each eligible file contains*

- Title
- Requirement ID
- Preco*ditions
- Steps
- Expected Outcome*
Flag any invalid file.

Do not pu*lish invalid files.

---

# Publis* Procedure

## Dry Run

If DryRun *equested:

Run:

```powershell
.\s*ripts\ado\invoke-ado-suite-publish-from-folder.ps1 `
  -Path "<requirement-folder>" `
  -Filter "0*.md" `
  -PlanId <plan-id> `
  -SuiteId <suite-id> `
  -WhatIf
```

Capture:

- Files that would publish
- Files excluded
- Validation failures

Do not modify ADO.

---

## Live Publish

Run:

```powershell
.\scripts\ado\invoke-ado-suite-publish-from-folder.ps1 `
  -Path "<requirement-folder>" `
  -Filter "0*.md" `
  -PlanId <plan-id> `
  -SuiteId <suite-id>
```

Capture for each file:

- Source File
- Status
  - Created
  - Updated
  - Skipped
  - Failed
- Test Case ID
- Plan ID
- Suite ID

---

# Failure Handling

## StopOnError

- Stop at first failure.
- Report failure details.

## ContinueOnError (Default)

- Continue publishing remaining files.
- Record failures.
- Provide final summary.

Do not automatically retry failed publishes.

---

# Post-Publish Verification

Verify:

- Every eligible file received a result.
- Every successful publish returned a TestCaseId.
- Published items target the requested PlanId.
- Published items target the requested SuiteId.

Flag anomalies.

---

# Required Output

## Publish Summary

| File | Result | Test Case ID |
| --- | --- | --- |

---

## Validation Summary

```text
Folder:
Plan:
Suite:

Eligible Files:
Excluded Files:
Invalid Files:
Successful:
Failed:
```

---

## Failed Files

List only failures.

Include:

- File
- Failure reason
- Recommended action

---

## Final Status

### Success

Use when:

- No failures occurred.

### Partial Success

Use when:

- One or more files failed.
- At least one file published successfully.

### Failed

Use when:

- No files published successfully.

---

## Final Statement

Provide:

```text
Published to Plan: <PlanId>
Published to Suite: <SuiteId>

Created: X
Updated: X
Skipped: X
Failed: X
```

If created or updated:

```text
ADO publish completed successfully.
```

If failures exist:

```text
ADO publish completed with issues.
Review failed files before republishing.
```

---

# Quality Checklist

Verify:

- [ ] Folder exists.
- [ ] Only numbered test files were selected.
- [ ] Audit files were excluded.
- [ ] Every published file returned a result.
- [ ] Every successful publish returned a TestCaseId.
- [ ] PlanId and SuiteId were validated.
- [ ] Publish summary was generated.
- [ ] Failure report was generated when required.

---

# Example Prompts

```text
/pf-ado-suite-publish-safe docs/.../requirement-290761 291616 292268

Publish this requirement folder to Plan 291616 Suite 292268.

Dry-run publish this requirement folder.

Republish numbered test cases only and show Created/Updated IDs.

Publish requirement-290770 and return publish results.
```
