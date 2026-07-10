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


[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [ValidateSet('pf-wsc19-qa1', 'pf-wsc19-qa2', 'pf-wsc19-qa3')]
    [string]$VmName,

    [Parameter(Mandatory = $false)]
    [switch]$Menu,

    [Parameter(Mandatory = $false)]
    [switch]$CacheCredential,

    [Parameter(Mandatory = $false)]
    [PSCredential]$Credential
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$vmConfig = @{
    'pf-wsc19-qa1' = @{
        Host = 'pf-wsc19-qa1'
        DefaultUser = 'peergroup\vstsbuild'
        Purpose = 'MES, PFDB, EDP, BPS DB'
    }
    'pf-wsc19-qa2' = @{
        Host = 'pf-wsc19-qa2'
        DefaultUser = '.\administrator'
        Purpose = 'PTO'
    }
    'pf-wsc19-qa3' = @{
        Host = 'pf-wsc19-qa3'
        DefaultUser = '.\administrator'
        Purpose = 'FTM, Batch Tool (BPME)'
    }
}

function ConvertTo-PlainText {
    param([Parameter(Mandatory = $true)][SecureString]$SecurePassword)

    $bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
    try {
        return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
    }
    finally {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
    }
}

function Select-VmFromMenu {
    Write-Host ''
    Write-Host 'Select a VM target:' -ForegroundColor Cyan

    $names = @($vmConfig.Keys | Sort-Object)
    for ($i = 0; $i -lt $names.Count; $i++) {
        $name = $names[$i]
        $details = $vmConfig[$name]
        Write-Host ('{0}. {1} ({2})' -f ($i + 1), $name, $details.Purpose)
    }

    $selection = Read-Host ('Enter selection (1-{0})' -f $names.Count)
    if ($selection -notmatch '^\d+$') {
        throw 'Selection must be a number.'
    }

    $index = [int]$selection - 1
    if ($index -lt 0 -or $index -ge $names.Count) {
        throw 'Selection is out of range.'
    }

    return $names[$index]
}

if ($Menu -or [string]::IsNullOrWhiteSpace($VmName)) {
    $VmName = Select-VmFromMenu
}

if (-not $vmConfig.ContainsKey($VmName)) {
    throw "Unsupported VM name: $VmName"
}

$target = $vmConfig[$VmName]
$rdpTarget = $target.Host

if ($CacheCredential) {
    if (-not $Credential) {
        $defaultUser = $target.DefaultUser
        Write-Host ("Prompting credentials for {0}. Default user: {1}" -f $VmName, $defaultUser) -ForegroundColor Yellow
        $Credential = Get-Credential -UserName $defaultUser -Message "Enter credentials for $VmName"
    }

    $plainPassword = ConvertTo-PlainText -SecurePassword $Credential.Password
    cmdkey /generic:"TERMSRV/$rdpTarget" /user:$($Credential.UserName) /pass:$plainPassword | Out-Null
    Write-Host "Credential cached for TERMSRV/$rdpTarget" -ForegroundColor Green
}

Write-Host "Launching Remote Desktop to $rdpTarget" -ForegroundColor Green
Start-Process -FilePath 'mstsc.exe' -ArgumentList "/v:$rdpTarget"
