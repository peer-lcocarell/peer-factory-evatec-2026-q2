# ------------------------------------------------------------------------------
# Copyright (C) The PEER Group Inc., 2026.
#
# This software contains confidential and trade secret information belonging
# to PEER Group Inc. All Rights Reserved.
#
# No part of this software may be reproduced or transmitted in any form or by
# any means, electronic, mechanical, photocopying, recording, or otherwise,
# without the prior written consent of PEER Group Inc.
# ------------------------------------------------------------------------------

#requires -Version 5.1
<#
.SYNOPSIS
    Bulk-publish all Markdown test cases in a folder to Azure DevOps.

.DESCRIPTION
    Recursively finds *.md files under -Path and publishes each one with
    Publish-AdoTestCaseFromMarkdown. Files are processed in sorted order
    so numeric prefixes (001-..., 002-...) drive execution order.

    By default, the suite is resolved per file from the CR ID parsed from
    each test case (via suite-map.json). Pass -SuiteId to force every test
    case into a single suite.

.PARAMETER Path
    Folder containing Markdown test cases (searched recursively).

.PARAMETER Filter
    Glob filter passed to Get-ChildItem. Defaults to '*.md'.

.PARAMETER ContinueOnError
    Continue processing remaining files when one fails. Failures are
    captured in the returned result objects (Status = 'Failed', Error = ...).

.EXAMPLE
    $env:AZURE_DEVOPS_PAT = '...'
    .\invoke-ado-suite-publish-from-folder.ps1 `
        -Path ..\..\docs\pf-evatec-phase-2\r10\r10-2\test-cases\286067

.EXAMPLE
    .\invoke-ado-suite-publish-from-folder.ps1 -Path .\cases -SuiteId 291700 -ContinueOnError
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)] [string]$Path,
    [string]$Filter = '*.md',
    [int]$PlanId,
    [int]$SuiteId,
    [string]$AreaPath,
    [string]$IterationPath,
    [string]$OrgUrl,
    [string]$Project,
    [string]$ApiVersion,
    [string]$SuiteMapPath,
    [switch]$ContinueOnError
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Import-Module (Join-Path $PSScriptRoot 'pf-evatec-ado-publisher.psm1') -Force

if (-not (Test-Path -LiteralPath $Path)) {
    throw "Folder not found: $Path"
}

$files = Get-ChildItem -LiteralPath $Path -Filter $Filter -File -Recurse |
         Sort-Object FullName

if (-not $files) {
    Write-Warning "No '$Filter' files found under: $Path"
    return
}

$results = New-Object System.Collections.Generic.List[object]

foreach ($file in $files) {
    $splat = @{ Path = $file.FullName }
    foreach ($key in 'PlanId','SuiteId','AreaPath','IterationPath','OrgUrl','Project','ApiVersion','SuiteMapPath') {
        if ($PSBoundParameters.ContainsKey($key)) { $splat[$key] = $PSBoundParameters[$key] }
    }
    if ($WhatIfPreference) { $splat.WhatIf = $true }

    try {
        $result = Publish-AdoTestCaseFromMarkdown @splat
        $results.Add($result) | Out-Null
        Write-Host ("[{0}] {1} -> #{2} (Plan {3} / Suite {4})" -f `
            $result.Status, $result.Title, $result.TestCaseId, $result.PlanId, $result.SuiteId)
    }
    catch {
        $err = $_
        $results.Add([pscustomobject]@{
            SourcePath = $file.FullName
            Title      = $null
            CrId       = $null
            Status     = 'Failed'
            TestCaseId = $null
            PlanId     = $null
            SuiteId    = $null
            Error      = $err.Exception.Message
        }) | Out-Null
        Write-Warning ("[Failed] {0}: {1}" -f $file.Name, $err.Exception.Message)
        if (-not $ContinueOnError) { throw }
    }
}

$results

