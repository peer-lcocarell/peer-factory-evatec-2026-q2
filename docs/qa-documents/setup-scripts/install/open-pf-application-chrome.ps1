
#requires -Version 5.1
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
param(
  [Parameter()]
  [ValidateNotNullOrEmpty()]
  [string]$Url = 'https://evatec2012r2qa4/home',

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
  Write-Log -Level Info -Message 'Starting PF application launch workflow...'

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





