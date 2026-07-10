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
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$ConfigPath = 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\Server.Grpc.config',

	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$HostName = 'pf-wsc19-qa1',

	[Parameter()]
	[ValidateRange(1, 65535)]
	[int]$Port = 9090,

	[Parameter()]
	[ValidateSet('insecure', 'secure')]
	[string]$Credentials = 'insecure',

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

try {
	Write-Log -Level Info -Message 'Starting gRPC configuration update...'

	if (-not (Test-Path -Path $ConfigPath -PathType Leaf)) {
		throw "Configuration file not found: $ConfigPath"
	}

	[xml]$xml = Get-Content -Path $ConfigPath -Raw -ErrorAction Stop
	$portNode = $xml.SelectSingleNode('//port')
	if (-not $portNode) {
		throw 'No <port> node found in Server.Grpc.config.'
	}

	if ($portNode.NodeType -ne [System.Xml.XmlNodeType]::Element) {
		throw 'Resolved <port> node is not an XML element.'
	}

	$oldHost = $portNode.GetAttribute('host')
	$oldPort = $portNode.GetAttribute('port')
	$oldCredentials = $portNode.GetAttribute('credentials')

	$portNode.SetAttribute('host', $HostName)
	$portNode.SetAttribute('port', [string]$Port)
	$portNode.SetAttribute('credentials', $Credentials)

	if ($PSCmdlet.ShouldProcess($ConfigPath, "Update port host='$HostName' port='$Port' credentials='$Credentials'")) {
		$xml.Save($ConfigPath)
		Write-Log -Level Success -Message "gRPC configuration updated from host='$oldHost' port='$oldPort' credentials='$oldCredentials' to host='$HostName' port='$Port' credentials='$Credentials'."
	} else {
		Write-Log -Level Warning -Message 'Update skipped by ShouldProcess (-WhatIf / -Confirm).'
	}

	if ($PauseSeconds -gt 0) {
		Start-Sleep -Seconds $PauseSeconds
	}
}
catch {
	Write-Log -Level Error -Message "gRPC configuration update failed: $($_.Exception.Message)"
	exit 1
}

