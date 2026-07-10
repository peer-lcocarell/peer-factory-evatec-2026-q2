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
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
param(
  [Parameter()]
  [ValidateNotNullOrEmpty()]
  [string]$Url = "https://$($env:COMPUTERNAME)/home",

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

  $line = "[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level.ToUpper(), $Message
  switch ($Level) {
    'Info' { Write-Information $line -InformationAction Continue }
    'Warning' { Write-Warning $line }
    'Error' { Write-Error $line }
    'Success' { Write-Information $line -InformationAction Continue }
  }
}

try {
  Write-Log -Level Info -Message 'Starting PF application launch workflow...'

  if (-not [Environment]::UserInteractive) {
    Write-Log -Level Warning -Message 'Non-interactive session detected. Browser launch is skipped.'
    return
  }

  $null = [Uri]::new($Url)

  $chromeCandidates = @(
    'C:\Program Files\Google\Chrome\Application\chrome.exe',
    'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
  )
  $chromePath = $chromeCandidates | Where-Object { Test-Path -Path $_ -PathType Leaf } | Select-Object -First 1

  if ($chromePath) {
    if ($PSCmdlet.ShouldProcess($chromePath, "Open URL $Url")) {
      Start-Process -FilePath $chromePath -ArgumentList $Url -ErrorAction Stop
      Write-Log -Level Success -Message 'PF Evatec web application opened in Chrome.'
    } else {
      Write-Log -Level Warning -Message 'Launch skipped by ShouldProcess (-WhatIf / -Confirm).'
    }
  } else {
    Write-Log -Level Warning -Message 'Chrome not found, opening URL with the system default browser.'
    if ($PSCmdlet.ShouldProcess($Url, 'Open URL with default browser')) {
      Start-Process -FilePath $Url -ErrorAction Stop
      Write-Log -Level Success -Message 'PF Evatec web application opened with default browser.'
    } else {
      Write-Log -Level Warning -Message 'Launch skipped by ShouldProcess (-WhatIf / -Confirm).'
    }
  }

  if ($PauseSeconds -gt 0) {
    Start-Sleep -Seconds $PauseSeconds
  }
}
catch {
  Write-Log -Level Error -Message "Application launch failed: $($_.Exception.Message)"
  exit 1
}






