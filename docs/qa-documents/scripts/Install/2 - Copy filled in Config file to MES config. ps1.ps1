
#requires -Version 5.1
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$SourcePath = 'C:\Automation\Files\Components.config',

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$DestinationFolder = 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\',

	[Parameter()]
	[ValidateRange(0, 300)]
	[int]$PauseSeconds = 3
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
		'Info'    { Write-Host $line -ForegroundColor Cyan }
		'Warning' { Write-Host $line -ForegroundColor Yellow }
		'Error'   { Write-Host $line -ForegroundColor Red }
		'Success' { Write-Host $line -ForegroundColor Green }
		'Debug'   {
			Write-Host $line -ForegroundColor Gray
			Write-Debug $Message
		}
	}
}

function Show-Banner {
	[CmdletBinding()]
	param()

	Write-Host '===============================================' -ForegroundColor DarkCyan
	Write-Host ' PF Evatec - MES Config Copy Tool' -ForegroundColor White
	Write-Host " Version: $ScriptVersion" -ForegroundColor White
	Write-Host '===============================================' -ForegroundColor DarkCyan
}

function Show-ExecutionSummary {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[datetime]$StartTime
	)

	$duration = (Get-Date) - $StartTime
	Write-Host ''
	Write-Host '============== Execution Summary ==============' -ForegroundColor DarkCyan
	Write-Host ('Runtime : {0:hh\:mm\:ss}' -f $duration) -ForegroundColor White
	Write-Host ('Info    : {0}' -f $script:Stats.Info) -ForegroundColor Cyan
	Write-Host ('Warning : {0}' -f $script:Stats.Warning) -ForegroundColor Yellow
	Write-Host ('Error   : {0}' -f $script:Stats.Error) -ForegroundColor Red
	Write-Host ('Success : {0}' -f $script:Stats.Success) -ForegroundColor Green
	Write-Host ('Debug   : {0}' -f $script:Stats.Debug) -ForegroundColor Gray
	Write-Host '===============================================' -ForegroundColor DarkCyan
}

try {
	Show-Banner
	Write-Log -Level Info -Message 'Starting MES configuration copy...'

	if (-not (Test-Path -Path $SourcePath -PathType Leaf)) {
		throw "Source configuration file not found: $SourcePath"
	}

	if (-not (Test-Path -Path $DestinationFolder -PathType Container)) {
		Write-Log -Level Warning -Message "Destination folder not found. Creating: $DestinationFolder"
		$null = New-Item -Path $DestinationFolder -ItemType Directory -Force -ErrorAction Stop
		Write-Log -Level Success -Message 'Destination folder created.'
	}

	$destinationPath = Join-Path -Path $DestinationFolder -ChildPath (Split-Path -Path $SourcePath -Leaf)
	Write-Log -Level Debug -Message "Source: $SourcePath"
	Write-Log -Level Debug -Message "Destination: $destinationPath"

	Write-Progress -Activity 'MES Configuration Copy' -Status 'Copying Components.config' -PercentComplete 60
	if ($PSCmdlet.ShouldProcess($destinationPath, 'Copy Components.config')) {
		Copy-Item -Path $SourcePath -Destination $DestinationFolder -Force -ErrorAction Stop
		Write-Log -Level Success -Message 'Updated MES configuration moved to MES Server folder.'
	} else {
		Write-Log -Level Warning -Message 'Copy operation skipped by ShouldProcess (-WhatIf / -Confirm).'
	}

	if ($PauseSeconds -gt 0) {
		Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
		Start-Sleep -Seconds $PauseSeconds
	}

	Write-Progress -Activity 'MES Configuration Copy' -Status 'Completed' -PercentComplete 100
}
catch {
	Write-Log -Level Error -Message "Critical failure: $($_.Exception.Message)"
	exit 1
}
finally {
	Write-Progress -Activity 'MES Configuration Copy' -Completed
	Show-ExecutionSummary -StartTime $script:StartTime
}