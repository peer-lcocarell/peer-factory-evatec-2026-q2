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
    Retrieves all Test Suite IDs from an Azure DevOps Test Plan and exports
    them to CSV. Optionally updates suite-map.json with the discovered mappings.

.DESCRIPTION
    Calls the Azure DevOps testplan/Plans/{planId}/suites REST endpoint,
    parses the RequirementId from each suite name, and outputs a table plus
    a CSV file. Supports PAT and Windows integrated authentication.

.PARAMETER OrgUrl
    Azure DevOps organization URL. Defaults to https://ops1.peergroup.com/DefaultCollection

.PARAMETER Project
    Azure DevOps project name. Defaults to PFEvatec.

.PARAMETER PlanId
    Test Plan ID to query. Defaults to 291616.

.PARAMETER ApiVersion
    ADO REST API version. Defaults to 7.1.

.PARAMETER OutputCsv
    Path for the exported CSV file. Defaults to suite-map-discovery.csv in the
    same directory as this script.

.PARAMETER UpdateSuiteMap
    When set, writes discovered requirement->suiteId mappings back into
    suite-map.json in the same directory as this script.

.EXAMPLE
    # Windows integrated auth (no PAT needed on corporate network)
    .\get-ado-suite-map.ps1 -PlanId 291616

.EXAMPLE
    # PAT auth
    $env:AZURE_DEVOPS_PAT = 'your-pat'
    .\get-ado-suite-map.ps1 -PlanId 291616 -UpdateSuiteMap
#>
[CmdletBinding()]
param(
    [string] $OrgUrl     = 'https://ops1.peergroup.com/DefaultCollection',
    [string] $Project    = 'PFEvatec',
    [int]    $PlanId     = 291616,
    [string] $ApiVersion = '7.1',
    [string] $OutputCsv  = (Join-Path $PSScriptRoot 'suite-map-discovery.csv'),
    [switch] $UpdateSuiteMap
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# ---------------------------------------------------------------------------
# Auth header - PAT if available, else Windows integrated credentials.
# ---------------------------------------------------------------------------
function Get-AuthParams {
    $pat = $env:AZURE_DEVOPS_PAT
    if (-not [string]::IsNullOrWhiteSpace($pat)) {
        $bytes  = [System.Text.Encoding]::ASCII.GetBytes(":$pat")
        $base64 = [Convert]::ToBase64String($bytes)
        return @{ Headers = @{ Authorization = "Basic $base64" } }
    }
    # On-prem with Windows auth - no header needed.
    return @{ UseDefaultCredentials = $true }
}

# ---------------------------------------------------------------------------
# Retrieve all suites with paging support.
# ---------------------------------------------------------------------------
$authParams = Get-AuthParams
$suites     = [System.Collections.Generic.List[object]]::new()

$continuationToken = $null

do {
    $uri = '{0}/{1}/_apis/testplan/Plans/{2}/suites?api-version={3}&$expand=children' `
        -f $OrgUrl.TrimEnd('/'), $Project, $PlanId, $ApiVersion

    if ($continuationToken) {
        $uri += "&continuationToken=$continuationToken"
    }

    Write-Verbose "GET $uri"

    $response = Invoke-RestMethod -Method GET -Uri $uri -ContentType 'application/json' @authParams

    if ($response.value) {
        $suites.AddRange($response.value)
    }

    # ADO returns a continuationToken header when there are more pages.
    $continuationToken = $null
    if ($response.PSObject.Properties.Name -contains 'continuationToken') {
        $continuationToken = $response.continuationToken
    }

} while ($continuationToken)

Write-Host "`nRetrieved $($suites.Count) suites from Plan $PlanId.`n" -ForegroundColor Cyan

# ---------------------------------------------------------------------------
# Parse RequirementId from suite name.
# Suite names follow the pattern:  "73354 : Add Role to Logbook..." or
# "290756 : Magnet System Types (Magnet System Types)"
# ---------------------------------------------------------------------------
$rows = foreach ($suite in $suites) {
    $requirementId = $null
    if ($suite.name -match '^\s*(\d{4,6})\s*:') {
        $requirementId = $Matches[1]
    }

    $parentId = $null
    if ($suite.PSObject.Properties.Name -contains 'parentSuite' -and $suite.parentSuite) {
        $parentId = $suite.parentSuite.id
    }

    [pscustomobject]@{
        SuiteId       = $suite.id
        SuiteName     = $suite.name
        ParentSuiteId = $parentId
        RequirementId = $requirementId
    }
}

# ---------------------------------------------------------------------------
# Display as table and export to CSV.
# ---------------------------------------------------------------------------
$rows | Sort-Object SuiteId | Format-Table -AutoSize

$rows | Sort-Object SuiteId | Export-Csv -Path $OutputCsv -NoTypeInformation -Encoding UTF8
Write-Host "CSV exported to: $OutputCsv" -ForegroundColor Green

# ---------------------------------------------------------------------------
# Optionally update suite-map.json with discovered requirement mappings.
# ---------------------------------------------------------------------------
if ($UpdateSuiteMap) {
    $mapPath = Join-Path $PSScriptRoot 'suite-map.json'

    if (-not (Test-Path $mapPath)) {
        Write-Warning "suite-map.json not found at $mapPath - skipping update."
    }
    else {
        $json = Get-Content $mapPath -Raw -Encoding UTF8 | ConvertFrom-Json

        # Build a fresh requirementSuiteIds hashtable from discovered rows.
        $newReqMap = [ordered]@{}

        # Preserve any existing entries.
        if ($json.PSObject.Properties.Name -contains 'requirementSuiteIds' -and $json.requirementSuiteIds) {
            foreach ($prop in $json.requirementSuiteIds.PSObject.Properties) {
                $newReqMap[$prop.Name] = $prop.Value
            }
        }

        # Add/update entries discovered from ADO.
        foreach ($row in ($rows | Where-Object { $_.RequirementId })) {
            $newReqMap[$row.RequirementId] = $row.SuiteId
        }

        # Write back.
        $json | Add-Member -MemberType NoteProperty -Name 'requirementSuiteIds' -Value $newReqMap -Force
        $json | ConvertTo-Json -Depth 10 | Set-Content $mapPath -Encoding UTF8

        Write-Host "suite-map.json updated with $($newReqMap.Count) requirement suite mappings." -ForegroundColor Green
    }
}
