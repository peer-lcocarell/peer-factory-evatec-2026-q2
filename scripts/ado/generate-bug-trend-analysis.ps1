$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$root = Split-Path -Parent $root

$inputPath = Join-Path $root 'docs/qa-documents/pf-evatec-phase-2/10-bug-audit/pf-evatec-r1-r10.2-all-real-bugs-not-reject-or-invalid.md'
$outputPath = Join-Path $root 'docs/qa-documents/pf-evatec-phase-2/10-bug-audit/r10.2-bug-trend-analysis.json'

$rows = Select-String -Path $inputPath -Pattern '^\|\s*\d+\s*\|\s*Bug\s*\|' | ForEach-Object { $_.Line }

$bugs = foreach ($line in $rows) {
    $cells = $line.Trim() -split '\|'
    $cells = $cells[1..($cells.Count - 2)] | ForEach-Object { $_.Trim() }
    if ($cells.Count -lt 7) { continue }

    [pscustomobject]@{
        ID          = $cells[0]
        Title       = $cells[2]
        Priority    = $cells[5]
        SeverityRaw = $cells[6]
    }
}

function Normalize-Severity {
    param([string]$Raw)

    if ([string]::IsNullOrWhiteSpace($Raw)) { return 'Low' }
    if ($Raw -match '^\s*1') { return 'Critical' }
    if ($Raw -match '^\s*2') { return 'High' }
    if ($Raw -match '^\s*3') { return 'Medium' }
    return 'Low'
}

function Normalize-Priority {
    param([string]$Raw)

    if ([string]::IsNullOrWhiteSpace($Raw)) { return 'P3' }
    if ($Raw -match '1') { return 'P1' }
    if ($Raw -match '2') { return 'P2' }
    if ($Raw -match '3') { return 'P3' }
    return 'P4'
}

function Get-Category {
    param([string]$Title)

    $t = ([string]$Title).ToLowerInvariant()

    if ($t -match 'security|unauthori|rights|credential|sso|sign in|sign out|role') { return 'Security' }
    if ($t -match 'installer|install|upgrade|bat|windows installer') { return 'Installer' }
    if ($t -match 'sql|database|pfdb|invalid column|ddl') { return 'Database' }
    if ($t -match 'api|grpc|service') { return 'API' }
    if ($t -match 'slow|performance|frozen|long time') { return 'Performance' }
    if ($t -match 'webassembly|iis|server') { return 'Infrastructure' }
    if ($t -match 'connect|connection|import|upload|sync|composer|pto') { return 'Integration' }
    if ($t -match 'required|duplicate|invalid|validation|max|missing') { return 'Validation' }
    if ($t -match 'not saved|not displayed|not updated|unknown|duplicate rows|state not') { return 'Data Integrity' }
    if ($t -match 'track in|track out|transfer|reorder|workflow|process') { return 'Workflow' }
    if ($t -match 'screen|dialog|modal|grid|layout|breadcrumb|button|tooltip|label|alignment|font|column|dropdown|filter|pagination|view') { return 'UI' }
    if ($t -match 'config|configuration|settings|predefined') { return 'Configuration' }

    return 'Other'
}

function Get-Module {
    param([string]$Title)

    if ([string]::IsNullOrWhiteSpace($Title)) { return 'Unknown' }

    if ($Title -match "'([^']+)'") {
        return $matches[1]
    }

    if ($Title -match '^(.*?):') {
        return $matches[1].Trim()
    }

    return (($Title -split '\s+' | Select-Object -First 4) -join ' ')
}

function Get-RootCause {
    param([string]$Title)

    $t = ([string]$Title).ToLowerInvariant()

    if ($t -match 'required|duplicate|invalid|validation|no error') { return 'Validation logic defect' }
    if ($t -match 'state|status|enabled|disabled|selected|undo|track in|track out') { return 'State management issue' }
    if ($t -match 'not saved|not displayed|not updated|missing|history|sync') { return 'Data synchronization issue' }
    if ($t -match 'connect|connection|communication|service|grpc|composer|pto') { return 'Possible communication failure' }
    if ($t -match 'config|configuration|installer|script|upgrade|sql|column') { return 'Possible configuration issue' }
    if ($t -match 'exception|error|crash|unresponsive') { return 'Dependency failure' }
    if ($t -match 'rights|security|unauthori|credential|sso') { return 'Execution workflow failure' }
    if ($t -match 'layout|ui|breadcrumb|label|font|alignment|tooltip') { return 'UI rendering defect' }

    return 'Product defect requiring investigation'
}

$normalized = $bugs | ForEach-Object {
    [pscustomobject]@{
        ID        = $_.ID
        Title     = $_.Title
        Severity  = Normalize-Severity -Raw $_.SeverityRaw
        Priority  = Normalize-Priority -Raw $_.Priority
        Category  = Get-Category -Title $_.Title
        Module    = Get-Module -Title $_.Title
        RootCause = Get-RootCause -Title $_.Title
    }
}

$total = $normalized.Count
$critical = ($normalized | Where-Object Severity -eq 'Critical').Count
$high = ($normalized | Where-Object Severity -eq 'High').Count
$medium = ($normalized | Where-Object Severity -eq 'Medium').Count
$low = ($normalized | Where-Object Severity -eq 'Low').Count

$p1 = ($normalized | Where-Object Priority -eq 'P1').Count
$p2 = ($normalized | Where-Object Priority -eq 'P2').Count
$p3 = ($normalized | Where-Object Priority -eq 'P3').Count
$p4 = ($normalized | Where-Object Priority -eq 'P4').Count

$categories = $normalized | Group-Object Category | Sort-Object Count -Descending | ForEach-Object {
    [pscustomobject]@{ name = $_.Name; count = $_.Count }
}

$modules = $normalized | Group-Object Module | Sort-Object Count -Descending | Select-Object -First 20 | ForEach-Object {
    [pscustomobject]@{ name = $_.Name; count = $_.Count }
}

$rootCauses = $normalized | Group-Object RootCause | Sort-Object Count -Descending | ForEach-Object {
    [pscustomobject]@{ cause = $_.Name; count = $_.Count }
}

$riskRows = foreach ($group in ($normalized | Group-Object Module)) {
    $score = 0
    foreach ($item in $group.Group) {
        switch ($item.Severity) {
            'Critical' { $score += 5 }
            'High' { $score += 3 }
            'Medium' { $score += 2 }
            default { $score += 1 }
        }
    }

    $riskLevel = if ($score -ge 60) { 'High' } elseif ($score -ge 25) { 'Medium' } else { 'Low' }

    [pscustomobject]@{
        area = $group.Name
        riskLevel = $riskLevel
        count = $group.Count
        score = $score
    }
}

$riskAreas = $riskRows |
    Sort-Object @{ Expression = 'score'; Descending = $true }, @{ Expression = 'count'; Descending = $true } |
    Select-Object -First 10 area, riskLevel, count

$topCategory = if ($categories.Count -gt 0) { $categories[0].name } else { '' }
$topModule = if ($modules.Count -gt 0) { $modules[0].name } else { '' }
$highestRiskArea = if ($riskAreas.Count -gt 0) { $riskAreas[0].area } else { '' }

$highRiskRatio = if ($total -gt 0) { ($critical + $high) / $total } else { 0 }
$releaseRisk = if ($critical -gt 0 -or $highRiskRatio -ge 0.35) { 'High' } elseif ($highRiskRatio -ge 0.20) { 'Medium' } else { 'Low' }

$result = [ordered]@{
    releaseInfo = [ordered]@{
        project = 'PEER Factory Evatec Phase 2 - R10.2'
        version = 'R10.2'
        date = '2026-07-06'
    }
    summary = [ordered]@{
        totalBugs = $total
        criticalBugs = $critical
        highBugs = $high
        topCategory = $topCategory
        topModule = $topModule
        highestRiskArea = $highestRiskArea
        releaseRisk = $releaseRisk
    }
    categories = @($categories)
    severity = [ordered]@{
        critical = $critical
        high = $high
        medium = $medium
        low = $low
    }
    priority = [ordered]@{
        p1 = $p1
        p2 = $p2
        p3 = $p3
        p4 = $p4
    }
    modules = @($modules)
    rootCauses = @($rootCauses)
    riskAreas = @($riskAreas)
    recommendations = [ordered]@{
        immediateActions = @(
            "Triage and retest all Critical and High defects in $highestRiskArea before release sign-off.",
            "Execute focused regression on top category '$topCategory' across affected modules.",
            'Add defect clustering review in daily triage for repeated failure signatures.'
        )
        nearTermImprovements = @(
            'Strengthen automated validation and negative-path tests for recurring rule and state defects.',
            'Add module-level trend gates in release readiness review for areas exceeding medium risk.',
            'Standardize defect taxonomy tags to improve trend accuracy across releases.'
        )
        preventiveActions = @(
            'Introduce pre-release risk scoring and stop-ship thresholds based on severity concentration.',
            'Expand regression suites for top recurring modules and root-cause buckets.',
            'Use post-release defect retrospectives to convert recurrent causes into checklist controls.'
        )
    }
}

$result | ConvertTo-Json -Depth 10 | Set-Content -Path $outputPath -Encoding utf8

Write-Host "Wrote $outputPath"
Write-Host "Total=$total Critical=$critical High=$high TopCategory=$topCategory TopModule=$topModule Risk=$releaseRisk"
