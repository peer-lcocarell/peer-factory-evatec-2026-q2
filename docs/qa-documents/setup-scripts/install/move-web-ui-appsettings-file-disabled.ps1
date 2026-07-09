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
    Copies the appsettings.Release.json file into the latest PF Evatec WebUI folder.

.DESCRIPTION
    Resolves the most recently installed PF Evatec version folder under PeerGroupRoot,
    then copies the release appsettings file into its WebUI subdirectory.
    Supports WhatIf and Confirm for safe execution in automated pipelines.

.PARAMETER SourceFile
    Full path to the appsettings.Release.json source file.
    Default: C:\Automation\Files\appsettings.Release.json

.PARAMETER PeerGroupRoot
    Root installation directory for PEER Group products.
    Default: C:\Program Files\PEER Group\

.PARAMETER PauseSeconds
    Optional pause after the copy completes. Default: 3.

.EXAMPLE
    .\move-web-ui-appsettings-file-disabled.ps1

.EXAMPLE
    .\move-web-ui-appsettings-file-disabled.ps1 -WhatIf

.NOTES
    Requires: Read access to SourceFile, write access to the WebUI destination folder.
    The -disabled suffix indicates this script is not part of the default automated sequence.
    The latest installation folder is determined by directory creation time.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$SourceFile = 'C:\Automation\Files\appsettings.Release.json',

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

    $color = switch ($Level) {
        'Info'    { 'Cyan' }
        'Warning' { 'Yellow' }
        'Error'   { 'Red' }
        'Success' { 'Green' }
    }

    Write-Host ("[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message) -ForegroundColor $color
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
        Sort-Object -Property CreationTime -Descending |
        Select-Object -First 1

    if (-not $latestFolder) {
        throw "No installation folders found under: $PeerGroupRoot"
    }

    $webUiPath = Join-Path -Path $latestFolder.FullName -ChildPath 'WebUI'
    Write-Log -Level Info -Message "Resolved WebUI path: $webUiPath"

    if (-not (Test-Path -Path $webUiPath -PathType Container)) {
        throw "WebUI folder not found for version '$($latestFolder.Name)': $webUiPath"
    }

    $destinationFile = Join-Path -Path $webUiPath -ChildPath (Split-Path -Path $SourceFile -Leaf)

    if ($PSCmdlet.ShouldProcess($destinationFile, 'Copy appsettings.Release.json')) {
        Copy-Item -Path $SourceFile -Destination $webUiPath -Force -ErrorAction Stop
        Write-Log -Level Success -Message "appsettings.Release.json deployed to: $webUiPath"
    } else {
        Write-Log -Level Warning -Message 'Copy skipped by ShouldProcess (-WhatIf / -Confirm).'
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

