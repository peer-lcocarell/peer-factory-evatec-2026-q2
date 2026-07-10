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

#Requires -Version 5.1
<#
.SYNOPSIS
    Merges appsettings.Release.json values into the latest PF Evatec WebUI appsettings.json.

.DESCRIPTION
    Resolves the most recently installed PF Evatec version folder under PeerGroupRoot,
    then merges release appsettings values into the WebUI appsettings.json.
    This preserves environment-specific sections required by the application while updating
    release-managed settings such as database connection and gRPC client values.
    Supports WhatIf and Confirm for safe execution in automated pipelines.

.PARAMETER SourceFile
    Full path to the appsettings.Release.json source file.
    Default: C:\Automated Scripts\Files\appsettings.Release.json

.PARAMETER PeerGroupRoot
    Root installation directory for PEER Group products.
    Default: C:\Program Files\PEER Group\

.PARAMETER PauseSeconds
    Optional pause after the copy completes. Default: 3.

.EXAMPLE
    .\05-update-webui-appsettings.ps1

.EXAMPLE
    .\05-update-webui-appsettings.ps1 -WhatIf

.NOTES
    Requires: Read access to SourceFile, write access to the WebUI destination folder.
    The latest installation folder is determined by directory LastWriteTime.
    A timestamped backup of appsettings.json is created before writing.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$SourceFile = 'C:\Automated Scripts\Files\appsettings.Release.json',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$PeerGroupRoot = 'C:\Program Files\PEER Group\',

    [Parameter()]
    [ValidateRange(0, 300)]
    [int]$PauseSeconds = 3
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Log {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Info', 'Warning', 'Error', 'Success')]
        [string]$Level,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Message
    )

    $line = "[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message
    switch ($Level) {
        'Info'    { Write-Information $line -InformationAction Continue }
        'Warning' { Write-Warning $line }
        'Error'   { Write-Information $line -InformationAction Continue }
        'Success' { Write-Information $line -InformationAction Continue }
    }
}

function Set-OrAddProperty {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [psobject]$Object,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory)]
        $Value
    )

    $property = $Object.PSObject.Properties[$Name]
    if ($null -eq $property) {
        $Object | Add-Member -MemberType NoteProperty -Name $Name -Value $Value -Force
    } else {
        $property.Value = $Value
    }
}

try {
    Write-Log -Level Info -Message 'Starting WebUI appsettings deployment...'

    if (-not (Test-Path -Path $SourceFile -PathType Leaf)) {
        throw "Source file not found: $SourceFile"
    }

    if (-not (Test-Path -Path $PeerGroupRoot -PathType Container)) {
        throw "PEER Group root folder not found: $PeerGroupRoot"
    }

    $latestFolder = Get-ChildItem -Path $PeerGroupRoot -Directory -ErrorAction Stop |
        Sort-Object -Property LastWriteTime -Descending |
        Select-Object -First 1

    if (-not $latestFolder) {
        throw "No installation folders found under: $PeerGroupRoot"
    }

    $webUiPath = Join-Path -Path $latestFolder.FullName -ChildPath 'WebUI'
    Write-Log -Level Info -Message "Resolved WebUI path: $webUiPath"

    if (-not (Test-Path -Path $webUiPath -PathType Container)) {
        throw "WebUI folder not found for version '$($latestFolder.Name)': $webUiPath"
    }

    $destinationFile = Join-Path -Path $webUiPath -ChildPath 'appsettings.json'

    if (-not (Test-Path -Path $destinationFile -PathType Leaf)) {
        throw "Destination appsettings file not found: $destinationFile"
    }

    if ($PSCmdlet.ShouldProcess($destinationFile, 'Merge appsettings.Release.json values into appsettings.json')) {
        $timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
        $backupFile = "$destinationFile.bak-$timestamp"
        Copy-Item -Path $destinationFile -Destination $backupFile -Force -ErrorAction Stop
        Write-Log -Level Info -Message "Backup created: $backupFile"

        try {
            $sourceJson = Get-Content -Path $SourceFile -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
        } catch {
            throw "Source JSON is invalid: $SourceFile"
        }

        try {
            $destinationJson = Get-Content -Path $destinationFile -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
        } catch {
            throw "Destination JSON is invalid: $destinationFile"
        }

        if ($sourceJson.PSObject.Properties['ConnectionStrings']) {
            if (-not $destinationJson.PSObject.Properties['ConnectionStrings']) {
                Set-OrAddProperty -Object $destinationJson -Name 'ConnectionStrings' -Value ([pscustomobject]@{})
            }

            foreach ($prop in $sourceJson.ConnectionStrings.PSObject.Properties) {
                Set-OrAddProperty -Object $destinationJson.ConnectionStrings -Name $prop.Name -Value $prop.Value
            }
        }

        if ($sourceJson.PSObject.Properties['GrpcClient']) {
            Set-OrAddProperty -Object $destinationJson -Name 'GrpcClient' -Value $sourceJson.GrpcClient
        }

        $destinationJson | ConvertTo-Json -Depth 100 | Set-Content -Path $destinationFile -Encoding UTF8
        Write-Log -Level Success -Message "WebUI appsettings merged and deployed to: $destinationFile"
    } else {
        Write-Log -Level Warning -Message 'Merge skipped by ShouldProcess (-WhatIf / -Confirm).'
    }

    if ($PauseSeconds -gt 0) {
        Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "WebUI appsettings deployment failed: $($_.Exception.Message)"
    exit 1
}

