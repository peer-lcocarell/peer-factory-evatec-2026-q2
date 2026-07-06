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

# Copyright(C) The PEER Group Inc., 2026.
#
# This software contains confidential and trade secret information
# belonging to The PEER Group Inc. All Rights Reserved.
#
# No part of this software may be reproduced or transmitted in any form
# or by any means, electronic, mechanical, photocopying, recording or
# otherwise, without the prior written consent of The PEER Group Inc.
#
# Description: Clear out PFSC logs. Copilot used to assist with this.

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

