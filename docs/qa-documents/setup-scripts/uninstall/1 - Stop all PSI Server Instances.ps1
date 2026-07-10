-4023-ADF4-1A58F884451A}".
WARNING: [2026-07-10 07:31:36] [WARNING] Uninstall skipped by ShouldProcess (-WhatIf / -Confirm).
PS C:\new-scripts\uninstall>
PS C:\new-scripts\uninstall> & "C:\new-scripts\uninstall\4 - Uninstall latest PF Evatec.ps1"
>> $LASTEXITCODE^C
PS C:\new-scripts\uninstall># ------------------------------------------------------------------------------
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
	Stops any running PSI Server Tray process instances.

.DESCRIPTION
	Finds and force-stops PSI.ServerTray processes when present.
	Supports WhatIf and Confirm for safe execution in automation.

.PARAMETER ProcessName
	Process name to stop. Default: PSI.ServerTray

.PARAMETER PauseSeconds
	Optional pause after operation completes. Default: 0.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$ProcessName = 'PSI.ServerTray',

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

	$line = "[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message
	switch ($Level) {
		'Info'    { Write-Information $line -InformationAction Continue }
		'Warning' { Write-Warning $line }
		'Error'   { Write-Error $line }
		'Success' { Write-Information $line -InformationAction Continue }
	}
}

try {
	Write-Log -Level Info -Message "Stopping process instances for: $ProcessName"

	$processes = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue
	if (-not $processes) {
		Write-Log -Level Info -Message 'No matching process instances are currently running.'
		return
	}

	foreach ($process in $processes) {
		if ($PSCmdlet.ShouldProcess("$($process.ProcessName) (PID $($process.Id))", 'Stop process')) {
			Stop-Process -Id $process.Id -Force -ErrorAction Stop
			Write-Log -Level Success -Message "Stopped PID $($process.Id)."
		}
	}

	if ($PauseSeconds -gt 0) {
		Start-Sleep -Seconds $PauseSeconds
	}
}
catch {
	Write-Log -Level Error -Message "Failed to stop PSI process instances: $($_.Exception.Message)"
	exit 1
}
