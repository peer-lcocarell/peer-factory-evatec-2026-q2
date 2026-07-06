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
<#
.SYNOPSIS
    Create or update a single Azure DevOps Test Case from a Markdown file
    and add it to a target Test Suite.

.DESCRIPTION
    Wraps Publish-AdoTestCaseFromMarkdown from pf-evatec-ado-publisher.psm1.

    Matching is by exact Title (System.Title). If an existing Test Case with
    the same title is found in the project, it is updated; otherwise a new
    one is created.

    Plan/Suite resolution order:
        1. -PlanId / -SuiteId parameters
        2. suite-map.json (CR ID -> Suite ID, with defaultSuiteId fallback)
        3. Module defaults (Plan 291616 / Suite 291617)

    Authentication:
        $env:AZURE_DEVOPS_PAT must be set. The PAT needs Work Items
        (Read, write & manage) and Test Management (Read & write).

.PARAMETER Path
    Path to the Markdown test-case file.

.EXAMPLE
    $env:AZURE_DEVOPS_PAT = '...'
    .\invoke-ado-test-case-publish-from-markdown.ps1 `
        -Path ..\..\docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\change-requests\286067\test-cases\001-create-magnet.md

.EXAMPLE
    .\invoke-ado-test-case-publish-from-markdown.ps1 -Path .\foo.md -WhatIf
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)] [string]$Path,
    [int]$PlanId,
    [int]$SuiteId,
    [string]$AreaPath,
    [string]$IterationPath,
    [string]$OrgUrl,
    [string]$Project,
    [string]$ApiVersion,
    [string]$SuiteMapPath
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Import-Module (Join-Path $PSScriptRoot 'pf-evatec-ado-publisher.psm1') -Force

$splat = @{ Path = $Path }
foreach ($key in 'PlanId','SuiteId','AreaPath','IterationPath','OrgUrl','Project','ApiVersion','SuiteMapPath') {
    if ($PSBoundParameters.ContainsKey($key)) { $splat[$key] = $PSBoundParameters[$key] }
}
if ($WhatIfPreference) { $splat.WhatIf = $true }

Publish-AdoTestCaseFromMarkdown @splat

