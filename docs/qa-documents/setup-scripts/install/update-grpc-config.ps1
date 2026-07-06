#requires -Version 5.1
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$ConfigPath = 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\Server.Grpc.config',

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$HostName = 'evatec2012r2qa4',

	[Parameter()]
	[ValidateRange(1, 65535)]
	[int]$Port = 9090,

	[Parameter()]
	[ValidateSet('insecure', 'secure')]
	[string]$Credentials = 'insecure',

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
	Write-Log -Level Info -Message 'Starting gRPC configuration update...'

	if (-not (Test-Path -Path $ConfigPath -PathType Leaf)) {
		throw "Configuration file not found: $ConfigPath"
	}

	[xml]$xml = Get-Content -Path $ConfigPath -Raw -ErrorAction Stop
	$portNode = $xml.SelectSingleNode('//port')
	if (-not $portNode) {
		throw 'No <port> node found in Server.Grpc.config.'
	}

	$oldHost = $portNode.host
	$oldPort = $portNode.port
	$oldCredentials = $portNode.credentials

	$portNode.host = $HostName
	$portNode.port = [string]$Port
	$portNode.credentials = $Credentials

	if ($PSCmdlet.ShouldProcess($ConfigPath, "Update port host='$HostName' port='$Port' credentials='$Credentials'")) {
		$xml.Save($ConfigPath)
		Write-Log -Level Success -Message "gRPC configuration updated from host='$oldHost' port='$oldPort' credentials='$oldCredentials' to host='$HostName' port='$Port' credentials='$Credentials'."
	} else {
		Write-Log -Level Warning -Message 'Update skipped by ShouldProcess (-WhatIf / -Confirm).'
	}

	if ($PauseSeconds -gt 0) {
		Start-Sleep -Seconds $PauseSeconds
	}
}
catch {
	Write-Log -Level Error -Message "gRPC configuration update failed: $($_.Exception.Message)"
	exit 1
}
