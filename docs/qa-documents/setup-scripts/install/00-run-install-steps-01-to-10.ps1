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
[CmdletBinding()]
param(
    [Parameter()]
    [switch]$WhatIf,

    [Parameter()]
    [switch]$ContinueOnError,

    [Parameter()]
    [ValidateRange(0, 60)]
    [int]$PauseBetweenSteps = 0,

    [Parameter()]
    [switch]$SkipServiceAccountUpdate,

    [Parameter()]
    [switch]$PromptForServicePassword,

    [Parameter()]
    [System.Security.SecureString]$ServiceAccountPassword,

    [Parameter()]
    [switch]$SkipOpenBrowser
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Log {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Info', 'Warning', 'Error', 'Success')]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Message
    )

    $line = "[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message
    switch ($Level) {
        'Info'    { Write-Information $line -InformationAction Continue }
        'Warning' { Write-Warning $line }
        'Error'   { Write-Information $line -InformationAction Continue }
        'Success' { Write-Information $line -InformationAction Continue }
    }
}

function Invoke-Step {
    param(
        [Parameter(Mandatory)]
        [string]$StepName,

        [Parameter(Mandatory)]
        [string]$ScriptPath,

        [Parameter()]
        [hashtable]$StepOptions = @{}
    )

    if (-not (Test-Path -Path $ScriptPath -PathType Leaf)) {
        throw "Required script not found: $ScriptPath"
    }

    Write-Log -Level Info -Message "Running $StepName -> $ScriptPath"

    if ($WhatIf) {
        $StepOptions['WhatIf'] = $true
    }

    # Pass explicit Confirm:false to avoid interactive prompts from child scripts.
    $StepOptions['Confirm'] = $false

    & $ScriptPath @StepOptions
    Write-Log -Level Success -Message "$StepName completed."
}

try {
    Write-Log -Level Info -Message 'Starting master install flow (steps 01 to 10)...'

    $root = $PSScriptRoot

    $steps = @(
        @{ Name = '01 Install Latest PF Evatec'; Script = '01-install-latest-pf-evatec-silent.ps1'; Skip = $false },
        @{ Name = '02 Run DB Upgrade'; Script = '02-run-db-upgrade.ps1'; Skip = $false },
        @{ Name = '03 Update WebUI Appsettings'; Script = '03-update-webui-appsettings.ps1'; Skip = $false },
        @{ Name = '04 Update gRPC Config'; Script = '04-update-grpc-config.ps1'; Skip = $false },
        @{ Name = '05 Update MES Config'; Script = '05-update-mes-config-file.ps1'; Skip = $false },
        @{ Name = '06 Update Service Account'; Script = '06-update-service-account.ps1'; Skip = [bool]$SkipServiceAccountUpdate },
        @{ Name = '07 Restart IIS'; Script = '07-restart-iis.ps1'; Skip = $false },
        @{ Name = '08 Start PF Service'; Script = '08-start-pf-service.ps1'; Skip = $false },
        @{ Name = '09 Start EDP Service'; Script = '09-start-edp-service.ps1'; Skip = $false },
        @{ Name = '10 Open PF Application'; Script = '10-open-pf-application-chrome.ps1'; Skip = [bool]$SkipOpenBrowser }
    )

    foreach ($step in $steps) {
        if ($step.Skip) {
            Write-Log -Level Warning -Message "Skipping $($step.Name)."
            continue
        }

        $scriptPath = Join-Path -Path $root -ChildPath $step.Script
        $stepOptions = @{}

        if ($step.Script -eq '06-update-service-account.ps1') {
            if ($ServiceAccountPassword) {
                $stepOptions['SecurePassword'] = $ServiceAccountPassword
            }
            elseif ($PromptForServicePassword) {
                $stepOptions['AllowInteractivePrompt'] = $true
            }
            else {
                throw 'Step 06 requires a password. Use -ServiceAccountPassword, or use -PromptForServicePassword, or pass -SkipServiceAccountUpdate.'
            }
        }

        try {
            Invoke-Step -StepName $step.Name -ScriptPath $scriptPath -StepOptions $stepOptions
        }
        catch {
            Write-Log -Level Error -Message "$($step.Name) failed: $($_.Exception.Message)"
            if (-not $ContinueOnError) {
                throw
            }
        }

        if ($PauseBetweenSteps -gt 0) {
            Start-Sleep -Seconds $PauseBetweenSteps
        }
    }

    Write-Log -Level Success -Message 'Master install flow finished.'
}
catch {
    Write-Log -Level Error -Message "Master install flow failed: $($_.Exception.Message)"
    exit 1
}
