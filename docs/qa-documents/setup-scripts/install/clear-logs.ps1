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

<#
.SYNOPSIS
    Clears all files and subdirectories from the PF log folder.

.DESCRIPTION
    Recursively removes all files and subdirectories from the specified log directory.
    Supports WhatIf and Confirm for safe execution in automated pipelines.

.PARAMETER TargetPath
    Full path to the log directory to clear.
    Default: C:\Users\Public\Documents\PEER Group\<FEED FACTORY>

.PARAMETER PauseSeconds
    Optional pause after cleanup. Default: 0 (no pause).

.EXAMPLE
    .\clear-logs.ps1 -TargetPath 'C:\Users\Public\Documents\PEER Group\PEER FACTORY'

.EXAMPLE
    .\clear-logs.ps1 -WhatIf

.NOTES
    Requires: Write access to the target log directory.
    The placeholder path <FEED FACTORY> must be replaced with the actual product folder name.
#>

#requires -Version 5.1
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TargetPath = "C:\Users\Public\Documents\PEER Group\<FEED FACTORY>",

    [Parameter()]
    [ValidateRange(0, 300)]
    [int]$PauseSeconds = 0
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
        'Info' { 'Cyan' }
        'Warning' { 'Yellow' }
        'Error' { 'Red' }
        'Success' { 'Green' }
    }

    Write-Host ("[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message) -ForegroundColor $color
}

try {
    Write-Log -Level Info -Message "Starting log cleanup for: $TargetPath"

    if (-not (Test-Path -Path $TargetPath -PathType Container)) {
        Write-Log -Level Warning -Message "Directory does not exist: $TargetPath"
        return
    }

    if ($PSCmdlet.ShouldProcess($TargetPath, 'Delete all files and subdirectories')) {
        Get-ChildItem -Path $TargetPath -File -Recurse -Force -ErrorAction Stop | Remove-Item -Force -ErrorAction Stop
        Get-ChildItem -Path $TargetPath -Directory -Recurse -Force -ErrorAction Stop | Remove-Item -Recurse -Force -ErrorAction Stop
        Write-Log -Level Success -Message "Contents of '$TargetPath' have been cleared."
    } else {
        Write-Log -Level Warning -Message 'Cleanup skipped by ShouldProcess (-WhatIf / -Confirm).'
    }

    if ($PauseSeconds -gt 0) {
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "Cleanup failed: $($_.Exception.Message)"
    exit 1
}

