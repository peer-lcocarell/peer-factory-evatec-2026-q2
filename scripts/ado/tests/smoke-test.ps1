Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
Import-Module (Join-Path $root 'pf-evatec-ado-publisher.psm1') -Force

$tmp = [System.IO.Path]::GetTempFileName() + '.md'
$md = @'
# 286067 Magnet Systems - Create New Magnet

## Requirement

CR: 286067  Ticket: 35008

## Preconditions

- Logged in as Tech User
- Magnet System Type "Standard" exists

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open Magnet Systems page | List loads with existing magnets |
| 2 | Click "New Magnet" | Create dialog opens |
| 3 | Enter unique Article Number and Save | New magnet appears in list |

## Expected Outcome

A new Magnet record is created and visible in the list.
'@
Set-Content -LiteralPath $tmp -Value $md -Encoding UTF8

try {
    $tc = ConvertFrom-TestCaseMarkdown -Path $tmp
    Write-Host '--- Parsed ---'
    $tc | Format-List Title, CrId, Requirement, Preconditions, ExpectedOutcome | Out-String | Write-Host
    Write-Host '--- Steps ---'
    $tc.Steps | Format-Table -AutoSize | Out-String | Write-Host
    Write-Host '--- StepsXML ---'
    ConvertTo-AdoStepsXml -Steps $tc.Steps | Write-Host
    Write-Host '--- SuiteMap ---'
    $map = Get-SuiteMap
    $map | Format-List | Out-String | Write-Host
    Write-Host ('Resolved suite for CR {0}: {1}' -f $tc.CrId, (Resolve-SuiteIdForCr -CrId $tc.CrId -SuiteMap $map))
}
finally {
    Remove-Item $tmp -Force -ErrorAction SilentlyContinue
}
