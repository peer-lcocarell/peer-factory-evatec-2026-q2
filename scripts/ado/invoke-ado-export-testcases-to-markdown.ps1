<#
.SYNOPSIS
    Export ADO test cases to Markdown files.
.PARAMETER TestCaseIds
    Array of test case work item IDs.
.PARAMETER OutputPath
    Folder to write Markdown files into.
#>
param(
    [int[]]$TestCaseIds = @(293145, 293146, 293147, 293150, 293151, 293824, 293825, 293826, 293827, 293828, 293829, 293830, 293831, 293832, 293833),
    [string]$OutputPath = "docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\regression\manual-regression\pf-smoke-test\TestCases"
)

$org = "https://ops1.peergroup.com/DefaultCollection"
$proj = "PFEvatec"
$api = "7.1"

New-Item -ItemType Directory -Force -Path $OutputPath | Out-Null

function Get-StepsMarkdown($stepsXml) {
    if ([string]::IsNullOrWhiteSpace($stepsXml)) { return @() }
    try {
        $xml = [xml]$stepsXml
        $rows = @()
        $num = 1
        foreach ($step in $xml.steps.step) {
            $action = ($step.parameterizedString | Where-Object { $_.isformatted -eq "true" })[0].'#text'
            $expected = ($step.parameterizedString | Where-Object { $_.isformatted -eq "true" })[1].'#text'
            $action = if ($action) { $action.Trim() } else { "" }
            $expected = if ($expected) { $expected.Trim() } else { "" }
            $rows += "| $num | $action | $expected |"
            $num++
        }
        return $rows
    }
    catch { return @() }
}

function Get-LinkedItems($relations) {
    if (-not $relations) { return @() }
    $links = @()
    foreach ($rel in $relations) {
        if ($rel.rel -match "TestedBy|Tests|Hyperlink" ) { continue }
        $id = $rel.url -replace '.*/(\d+)$', '$1'
        $links += "- [$($rel.rel)] Work Item $id"
    }
    return $links
}

$index = @()
$failed = @()

foreach ($id in $TestCaseIds) {
    Write-Host "Fetching $id..." -ForegroundColor Cyan
    try {
        $wi = Invoke-RestMethod "$org/$proj/_apis/wit/workItems/$($id)?`$expand=all&api-version=$api" -UseDefaultCredentials
        $f = $wi.fields
        # ...existing code...
        $title = if ($f.'System.Title') { $f.'System.Title' }                        else { "Untitled" }
        $state = if ($f.'System.State') { $f.'System.State' }                        else { "" }
        $areaPath = if ($f.'System.AreaPath') { $f.'System.AreaPath' }                     else { "" }
        $iterPath = if ($f.'System.IterationPath') { $f.'System.IterationPath' }                else { "" }
        $assignedTo = if ($f.'System.AssignedTo') { $f.'System.AssignedTo'.displayName }       else { "" }
        $priority = if ($f.'Microsoft.VSTS.Common.Priority') { $f.'Microsoft.VSTS.Common.Priority' }      else { "" }
        $autoStatus = if ($f.'Microsoft.VSTS.TCM.AutomationStatus') { $f.'Microsoft.VSTS.TCM.AutomationStatus' } else { "" }
        $tags = if ($f.'System.Tags') { $f.'System.Tags' }                         else { "" }
        $precondRaw = if ($f.'Microsoft.VSTS.Common.Description') { $f.'Microsoft.VSTS.Common.Description' }   else { "" }
        $stepsXml = if ($f.'Microsoft.VSTS.TCM.Steps') { $f.'Microsoft.VSTS.TCM.Steps' }            else { "" }
        # ...existing code...

        # Strip HTML from preconditions
        $precond = $precondRaw -replace '<[^>]+>', '' -replace '&nbsp;', ' ' -replace '&amp;', '&'

        $stepRows = Get-StepsMarkdown $stepsXml
        $linkRows = Get-LinkedItems $wi.relations

        $lines = @(
            "# $title",
            "",
            "## Metadata",
            "",
            "- **Test Case ID:** $id",
            "- **Area Path:** $areaPath",
            "- **Iteration Path:** $iterPath",
            "- **State:** $state",
            "- **Assigned To:** $assignedTo",
            "- **Priority:** $priority",
            "- **Automation Status:** $autoStatus",
            "- **Tags:** $tags",
            "",
            "## Preconditions",
            ""
        )

        if ($precond.Trim()) {
            foreach ($line in ($precond.Trim() -split "`n")) {
                $lines += "- $($line.Trim())"
            }
        }
        else {
            $lines += "- None"
        }

        $lines += ""
        $lines += "## Steps"
        $lines += ""
        $lines += "| Step | Action | Expected Result |"
        $lines += "|------|--------|-----------------|"

        if ($stepRows.Count -gt 0) {
            $lines += $stepRows
        }
        else {
            $lines += "| 1 | No steps recorded | - |"
        }

        if ($linkRows.Count -gt 0) {
            $lines += ""
            $lines += "## Links"
            $lines += ""
            $lines += $linkRows
        }

        $lines += ""
        $lines += "## Expected Outcome"
        $lines += ""
        $lines += "See step-level expected results above."

        $outFile = Join-Path $OutputPath "$id.md"
        $lines | Set-Content -Path $outFile -Encoding UTF8
        Write-Host "  Written: $outFile" -ForegroundColor Green

        $index += [PSCustomObject]@{
            ID    = $id
            Title = $title
            State = $state
            File  = "$id.md"
        }
    }
    catch {
        Write-Host "  FAILED: $id - $_" -ForegroundColor Red
        $failed += $id
    }
}

# README index
$readmeLines = @(
    "# Test Cases Index",
    "",
    "| ID | Title | State | File |",
    "|----|-------|-------|------|"
)
foreach ($row in $index) {
    $readmeLines += "| $($row.ID) | $($row.Title) | $($row.State) | [$($row.File)]($($row.File)) |"
}

if ($failed.Count -gt 0) {
    $readmeLines += ""
    $readmeLines += "## Failed Retrievals"
    $readmeLines += ""
    foreach ($f in $failed) { $readmeLines += "- $f" }
}

$readmeLines | Set-Content -Path (Join-Path $OutputPath "README.md") -Encoding UTF8
Write-Host "`nREADME written." -ForegroundColor Cyan
Write-Host "Done. Exported: $($index.Count)  Failed: $($failed.Count)"
