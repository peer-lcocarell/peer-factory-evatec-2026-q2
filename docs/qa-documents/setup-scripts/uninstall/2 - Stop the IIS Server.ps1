
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
	Stops IIS using iisreset.

.DESCRIPTION
	Executes iisreset /stop and validates the command exit code.
	Supports WhatIf and Confirm for safe execution in automation.

.PARAMETER IisResetPath
	Full path to iisreset.exe.

.PARAMETER PauseSeconds
	Optional pause after operation completes. Default: 0.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$IisResetPath = "$env:SystemRoot\System32\iisreset.exe",

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
	if (-not (Test-Path -Path $IisResetPath -PathType Leaf)) {
		throw "iisreset executable not found: $IisResetPath"
	}

	if ($PSCmdlet.ShouldProcess("$IisResetPath /stop", 'Stop IIS')) {
		$process = Start-Process -FilePath $IisResetPath -ArgumentList '/stop' -Wait -PassThru -ErrorAction Stop
		if ($process.ExitCode -ne 0) {
			throw "iisreset /stop failed with exit code $($process.ExitCode)."
		}

		Write-Log -Level Success -Message 'IIS stopped successfully.'
	} else {
		Write-Log -Level Warning -Message 'IIS stop skipped by ShouldProcess (-WhatIf / -Confirm).'
	}

	if ($PauseSeconds -gt 0) {
		Start-Sleep -Seconds $PauseSeconds
	}
}
catch {
	Write-Log -Level Error -Message "Failed to stop IIS: $($_.Exception.Message)"
	exit 1
}
