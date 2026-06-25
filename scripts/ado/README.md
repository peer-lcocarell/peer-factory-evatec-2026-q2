# ADO Test Case Publishing Utility

Publishes Markdown-authored test cases into Azure DevOps Test Plans, per the
format and metadata defined in [`../../.github/copilot-instructions.md`](../../.github/copilot-instructions.md).

## Contents

| File | Purpose |
|------|---------|
| [`pf-evatec-ado-publisher.psm1`](pf-evatec-ado-publisher.psm1) | Shared module: Markdown parser, ADO REST helpers, publish logic. |
| [`invoke-ado-test-case-publish-from-markdown.ps1`](invoke-ado-test-case-publish-from-markdown.ps1) | Publish a single `.md` file. |
| [`invoke-ado-suite-publish-from-folder.ps1`](invoke-ado-suite-publish-from-folder.ps1) | Bulk-publish all `.md` files under a folder. |
| [`suite-map.json`](suite-map.json) | Maps CR ID → Test Suite ID under the configured plan. |

## Defaults

Read from `.github/copilot-instructions.md`:

- Org URL: `https://ops1.peergroup.com/DefaultCollection`
- Project: `PFEvatec`
- API version: `7.1`
- Test Plan: `291616`
- Default Suite: `291617` (Requirements)

All defaults are overridable via parameters.

## Prerequisites

1. PowerShell 5.1+ (Windows PowerShell is supported).
2. A Personal Access Token (PAT) with:
   - **Work Items** — Read, write & manage
   - **Test Management** — Read & write
3. Set the PAT before running:

   ```powershell
   $env:AZURE_DEVOPS_PAT = '<your-pat>'
   ```

## Markdown contract

Files must follow the structure required by the Copilot instructions:

```markdown
# [CR-ID] Feature - Scenario

## Requirement

CR: 286067  Ticket: 35008

## Preconditions

- Logged in as Tech User
- Magnet System Type "Standard" exists

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1    | Open Magnet Systems page | List loads |
| 2    | Click "New Magnet"       | Create dialog opens |

## Expected Outcome

A new Magnet record is created and visible in the list.
```

The parser extracts:

- **Title** — first `# ` heading.
- **CR ID** — first 6-digit number in the title or `## Requirement` section.
- **Requirement / Preconditions / Expected Outcome** — composed into the work
  item `System.Description`.
- **Steps** — converted into the `Microsoft.VSTS.TCM.Steps` XML field.

## Behavior

- Matching is by exact `System.Title`. If a Test Case with that title exists
  in the project, it is **updated**; otherwise a new one is **created**.
- After create/update, the Test Case is added to the resolved suite under the
  configured plan.
- Suite resolution: `-SuiteId` → `suite-map.json` lookup by CR ID → `defaultSuiteId`.

## Usage

### Single file

```powershell
$env:AZURE_DEVOPS_PAT = '<pat>'

./scripts/ado/invoke-ado-test-case-publish-from-markdown.ps1 `
    -Path ./docs/pf-evatec-phase-2/r10/r10-2/test-cases/286067/001-create-magnet.md
```

Dry-run (no API writes):

```powershell
./scripts/ado/invoke-ado-test-case-publish-from-markdown.ps1 -Path .\foo.md -WhatIf
```

### Folder (bulk)

```powershell
./scripts/ado/invoke-ado-suite-publish-from-folder.ps1 `
    -Path ./docs/pf-evatec-phase-2/r10/r10-2/test-cases/286067 `
    -ContinueOnError
```

Override target suite (force every file into one suite):

```powershell
./scripts/ado/invoke-ado-suite-publish-from-folder.ps1 -Path .\cases -SuiteId 291700
```

### Configuring CR → Suite mapping

Edit [`suite-map.json`](suite-map.json) and fill in the child requirement
suite IDs once you create them in ADO:

```json
{
  "planId": 291616,
  "defaultSuiteId": 291617,
  "crSuiteIds": {
    "286067": 291700,
    "285729": 291701,
    "286836": 291702,
    "284111": 291703
  }
}
```

Until a CR is mapped, its test cases land in `defaultSuiteId` (Requirements).

## Output

Each publish call returns a result object:

| Field | Notes |
|-------|-------|
| `SourcePath` | Absolute path to the Markdown file. |
| `Title`      | `System.Title` used. |
| `CrId`       | Parsed CR ID, or `null`. |
| `Status`     | `Created`, `Updated`, `WhatIf`, or `Failed`. |
| `TestCaseId` | Work item ID after publish. |
| `PlanId` / `SuiteId` | Plan and suite the test was added to. |
| `Error`      | Failure message (when `Status = Failed`). |
