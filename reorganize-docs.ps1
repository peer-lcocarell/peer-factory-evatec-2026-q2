# ...existing code...
function Invoke-RepoMove {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$SourcePath,
        [Parameter(Mandatory)][string]$DestinationPath,
        [Parameter(Mandatory)][string]$RootPath,
        [Parameter(Mandatory)][bool]$DoApply
    )

    if (-not (Test-Path -LiteralPath $SourcePath)) {
        Write-Warning "Missing source: $SourcePath"
        return
    }

    if (Test-Path -LiteralPath $DestinationPath) {
        Write-Warning "Destination exists, skipping: $DestinationPath"
        return
    }

    $destinationDirectory = Split-Path -Path $DestinationPath -Parent
    if (-not (Test-Path -LiteralPath $destinationDirectory -PathType Container)) {
        if ($DoApply) {
            New-Item -Path $destinationDirectory -ItemType Directory -Force | Out-Null
            Write-Host "Created: $destinationDirectory"
        }
        else {
            Write-Host "Would create: $destinationDirectory"
        }
    }

    if (-not $DoApply) {
        Write-Host "Would move: $SourcePath -> $DestinationPath"
        return
    }

    $useGitMove = $false
    try {
        $useGitMove = Test-IsGitTracked -RootPath $RootPath -PathToCheck $SourcePath
    }
    catch {
        $useGitMove = $false
    }

    if ($useGitMove) {
        $sourceRel = Get-RelativePath -RootPath $RootPath -ChildPath $SourcePath
        $destRel = Get-RelativePath -RootPath $RootPath -ChildPath $DestinationPath

        & git -C $RootPath mv -- "$sourceRel" "$destRel"

        if ($LASTEXITCODE -eq 0) {
            Write-Host "Moved (git): $SourcePath -> $DestinationPath"
            return
        }

        Write-Warning "git mv failed; falling back to filesystem move: $SourcePath"
    }

    Move-Item -LiteralPath $SourcePath -Destination $DestinationPath -Force -ErrorAction Stop
    Write-Host "Moved (filesystem): $SourcePath -> $DestinationPath"
}
# ...existing code...