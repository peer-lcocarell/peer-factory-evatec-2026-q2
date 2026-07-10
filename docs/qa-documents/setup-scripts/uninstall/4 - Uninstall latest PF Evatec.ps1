
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
    Silently installs the latest PF Evatec version directly from a release-build share.

.DESCRIPTION
    Resolves the newest release folder from the configured build share, then runs msiexec
    against the PEER Factory ECL Server MSI. Supports WhatIf and Confirm for safe execution
    in automated pipelines.

.PARAMETER InstallerPath
    Optional direct path to an MSI installer. If supplied, build-share discovery is skipped.

.PARAMETER BuildRootPath
    Root UNC path that contains release build folders.

.PARAMETER InstallerRelativePath
    Relative installer path under the selected release folder.

.PARAMETER ProductKey
    Optional PIDKEY passed to msiexec.

.PARAMETER InstallLevel
    INSTALLLEVEL passed to msiexec.

.PARAMETER MsiLogPath
    Path for verbose MSI install logging. Default: C:\temp\pf-evatec-install.log

.PARAMETER PauseSeconds
    Optional pause after the installation completes. Default: 0 (no pause).

.EXAMPLE
    .\install-latest-pf-evatec-silent-disabled.ps1

.EXAMPLE
    .\install-latest-pf-evatec-silent-disabled.ps1 -BuildRootPath '\\peergroup.com\Files\Services\PF\Evatec\Builds\Release Builds' -WhatIf

.NOTES
    Requires: Local administrator rights.
    Assumption: Build folders under BuildRootPath are sortable by LastWriteTime.
    The -disabled suffix indicates this script is not part of the default automated sequence.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$InstallerPath,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$BuildRootPath = '\\peergroup.com\Files\Services\PF\Evatec\Builds\Release Builds',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$InstallerRelativePath = 'Installers\PEER Factory ECL Server.msi',

    [Parameter()]
    [string]$ProductKey,

    [Parameter()]
    [ValidateRange(1, 65535)]
    [int]$InstallLevel = 1000,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$MsiLogPath = 'C:\temp\pf-evatec-install.log',

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

function Resolve-InstallerPath {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$DirectInstallerPath,

        [Parameter(Mandatory)]
        [string]$ReleaseBuildRoot,

        [Parameter(Mandatory)]
        [string]$RelativeInstallerPath
    )

    if ($DirectInstallerPath) {
        if (-not (Test-Path -Path $DirectInstallerPath -PathType Leaf)) {
            throw "Installer not found at direct path: $DirectInstallerPath"
        }

        return [PSCustomObject]@{
            InstallerPath = $DirectInstallerPath
            BuildFolder   = Split-Path -Path $DirectInstallerPath -Parent
        }
    }

    if (-not (Test-Path -Path $ReleaseBuildRoot -PathType Container)) {
        throw "Build root path not found: $ReleaseBuildRoot"
    }

    $latestBuild = Get-ChildItem -Path $ReleaseBuildRoot -Directory -ErrorAction Stop |
        Sort-Object -Property LastWriteTime -Descending |
        Select-Object -First 1

    if (-not $latestBuild) {
        throw "No build folders were found under: $ReleaseBuildRoot"
    }

    $resolvedInstaller = Join-Path -Path $latestBuild.FullName -ChildPath $RelativeInstallerPath
    if (-not (Test-Path -Path $resolvedInstaller -PathType Leaf)) {
        throw "Installer not found in latest build folder: $resolvedInstaller"
    }

    return [PSCustomObject]@{
        InstallerPath = $resolvedInstaller
        BuildFolder   = $latestBuild.FullName
    }
}

function Invoke-MsiInstall {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ResolvedInstallerPath,

        [Parameter(Mandatory)]
        [ValidateRange(1, 65535)]
        [int]$ResolvedInstallLevel,

        [Parameter()]
        [string]$ResolvedProductKey,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ResolvedMsiLogPath
    )

    $logFolder = Split-Path -Path $ResolvedMsiLogPath -Parent
    if ($logFolder -and -not (Test-Path -Path $logFolder -PathType Container)) {
        $null = New-Item -Path $logFolder -ItemType Directory -Force -ErrorAction Stop
    }

    $msiArguments = @(
        '/i'
        ('"{0}"' -f $ResolvedInstallerPath)
        '/qn'
        ('INSTALLLEVEL={0}' -f $ResolvedInstallLevel)
        '/L*v'
        ('"{0}"' -f $ResolvedMsiLogPath)
    )

    if ($ResolvedProductKey) {
        $msiArguments += ('PIDKEY={0}' -f $ResolvedProductKey)
    }

    $target = "msiexec.exe $($msiArguments -join ' ')"
    if (-not $PSCmdlet.ShouldProcess($ResolvedInstallerPath, "Install latest PF Evatec via $target")) {
        Write-Log -Level Warning -Message 'Installation skipped by ShouldProcess (-WhatIf / -Confirm).'
        return
    }

    Write-Log -Level Info -Message "Launching msiexec for silent installation. Log: $ResolvedMsiLogPath"
    $process = Start-Process -FilePath 'msiexec.exe' -ArgumentList $msiArguments -Wait -PassThru -ErrorAction Stop

    if ($process.ExitCode -eq 0) {
        Write-Log -Level Success -Message 'PF Evatec silent installation completed successfully.'
        return
    }

    if ($process.ExitCode -eq 3010) {
        Write-Log -Level Warning -Message 'PF Evatec installation completed successfully but requires a reboot (3010).'
        return
    }

    if ($process.ExitCode -eq 1641) {
        Write-Log -Level Warning -Message 'PF Evatec installation completed successfully and initiated reboot (1641).'
        return
    }

    throw "msiexec exited with non-zero exit code: $($process.ExitCode). See log: $ResolvedMsiLogPath"
}

try {
    Write-Log -Level Info -Message 'Starting PF Evatec silent installation workflow...'

    $resolved = Resolve-InstallerPath -DirectInstallerPath $InstallerPath -ReleaseBuildRoot $BuildRootPath -RelativeInstallerPath $InstallerRelativePath
    $resolvedInstallerPath = $resolved.InstallerPath
    Write-Log -Level Info -Message "Resolved build folder: $($resolved.BuildFolder)"
    Write-Log -Level Info -Message "Resolved installer path: $resolvedInstallerPath"

    Invoke-MsiInstall -ResolvedInstallerPath $resolvedInstallerPath -ResolvedInstallLevel $InstallLevel -ResolvedProductKey $ProductKey -ResolvedMsiLogPath $MsiLogPath -Confirm:$false

    if ($PauseSeconds -gt 0) {
        Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "Installation failed: $($_.Exception.Message)"
    exit 1
}
