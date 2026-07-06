param(
    [Parameter()]
    [string]$RepoRoot = "c:\repos\pf-evatec\peer-factory-evatec-2026-q2",

    [Parameter()]
    [switch]$Apply
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$installPath = Join-Path $RepoRoot "docs\qa-documents\scripts\install"

$renameMap = [ordered]@{
    "1 - Install the latest PF Evatec silent - broken don't run.ps1" = "install-latest-pf-evatec-silent-broken-do-not-run.ps1"
    "2 - Update MES Config File.ps1" = "update-mes-config-file.ps1"
    "3 - Don't run this - Move the modified MES configuration to MES - Server folder.ps1" = "move-modified-mes-configuration-to-mes-server-folder-do-not-run.ps1"
    "4 - Move the Web UI AppSettings file - broken don't run.ps1" = "move-web-ui-appsettings-file-broken-do-not-run.ps1"
    "Optional - Clear Browser Cache.ps1" = "clear-browser-cache-optional.ps1"
}

if (-not (Test-Path -LiteralPath $installPath -PathType Container)) {
    throw "Install folder not found: $installPath"
}

Write-Host "Mode: $([string]::new('D','r','y','-','R','u','n'))"
if ($Apply) { Write-Host "Mode: Apply" }

foreach ($pair in $renameMap.GetEnumerator()) {
    $oldName = $pair.Key
    $newName = $pair.Value

    $oldPath = Join-Path $installPath $oldName
    $newPath = Join-Path $installPath $newName

    if (-not (Test-Path -LiteralPath $oldPath -PathType Leaf)) {
        Write-Warning "Missing source: $oldName"
        continue
    }

    if (Test-Path -LiteralPath $newPath -PathType Leaf) {
        Write-Warning "Target already exists: $newName"
        continue
    }

    if ($Apply) {
        Rename-Item -LiteralPath $oldPath -NewName $newName -ErrorAction Stop
        Write-Host "Renamed: '$oldName' -> '$newName'"
    }
    else {
        Write-Host "Would rename: '$oldName' -> '$newName'"
    }
}

$patterns = @("*.md", "*.ps1")
$files = Get-ChildItem -Path $RepoRoot -Recurse -File | Where-Object {
    $name = $_.Name.ToLowerInvariant()
    $patterns | ForEach-Object { $name -like $_ } | Where-Object { $_ } | Measure-Object | Select-Object -ExpandProperty Count
}

foreach ($file in $files) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    $updated = $content

    foreach ($pair in $renameMap.GetEnumerator()) {
        $updated = $updated.Replace($pair.Key, $pair.Value)
    }

    if ($updated -ne $content) {
        if ($Apply) {
            Set-Content -LiteralPath $file.FullName -Value $updated -Encoding utf8
            Write-Host "Updated refs: $($file.FullName)"
        }
        else {
            Write-Host "Would update refs: $($file.FullName)"
        }
    }
}

Write-Host "Done."