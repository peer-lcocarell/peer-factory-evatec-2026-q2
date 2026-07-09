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
    Silently installs the latest PF Evatec version using a batch launcher.

.DESCRIPTION
    Launches the silent PF Evatec installer batch file and waits for it to complete.
    Supports WhatIf and Confirm for safe execution in automated pipelines.

.PARAMETER InstallerPath
    Full path to the silent installer batch file.
    Default: C:\Automation\Files\Install the latest PF Evatec - Silent.bat

.PARAMETER PauseSeconds
    Optional pause after the installation completes. Default: 0 (no pause).

.EXAMPLE
    .\install-latest-pf-evatec-silent-disabled.ps1

.EXAMPLE
    .\install-latest-pf-evatec-silent-disabled.ps1 -InstallerPath 'D:\Deploy\Install.bat' -WhatIf

.NOTES
    Requires: Local administrator rights.
    Assumption: The installer batch file is idempotent and safe to re-run.
    The -disabled suffix indicates this script is not part of the default automated sequence.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$InstallerPath = 'C:\Automation\Files\Install the latest PF Evatec - Silent.bat',

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

    $color = switch ($Level) {
        'Info'    { 'Cyan' }
        'Warning' { 'Yellow' }
        'Error'   { 'Red' }
        'Success' { 'Green' }
    }

    Write-Host ("[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message) -ForegroundColor $color
}

try {
    Write-Log -Level Info -Message 'Starting PF Evatec silent installation workflow...'

    if (-not (Test-Path -Path $InstallerPath -PathType Leaf)) {
        throw "Installer batch file not found: $InstallerPath"
    }

    if ($PSCmdlet.ShouldProcess($InstallerPath, 'Execute silent installer')) {
        Write-Log -Level Info -Message "Launching installer: $InstallerPath"
        $process = Start-Process -FilePath $InstallerPath -Wait -PassThru -ErrorAction Stop

        if ($process.ExitCode -ne 0) {
            throw "Installer exited with non-zero exit code: $($process.ExitCode)."
        }

        Write-Log -Level Success -Message 'PF Evatec silent installation completed successfully.'
    } else {
        Write-Log -Level Warning -Message 'Installation skipped by ShouldProcess (-WhatIf / -Confirm).'
    }

    if ($PauseSeconds -gt 0) {
        Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "Installation failed: $($_.Exception.Message)"
    exit 1
}

