# Skill: ADO Markdown Generation

## Description

Convert test case content into Azure DevOps-compatible Markdown files. Writes one file per test case into the correct CR directory. Provides ready-to-run PowerShell publish commands.

## Triggers

Use this skill when the user asks to:

- Create ADO markdown files
- Generate publishable test cases
- Write test cases to the CR folder
- Publish test cases to Azure DevOps

---

## Inputs

- Test case content (from PF Test Case Generation skill or inline descriptions)
- CR number
- Target ADO Test Plan ID (default: 291616)
- Target ADO Suite ID (from `scripts/ado/suite-map.json` or provided directly)

---

## Steps

### 1. Identify Target CR and Suite

- Detect CR from the request or current file context.
- Look up suite ID in `scripts/ado/suite-map.json`.
- Confirm with the user if the suite ID cannot be resolved.

Default suite mappings for R10.2:

| CR | Suite ID |
|----|----------|
| 286067 | 291617 |
| 285729 | 291617 |
| 286836 | 291617 |
| 284111 | 291617 |

### 2. Resolve Output Directory

Use the pattern:

```
docs/pf-evatec-phase-2/r10/r10-2/crs/<CR>/<CR>-test-cases/
```

- Use an existing test case folder if present.
- Create it if missing.
- Do not place files outside the CR path.

### 3. Generate ADO-Compatible Markdown Files

Each file must use this exact structure:

```markdown
# Test Case Title

## Requirement

CR: <CR Number>
Ticket: <Ticket Number>

## Preconditions

- Precondition 1
- Precondition 2

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Action description | Expected result description |

## Expected Outcome

Single statement describing successful scenario completion.
```

Rules:

- Do not use HTML tables.
- Do not omit any section headings.
- Do not use alternate table layouts.

### 4. Apply File Naming Convention

- Use sortable numeric prefixes: `001-scenario-name.md`
- Lowercase filenames only.
- Hyphenated words only.
- One file per test case.
- Do not overwrite existing files without user confirmation.

### 5. Provide Publish Commands

After files are created, provide the appropriate publish command.

**Publish entire folder:**

```powershell
.\scripts\ado\invoke-ado-suite-publish-from-folder.ps1 `
  -FolderPath "docs/pf-evatec-phase-2/r10/r10-2/crs/<CR>/<CR>-test-cases" `
  -TestPlanId 291616 `
  -SuiteId <SuiteId> `
  -OrgUrl "https://ops1.peergroup.com/DefaultCollection" `
  -Project "PFEvatec"
```

**Publish single file:**

```powershell
.\scripts\ado\invoke-ado-test-case-publish-from-markdown.ps1 `
  -FilePath "docs/pf-evatec-phase-2/r10/r10-2/crs/<CR>/<CR>-test-cases/001-scenario-name.md" `
  -TestPlanId 291616 `
  -SuiteId <SuiteId> `
  -OrgUrl "https://ops1.peergroup.com/DefaultCollection" `
  -Project "PFEvatec"
```

Do not run publish scripts automatically. Provide commands for the user to review and execute.

---

## Outputs

- ADO-compatible Markdown files written to the CR test case directory
- File list with relative paths
- Scenarios covered summary
- Ready-to-run PowerShell publish command

---

## Error Handling

- If the CR directory does not exist, create it before writing files.
- If suite ID is not in `suite-map.json`, stop and ask the user to provide it.
- If the publish script returns an error, report the error message and the affected file path.
- Never overwrite existing test cases without user confirmation.

---

## ADO Metadata Defaults

| Setting | Value |
|---------|-------|
| Org URL | https://ops1.peergroup.com/DefaultCollection |
| Project | PFEvatec |
| Test Plan ID | 291616 |
| API Version | 7.1 |
