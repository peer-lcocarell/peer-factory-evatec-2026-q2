#requires -Version 5.1
<#
.SYNOPSIS
    Shared helpers for publishing Markdown-authored test cases into Azure DevOps.

.DESCRIPTION
    Parses the strict Markdown test-case format defined in
    .github/copilot-instructions.md and creates or updates the matching
    Azure DevOps Test Case work item, then adds it to a target Test Suite.

    Authentication uses a Personal Access Token (PAT) read from the
    AZURE_DEVOPS_PAT environment variable. The PAT needs:
      - Work Items (Read, write, & manage)
      - Test Management (Read & write)
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------
# Defaults (from .github/copilot-instructions.md)
# ---------------------------------------------------------------------------

$script:DefaultOrgUrl     = 'https://ops1.peergroup.com/DefaultCollection'
$script:DefaultProject    = 'PFEvatec'
$script:DefaultApiVersion = '7.1'
$script:DefaultPlanId     = 291616
$script:DefaultSuiteId    = 291617  # Requirements (parent)

# ---------------------------------------------------------------------------
# Auth / HTTP
# ---------------------------------------------------------------------------

function Get-AdoAuthHeader {
    [CmdletBinding()]
    param(
        [string]$Pat = $env:AZURE_DEVOPS_PAT
    )

    if ([string]::IsNullOrWhiteSpace($Pat)) {
        return $null
    }

    $bytes  = [System.Text.Encoding]::ASCII.GetBytes(":$Pat")
    $base64 = [Convert]::ToBase64String($bytes)

    return @{ Authorization = "Basic $base64" }
}

function Invoke-AdoRest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [ValidateSet('GET','POST','PATCH','PUT','DELETE')] [string]$Method,
        [Parameter(Mandatory)] [string]$Uri,
        [object]$Body,
        [string]$ContentType = 'application/json',
        [hashtable]$Headers,
        [switch]$UseDefaultCredentials
    )

    if (-not $Headers) { $Headers = Get-AdoAuthHeader }

    $params = @{
        Method      = $Method
        Uri         = $Uri
        ContentType = $ContentType
        ErrorAction = 'Stop'
    }

    if ($Headers) {
        $params.Headers = $Headers
    }
    else {
        # Support on-prem ADO Server integrated authentication when PAT is not provided.
        $params.UseDefaultCredentials = $true
    }

    if ($PSBoundParameters.ContainsKey('Body') -and $null -ne $Body) {
        if ($Body -is [string]) {
            $params.Body = $Body
        }
        else {
            $params.Body = ($Body | ConvertTo-Json -Depth 50 -Compress)
        }
    }

    return Invoke-RestMethod @params
}

# ---------------------------------------------------------------------------
# Markdown parsing
# ---------------------------------------------------------------------------

function ConvertFrom-TestCaseMarkdown {
    <#
    .SYNOPSIS
        Parses a Markdown test case into a structured object.

    .OUTPUTS
        PSCustomObject with: SourcePath, Title, CrId, Requirement,
        Preconditions[], Steps[ { Number, Action, Expected } ],
        ExpectedOutcome, RawSections (hashtable).
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Markdown file not found: $Path"
    }

    $lines = Get-Content -LiteralPath $Path -Encoding UTF8

    # Title = first H1
    $title = $null
    foreach ($line in $lines) {
        if ($line -match '^\s*#\s+(.+?)\s*$') {
            $title = $Matches[1].Trim()
            break
        }
    }

    if (-not $title) {
        throw "No '# Title' heading found in: $Path"
    }

    # Section split on H2 (## )
    $sections = [ordered]@{}
    $currentName = '__preamble__'
    $sections[$currentName] = New-Object System.Collections.Generic.List[string]

    foreach ($line in $lines) {
        if ($line -match '^\s*##\s+(.+?)\s*$') {
            $currentName = $Matches[1].Trim()
            if (-not $sections.Contains($currentName)) {
                $sections[$currentName] = New-Object System.Collections.Generic.List[string]
            }
            continue
        }
        $sections[$currentName].Add($line) | Out-Null
    }

    function Get-SectionLines {
        param([string]$Name)
        foreach ($key in $sections.Keys) {
            if ($key -ieq $Name) { return $sections[$key] }
        }
        return @()
    }

    # Requirement (free text)
    $requirementLines = (Get-SectionLines 'Requirement') | Where-Object { $_ -and $_.Trim() }
    $requirement      = ($requirementLines -join "`n").Trim()

    # Preconditions (bullets)
    $preconditions = @()
    foreach ($l in (Get-SectionLines 'Preconditions')) {
        if ($l -match '^\s*[-*]\s+(.+?)\s*$') {
            $preconditions += $Matches[1].Trim()
        }
    }

    # Steps: locate the | Step | Action | Expected Result | table anywhere
    # in the document (instructions allow it outside an explicit ## Steps section).
    $steps = @()
    $inHeader = $false
    $sawSeparator = $false
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $l = $lines[$i]
        if (-not $inHeader -and $l -match '^\s*\|\s*Step\s*\|\s*Action\s*\|\s*Expected Result\s*\|\s*$') {
            $inHeader     = $true
            $sawSeparator = $false
            continue
        }
        if ($inHeader -and -not $sawSeparator) {
            if ($l -match '^\s*\|\s*-+\s*\|\s*-+\s*\|\s*-+\s*\|\s*$') {
                $sawSeparator = $true
                continue
            }
            # malformed table; bail out of this header
            $inHeader = $false
            continue
        }
        if ($inHeader -and $sawSeparator) {
            if ($l -notmatch '^\s*\|') { break }
            $cells = ($l -split '\|') | ForEach-Object { $_.Trim() }
            # leading and trailing splits are empty strings
            if ($cells.Count -lt 5) { continue }
            $num      = $cells[1]
            $action   = $cells[2] -replace '<br\s*/?>', "`n"
            $expected = $cells[3] -replace '<br\s*/?>', "`n"
            $steps += [pscustomobject]@{
                Number   = $num
                Action   = $action
                Expected = $expected
            }
        }
    }

    if ($steps.Count -eq 0) {
        throw "No '| Step | Action | Expected Result |' table found in: $Path"
    }

    $expectedOutcomeLines = (Get-SectionLines 'Expected Outcome') | Where-Object { $_ -and $_.Trim() }
    $expectedOutcome      = ($expectedOutcomeLines -join "`n").Trim()

    # CR ID: prefer Requirement section, fall back to first numeric token in title.
    $crId = $null
    $combined = "$requirement`n$title"
    if ($combined -match '\b(\d{6})\b') { $crId = $Matches[1] }

    [pscustomobject]@{
        SourcePath      = (Resolve-Path -LiteralPath $Path).Path
        Title           = $title
        CrId            = $crId
        Requirement     = $requirement
        Preconditions   = $preconditions
        Steps           = $steps
        ExpectedOutcome = $expectedOutcome
    }
}

# ---------------------------------------------------------------------------
# ADO field formatting
# ---------------------------------------------------------------------------

function ConvertTo-HtmlParagraphs {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return '' }
    $encoded = [System.Net.WebUtility]::HtmlEncode($Text)
    $parts   = $encoded -split "(`r`n|`n)"
    $html    = ($parts | Where-Object { $_ -and $_ -notmatch '^(`r`n|`n)$' } |
                ForEach-Object { "<P>$_</P>" }) -join ''
    if (-not $html) { $html = "<P>$encoded</P>" }
    return "<DIV>$html</DIV>"
}

function ConvertTo-AdoStepsXml {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [object[]]$Steps,
        [string[]]$Preconditions
    )

    $effectiveSteps = New-Object System.Collections.Generic.List[object]

    if ($Preconditions -and $Preconditions.Count -gt 0) {
        $effectiveSteps.Add([pscustomobject]@{
            Number   = '0'
            Action   = 'Verify preconditions.'
            Expected = ''
        }) | Out-Null
    }

    foreach ($s in $Steps) {
        $effectiveSteps.Add($s) | Out-Null
    }

    $doc  = New-Object System.Xml.XmlDocument
    $root = $doc.CreateElement('steps')
    $root.SetAttribute('id', '0')
    $root.SetAttribute('last', [string]($effectiveSteps.Count + 1))
    [void]$doc.AppendChild($root)

    $stepId = 2
    foreach ($s in $effectiveSteps) {
        $step = $doc.CreateElement('step')
        $step.SetAttribute('id', [string]$stepId)
        $step.SetAttribute('type', 'ActionStep')

        $action = $doc.CreateElement('parameterizedString')
        $action.SetAttribute('isformatted', 'true')
        $action.InnerText = (ConvertTo-HtmlParagraphs $s.Action)
        [void]$step.AppendChild($action)

        $expected = $doc.CreateElement('parameterizedString')
        $expected.SetAttribute('isformatted', 'true')
        $expected.InnerText = (ConvertTo-HtmlParagraphs $s.Expected)
        [void]$step.AppendChild($expected)

        $desc = $doc.CreateElement('description')
        [void]$step.AppendChild($desc)

        [void]$root.AppendChild($step)
        $stepId++
    }

    return $doc.OuterXml
}

function ConvertTo-DescriptionHtml {
    param(
        [string]$Requirement,
        [string[]]$Preconditions,
        [string]$ExpectedOutcome
    )

    $sb = New-Object System.Text.StringBuilder

    if ($Requirement) {
        [void]$sb.Append('<p><b>Requirement:</b> ')
        [void]$sb.Append([System.Net.WebUtility]::HtmlEncode($Requirement))
        [void]$sb.Append('</p>')
    }

    if ($ExpectedOutcome) {
        [void]$sb.Append('<p><b>Expected Outcome:</b> ')
        [void]$sb.Append([System.Net.WebUtility]::HtmlEncode($ExpectedOutcome))
        [void]$sb.Append('</p>')
    }

    return $sb.ToString()
}

function ConvertTo-PreconditionsText {
    param(
        [string[]]$Preconditions
    )

    if (-not $Preconditions -or $Preconditions.Count -eq 0) {
        return ''
    }

    $items = $Preconditions | ForEach-Object {
        "<li>$([System.Net.WebUtility]::HtmlEncode($_))</li>"
    }

    return "<ul>`r`n$($items -join "`r`n")`r`n</ul>"
}

# ---------------------------------------------------------------------------
# Test Case CRUD
# ---------------------------------------------------------------------------

function Find-AdoTestCaseByTitle {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Title,
        [string]$OrgUrl     = $script:DefaultOrgUrl,
        [string]$Project    = $script:DefaultProject,
        [string]$ApiVersion = $script:DefaultApiVersion
    )

    $escapedTitle = $Title.Replace("'", "''")
    $wiql = @{
        query = "SELECT [System.Id] FROM workitems " +
                "WHERE [System.TeamProject] = '$Project' " +
                "AND [System.WorkItemType] = 'Test Case' " +
                "AND [System.Title] = '$escapedTitle'"
    }

    $uri = "{0}/{1}/_apis/wit/wiql?api-version={2}" -f $OrgUrl.TrimEnd('/'), $Project, $ApiVersion
    $result = Invoke-AdoRest -Method POST -Uri $uri -Body $wiql

    if (-not $result.workItems -or $result.workItems.Count -eq 0) {
        return $null
    }
    return [int]$result.workItems[0].id
}

function New-AdoTestCase {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [pscustomobject]$TestCase,
        [string]$AreaPath,
        [string]$IterationPath,
        [string]$OrgUrl     = $script:DefaultOrgUrl,
        [string]$Project    = $script:DefaultProject,
        [string]$ApiVersion = $script:DefaultApiVersion
    )

    $stepsXml   = ConvertTo-AdoStepsXml -Steps $TestCase.Steps -Preconditions $TestCase.Preconditions
    $descHtml   = ConvertTo-DescriptionHtml `
                    -Requirement     $TestCase.Requirement `
                    -Preconditions   $TestCase.Preconditions `
                    -ExpectedOutcome $TestCase.ExpectedOutcome
    $preconditionsText = ConvertTo-PreconditionsText -Preconditions $TestCase.Preconditions

    $ops = New-Object System.Collections.Generic.List[object]
    $ops.Add(@{ op = 'add'; path = '/fields/System.Title';                  value = $TestCase.Title })
    $ops.Add(@{ op = 'add'; path = '/fields/System.Description';            value = $descHtml })
    $ops.Add(@{ op = 'add'; path = '/fields/Microsoft.VSTS.TCM.Steps';      value = $stepsXml })
    $ops.Add(@{ op = 'add'; path = '/fields/Custom.PreconditionsPG';         value = $preconditionsText })
    if ($AreaPath)      { $ops.Add(@{ op = 'add'; path = '/fields/System.AreaPath';      value = $AreaPath }) }
    if ($IterationPath) { $ops.Add(@{ op = 'add'; path = '/fields/System.IterationPath'; value = $IterationPath }) }

    $uri = "{0}/{1}/_apis/wit/workitems/`$Test Case?api-version={2}" -f $OrgUrl.TrimEnd('/'), $Project, $ApiVersion
    return Invoke-AdoRest -Method POST -Uri $uri -Body $ops -ContentType 'application/json-patch+json'
}

function Update-AdoTestCase {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [int]$Id,
        [Parameter(Mandatory)] [pscustomobject]$TestCase,
        [string]$AreaPath,
        [string]$IterationPath,
        [string]$OrgUrl     = $script:DefaultOrgUrl,
        [string]$Project    = $script:DefaultProject,
        [string]$ApiVersion = $script:DefaultApiVersion
    )

    $stepsXml = ConvertTo-AdoStepsXml -Steps $TestCase.Steps -Preconditions $TestCase.Preconditions
    $descHtml = ConvertTo-DescriptionHtml `
                    -Requirement     $TestCase.Requirement `
                    -Preconditions   $TestCase.Preconditions `
                    -ExpectedOutcome $TestCase.ExpectedOutcome
    $preconditionsText = ConvertTo-PreconditionsText -Preconditions $TestCase.Preconditions

    $ops = New-Object System.Collections.Generic.List[object]
    $ops.Add(@{ op = 'add'; path = '/fields/System.Title';                  value = $TestCase.Title })
    $ops.Add(@{ op = 'add'; path = '/fields/System.Description';            value = $descHtml })
    $ops.Add(@{ op = 'add'; path = '/fields/Microsoft.VSTS.TCM.Steps';      value = $stepsXml })
    $ops.Add(@{ op = 'add'; path = '/fields/Custom.PreconditionsPG';         value = $preconditionsText })
    if ($AreaPath)      { $ops.Add(@{ op = 'add'; path = '/fields/System.AreaPath';      value = $AreaPath }) }
    if ($IterationPath) { $ops.Add(@{ op = 'add'; path = '/fields/System.IterationPath'; value = $IterationPath }) }

    $uri = "{0}/{1}/_apis/wit/workitems/{2}?api-version={3}" -f $OrgUrl.TrimEnd('/'), $Project, $Id, $ApiVersion
    return Invoke-AdoRest -Method PATCH -Uri $uri -Body $ops -ContentType 'application/json-patch+json'
}

function Add-AdoTestCaseToSuite {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [int]$PlanId,
        [Parameter(Mandatory)] [int]$SuiteId,
        [Parameter(Mandatory)] [int]$TestCaseId,
        [string]$OrgUrl     = $script:DefaultOrgUrl,
        [string]$Project    = $script:DefaultProject,
        [string]$ApiVersion = $script:DefaultApiVersion
    )

    $uri = "{0}/{1}/_apis/test/Plans/{2}/suites/{3}/testcases/{4}?api-version={5}" -f `
        $OrgUrl.TrimEnd('/'), $Project, $PlanId, $SuiteId, $TestCaseId, $ApiVersion

    return Invoke-AdoRest -Method POST -Uri $uri -Body '' -ContentType 'application/json'
}

# ---------------------------------------------------------------------------
# Suite mapping
# ---------------------------------------------------------------------------

function Get-SuiteMap {
    [CmdletBinding()]
    param(
        [string]$Path = (Join-Path $PSScriptRoot 'suite-map.json')
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        return [pscustomobject]@{
            planId         = $script:DefaultPlanId
            defaultSuiteId = $script:DefaultSuiteId
            crSuiteIds     = @{}
        }
    }

    $raw = Get-Content -LiteralPath $Path -Raw -Encoding UTF8 | ConvertFrom-Json

    # Normalize crSuiteIds into a hashtable<string,int?>
    $map = @{}
    if ($raw.PSObject.Properties.Name -contains 'crSuiteIds' -and $raw.crSuiteIds) {
        foreach ($prop in $raw.crSuiteIds.PSObject.Properties) {
            $map[$prop.Name] = $prop.Value
        }
    }

    $planId         = if ($raw.PSObject.Properties.Name -contains 'planId'         -and $raw.planId)         { [int]$raw.planId }         else { $script:DefaultPlanId }
    $defaultSuiteId = if ($raw.PSObject.Properties.Name -contains 'defaultSuiteId' -and $raw.defaultSuiteId) { [int]$raw.defaultSuiteId } else { $script:DefaultSuiteId }

    [pscustomobject]@{
        planId         = $planId
        defaultSuiteId = $defaultSuiteId
        crSuiteIds     = $map
    }
}

function Resolve-SuiteIdForCr {
    [CmdletBinding()]
    param(
        [string]$CrId,
        [pscustomobject]$SuiteMap = (Get-SuiteMap)
    )

    if ($CrId -and $SuiteMap.crSuiteIds.ContainsKey($CrId)) {
        $value = $SuiteMap.crSuiteIds[$CrId]
        if ($value) { return [int]$value }
    }
    return [int]$SuiteMap.defaultSuiteId
}

# ---------------------------------------------------------------------------
# High-level publish
# ---------------------------------------------------------------------------

function Publish-AdoTestCaseFromMarkdown {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)] [string]$Path,
        [int]$PlanId,
        [int]$SuiteId,
        [string]$AreaPath,
        [string]$IterationPath,
        [string]$OrgUrl     = $script:DefaultOrgUrl,
        [string]$Project    = $script:DefaultProject,
        [string]$ApiVersion = $script:DefaultApiVersion,
        [string]$SuiteMapPath
    )

    $tc = ConvertFrom-TestCaseMarkdown -Path $Path

    if (-not $PlanId -or -not $SuiteId) {
        $mapArgs = @{}
        if ($SuiteMapPath) { $mapArgs.Path = $SuiteMapPath }
        $map = Get-SuiteMap @mapArgs
        if (-not $PlanId)  { $PlanId  = $map.planId }
        if (-not $SuiteId) { $SuiteId = Resolve-SuiteIdForCr -CrId $tc.CrId -SuiteMap $map }
    }

    $existingId = Find-AdoTestCaseByTitle -Title $tc.Title -OrgUrl $OrgUrl -Project $Project -ApiVersion $ApiVersion

    $action = if ($existingId) { "Update existing Test Case $existingId" } else { 'Create new Test Case' }
    $target = "$($tc.Title) [Plan $PlanId / Suite $SuiteId]"

    if (-not $PSCmdlet.ShouldProcess($target, $action)) {
        return [pscustomobject]@{
            SourcePath = $tc.SourcePath
            Title      = $tc.Title
            Status     = 'WhatIf'
            TestCaseId = $existingId
            PlanId     = $PlanId
            SuiteId    = $SuiteId
        }
    }

    if ($existingId) {
        $null = Update-AdoTestCase -Id $existingId -TestCase $tc `
            -AreaPath $AreaPath -IterationPath $IterationPath `
            -OrgUrl $OrgUrl -Project $Project -ApiVersion $ApiVersion
        $id     = $existingId
        $status = 'Updated'
    }
    else {
        $created = New-AdoTestCase -TestCase $tc `
            -AreaPath $AreaPath -IterationPath $IterationPath `
            -OrgUrl $OrgUrl -Project $Project -ApiVersion $ApiVersion
        $id     = [int]$created.id
        $status = 'Created'
    }

    try {
        $null = Add-AdoTestCaseToSuite -PlanId $PlanId -SuiteId $SuiteId -TestCaseId $id `
            -OrgUrl $OrgUrl -Project $Project -ApiVersion $ApiVersion
    }
    catch {
        $statusCode = $null
        if ($_.Exception.Response -and $_.Exception.Response.StatusCode) {
            $statusCode = [int]$_.Exception.Response.StatusCode
        }

        # Re-publishing an existing case can return 400/409 when the suite relation already exists.
        if ($statusCode -in 400, 409) {
            Write-Verbose "Test Case $id is already associated with Plan $PlanId / Suite $SuiteId. Continuing."
        }
        else {
            throw
        }
    }

    [pscustomobject]@{
        SourcePath = $tc.SourcePath
        Title      = $tc.Title
        CrId       = $tc.CrId
        Status     = $status
        TestCaseId = $id
        PlanId     = $PlanId
        SuiteId    = $SuiteId
    }
}

Export-ModuleMember -Function `
    Get-AdoAuthHeader, Invoke-AdoRest, `
    ConvertFrom-TestCaseMarkdown, ConvertTo-AdoStepsXml, ConvertTo-DescriptionHtml, ConvertTo-PreconditionsText, `
    Find-AdoTestCaseByTitle, New-AdoTestCase, Update-AdoTestCase, Add-AdoTestCaseToSuite, `
    Get-SuiteMap, Resolve-SuiteIdForCr, `
    Publish-AdoTestCaseFromMarkdown
