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
    Bulk publish Markdown test cases to Azure DevOps.

.DESCRIPTION
    Recursively searches a folder for Markdown (*.md) test case files and
    publishes each file to Azure DevOps.

    Files are processed in alphabetical order. Using numeric prefixes such as
    001-, 002-, and 003- allows the publish order to be controlled.

    By default, the destination suite is resolved from the test case metadata
    and suite mapping configuration.

    Use -SuiteId to force all test cases into a specific suite.

.PARAMETER Path
    Root folder containing Markdown test case files.

.PARAMETER Filter
    File filter used during discovery.
    Default: '*.md'

.PARAMETER PlanId
    Azure DevOps Test Plan ID.

.PARAMETER SuiteId
    Azure DevOps Test Suite ID. When specified, all test cases are published
    into this suite.

.PARAMETER AreaPath
    Azure DevOps Area Path.

.PARAMETER IterationPath
    Azure DevOps Iteration Path.

.PARAMETER OrgUrl
    Azure DevOps organization or server URL.

.PARAMETER Project
    Azure DevOps project name.

.PARAMETER ApiVersion
    Azure DevOps REST API version.

.PARAMETER SuiteMapPath
    Path to the suite mapping JSON file.

.PARAMETER ContinueOnError
    Continue processing remaining files if publishing a file fails.

.PARAMETER SkipValidation
    Allows publishing when validation reports blocking issues.
    Validation messages are emitted as warnings.

.EXAMPLE
    .\Invoke-AdoSuitePublishFromFolder.ps1 `
        -Path "C:\TestCases"

.EXAMPLE
    .\Invoke-AdoSuitePublishFromFolder.ps1 `
        -Path "C:\TestCases" `
        -SuiteId 291700

.EXAMPLE
    .\Invoke-AdoSuitePublishFromFolder.ps1 `
        -Path "C:\TestCases" `
        -ContinueOnError

.NOTES
    Authentication is handled by the underlying publisher module
    (pf-evatec-ado-publisher.psm1).
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string]$Path,

    [string]$Filter = '*.md',

    [int]$PlanId,

    [int]$SuiteId,

    [string]$AreaPath,

    [string]$IterationPath,

    [string]$OrgUrl,

    [string]$Project,

    [string]$ApiVersion,

    [string]$SuiteMapPath,

    [switch]$ContinueOnError,

    [switch]$SkipValidation
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Load Azure DevOps publishing module
Import-Module (
    Join-Path $PSScriptRoot 'pf-evatec-ado-publisher.psm1'
) -Force

# -------------------------------------------------------------------------
# Validate input path
# -------------------------------------------------------------------------

if (-not (Test-Path -LiteralPath $Path)) {
    throw "Folder not found: $Path"
}

# -------------------------------------------------------------------------
# Discover Markdown test case files
# -------------------------------------------------------------------------

$files = Get-ChildItem `
    -LiteralPath $Path `
    -Filter $Filter `
    -File `
    -Recurse |
Sort-Object FullName

if (-not $files) {
    Write-Warning "No '$Filter' files found under '$Path'."
    return
}

Write-Host "Found $($files.Count) file(s) to publish."

# -------------------------------------------------------------------------
# Collect publish results
# -------------------------------------------------------------------------

$results = [System.Collections.Generic.List[object]]::new()

foreach ($file in $files) {

    Write-Host "Processing: $($file.FullName)"

    $publishParams = @{
        Path = $file.FullName
    }

    foreach ($parameterName in @(
            'PlanId',
            'SuiteId',
            'AreaPath',
            'IterationPath',
            'OrgUrl',
            'Project',
            'ApiVersion',
            'SuiteMapPath',
            'SkipValidation'
        )) {
        if ($PSBoundParameters.ContainsKey($parameterName)) {
            $publishParams[$parameterName] =
            $PSBoundParameters[$parameterName]
        }
    }

    if ($WhatIfPreference) {
        $publishParams['WhatIf'] = $true
    }

    try {

        $result = Publish-AdoTestCaseFromMarkdown @publishParams

        $results.Add($result) | Out-Null

        Write-Host (
            '[{0}] {1} -> #{2} (Plan {3}, Suite {4})' -f
            $result.Status,
            $result.Title,
            $result.TestCaseId,
            $result.PlanId,
            $result.SuiteId
        )
    }
    catch {

        $failure = [pscustomobject]@{
            SourcePath = $file.FullName
            Title      = $null
            CrId       = $null
            Status     = 'Failed'
            TestCaseId = $null
            PlanId     = $null
            SuiteId    = $null
            Error      = $_.Exception.Message
        }

        $results.Add($failure) | Out-Null

        Write-Warning (
            "[FAILED] $($file.Name): $($_.Exception.Message)"
        )

        if (-not $ContinueOnError) {
            throw
        }
    }
}

# -------------------------------------------------------------------------
# Return publish results
# -------------------------------------------------------------------------

$results

