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
	Stops the latest PF Evatec server service.

.DESCRIPTION
	Resolves the latest PEER Group install folder and derives the service name
	using the pattern: <version> Server. Supports WhatIf and Confirm.

.PARAMETER PeerGroupRoot
	Root path containing PF Evatec versioned install folders.

.PARAMETER PauseSeconds
	Optional pause after operation completes. Default: 0.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$PeerGroupRoot = 'C:\Program Files\PEER Group',

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
	if (-not (Test-Path -Path $PeerGroupRoot -PathType Container)) {
		throw "Root path not found: $PeerGroupRoot"
	}

	$latestFolder = Get-ChildItem -Path $PeerGroupRoot -Directory -ErrorAction Stop |
		Sort-Object -Property LastWriteTime -Descending |
		Select-Object -First 1

	if (-not $latestFolder) {
		throw "No installation folders found under: $PeerGroupRoot"
	}

	$serviceName = "$($latestFolder.Name) Server"
	$service = Get-Service -Name $serviceName -ErrorAction Stop

	if ($service.Status -eq 'Stopped') {
		Write-Log -Level Info -Message "Service '$serviceName' is already stopped."
	} elseif ($PSCmdlet.ShouldProcess($serviceName, 'Stop service')) {
		Stop-Service -Name $serviceName -Force -ErrorAction Stop
		$service.WaitForStatus([System.ServiceProcess.ServiceControllerStatus]::Stopped, [TimeSpan]::FromSeconds(30))
		Write-Log -Level Success -Message "Service '$serviceName' stopped successfully."
	} else {
		Write-Log -Level Warning -Message 'Service stop skipped by ShouldProcess (-WhatIf / -Confirm).'
	}

	if ($PauseSeconds -gt 0) {
		Start-Sleep -Seconds $PauseSeconds
	}
}
catch {
	Write-Log -Level Error -Message "Failed to stop PEER Factory service: $($_.Exception.Message)"
	exit 1
}




