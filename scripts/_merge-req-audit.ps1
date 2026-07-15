param(
    [string]$TestCasesDir
)

# Ensure path uses \\?\ prefix for long-path support
if (-not $TestCasesDir.StartsWith('\\?\')) {
    $TestCasesDir = '\\?\' + $TestCasesDir.TrimStart('\')
}

# Use .NET IO for long-path compatibility
foreach ($dir in [System.IO.Directory]::GetDirectories($TestCasesDir)) {
    # Re-apply the long-path prefix if GetDirectories stripped it
    if (-not $dir.StartsWith('\\?\')) {
        $dir = '\\?\' + $dir.TrimStart('\')
    }

    $id        = [System.IO.Path]::GetFileName($dir) -replace 'requirement-', ''
    $reqFile   = $dir + '\' + "req-$id.md"
    $auditFile = $dir + '\' + "req-$id-audit.md"

    if (-not [IO.File]::Exists($reqFile) -or -not [IO.File]::Exists($auditFile)) { continue }

    $reqContent   = [IO.File]::ReadAllText($reqFile,   [Text.Encoding]::UTF8)
    $auditContent = [IO.File]::ReadAllText($auditFile, [Text.Encoding]::UTF8)

    if ([string]::IsNullOrWhiteSpace($reqContent)) {
        [IO.File]::Delete($reqFile)
        Write-Host "DELETED  (empty)     req-$id.md"
        continue
    }

    if ($reqContent.Trim() -eq $auditContent.Trim()) {
        [IO.File]::Delete($reqFile)
        Write-Host "DELETED  (duplicate) req-$id.md"
        continue
    }

    $merged = $auditContent.TrimEnd() + "`n`n---`n`n" + $reqContent.TrimEnd() + "`n"
    [IO.File]::WriteAllText($auditFile, $merged, [Text.Encoding]::UTF8)
    [IO.File]::Delete($reqFile)
    Write-Host "MERGED               req-$id.md  ->  req-$id-audit.md"
}
