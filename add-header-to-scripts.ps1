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

$header = @'
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
'@

$headerMarker = "Copyright (C) The PEER Group Inc., 2026."

if (-not (Test-Path -LiteralPath $ScriptsPath -PathType Container)) {
    throw "Scripts path not found: $ScriptsPath"
}

$files = Get-ChildItem -LiteralPath $ScriptsPath -File -Filter "*.ps1"

if (-not $files) {
    Write-Warning "No .ps1 files found in: $ScriptsPath"
    return
}

Write-Host "Scripts path: $ScriptsPath"
Write-Host ("Mode: " + ($(if ($Apply) { "Apply" } else { "Dry-run" })))

foreach ($file in $files) {
    $originalContent = Get-Content -LiteralPath $file.FullName -Raw -ErrorAction Stop

    if ($originalContent -match [regex]::Escape($headerMarker)) {
        Write-Host "Skipping (header exists): $($file.Name)"
        continue
    }

    $newContent = $header + [Environment]::NewLine + [Environment]::NewLine + $originalContent

    if ($Apply) {
        Set-Content -LiteralPath $file.FullName -Value $newContent -Encoding UTF8 -ErrorAction Stop
        Write-Host "Header added: $($file.Name)"
    }
    else {
        Write-Host "Would add header: $($file.Name)"
    }
}

Write-Host "Done."