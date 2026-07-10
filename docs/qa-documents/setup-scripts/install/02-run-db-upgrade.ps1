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
<#!
.SYNOPSIS
    Runs the PF Evatec database upgrade batch script from the installed build.

.DESCRIPTION
    Resolves the installed PEER Factory ECL folder (latest by default), locates
    Database\Scripts\UpgradeDataModel.bat, and executes it with the standard
    VM parameters used in the release guide.

.PARAMETER InstalledBuildPath
    Optional full path to the installed PEER Factory ECL folder.

.PARAMETER InstallRoot
    Root path where PEER Factory ECL folders are installed.

.PARAMETER BuildFolderPattern
    Folder name pattern to locate installed builds.

.PARAMETER SqlInstance
    SQL instance passed to UpgradeDataModel.bat.

.PARAMETER TempFolder
    Output/temp folder passed to UpgradeDataModel.bat.

.PARAMETER DbUser
    User argument passed to UpgradeDataModel.bat.

.PARAMETER DbPassword
    Password argument passed to UpgradeDataModel.bat.

.PARAMETER EnableTranscript
    When true, starts a PowerShell transcript for the run. Default: true.

.PARAMETER TranscriptPath
    Transcript log path used when EnableTranscript is true.

.EXAMPLE
    .\run-db-upgrade.ps1

.EXAMPLE
    .\run-db-upgrade.ps1 -InstalledBuildPath 'C:\Program Files\PEER Group\PEER Factory ECL 2.10'
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
    [Parameter()]
    [string]$InstalledBuildPath,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$InstallRoot = 'C:\Program Files\PEER Group',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$BuildFolderPattern = 'PEER Factory ECL*',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$SqlInstance = 'PF-WSC19-QA1\SQLEXPRESS',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TempFolder = 'C:\temp',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$DbUser = 'PEERGROUP\vstsbuild',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$DbPassword = 'PEERGROUP\vstsbuild',

    [Parameter()]
    [bool]$EnableTranscript = $true,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TranscriptPath = 'C:\temp\db-upgrade-transcript.log'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$transcriptStarted = $false

function Write-Log {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Info', 'Warning', 'Error', 'Success')]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Message
    )

    $line = "[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message
    $color = switch ($Level) {
        'Info'    { 'Cyan' }
        'Warning' { 'Yellow' }
        'Error'   { 'Red' }
        'Success' { 'Green' }
    }

    Write-Host $line -ForegroundColor $color
}

function Resolve-InstalledBuildPath {
    param(
        [string]$DirectPath,
        [string]$Root,
        [string]$Pattern
    )

    if (-not [string]::IsNullOrWhiteSpace($DirectPath)) {
        if (-not (Test-Path -Path $DirectPath -PathType Container)) {
            throw "Installed build path not found: $DirectPath"
        }

        return (Resolve-Path -Path $DirectPath).Path
    }

    if (-not (Test-Path -Path $Root -PathType Container)) {
        throw "Install root not found: $Root"
    }

    $latest = Get-ChildItem -Path $Root -Directory -ErrorAction Stop |
        Where-Object { $_.Name -like $Pattern } |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1

    if (-not $latest) {
        throw "No installed build folders matching '$Pattern' were found under: $Root"
    }

    return $latest.FullName
}

try {
    if ($EnableTranscript) {
        $transcriptFolder = Split-Path -Path $TranscriptPath -Parent
        if ($transcriptFolder -and -not (Test-Path -Path $transcriptFolder -PathType Container)) {
            $null = New-Item -Path $transcriptFolder -ItemType Directory -Force -ErrorAction Stop
        }

        Start-Transcript -Path $TranscriptPath -Force | Out-Null
        $transcriptStarted = $true
    }

    Write-Log -Level Info -Message 'Starting DB upgrade workflow...'

    $resolvedBuildPath = Resolve-InstalledBuildPath -DirectPath $InstalledBuildPath -Root $InstallRoot -Pattern $BuildFolderPattern
    $scriptsPath = Join-Path -Path $resolvedBuildPath -ChildPath 'Database\Scripts'
    $upgradeBat = Join-Path -Path $scriptsPath -ChildPath 'UpgradeDataModel.bat'

    Write-Log -Level Info -Message "Resolved installed build path: $resolvedBuildPath"
    Write-Log -Level Info -Message "Resolved database scripts path: $scriptsPath"

    if (-not (Test-Path -Path $upgradeBat -PathType Leaf)) {
        throw "Upgrade script not found: $upgradeBat"
    }

    if (-not (Test-Path -Path $TempFolder -PathType Container)) {
        $null = New-Item -Path $TempFolder -ItemType Directory -Force -ErrorAction Stop
    }

    $argsForBat = @($SqlInstance, $TempFolder, $DbUser, $DbPassword)
    $preview = "$upgradeBat $($argsForBat -join ' ')"

    if (-not $PSCmdlet.ShouldProcess($upgradeBat, "Run database upgrade via $preview")) {
        Write-Log -Level Warning -Message 'DB upgrade skipped by ShouldProcess (-WhatIf / -Confirm).'
        exit 0
    }

    Write-Log -Level Info -Message "Executing: $preview"

    Push-Location -Path $scriptsPath
    try {
        $batchOutput = & $upgradeBat @argsForBat 2>&1
        $exitCode = $LASTEXITCODE
    }
    finally {
        Pop-Location
    }

    foreach ($line in $batchOutput) {
        Write-Host $line
    }

    $sqlPathErrors = $batchOutput | Where-Object {
        $_ -match 'Sqlcmd:\s*Error:' -or $_ -match "Sqlcmd:\s*'.*':\s*Invalid filename\."
    }
    if ($sqlPathErrors) {
        throw 'Database upgrade reported sqlcmd file/path errors. Verify the upgrade script is run from the Database\\Scripts folder and required SQL files exist.'
    }

    Write-Log -Level Info -Message "UpgradeDataModel.bat exit code: $exitCode"
    if ($exitCode -ne 0) {
        throw "Database upgrade failed with exit code: $exitCode"
    }

    Write-Log -Level Success -Message 'Database upgrade completed successfully.'

    Write-Log -Level Info -Message "Recent files in ${TempFolder}:"
    Get-ChildItem -Path $TempFolder -File -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 10 Name, LastWriteTime, Length |
        Format-Table -AutoSize
}
catch {
    Write-Log -Level Error -Message "DB upgrade failed: $($_.Exception.Message)"
    exit 1
}
finally {
    if ($transcriptStarted) {
        Stop-Transcript | Out-Null
    }
}
