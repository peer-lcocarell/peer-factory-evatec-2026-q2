#requires -Version 5.1
<#
.SYNOPSIS
    Bulk-updates Original Estimate and Remaining Work on Azure DevOps Task
    work items for the PF Evatec R10.2 release.

.DESCRIPTION
    Uses the shared pf-evatec-ado-publisher module (Invoke-AdoRest) so
    authentication behaves identically to the test-case publisher:

      1. If $env:AZURE_DEVOPS_PAT is set, it is used.
      2. Otherwise the request falls back to Windows Integrated Auth
         (UseDefaultCredentials), which works against on-prem
         Azure DevOps Server (ops1.peergroup.com).

    No PAT is required when running from a domain-joined machine with
    ADO access.

.PARAMETER OrgUrl
    Azure DevOps organization URL. Defaults to
    https://ops1.peergroup.com/DefaultCollection.

.PARAMETER Project
    Azure DevOps project. Defaults to PFEvatec.

.PARAMETER ApiVersion
    REST API version. Defaults to 7.1.

.PARAMETER WhatIf
    Show the PATCH payload for each task without calling the API.

.EXAMPLE
    # Dry run - preview all changes
    .\invoke-ado-task-estimate-update.ps1 -WhatIf

.EXAMPLE
    # Apply all changes using Windows Integrated Auth
    .\invoke-ado-task-estimate-update.ps1

.NOTES
    Mapping is defined inline in $TaskUpdates below. Edit that block to
    change estimates. Values match ado-task-field-changes.md
    (docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\project-logs\).
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [string]$OrgUrl     = 'https://ops1.peergroup.com/DefaultCollection',
    [string]$Project    = 'PFEvatec',
    [string]$ApiVersion = '7.1'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------
# Load shared publisher module for Invoke-AdoRest
# ---------------------------------------------------------------------------

$modulePath = Join-Path $PSScriptRoot 'pf-evatec-ado-publisher.psm1'
if (-not (Test-Path -LiteralPath $modulePath)) {
    throw "Publisher module not found: $modulePath"
}
Import-Module -Name $modulePath -Force

# ---------------------------------------------------------------------------
# Task update mapping - matches ado-task-field-changes.md (11 tasks)
#
# Active/Proposed tasks - safe to PATCH.
# Resolved tasks are typically read-only in ADO Server and will 400 unless
# rules are bypassed. They are commented out below by default; edit them
# manually in the UI when needed.
# ---------------------------------------------------------------------------

$TaskUpdates = @(
    # --- Active ---
    [pscustomobject]@{ Id = 291908; Title = 'MISC';                     OriginalEstimate = 16; RemainingWork = 14.5 }
    [pscustomobject]@{ Id = 291911; Title = 'Verification';             OriginalEstimate = 10; RemainingWork = 10   }
    [pscustomobject]@{ Id = 292162; Title = 'Write #35008 Magnet';      OriginalEstimate = 8;  RemainingWork = 7    }
    [pscustomobject]@{ Id = 292217; Title = 'Write #34951 Search HW';   OriginalEstimate = 1;  RemainingWork = 0.5  }

    # --- Proposed ---
    [pscustomobject]@{ Id = 291910; Title = 'Regression';               OriginalEstimate = 4;  RemainingWork = 4    }
    [pscustomobject]@{ Id = 292161; Title = 'Test #35008 Magnet';       OriginalEstimate = 23; RemainingWork = 23   }
    [pscustomobject]@{ Id = 292215; Title = 'Test #34682 WBS Element';  OriginalEstimate = 3;  RemainingWork = 3    }
    [pscustomobject]@{ Id = 292218; Title = 'Test #34951 Search HW';    OriginalEstimate = 3;  RemainingWork = 3    }
    [pscustomobject]@{ Id = 292219; Title = 'Test #34948 Article Import'; OriginalEstimate = 3; RemainingWork = 3   }

    # --- Resolved (update manually in ADO UI; PATCH will 400) ---
    # [pscustomobject]@{ Id = 291909; Title = 'Planning and Review';    OriginalEstimate = 7;  RemainingWork = $null }
    # [pscustomobject]@{ Id = 292220; Title = 'Write #34948 Article';   OriginalEstimate = 2;  RemainingWork = $null }
)

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

function Get-AdoWorkItem {
    param(
        [Parameter(Mandatory)] [int]$Id
    )
    $uri = "$OrgUrl/$Project/_apis/wit/workitems/{0}?api-version=$ApiVersion" -f $Id
    return Invoke-AdoRest -Method GET -Uri $uri
}

function Get-FieldValue {
    <#
    .SYNOPSIS
        Safely reads a field from an ADO work item response even when the
        field is absent (Strict Mode friendly).
    #>
    param(
        [Parameter(Mandatory)] $Fields,
        [Parameter(Mandatory)] [string]$Name,
        $Default = $null
    )
    $prop = $Fields.PSObject.Properties[$Name]
    if ($null -eq $prop) { return $Default }
    return $prop.Value
}

function Update-AdoTaskEstimate {
    param(
        [Parameter(Mandatory)] [int]$Id,
        [Parameter(Mandatory)] [double]$OriginalEstimate,
        [Nullable[double]]$RemainingWork
    )

    $ops = @(
        @{ op = 'add'; path = '/fields/Microsoft.VSTS.Scheduling.OriginalEstimate'; value = $OriginalEstimate }
    )

    if ($null -ne $RemainingWork) {
        $ops += @{ op = 'add'; path = '/fields/Microsoft.VSTS.Scheduling.RemainingWork'; value = [double]$RemainingWork }
    }

    $uri = "$OrgUrl/$Project/_apis/wit/workitems/{0}?api-version=$ApiVersion" -f $Id
    $body = ($ops | ConvertTo-Json -Depth 5 -Compress)

    return Invoke-AdoRest `
        -Method      PATCH `
        -Uri         $uri `
        -ContentType 'application/json-patch+json' `
        -Body        $body
}

# ---------------------------------------------------------------------------
# Auth mode banner
# ---------------------------------------------------------------------------

if ($env:AZURE_DEVOPS_PAT) {
    Write-Host "Auth mode: PAT (AZURE_DEVOPS_PAT is set)" -ForegroundColor Cyan
}
else {
    Write-Host "Auth mode: Windows Integrated (UseDefaultCredentials)" -ForegroundColor Cyan
}

Write-Host ("Target : {0}/{1}" -f $OrgUrl, $Project) -ForegroundColor Cyan
Write-Host ("Tasks  : {0}" -f $TaskUpdates.Count) -ForegroundColor Cyan
Write-Host ""

# ---------------------------------------------------------------------------
# Execute updates
# ---------------------------------------------------------------------------

$results = foreach ($t in $TaskUpdates) {
    $target = "Task {0} ({1})" -f $t.Id, $t.Title

    # Fetch current values for reporting
    try {
        $current = Get-AdoWorkItem -Id $t.Id
    }
    catch {
        Write-Warning "Failed to read $target : $($_.Exception.Message)"
        [pscustomobject]@{
            Id     = $t.Id
            Title  = $t.Title
            Status = 'Read Failed'
            Error  = $_.Exception.Message
        }
        continue
    }

    $curOE = Get-FieldValue -Fields $current.fields -Name 'Microsoft.VSTS.Scheduling.OriginalEstimate' -Default 0
    $curRW = Get-FieldValue -Fields $current.fields -Name 'Microsoft.VSTS.Scheduling.RemainingWork'   -Default 0
    $curCW = Get-FieldValue -Fields $current.fields -Name 'Microsoft.VSTS.Scheduling.CompletedWork'   -Default 0
    $state = Get-FieldValue -Fields $current.fields -Name 'System.State'                              -Default '(unknown)'

    $rwPreview = if ($null -eq $t.RemainingWork) { '(unchanged)' } else { "$curRW -> $($t.RemainingWork)" }
    Write-Host ("{0,-45} State={1,-9} OE: {2} -> {3}    RW: {4}    CW: {5}" -f `
        $target, $state, $curOE, $t.OriginalEstimate, $rwPreview, $curCW)

    if ($PSCmdlet.ShouldProcess($target, "PATCH OriginalEstimate=$($t.OriginalEstimate) RemainingWork=$($t.RemainingWork)")) {
        try {
            $null = Update-AdoTaskEstimate `
                -Id               $t.Id `
                -OriginalEstimate $t.OriginalEstimate `
                -RemainingWork    $t.RemainingWork

            [pscustomobject]@{
                Id     = $t.Id
                Title  = $t.Title
                Status = 'Updated'
                OE     = "$curOE -> $($t.OriginalEstimate)"
                RW     = $rwPreview
            }
        }
        catch {
            Write-Warning "Failed to update $target : $($_.Exception.Message)"
            [pscustomobject]@{
                Id     = $t.Id
                Title  = $t.Title
                Status = 'Update Failed'
                Error  = $_.Exception.Message
            }
        }
    }
    else {
        [pscustomobject]@{
            Id     = $t.Id
            Title  = $t.Title
            Status = 'WhatIf'
            OE     = "$curOE -> $($t.OriginalEstimate)"
            RW     = $rwPreview
        }
    }
}

Write-Host ""
Write-Host "Summary:" -ForegroundColor Cyan
$results | Format-Table -AutoSize
