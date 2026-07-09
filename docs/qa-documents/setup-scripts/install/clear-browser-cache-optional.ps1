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
    Clears the Chrome browser cache for a specified user profile.

.DESCRIPTION
    Removes selected Chrome cache files and data from the given profile folder.
    Supports WhatIf and Confirm for safe execution in automated pipelines.

.PARAMETER ProfilePath
    Full path to the Chrome user profile folder.
    Default: C:\Users\administrator.EVATEC\AppData\Local\Google\Chrome\User Data\Profile 3

.PARAMETER PauseSeconds
    Optional pause after cleanup. Default: 3.

.EXAMPLE
    .\clear-browser-cache-optional.ps1

.EXAMPLE
    .\clear-browser-cache-optional.ps1 -ProfilePath 'C:\Users\admin\AppData\Local\Google\Chrome\User Data\Default' -WhatIf

.NOTES
    Requires: Chrome must not be running when this script executes. Locked files will cause errors.
    This script is optional and intended for QA environment reset workflows.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ProfilePath = 'C:\Users\administrator.EVATEC\AppData\Local\Google\Chrome\User Data\Profile 3',

    [Parameter()]
    [ValidateRange(0, 300)]
    [int]$PauseSeconds = 3
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$cacheItems = @(
    'Archived History',
    'Cache\*',
    'Cookies',
    'History',
    'Login Data',
    'Top Sites',
    'Visited Links',
    'Web Data'
)

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
    Write-Log -Level Info -Message "Starting Chrome cache cleanup for profile: $ProfilePath"

    if (-not (Test-Path -Path $ProfilePath -PathType Container)) {
        Write-Log -Level Warning -Message "Chrome profile folder not found: $ProfilePath"
        return
    }

    foreach ($item in $cacheItems) {
        $fullPath = Join-Path -Path $ProfilePath -ChildPath $item
        if (Test-Path -Path $fullPath) {
            if ($PSCmdlet.ShouldProcess($fullPath, 'Remove cache item')) {
                Remove-Item -Path $fullPath -Recurse -Force -ErrorAction Stop
                Write-Log -Level Success -Message "Removed: $item"
            } else {
                Write-Log -Level Warning -Message "Skipped by ShouldProcess: $item"
            }
        } else {
            Write-Log -Level Info -Message "Not found, skipping: $item"
        }
    }

    Write-Log -Level Success -Message 'Chrome cache cleanup completed.'

    if ($PauseSeconds -gt 0) {
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "Cache cleanup failed: $($_.Exception.Message)"
    exit 1
}

