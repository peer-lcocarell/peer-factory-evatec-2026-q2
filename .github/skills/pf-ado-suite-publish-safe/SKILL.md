---
name: pf-ado-suite-publish-safe
description: Publish numbered markdown test cases to Azure DevOps Test Plans with validation, dry-run support, and publish reporting.
argument-hint: "<folder> <PlanId> <SuiteId> [dryrun]"
user-invocable: true
---

# Goal

Safely publish valid test cases to Azure DevOps.

# Inputs

Required:
- Folder
- PlanId
- SuiteId

Optional:
- dryrun
- StopOnError | ContinueOnError (default)

# File Selection

Include:
- `0*.md`

Exclude:
- `req-*-audit.md`
- `*_audit.md`
- `notes.md`
- `README*.md`
- Requirement documents
- Temporary files
- Backup files

# Validation

Folder:
- Exists
- Accessible
- Contains markdown files

Test files must contain:
- Title
- Requirement mapping
- Preconditions
- Steps
- Expected outcome

Invalid files:
- Exclude from publish
- Report reason

# Publish

Dry Run:

```powershell
./scripts/ado/invoke-ado-suite-publish-from-folder.ps1 `
  -Path "<folder>" `
  -Filter "0*.md" `
  -PlanId <PlanId> `
  -Sui*eId <*uite*d> `
  -WhatIf
```

Live:

```powe*shell
./scripts/ado/invoke-ado-sui*e-publish-from-folder.ps1 `
  -Pat* "<folder>" `
  -Filter "0*.md" `
* -PlanId <PlanId> `
  -SuiteId <Su*teId>
```

# Rules

- Validate bef*re publish.
- Publish numbered tes* case files only.
- Never publish *udits, notes, reports, temporary f*les, or backups.
- Do not automati*ally retry failures.
- Verify ever* eligible file receives a result.
* Verify successful publishes retur* a TestCaseId.

# Output

## Valid*tion

- Eligible
- Excluded
- Inva*id

## Publish

- File
- Created | Updated | Skipped | Failed
- TestCaseId

## Failures

- File
- Reason

## Final

- PlanId
- SuiteId
- Created
- Updated
- Skipped
- Failed

Status:
- Success
- Partial Success
- Failed
