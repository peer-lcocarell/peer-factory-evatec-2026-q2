# Invoke-QaDocsReorg.ps1
# One-shot reorganization of docs/qa-documents/pf-evatec-phase-2.
# Uses `git mv` when source is git-tracked (preserves history); otherwise Move-Item.
# Emits a Move-Log object stream so the caller can build the report.

[CmdletBinding()]
param(
    [string]$RepoRoot = 'c:\repos\pf-evatec\peer-factory-evatec-2026-q2'
)

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $RepoRoot

$Base = 'docs/qa-documents/pf-evatec-phase-2'
$script:MoveLog     = New-Object System.Collections.Generic.List[object]
$script:MkdirLog    = New-Object System.Collections.Generic.List[string]
$script:RemoveLog   = New-Object System.Collections.Generic.List[string]

function Test-IsGitTracked {
    param([string]$Path)
    $rel = (Resolve-Path -LiteralPath $Path).Path.Substring((Resolve-Path -LiteralPath $RepoRoot).Path.Length + 1) -replace '\\','/'
    $result = & git ls-files --error-unmatch -- "$rel" 2>$null
    return ($LASTEXITCODE -eq 0)
}

function New-Dir {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
        $script:MkdirLog.Add($Path) | Out-Null
    }
}

function Move-Entry {
    param(
        [Parameter(Mandatory)][string]$Source,
        [Parameter(Mandatory)][string]$Destination,
        [string]$Category = 'move'
    )
    if (-not (Test-Path -LiteralPath $Source)) {
        Write-Warning "Missing source: $Source"
        return
    }
    if (Test-Path -LiteralPath $Destination) {
        Write-Warning "Destination exists, skipping: $Destination"
        return
    }
    $destDir = Split-Path -Path $Destination -Parent
    New-Dir -Path $destDir

    $tracked = $false
    try { $tracked = Test-IsGitTracked -Path $Source } catch { $tracked = $false }

    if ($tracked) {
        $srcRel  = ($Source     -replace '\\','/')
        $destRel = ($Destination -replace '\\','/')
        & git mv -- "$srcRel" "$destRel"
        if ($LASTEXITCODE -ne 0) { throw "git mv failed: $Source -> $Destination" }
    } else {
        Move-Item -LiteralPath $Source -Destination $Destination -Force
    }
    $script:MoveLog.Add([pscustomobject]@{
        Category    = $Category
        Source      = $Source
        Destination = $Destination
        UsedGit     = $tracked
    }) | Out-Null
}

function Remove-EmptyDirTree {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) { return }
    Get-ChildItem -LiteralPath $Path -Recurse -Force -Directory |
        Sort-Object -Property FullName -Descending |
        ForEach-Object {
            if (-not (Get-ChildItem -LiteralPath $_.FullName -Force)) {
                Remove-Item -LiteralPath $_.FullName -Force
                $script:RemoveLog.Add($_.FullName) | Out-Null
            }
        }
    if ((Test-Path -LiteralPath $Path) -and -not (Get-ChildItem -LiteralPath $Path -Force)) {
        Remove-Item -LiteralPath $Path -Force
        $script:RemoveLog.Add($Path) | Out-Null
    }
}

# -------- 1. Create target skeleton --------
$skeleton = @(
    "$Base/00-project-overview",
    "$Base/01-requirements",
    "$Base/02-planning",
    "$Base/03-testing/estimates",
    "$Base/03-testing/test-plans",
    "$Base/03-testing/test-cases",
    "$Base/03-testing/test-assets",
    "$Base/04-environment",
    "$Base/05-operations",
    "$Base/06-automation/converters",
    "$Base/06-automation/scripts",
    "$Base/06-automation/tools",
    "$Base/07-references/source-files",
    "$Base/08-releases/r10/r10.2/change-requests",
    "$Base/08-releases/r10/r10.2/release-documentation",
    "$Base/08-releases/r10/r10.2/test-logs",
    "$Base/09-templates",
    "$Base/archive/review-required"
)
$skeleton | ForEach-Object { New-Dir -Path $_ }

# -------- 2. Top-level file moves --------
Move-Entry -Source "$Base/overview.md"                                        -Destination "$Base/00-project-overview/project-overview.md"           -Category 'overview'
Move-Entry -Source "$Base/domain-reference.md"                                -Destination "$Base/00-project-overview/domain-reference.md"          -Category 'overview'
Move-Entry -Source "$Base/magnet-systems-kickoff-summary.md"                  -Destination "$Base/00-project-overview/project-kickoff-summary.md"   -Category 'overview'

Move-Entry -Source "$Base/additional-requirements-scope-changes-identified.md" -Destination "$Base/01-requirements/additional-scope-changes.md"      -Category 'requirements'

Move-Entry -Source "$Base/CR PLAN SO FAR.md"                                  -Destination "$Base/02-planning/change-request-plan.md"               -Category 'planning'
Move-Entry -Source "$Base/mini-stip-outline.md"                               -Destination "$Base/02-planning/mini-stip-outline.md"                 -Category 'planning'

Move-Entry -Source "$Base/planning/qa-test-estimates.csv"                     -Destination "$Base/03-testing/estimates/qa-test-estimates.csv"       -Category 'testing/estimates'

# Mini software test plans
$stpDir = "$Base/resources/mini-software-test-plans"
if (Test-Path -LiteralPath $stpDir) {
    Get-ChildItem -LiteralPath $stpDir -File | ForEach-Object {
        Move-Entry -Source $_.FullName -Destination "$Base/03-testing/test-plans/$($_.Name)" -Category 'testing/test-plans'
    }
}

Move-Entry -Source "$Base/infrastructure-and-links.md"                        -Destination "$Base/04-environment/infrastructure-and-links.md"       -Category 'environment'
Move-Entry -Source "$Base/qa-environment-setup.md"                            -Destination "$Base/04-environment/qa-environment-setup.md"           -Category 'environment'
Move-Entry -Source "$Base/playwright-setup.md"                                -Destination "$Base/04-environment/playwright-setup.md"               -Category 'environment'

Move-Entry -Source "$Base/pto-operations.md"                                  -Destination "$Base/05-operations/pto-operations.md"                  -Category 'operations'
Move-Entry -Source "$Base/release-deployment.md"                              -Destination "$Base/05-operations/release-deployment.md"              -Category 'operations'

Move-Entry -Source "$Base/test-plan-converter.md"                             -Destination "$Base/06-automation/converters/test-plan-converter.md"  -Category 'automation'

Move-Entry -Source "$Base/planning/PF-Evatec-R10.02-ADO-Publishing-Guide.md"  -Destination "$Base/07-references/ado-publishing-guide-r10.02.md"     -Category 'references'

# -------- 3. Release moves (r10/r10-2 -> 08-releases/r10/r10.2) --------
$oldRel  = "$Base/r10/r10-2"
$newRel  = "$Base/08-releases/r10/r10.2"

# log/
Move-Entry -Source "$oldRel/log/current-project-status.md"                    -Destination "$newRel/test-logs/current-project-status.md"            -Category 'release/test-logs'

# documentation/
Move-Entry -Source "$oldRel/documentation/magnet-system-notes.md"             -Destination "$newRel/release-documentation/magnet-system-notes.md"   -Category 'release/documentation'
Move-Entry -Source "$oldRel/documentation/r102-crs.md"                        -Destination "$newRel/release-documentation/r10.2-change-requests.md" -Category 'release/documentation'
Move-Entry -Source "$oldRel/documentation/r102-requirements.md"               -Destination "$newRel/release-documentation/r10.2-requirements.md"    -Category 'release/documentation'

# Duplicate: r10-2/documentation/magnet-systems-kickoff-summary.md -> archive
Move-Entry -Source "$oldRel/documentation/magnet-systems-kickoff-summary.md" `
           -Destination "$Base/archive/review-required/magnet-systems-kickoff-summary--from-r10.2-documentation.md" `
           -Category 'archive/duplicate'

# CR folders
$crMap = @{
    '284111' = @{ CrFile = 'cr-28411.md';   NewCrFile = 'cr-284111.md'; TestCasesDir = '28411-test-cases'  }
    '285729' = @{ CrFile = 'cr-285729.md';  NewCrFile = 'cr-285729.md'; TestCasesDir = '285729-test-cases' }
    '286067' = @{ CrFile = 'cr-286067.md';  NewCrFile = 'cr-286067.md'; TestCasesDir = '286067-test-cases' }
    '286836' = @{ CrFile = 'cr-286836.md';  NewCrFile = 'cr-286836.md'; TestCasesDir = '286836-test-cases' }
    '290161' = @{ CrFile = 'cr-290161.md';  NewCrFile = 'cr-290161.md'; TestCasesDir = $null              }
}

foreach ($crId in $crMap.Keys | Sort-Object) {
    $info = $crMap[$crId]
    $srcCrRoot  = "$oldRel/crs/$crId"
    $destCrRoot = "$newRel/change-requests/$crId"
    New-Dir -Path $destCrRoot

    # CR file
    $srcCr  = "$srcCrRoot/$($info.CrFile)"
    $destCr = "$destCrRoot/$($info.NewCrFile)"
    Move-Entry -Source $srcCr -Destination $destCr -Category 'release/change-requests'

    if ($info.TestCasesDir) {
        $srcTc  = "$srcCrRoot/$($info.TestCasesDir)"
        $destTc = "$destCrRoot/test-cases"

        # Archive the placeholder requirement folder ONLY for 286067
        if ($crId -eq '286067') {
            $placeholder = "$srcTc/requirement-Requirement ID"
            if (Test-Path -LiteralPath $placeholder) {
                Move-Entry -Source $placeholder `
                           -Destination "$Base/archive/review-required/286067--requirement-Requirement-ID--placeholder" `
                           -Category 'archive/placeholder'
            }
        }

        # Move each requirement-* folder
        if (Test-Path -LiteralPath $srcTc) {
            New-Dir -Path $destTc
            Get-ChildItem -LiteralPath $srcTc -Directory | ForEach-Object {
                Move-Entry -Source $_.FullName -Destination "$destTc/$($_.Name)" -Category 'release/test-cases'
            }
        }
    }
}

# -------- 4. Cleanup empty folders --------
Remove-EmptyDirTree -Path "$Base/r10"
Remove-EmptyDirTree -Path "$Base/overview"
Remove-EmptyDirTree -Path "$Base/planning"
Remove-EmptyDirTree -Path "$Base/resources"

# -------- 5. Emit logs (as JSON on final line for parsing) --------
$summary = [pscustomobject]@{
    Moves    = $script:MoveLog
    Created  = $script:MkdirLog
    Removed  = $script:RemoveLog
}

$outFile = Join-Path $RepoRoot 'scripts/_reorg/last-run.json'
$summary | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $outFile -Encoding UTF8

Write-Host ""
Write-Host "== Reorg complete =="
Write-Host ("Moves:   {0}" -f $script:MoveLog.Count)
Write-Host ("Created: {0}" -f $script:MkdirLog.Count)
Write-Host ("Removed: {0}" -f $script:RemoveLog.Count)
Write-Host ("Log:     {0}" -f $outFile)
