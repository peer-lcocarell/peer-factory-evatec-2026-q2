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
    Copies the modified MES configuration file to the MES Server folder.

.DESCRIPTION
    Copies Components.config from the Automation Files source to the MES Server
    configuration destination. Supports WhatIf and Confirm for safe execution.

.PARAMETER SourcePath
    Full path to the source configuration file.
    Default: C:\Automation\Files\Components.config

.PARAMETER DestinationFolder
    Full path to the MES Server configuration destination folder.
    Default: C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\

.PARAMETER PauseSeconds
    Optional pause after the copy completes. Default: 3.

.EXAMPLE
    .\move-modified-mes-config-to-mes-server-disabled.ps1

.EXAMPLE
    .\move-modified-mes-config-to-mes-server-disabled.ps1 -WhatIf

.NOTES
    Requires: Read access to SourcePath, write access to DestinationFolder.
    The -disabled suffix indicates this script is not part of the default automated sequence.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$SourcePath = 'C:\Automation\Files\Components.config',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$DestinationFolder = 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\',

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
    Write-Log -Level Info -Message 'Starting MES configuration copy...'

    if (-not (Test-Path -Path $SourcePath -PathType Leaf)) {
        throw "Source configuration file not found: $SourcePath"
    }

    if (-not (Test-Path -Path $DestinationFolder -PathType Container)) {
        Write-Log -Level Warning -Message "Destination folder not found. Creating: $DestinationFolder"
        $null = New-Item -Path $DestinationFolder -ItemType Directory -Force -ErrorAction Stop
        Write-Log -Level Success -Message 'Destination folder created.'
    }

    $destinationPath = Join-Path -Path $DestinationFolder -ChildPath (Split-Path -Path $SourcePath -Leaf)

    if ($PSCmdlet.ShouldProcess($destinationPath, 'Copy Components.config')) {
        Copy-Item -Path $SourcePath -Destination $DestinationFolder -Force -ErrorAction Stop
        Write-Log -Level Success -Message 'Updated MES configuration moved to MES Server folder.'
    } else {
        Write-Log -Level Warning -Message 'Copy operation skipped by ShouldProcess (-WhatIf / -Confirm).'
    }

    if ($PauseSeconds -gt 0) {
        Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "MES configuration copy failed: $($_.Exception.Message)"
    exit 1
}
