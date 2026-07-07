#requires -Version 5.1

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ScriptsPath = "C:\repos\pf-evatec\peer-factory-evatec-2026-q2\docs\qa-documents\setup-scripts\install",

    [Parameter()]
    [switch]$Apply
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$renameMap = [ordered]@{
    "1 - Install the latest PF Evatec silent - broken don't run.ps1" = "install-latest-pf-evatec-silent-disabled.ps1"
    "2 - Update MES Config File.ps1" = "update-mes-config-file.ps1"
    "3 - Don't run this - Move the modified MES configuration to MES - Server folder.ps1" = "move-modified-mes-config-to-mes-server-disabled.ps1"
    "4 - Move the Web UI AppSettings file - broken don't run.ps1" = "move-web-ui-appsettings-file-disabled.ps1"
    "Optional - Clear Browser Cache.ps1" = "clear-browser-cache-optional.ps1"
}

if (-not (Test-Path -LiteralPath $ScriptsPath -PathType Container)) {
    throw "Scripts path not found: $ScriptsPath"
}

Write-Host "Scripts path: $ScriptsPath"
Write-Host "Mode: $(if ($Apply) { 'Apply' } else { 'Dry-run' })"

foreach ($item in $renameMap.GetEnumerator()) {
    $oldPath = Join-Path -Path $ScriptsPath -ChildPath $item.Key
    $newPath = Join-Path -Path $ScriptsPath -ChildPath $item.Value

    if (-not (Test-Path -LiteralPath $oldPath -PathType Leaf)) {
        Write-Warning "Missing source: $($item.Key)"
        continue
    }

    if (Test-Path -LiteralPath $newPath -PathType Leaf) {
        Write-Warning "Target already exists: $($item.Value)"
        continue
    }

    if ($Apply) {
        Rename-Item -LiteralPath $oldPath -NewName $item.Value -ErrorAction Stop
        Write-Host "Renamed: '$($item.Key)' -> '$($item.Value)'"
    }
    else {
        Write-Host "Would rename: '$($item.Key)' -> '$($item.Value)'"
    }
}

Write-Host "Done."