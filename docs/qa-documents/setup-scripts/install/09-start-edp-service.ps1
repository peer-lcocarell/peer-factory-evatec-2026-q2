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
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ServiceName = 'PF.EDP',

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

try {
    Write-Log -Level Info -Message "Starting service '$ServiceName'..."

    $service = Get-Service -Name $ServiceName -ErrorAction Stop

    if ($service.Status -eq 'Running') {
        Write-Log -Level Info -Message "Service '$ServiceName' is already running."
    }
    elseif ($PSCmdlet.ShouldProcess($ServiceName, 'Start service')) {
        Start-Service -Name $ServiceName -ErrorAction Stop
        $service.WaitForStatus([System.ServiceProcess.ServiceControllerStatus]::Running, [TimeSpan]::FromSeconds(30))
        Write-Log -Level Success -Message "Service '$ServiceName' started successfully."
    }
    else {
        Write-Log -Level Warning -Message 'Service start skipped by ShouldProcess (-WhatIf / -Confirm).'
    }

    if ($PauseSeconds -gt 0) {
        Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "Service start failed: $($_.Exception.Message)"
    exit 1
}
