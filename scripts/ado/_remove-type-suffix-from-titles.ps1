<#
.SYNOPSIS
    Remove (Negative) and (Validation) suffixes from ADO test case titles in test plan 291616.
.PARAMETER WhatIf
    Preview changes without applying them.
#>
param([switch]$WhatIf)

$org = "https://ops1.peergroup.com/DefaultCollection"
$proj = "PFEvatec"
$planId = 291616
$pattern = '\s*\((Negative|Validation)\)$'

Write-Host "Fetching suites for plan $planId..." -ForegroundColor Cyan
$suites = (Invoke-RestMethod "$org/$proj/_apis/testplan/Plans/$planId/suites?api-version=7.1" -UseDefaultCredentials).value
Write-Host "Suites found: $($suites.Count)"

$hits = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($suite in $suites) {
    $tcs = (Invoke-RestMethod "$org/$proj/_apis/testplan/Plans/$planId/Suites/$($suite.id)/TestCase?api-version=7.1" -UseDefaultCredentials).value
    foreach ($tc in $tcs) {
        $title = $tc.workItem.name
        if ($title -match $pattern) {
            $newTitle = ($title -replace $pattern, '').TrimEnd()
            $hits.Add([PSCustomObject]@{
                    Id       = $tc.workItem.id
                    OldTitle = $title
                    NewTitle = $newTitle
                })
        }
    }
}

# Deduplicate by ID (same TC can appear in multiple suites)
$unique = $hits | Sort-Object Id -Unique

Write-Host "`nTest cases to update: $($unique.Count)"
$unique | Format-Table Id, OldTitle, NewTitle -AutoSize -Wrap

if ($WhatIf) {
    Write-Host "`n[WhatIf] No changes applied." -ForegroundColor Yellow
    return
}

$ok = 0
$err = 0

foreach ($item in $unique) {
    $ops = [array]@( @{ op = "add"; path = "/fields/System.Title"; value = $item.NewTitle } )
    $json = ConvertTo-Json $ops -Compress -Depth 5
    $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($json)
    try {
        Invoke-RestMethod "$org/$proj/_apis/wit/workItems/$($item.Id)?api-version=7.1" `
            -Method Patch -UseDefaultCredentials `
            -ContentType "application/json-patch+json; charset=utf-8" `
            -Body $bodyBytes | Out-Null
        Write-Host "  [$($item.Id)] Updated OK" -ForegroundColor Green
        $ok++
    }
    catch {
        Write-Host "  [$($item.Id)] FAILED: $_" -ForegroundColor Red
        $err++
    }
}

Write-Host "`nDone. Updated: $ok  Errors: $err"
