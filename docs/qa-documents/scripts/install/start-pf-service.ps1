#requires -Version 5.1
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$PeerGroupRoot = 'C:\Program Files\PEER Group',

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
		'Info' { 'Cyan' }
		'Warning' { 'Yellow' }
		'Error' { 'Red' }
		'Success' { 'Green' }
	}

	Write-Host ("[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message) -ForegroundColor $color
}

try {
	Write-Log -Level Info -Message 'Starting PF service startup workflow...'

	if (-not (Test-Path -Path $PeerGroupRoot -PathType Container)) {
		throw "Root path not found: $PeerGroupRoot"
	}

	$latestFolder = Get-ChildItem -Path $PeerGroupRoot -Directory -ErrorAction Stop |
		Sort-Object -Property CreationTime -Descending |
		Select-Object -First 1

	if (-not $latestFolder) {
		throw "No installation folders found under: $PeerGroupRoot"
	}

	$latestVersionNumber = $latestFolder.Name
	$serviceName = "$latestVersionNumber Server"
	$service = Get-Service -Name $serviceName -ErrorAction Stop

	if ($service.Status -eq 'Running') {
		Write-Log -Level Info -Message "Service '$serviceName' is already running."
	} elseif ($PSCmdlet.ShouldProcess($serviceName, 'Start service')) {
		Start-Service -Name $serviceName -ErrorAction Stop
		Write-Log -Level Success -Message "PEER Factory ECL Service $latestVersionNumber started."
	} else {
		Write-Log -Level Warning -Message 'Service start skipped by ShouldProcess (-WhatIf / -Confirm).'
	}

	if ($PauseSeconds -gt 0) {
		Start-Sleep -Seconds $PauseSeconds
	}
}
catch {
	Write-Log -Level Error -Message "Service startup failed: $($_.Exception.Message)"
	exit 1
}


