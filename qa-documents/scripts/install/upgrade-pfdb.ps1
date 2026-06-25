
#requires -Version 5.1
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$PeerGroupRoot = "C:\Program Files\PEER Group",

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$SqlInstance = "EVATEC2012R2QA4\SQLEXPRESS2017",

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$TempPath = "C:\temp",

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$WriteDomainUser = "EVATEC2012R2QA4\Administrator",

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$ReadDomainUser = "EVATEC2012R2QA4\Administrator",

	[Parameter()]
	[switch]$Wait
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Script metadata
$ScriptVersion = "1.1.0"
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
		[ValidateSet("Info", "Warning", "Error", "Success", "Debug")]
		[string]$Level,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$Message
	)

	$script:Stats[$Level]++
	$timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
	$line = "[$timestamp] [$($Level.ToUpper())] $Message"

	switch ($Level) {
		"Info"    { Write-Host $line -ForegroundColor Cyan }
		"Warning" { Write-Host $line -ForegroundColor Yellow }
		"Error"   { Write-Host $line -ForegroundColor Red }
		"Success" { Write-Host $line -ForegroundColor Green }
		"Debug"   {
			Write-Host $line -ForegroundColor Gray
			Write-Debug $Message
		}
	}
}

function Show-Banner {
	[CmdletBinding()]
	param()

	Write-Host "===============================================" -ForegroundColor DarkCyan
	Write-Host " PF Evatec - PFDB Upgrade Launcher" -ForegroundColor White
	Write-Host " Version: $ScriptVersion" -ForegroundColor White
	Write-Host "===============================================" -ForegroundColor DarkCyan
}

function Get-LatestInstallFolder {
	<#
	.SYNOPSIS
	Gets the latest created PEER Group installation folder.

	.PARAMETER RootPath
	Root path under which versioned PEER Group folders are expected.

	.OUTPUTS
	System.IO.DirectoryInfo
	#>
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$RootPath
	)

	if (-not (Test-Path -Path $RootPath -PathType Container)) {
		throw "Root path not found: $RootPath"
	}

	$latestFolder = Get-ChildItem -Path $RootPath -Directory -ErrorAction Stop |
		Sort-Object -Property CreationTime -Descending |
		Select-Object -First 1

	if (-not $latestFolder) {
		throw "No installation folders found under: $RootPath"
	}

	return $latestFolder
}

function Start-PfdbUpgrade {
	<#
	.SYNOPSIS
	Starts UpgradeDataModel.bat in the latest installation scripts folder.

	.PARAMETER ScriptsPath
	Full path to the Database\Scripts directory.

	.PARAMETER SqlInstance
	SQL Server instance value passed to UpgradeDataModel.bat.

	.PARAMETER TempPath
	Temporary path argument passed to UpgradeDataModel.bat.

	.PARAMETER WriteDomainUser
	Domain user argument for write domain users.

	.PARAMETER ReadDomainUser
	Domain user argument for read domain users.

	.PARAMETER Wait
	If specified, waits for the batch file to complete and validates exit code.
	#>
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$ScriptsPath,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$SqlInstance,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$TempPath,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$WriteDomainUser,

		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$ReadDomainUser,

		[Parameter()]
		[switch]$Wait
	)

	$batchPath = Join-Path -Path $ScriptsPath -ChildPath "UpgradeDataModel.bat"
	if (-not (Test-Path -Path $batchPath -PathType Leaf)) {
		throw "UpgradeDataModel.bat not found at: $batchPath"
	}

	$arguments = @($SqlInstance, $TempPath, $WriteDomainUser, $ReadDomainUser)
	Write-Log -Level Info -Message "Launching upgrade batch: $batchPath"
	Write-Log -Level Debug -Message ("Arguments: " + ($arguments -join " "))

	if (-not $PSCmdlet.ShouldProcess($batchPath, "Start UpgradeDataModel.bat")) {
		Write-Log -Level Warning -Message "Execution skipped by ShouldProcess (-WhatIf / -Confirm)."
		return $null
	}

	$process = Start-Process -FilePath $batchPath -ArgumentList $arguments -WorkingDirectory $ScriptsPath -PassThru -ErrorAction Stop

	if ($Wait) {
		Write-Log -Level Info -Message "Waiting for upgrade process (PID: $($process.Id)) to complete..."
		$process.WaitForExit()

		if ($process.ExitCode -ne 0) {
			throw "Upgrade process failed with exit code $($process.ExitCode)."
		}

		Write-Log -Level Success -Message "Upgrade process completed with exit code 0."
	} else {
		Write-Log -Level Success -Message "Upgrade process started successfully (PID: $($process.Id))."
	}

	return $process
}

function Show-ExecutionSummary {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[datetime]$StartTime
	)

	$duration = (Get-Date) - $StartTime
	Write-Host ""
	Write-Host "============== Execution Summary ==============" -ForegroundColor DarkCyan
	Write-Host ("Runtime : {0:hh\:mm\:ss}" -f $duration) -ForegroundColor White
	Write-Host ("Info    : {0}" -f $script:Stats.Info) -ForegroundColor Cyan
	Write-Host ("Warning : {0}" -f $script:Stats.Warning) -ForegroundColor Yellow
	Write-Host ("Error   : {0}" -f $script:Stats.Error) -ForegroundColor Red
	Write-Host ("Success : {0}" -f $script:Stats.Success) -ForegroundColor Green
	Write-Host ("Debug   : {0}" -f $script:Stats.Debug) -ForegroundColor Gray
	Write-Host "===============================================" -ForegroundColor DarkCyan
}

try {
	Show-Banner
	Write-Log -Level Info -Message "Starting PFDB upgrade launcher..."

	if (-not (Test-Path -Path $TempPath -PathType Container)) {
		Write-Log -Level Warning -Message "Temp path not found. Creating: $TempPath"
		$null = New-Item -Path $TempPath -ItemType Directory -Force -ErrorAction Stop
		Write-Log -Level Success -Message "Temp path created."
	}

	Write-Progress -Activity "PFDB Upgrade" -Status "Locating latest install folder" -PercentComplete 15
	$latestFolder = Get-LatestInstallFolder -RootPath $PeerGroupRoot
	Write-Log -Level Info -Message "Latest install folder: $($latestFolder.FullName)"

	$scriptsPath = Join-Path -Path $latestFolder.FullName -ChildPath "Database\Scripts"
	if (-not (Test-Path -Path $scriptsPath -PathType Container)) {
		throw "Database scripts folder not found: $scriptsPath"
	}

	Write-Progress -Activity "PFDB Upgrade" -Status "Launching UpgradeDataModel.bat" -PercentComplete 55
	$null = Start-PfdbUpgrade -ScriptsPath $scriptsPath -SqlInstance $SqlInstance -TempPath $TempPath -WriteDomainUser $WriteDomainUser -ReadDomainUser $ReadDomainUser -Wait:$Wait

	Write-Progress -Activity "PFDB Upgrade" -Status "Completed" -PercentComplete 100
	Write-Log -Level Success -Message "PFDB upgrade launcher finished successfully."
}
catch {
	Write-Log -Level Error -Message "Critical failure: $($_.Exception.Message)"
	exit 1
}
finally {
	Write-Progress -Activity "PFDB Upgrade" -Completed
	Show-ExecutionSummary -StartTime $script:StartTime
}




