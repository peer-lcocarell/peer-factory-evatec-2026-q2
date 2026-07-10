[CmdletBinding()]
param(
    [Parameter()]
    [string]$ResultsRoot = (Join-Path $PSScriptRoot "..\TestResults"),

    [Parameter()]
    [string]$RunFile,

    [Parameter()]
    [int]$TopSlow = 5
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-InnerText {
    param(
        [Parameter(Mandatory)]
        [System.Xml.XmlNode]$Node,
        [Parameter(Mandatory)]
        [string]$XPath
    )

    $selected = $Node.SelectSingleNode($XPath)
    if ($null -eq $selected) {
        return ""
    }

    return [string]$selected.InnerText
}

function Get-RunSummary {
    param(
        [Parameter(Mandatory)]
        [string]$TrxPath
    )

    [xml]$xml = Get-Content -Path $TrxPath -Raw

    $unitTestById = @{}
    $unitTests = $xml.SelectNodes("//*[local-name()='UnitTest']")

    foreach ($unitTest in $unitTests) {
        $id = [string]$unitTest.id
        if ([string]::IsNullOrWhiteSpace($id)) {
            continue
        }

        $className = Get-InnerText -Node $unitTest -XPath "./*[local-name()='TestMethod']/@className"
        if ([string]::IsNullOrWhiteSpace($className)) {
            $classNode = $unitTest.SelectSingleNode("./*[local-name()='TestMethod']")
            if ($null -ne $classNode) {
                $className = [string]$classNode.className
            }
        }

        $name = [string]$unitTest.name
        $unitTestById[$id] = [PSCustomObject]@{
            TestName  = $name
            ClassName = $className
        }
    }

    $results = @()
    $resultNodes = $xml.SelectNodes("//*[local-name()='UnitTestResult']")

    foreach ($node in $resultNodes) {
        $testId = [string]$node.testId
        $meta = $null
        if ($unitTestById.ContainsKey($testId)) {
            $meta = $unitTestById[$testId]
        }

        $durationRaw = [string]$node.duration
        $durationSeconds = 0.0
        if (-not [string]::IsNullOrWhiteSpace($durationRaw)) {
            try {
                $durationSeconds = [TimeSpan]::Parse($durationRaw).TotalSeconds
            }
            catch {
                $durationSeconds = 0.0
            }
        }

        $outcome = [string]$node.outcome
        $message = Get-InnerText -Node $node -XPath "./*[local-name()='Output']/*[local-name()='ErrorInfo']/*[local-name()='Message']"

        $className = if ($null -ne $meta) { $meta.ClassName } else { "" }
        $testName = if ($null -ne $meta -and -not [string]::IsNullOrWhiteSpace($meta.TestName)) { $meta.TestName } else { [string]$node.testName }

        if ([string]::IsNullOrWhiteSpace($className)) {
            $className = "Unknown"
        }

        $feature = ($className -split '\.')[-1]

        $results += [PSCustomObject]@{
            Name            = $testName
            ClassName       = $className
            Feature         = $feature
            Outcome         = $outcome
            DurationSeconds = [Math]::Round($durationSeconds, 3)
            Message         = $message
            TrxPath         = $TrxPath
        }
    }

    return $results
}

function Get-NormalizedFailureMessage {
    param([string]$Message)

    if ([string]::IsNullOrWhiteSpace($Message)) {
        return "(no failure message)"
    }

    $line = ($Message -split "`r?`n")[0].Trim()
    $line = $line -replace '\d+ms', '<time-ms>'
    $line = $line -replace '\d+(\.\d+)?s', '<time-s>'
    $line = $line -replace '[0-9a-fA-F]{8}-[0-9a-fA-F-]{27}', '<guid>'
    $line = $line -replace '\s+', ' '
    return $line
}

$trxFiles = @()
if (-not [string]::IsNullOrWhiteSpace($RunFile)) {
    if (-not (Test-Path -Path $RunFile -PathType Leaf)) {
        throw "RunFile not found: $RunFile"
    }

    $trxFiles = @((Resolve-Path -Path $RunFile).Path)
}
else {
    if (Test-Path -Path $ResultsRoot -PathType Container) {
        $trxFiles = @(Get-ChildItem -Path $ResultsRoot -Recurse -Filter *.trx |
            Sort-Object -Property LastWriteTimeUtc -Descending |
            Select-Object -ExpandProperty FullName)
    }
}

if ($trxFiles.Count -eq 0) {
    Write-Host "No .trx test result files found."
    Write-Host 'Run tests with: dotnet test --logger "trx;LogFileName=run.trx"'
    Write-Host 'Then run: .\scripts\summarize-test-suite.ps1 -RunFile .\TestResults\run.trx'
    exit 0
}

$latestRunPath = $trxFiles[0]
$latestRunResults = Get-RunSummary -TrxPath $latestRunPath

if ($latestRunResults.Count -eq 0) {
    Write-Host "The selected run has no UnitTestResult entries: $latestRunPath"
    exit 0
}

$allResults = @()
foreach ($file in $trxFiles) {
    $allResults += Get-RunSummary -TrxPath $file
}

$total = $latestRunResults.Count
$passed = ($latestRunResults | Where-Object { $_.Outcome -eq "Passed" }).Count
$failed = ($latestRunResults | Where-Object { $_.Outcome -eq "Failed" }).Count
$skipped = ($latestRunResults | Where-Object { $_.Outcome -in @("NotExecuted", "Skipped") }).Count

$passRate = if ($total -gt 0) { [Math]::Round(($passed / $total) * 100, 1) } else { 0 }

$featureBreakdown = @($latestRunResults |
    Group-Object -Property Feature |
    Sort-Object -Property Name |
    ForEach-Object {
        $featureTotal = $_.Count
        $featurePassed = ($_.Group | Where-Object { $_.Outcome -eq "Passed" }).Count
        $featureFailed = ($_.Group | Where-Object { $_.Outcome -eq "Failed" }).Count
        $featureSkipped = ($_.Group | Where-Object { $_.Outcome -in @("NotExecuted", "Skipped") }).Count

        [PSCustomObject]@{
            Feature = $_.Name
            Total   = $featureTotal
            Passed  = $featurePassed
            Failed  = $featureFailed
            Skipped = $featureSkipped
        }
    })

$slowest = @($latestRunResults |
    Sort-Object -Property DurationSeconds -Descending |
    Select-Object -First $TopSlow)

$failurePatterns = @($latestRunResults |
    Where-Object { $_.Outcome -eq "Failed" } |
    ForEach-Object {
        [PSCustomObject]@{
            Pattern = Get-NormalizedFailureMessage -Message $_.Message
            Test    = $_.Name
        }
    } |
    Group-Object -Property Pattern |
    Sort-Object -Property Count -Descending |
    Select-Object -First 5)

$flakyCandidates = @($allResults |
    Group-Object -Property Name |
    Where-Object {
        $outcomes = $_.Group | Select-Object -ExpandProperty Outcome -Unique
        ($outcomes -contains "Passed") -and ($outcomes -contains "Failed")
    } |
    Sort-Object -Property Name |
    Select-Object -First 10)

$runComparison = $null
if ($trxFiles.Count -ge 2) {
    $previousRunResults = Get-RunSummary -TrxPath $trxFiles[1]
    if ($previousRunResults.Count -gt 0) {
        $prevTotal = $previousRunResults.Count
        $prevPassed = ($previousRunResults | Where-Object { $_.Outcome -eq "Passed" }).Count
        $prevFailed = ($previousRunResults | Where-Object { $_.Outcome -eq "Failed" }).Count
        $prevSkipped = ($previousRunResults | Where-Object { $_.Outcome -in @("NotExecuted", "Skipped") }).Count

        $runComparison = [PSCustomObject]@{
            PreviousFile = $trxFiles[1]
            DeltaPassed  = $passed - $prevPassed
            DeltaFailed  = $failed - $prevFailed
            DeltaSkipped = $skipped - $prevSkipped
            DeltaTotal   = $total - $prevTotal
        }
    }
}

Write-Host ""
Write-Host "Playwright Suite Summary"
Write-Host "------------------------"
Write-Host "Run file : $latestRunPath"
Write-Host "Total    : $total"
Write-Host "Passed   : $passed"
Write-Host "Failed   : $failed"
Write-Host "Skipped  : $skipped"
Write-Host "Pass rate: $passRate%"

Write-Host ""
Write-Host "Feature Breakdown"
Write-Host "-----------------"
foreach ($feature in $featureBreakdown) {
    Write-Host ("- {0}: total={1}, passed={2}, failed={3}, skipped={4}" -f $feature.Feature, $feature.Total, $feature.Passed, $feature.Failed, $feature.Skipped)
}

Write-Host ""
Write-Host "Failure Insights"
Write-Host "----------------"
if ($failurePatterns.Count -eq 0) {
    Write-Host "- No failures in selected run."
}
else {
    foreach ($pattern in $failurePatterns) {
        Write-Host ("- {0}x {1}" -f $pattern.Count, $pattern.Name)
    }
}

Write-Host ""
Write-Host "Slowest Tests"
Write-Host "-------------"
foreach ($test in $slowest) {
    Write-Host ("- {0}: {1}s [{2}]" -f $test.Name, $test.DurationSeconds, $test.Outcome)
}

Write-Host ""
Write-Host "Flaky Candidates (Across Available Runs)"
Write-Host "----------------------------------------"
if ($flakyCandidates.Count -eq 0) {
    Write-Host "- No pass/fail flips detected across available .trx files."
}
else {
    foreach ($candidate in $flakyCandidates) {
        $outcomes = ($candidate.Group | Select-Object -ExpandProperty Outcome -Unique) -join ", "
        Write-Host ("- {0}: outcomes={1}" -f $candidate.Name, $outcomes)
    }
}

if ($null -ne $runComparison) {
    Write-Host ""
    Write-Host "Trend vs Previous Run"
    Write-Host "---------------------"
    Write-Host "Previous: $($runComparison.PreviousFile)"
    Write-Host ("Delta   : total={0}, passed={1}, failed={2}, skipped={3}" -f $runComparison.DeltaTotal, $runComparison.DeltaPassed, $runComparison.DeltaFailed, $runComparison.DeltaSkipped)
}

Write-Host ""
Write-Host "Overall Health"
Write-Host "--------------"
if ($failed -eq 0) {
    Write-Host "- Healthy: all tests passed in the latest run."
}
elseif ($passed -eq 0) {
    Write-Host "- Critical: no tests passed in the latest run; investigate environment and blocking failures first."
}
else {
    Write-Host "- Mixed: suite is partially healthy; prioritize recurring failure patterns and slowest unstable tests."
}
