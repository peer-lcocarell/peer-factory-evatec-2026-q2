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
	[ValidateNotNullOrEmpty()]
	[string]$ServiceNamePattern = '*PEER Factory ECL*',

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$AccountName = 'PEERGROUP\vstsbuild',

	[Parameter()]
	[ValidateRange(0, 300)]
	[int]$PauseSeconds = 3,

	[Parameter()]
	[System.Security.SecureString]$SecurePassword,

	[Parameter()]
	[switch]$AllowInteractivePrompt
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
		'Error'   { Write-Information $line -InformationAction Continue }
		'Success' { Write-Information $line -InformationAction Continue }
		'Debug'   { Write-Verbose $line }
	}
}

function Show-Banner {
	[CmdletBinding()]
	param()

	Write-Information '===============================================' -InformationAction Continue
	Write-Information ' PF Evatec - Service Account Update Tool' -InformationAction Continue
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

function Test-IsInteractiveSession {
	[CmdletBinding()]
	param()

	return [Environment]::UserInteractive
}

function ConvertTo-PlainText {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[System.Security.SecureString]$Value
	)

	$bstr = [IntPtr]::Zero
	try {
		$bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($Value)
		return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
	}
	finally {
		if ($bstr -ne [IntPtr]::Zero) {
			[Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
		}
	}
}

function Get-TargetService {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$NamePattern
	)

	$services = @(Get-CimInstance -ClassName Win32_Service -ErrorAction Stop |
		Where-Object { $_.Name -like $NamePattern -or $_.DisplayName -like $NamePattern })

	if ($services.Count -eq 0) {
		throw "No service found matching pattern: $NamePattern"
	}

	if ($services.Count -gt 1) {
		$names = ($services | Select-Object -ExpandProperty Name) -join ', '
		throw "Multiple services matched pattern '$NamePattern': $names. Use a more specific pattern."
	}

	return $services[0]
}

function Set-ServiceCredential {
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
	param(
		[Parameter(Mandatory)]
		[Microsoft.Management.Infrastructure.CimInstance]$Service,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$Account,

		[Parameter(Mandatory)]
		[System.Security.SecureString]$Password
	)

	if (-not $PSCmdlet.ShouldProcess($Service.Name, "Update Log On account to '$Account'")) {
		Write-Log -Level Warning -Message 'Service credential update skipped by ShouldProcess (-WhatIf / -Confirm).'
		return
	}

	$plainPassword = ConvertTo-PlainText -Value $Password
	try {
		$result = Invoke-CimMethod -InputObject $Service -MethodName Change -Arguments @{
			StartName     = $Account
			StartPassword = $plainPassword
		} -ErrorAction Stop
	}
	finally {
		$plainPassword = $null
	}

	if ($result.ReturnValue -ne 0) {
		throw "Service account update failed. Win32_Service.Change return code: $($result.ReturnValue)"
	}

	Write-Log -Level Success -Message "Service '$($Service.Name)' credentials updated successfully."
}

try {
	Show-Banner
	Write-Log -Level Info -Message 'Starting service-account update...'

	if (-not $SecurePassword) {
		if (-not $AllowInteractivePrompt) {
			throw 'SecurePassword is required for unattended execution. Supply -SecurePassword, or explicitly opt in with -AllowInteractivePrompt.'
		}

		if (-not (Test-IsInteractiveSession)) {
			throw 'Interactive prompting is unavailable in this session. Supply -SecurePassword for remote/non-interactive execution.'
		}

		Write-Log -Level Info -Message "No password parameter supplied. Prompting securely for account '$AccountName'."
		$SecurePassword = Read-Host -AsSecureString -Prompt "Enter password for $AccountName"
	}

	Write-Progress -Activity 'Service Account Update' -Status 'Finding target service' -PercentComplete 30
	$service = Get-TargetService -NamePattern $ServiceNamePattern
	Write-Log -Level Info -Message "Target service resolved: $($service.Name) ($($service.DisplayName))"

	Write-Progress -Activity 'Service Account Update' -Status 'Updating service credentials' -PercentComplete 70
	Set-ServiceCredential -Service $service -Account $AccountName -Password $SecurePassword -Confirm:$false

	if ($PauseSeconds -gt 0) {
		Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
		Start-Sleep -Seconds $PauseSeconds
	}

	Write-Progress -Activity 'Service Account Update' -Status 'Completed' -PercentComplete 100
	Write-Log -Level Success -Message 'Service account update completed.'
}
catch {
	Write-Log -Level Error -Message "Critical failure: $($_.Exception.Message)"
	exit 1
}
finally {
	Write-Progress -Activity 'Service Account Update' -Completed
	Show-ExecutionSummary -StartTime $script:StartTime
}




