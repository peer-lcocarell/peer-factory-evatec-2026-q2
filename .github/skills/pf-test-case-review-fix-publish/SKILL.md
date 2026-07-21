---
name: pf-test-case-review-fix-publish
description: "End-to-end QA workflow: review PF markdown test cases against a requirement using PG BOT rules, fix ambiguous wording and structural issues in place, add ADO YAML frontmatter, dry-run then live-publish to an Azure DevOps test suite, and compare the suite to identify orphan or superseded test cases for [REMOVE] marking. Use for: review and publish, fix and publish, qa cycle, test case update and sync, ado suite cleanup, mark for removal."
argument-hint: "<requirement-folder> <PlanId> <SuiteId>"
user-invocable: true
---

# PF Test Case Review, Fix, and Publish

## When to Use

- Reviewing and cleaning up a requirement folder of markdown test cases
- Fixing PG BOT rule violations before publishing to ADO
- Publishing updated test cases to an Azure DevOps test suite
- Comparing the live ADO suite against local files to identify orphans or superseded duplicates

## Inputs

- `<requirement-folder>` — absolute or relative path to the requirement folder (e.g., `docs/.../requirement-290757`)
- `<PlanId>` — Azure DevOps Test Plan ID
- `<SuiteId>` — Azure DevOps Test Suite ID

## Phase 1 — Review

Apply the PG BOT QA Test Case Writing Style Guide to every `0*.md` file in the folder.

Flag and fix:
- Ambiguous wording: `valid`, `basic`, `correct`, `appropriate`, `successfully`, `expected`, `normal`
- Actions that contain observations or assertions instead of tester actions
- Expected Results that contain inferred states instead of observable outcomes
- Conditional steps (`if... if...`) — resolve to a single deterministic branch
- Multiple independent actions in one step — split or consolidate with clear intent
- Passive save confirmation: "Save completes without errors" → "The [page/form] is displayed"
- Read-only assertions that say "cannot be edited" → observable click-test assertion
- Redundant steps that repeat the conclusion of the previous step — remove them
- Steps that verify the same thing twice in consecutive rows — consolidate

PG BOT Rules:
- No semicolons
- No arrows
- Actions contain tester actions only
- Expected Results contain observable outcomes only
- Use "tester" not "operator"

## Phase 2 — Fix Local Files

Apply all review findings directly to the markdown files.

- Prefer modifying existing steps over adding new ones
- Remove redundant steps
- Update the `## Expected Outcome` section to match the revised steps
- Do not change titles unless genuinely required for clarity
- Do not add new test cases unless explicitly requested

## Phase 3 — Prepare for Publish

### 3a — Look Up ADO IDs

Check `_ado_publish/<cr-folder>/` for a live publish results JSON matching the requirement folder.

Extract for each `0*.md` file:
- `TestCaseId`
- `PlanId`
- `SuiteId`

If no prior publish results exist, note that new IDs will be assigned on first publish and skip frontmatter until after the first run.

### 3b — Add YAML Frontmatter

Prepend to each `0*.md` file that does not already have it:

```markdown
---
TestCaseId: <id>
PlanId: <PlanId>
SuiteId: <SuiteId>
---
```

### 3c — Add ## Test Steps Header

Each file must have a `## Test Steps` heading immediately before the step table.
The publisher's `Get-Section` function requires this heading to locate the steps block.

Pattern — insert before the table:
```markdown
## Test Steps

| Step | Action | Expected Result |
```

Do not merge `## Test Steps` onto the same line as the table header. Verify visually after inserting.

## Phase 4 — Dry Run

```powershell
.\scripts\ado\invoke-ado-suite-publish-from-folder.ps1 `
    -Path "<requirement-folder>" `
    -PlanId <PlanId> `
    -SuiteId <SuiteId> `
    -Filter "0*.md" `
    -WhatIf
```

Check dry-run output:
- All `0*.md` files are listed as `[WhatIf]`
- No files fail with parse errors
- `req-*-audit.md` files are excluded by the `0*.md` filter

Do not proceed to live publish if any file fails the dry run.

## Phase 5 — Live Publish

```powershell
.\scripts\ado\invoke-ado-suite-publish-from-folder.ps1 `
    -Path "<requirement-folder>" `
    -PlanId <PlanId> `
    -SuiteId <SuiteId> `
    -Filter "0*.md"
```

Confirm:
- All files show `[Updated]` or `[Created]`
- Exit code is 0
- No `[FAILED]` entries

## Phase 6 — ADO Suite Comparison (Optional)

Fetch all test cases currently in the suite:

```powershell
$org = "https://ops1.peergroup.com/DefaultCollection"
$proj = "PFEvatec"
$result = Invoke-RestMethod "$org/$proj/_apis/testplan/Plans/<PlanId>/Suites/<SuiteId>/TestCase?api-version=7.1" -UseDefaultCredentials
$result.value | ForEach-Object { Write-Host "$($_.workItem.id) | $($_.workItem.name)" }
```

Classify each ADO test case:

| Classification | Criteria |
|---|---|
| **Keep** | Matches a local `0*.md` file by TestCaseId or is the authoritative version |
| **[REMOVE]** | Fully covered by a local test case — no unique coverage would be lost |
| **Candidate for Deletion** | Identical duplicate or completely superseded with no history value |
| **Candidate for Merge** | Significant overlap but contains unique coverage to preserve |

To mark a test case for removal, PATCH its title:

```powershell
$id = <TestCaseId>
$currentTitle = (Invoke-RestMethod "$org/$proj/_apis/wit/workItems/${id}?api-version=7.1" -UseDefaultCredentials).fields.'System.Title'
$newTitle = "[REMOVE] $currentTitle"
$escaped = $newTitle -replace '"', '\"'
$body = "[{`"op`":`"add`",`"path`":`"/fields/System.Title`",`"value`":`"$escaped`"}]"
Invoke-RestMethod "$org/$proj/_apis/wit/workitems/${id}?api-version=7.1" -Method Patch -UseDefaultCredentials -ContentType "application/json-patch+json" -Body $body | Out-Null
```

Verify by re-fetching the title after the PATCH.

## Common Failures

| Symptom | Cause | Fix |
|---|---|---|
| `No '| Step | Action | Expected Result |' table found` | `## Test Steps` merged onto same line as table header | Fix: replace `## Test Steps \| Action...` with `## Test Steps\n\n\| Step \| Action...` |
| `[REMOVE] [REMOVE]` double prefix | PATCH ran twice | Re-PATCH with the correct single-prefix title |
| `req-*-audit.md` fails | Missing step table in audit file | Use `-Filter "0*.md"` to exclude it |
| Silent PATCH failure | Body not serialized as JSON array | Use explicit JSON string: `"[{...}]"` not `ConvertTo-Json` of single-item list |
