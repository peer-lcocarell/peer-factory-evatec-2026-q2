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

#Requires -Version 5.1
<#
.SYNOPSIS
    Updates MES configuration values in Components.config using XML DOM.

.DESCRIPTION
    Applies environment-specific settings to the MES Components.config file:
    - ConnectionTimeout
    - FileWatchFolder (UNC share)
    - HostAddress
    - DataSource for the DatabaseConnection component
    - DataSource for the BPSImportService component

    Uses XML DOM for safe, encoding-preserving updates. Supports WhatIf and Confirm.

.PARAMETER ConfigPath
    Full path to the Components.config XML file.
    Default: C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\Components.config

.PARAMETER ConnectionTimeoutMs
    Connection timeout value in milliseconds. Default: 3500.

.PARAMETER FileWatchFolder
    UNC path for the file watch folder. Default: \\<ComputerName>\Uploaded

.PARAMETER HostAddress
    MES host address. Default: pf-wsc19-qa1.

.PARAMETER DataSource
    SQL Server data source for DatabaseConnection and BPSImportService components.
    Default: PF-WSC19-QA1\SQLEXPRESS

.PARAMETER PauseSeconds
    Optional pause after the update completes. Default: 3.

.EXAMPLE
    .\update-mes-config-file.ps1

.EXAMPLE
    .\update-mes-config-file.ps1 -HostAddress 'myserver' -DataSource 'myserver\SQLEXPRESS' -WhatIf

.NOTES
    Requires: Write access to the Components.config file.
    Uses XML DOM (.Save()) to preserve encoding and avoid string-replace encoding corruption.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ConfigPath = 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\Components.config',

    [Parameter()]
    [ValidateRange(1, 86400000)]
    [int]$ConnectionTimeoutMs = 3500,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$FileWatchFolder = '\\pf-wsc19-qa1\Uploaded',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$HostAddress = 'pf-wsc19-qa1',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$DataSource = 'PF-WSC19-QA1\SQLEXPRESS',

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
        'Info'    { Write-Information $line -InformationAction Continue }
        'Warning' { Write-Warning $line }
        'Error'   { Write-Information $line -InformationAction Continue }
        'Success' { Write-Information $line -InformationAction Continue }
    }
}

function Set-ComponentChildText {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [xml]$Xml,
        [Parameter(Mandatory)] [ValidateNotNullOrEmpty()] [string]$ComponentTypeFragment,
        [Parameter(Mandatory)] [ValidateNotNullOrEmpty()] [string]$ChildElementName,
        [Parameter(Mandatory)] [string]$Value,
        [Parameter(Mandatory)] [string]$Label
    )

    $xpath = "//AutomationComponent[contains(@Type,'$ComponentTypeFragment')]"
    $componentNodes = $Xml.SelectNodes($xpath)

    if (-not $componentNodes -or $componentNodes.Count -eq 0) {
        Write-Log -Level Warning -Message "AutomationComponent not found for type fragment: $ComponentTypeFragment"
        return
    }

    $index = 0
    foreach ($componentNode in $componentNodes) {
        $index++
        $childNode = $componentNode.SelectSingleNode($ChildElementName)

        if (-not $childNode) {
            $childNode = $Xml.CreateElement($ChildElementName)
            $null = $componentNode.AppendChild($childNode)
            Write-Log -Level Info -Message "Created <$ChildElementName> for $ComponentTypeFragment (#$index)"
        }

        Write-Log -Level Info -Message "$Label (#$index) : '$($childNode.InnerText)' -> '$Value'"
        $childNode.InnerText = $Value
    }
}

function Set-ComponentDataSource {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [xml]$Xml,
        [Parameter(Mandatory)] [ValidateNotNullOrEmpty()] [string]$ComponentTypeFragment,
        [Parameter(Mandatory)] [string]$Value
    )

    $xpath = "//AutomationComponent[contains(@Type,'$ComponentTypeFragment')]"
    $componentNodes = $Xml.SelectNodes($xpath)
    if (-not $componentNodes -or $componentNodes.Count -eq 0) {
        Write-Log -Level Warning -Message "AutomationComponent not found for type fragment: $ComponentTypeFragment"
        return
    }

    $index = 0
    foreach ($componentNode in $componentNodes) {
        $index++
        $dsNode = $componentNode.SelectSingleNode('DataSource')
        if (-not $dsNode) {
            $dsNode = $Xml.CreateElement('DataSource')
            $null = $componentNode.PrependChild($dsNode)
            Write-Log -Level Info -Message "Created <DataSource> for $ComponentTypeFragment (#$index)"
        }
        else {
            Write-Log -Level Info -Message "Updating existing <DataSource> for $ComponentTypeFragment (#$index)"
        }
        $dsNode.InnerText = $Value
    }
}

try {
    Write-Log -Level Info -Message 'Starting MES configuration update...'

    if (-not (Test-Path -Path $ConfigPath -PathType Leaf)) {
        throw "Configuration file not found: $ConfigPath"
    }

    [xml]$xml = Get-Content -Path $ConfigPath -Raw -ErrorAction Stop

    Set-ComponentChildText -Xml $xml -ComponentTypeFragment 'ToolConnectionManager' -ChildElementName 'ConnectionTimeout' -Value ([string]$ConnectionTimeoutMs) -Label 'ConnectionTimeout'
    Set-ComponentChildText -Xml $xml -ComponentTypeFragment 'ToolConnectionManager' -ChildElementName 'FileWatchFolder'   -Value $FileWatchFolder              -Label 'FileWatchFolder'
    Set-ComponentChildText -Xml $xml -ComponentTypeFragment 'ToolConnectionManager' -ChildElementName 'HostAddress'       -Value $HostAddress                  -Label 'HostAddress'
    Set-ComponentDataSource -Xml $xml -ComponentTypeFragment 'DatabaseConnection' -Value $DataSource
    Set-ComponentDataSource -Xml $xml -ComponentTypeFragment 'BPSImportService'   -Value $DataSource

    if ($PSCmdlet.ShouldProcess($ConfigPath, 'Save updated MES configuration')) {
        $xml.Save($ConfigPath)
        Write-Log -Level Success -Message "MES configuration saved: $ConfigPath"
    } else {
        Write-Log -Level Warning -Message 'Save skipped by ShouldProcess (-WhatIf / -Confirm).'
    }

    if ($PauseSeconds -gt 0) {
        Write-Log -Level Info -Message "Pausing for $PauseSeconds second(s)."
        Start-Sleep -Seconds $PauseSeconds
    }
}
catch {
    Write-Log -Level Error -Message "MES configuration update failed: $($_.Exception.Message)"
    exit 1
}
