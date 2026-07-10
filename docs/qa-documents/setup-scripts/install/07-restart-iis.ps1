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
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
	[Parameter()]
	[ValidateRange(0, 300)]
	[int]$PauseSeconds = 3,

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$IisResetPath = "$env:SystemRoot\System32\iisreset.exe"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ScriptVersion = '1.0.0'
$script:StartTime = Get-Date
$script:Stats = [ordered]@{
	Info    = 0
	Warning = 0
	Error   = 0
	Success = 0
	Debug   = 0
}

function Write-Log {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[ValidateSet('Info', 'Warning', 'Error', 'Success', 'Debug')]
		[string]$Level,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$Message
	)

	$script:Stats[$Level]++
	$timestamp = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
	$line = "[$timestamp] [$($Level.ToUpper())] $Message"

	switch ($Level) {
		'Info'    { Write-Information $line -InformationAction Continue }
		'Warning' { Write-Warning $line }
		'Error'   { Write-Error $line }
		'Success' { Write-Information $line -InformationAction Continue }
		'Debug'   { Write-Verbose $line }
	}
}

function Show-Banner {
	[CmdletBinding()]
	param()

	Write-Information '===============================================' -InformationAction Continue
	Write-Information ' PF Evatec - IIS Restart Tool' -InformationAction Continue
	Write-Information " Version: $ScriptVersion" -InformationAction Continue
	Write-Information '===============================================' -InformationAction Continue
}

function Show-ExecutionSummary {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[datetime]$StartTime
	)

	$duration = (Get-Date) - $StartTime
	Write-Information '' -InformationAction Continue
	Write-Information '============== Execution Summary ==============' -InformationAction Continue
	Write-Information ('Runtime : {0:hh\:mm\:ss}' -f $duration) -InformationAction Continue
	Write-Information ('Info    : {0}' -f $script:Stats.Info) -InformationAction Continue
	Write-Information ('Warning : {0}' -f $script:Stats.Warning) -InformationAction Continue
	Write-Information ('Error   : {0}' -f $script:Stats.Error) -InformationAction Continue
	Write-Information ('Success : {0}' -f $script:Stats.Success) -InformationAction Continue
	Write-Information ('Debug   : {0}' -f $script:Stats.Debug) -InformationAction Continue
	Write-Information '===============================================' -InformationAction Continue
}

function Restart-Iis {
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
	param(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$ExecutablePath
	)

	if (-not (Test-Path -Path $ExecutablePath -PathType Leaf)) {
		throw "iisreset executable not found: $ExecutablePath"
	}

	$target = "$ExecutablePath /restart"
	if (-not $PSCmdlet.ShouldProcess($target, 'Restart IIS')) {
		Write-Log -Level Warning -Message 'IIS restart skipped by ShouldProcess (-WhatIf / -Confirm).'
		return
	}

	Write-Log -Level Info -Message 'Restarting IIS using iisreset...'
	$process = Start-Process -FilePath $ExecutablePath -ArgumentList '/restart' -Wait -PassThru -ErrorAction Stop

	if ($process.ExitCode -ne 0) {
		throw "iisreset failed with exit code $($process.ExitCode)."
	}

	Write-Log -Level Success -Message 'IIS restarted successfully.'
}

try {
	Show-Banner
	Write-Log -Level Info -Message 'Starting IIS restart workflow...'

	Write-Progress -Activity 'IIS Restart' -Status 'Executing iisreset /restart' -PercentComplete 65
	Restart-Iis -ExecutablePath $IisResetPath -Confirm:$false

	if ($PauseSeconds -gt 0) {
		Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
		Start-Sleep -Seconds $PauseSeconds
	}

	Write-Progress -Activity 'IIS Restart' -Status 'Completed' -PercentComplete 100
}
catch {
	Write-Log -Level Error -Message "Critical failure: $($_.Exception.Message)"
	exit 1
}
finally {
	Write-Progress -Activity 'IIS Restart' -Completed
	Show-ExecutionSummary -StartTime $script:StartTime
}







