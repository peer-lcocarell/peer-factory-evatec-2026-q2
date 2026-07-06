param(
    [string]$JsonPath = 'docs/qa-documents/pf-evatec-phase-2/10-bug-audit/r10.2-bug-trend-analysis.json',
    [string]$CssPath = 'docs/qa-documents/pf-evatec-phase-2/10-bug-audit/skyrunner-qa-report.css',
    [string]$OutputHtmlPath = 'docs/qa-documents/pf-evatec-phase-2/10-bug-audit/r10.2-bug-trend-analysis.html'
)

$ErrorActionPreference = 'Stop'

function Escape-Html {
    param([string]$Text)

    if ($null -eq $Text) { return '' }
    return [System.Net.WebUtility]::HtmlEncode($Text)
}

function Get-RiskClass {
    param([string]$Risk)

  $riskValue = if ($null -eq $Risk) { '' } else { $Risk }
  switch ($riskValue.ToLowerInvariant()) {
        'high' { return 'fail' }
        'medium' { return 'warn' }
        default { return 'pass' }
    }
}

function Get-Percent {
    param(
        [int]$Count,
        [int]$Total
    )

    if ($Total -le 0) { return 0 }
    return [Math]::Round(($Count * 100.0) / $Total, 2)
}

if (-not (Test-Path -Path $JsonPath)) {
    throw "JSON file not found: $JsonPath"
}

if (-not (Test-Path -Path $CssPath)) {
    throw "CSS file not found: $CssPath"
}

$json = Get-Content -Path $JsonPath -Raw | ConvertFrom-Json
$total = [int]$json.summary.totalBugs

$categoryRows = @()
foreach ($row in $json.categories) {
    $pct = Get-Percent -Count ([int]$row.count) -Total $total
    $categoryRows += @"
<tr>
  <td>$(Escape-Html $row.name)</td>
  <td>$($row.count)</td>
  <td>
    <div class='inline-flex'>
      <div class='bar-wrap'><div class='bar-fill' style='width: $pct%'></div></div>
      <span class='small'>$pct%</span>
    </div>
  </td>
</tr>
"@
}

$moduleRows = @()
foreach ($row in $json.modules) {
    $pct = Get-Percent -Count ([int]$row.count) -Total $total
    $moduleRows += @"
<tr>
  <td>$(Escape-Html $row.name)</td>
  <td>$($row.count)</td>
  <td>
    <div class='inline-flex'>
      <div class='bar-wrap'><div class='bar-fill' style='width: $pct%'></div></div>
      <span class='small'>$pct%</span>
    </div>
  </td>
</tr>
"@
}

$rootCauseRows = @()
foreach ($row in $json.rootCauses) {
    $pct = Get-Percent -Count ([int]$row.count) -Total $total
    $rootCauseRows += @"
<tr>
  <td>$(Escape-Html $row.cause)</td>
  <td>$($row.count)</td>
  <td>
    <div class='inline-flex'>
      <div class='bar-wrap'><div class='bar-fill' style='width: $pct%'></div></div>
      <span class='small'>$pct%</span>
    </div>
  </td>
</tr>
"@
}

$riskRows = @()
foreach ($row in $json.riskAreas) {
    $riskClass = Get-RiskClass -Risk ([string]$row.riskLevel)
    $riskRows += @"
<tr>
  <td>$(Escape-Html $row.area)</td>
  <td><span class='badge badge-$riskClass'>$(Escape-Html $row.riskLevel)</span></td>
  <td>$($row.count)</td>
</tr>
"@
}

$immediateRows = @()
foreach ($item in $json.recommendations.immediateActions) {
    $immediateRows += "<li>$(Escape-Html $item)</li>"
}

$nearTermRows = @()
foreach ($item in $json.recommendations.nearTermImprovements) {
    $nearTermRows += "<li>$(Escape-Html $item)</li>"
}

$preventiveRows = @()
foreach ($item in $json.recommendations.preventiveActions) {
    $preventiveRows += "<li>$(Escape-Html $item)</li>"
}

$timestamp = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
$pageTitle = 'R10.2 QA Bug Trend Analysis Dashboard'

$html = @"
<!doctype html>
<html lang='en'>
<head>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <title>$pageTitle</title>
  <link rel='stylesheet' href='skyrunner-qa-report.css'>
</head>
<body>
  <a class='skip-link' href='#main'>Skip to main content</a>

  <nav class='report-nav'>
    <a href='#release'>Release Info</a>
    <a href='#summary'>Executive Dashboard</a>
    <a href='#severity'>Severity</a>
    <a href='#priority'>Priority</a>
    <a href='#categories'>Category Distribution</a>
    <a href='#modules'>Module Distribution</a>
    <a href='#root-causes'>Root Causes</a>
    <a href='#risk'>Risk Areas</a>
    <a href='#recommendations'>Recommendations</a>
  </nav>

  <main id='main' class='report-main'>
    <header class='page-header'>
      <div class='report-title'>QA Bug Trend Analysis Dashboard</div>
      <h1>R10.2 Defect Trend Report</h1>
      <div class='meta'>Generated on $timestamp from $(Escape-Html $JsonPath)</div>
    </header>

    <section id='release' class='panel'>
      <h2>Release Information</h2>
      <div class='info-grid'>
        <div class='info-item'><div class='k'>Project</div><div class='v'>$(Escape-Html $json.releaseInfo.project)</div></div>
        <div class='info-item'><div class='k'>Version</div><div class='v'>$(Escape-Html $json.releaseInfo.version)</div></div>
        <div class='info-item'><div class='k'>Date</div><div class='v'>$(Escape-Html $json.releaseInfo.date)</div></div>
      </div>
    </section>

    <section id='summary' class='panel'>
      <h2>Executive Dashboard</h2>
      <div class='cards'>
        <div class='card'><div class='num'>$($json.summary.totalBugs)</div><div class='lbl'>Total Bugs</div></div>
        <div class='card fail'><div class='num'>$($json.summary.criticalBugs)</div><div class='lbl'>Critical Bugs</div></div>
        <div class='card warn'><div class='num'>$($json.summary.highBugs)</div><div class='lbl'>High Bugs</div></div>
        <div class='card'><div class='num'>$(Escape-Html $json.summary.topCategory)</div><div class='lbl'>Top Category</div></div>
        <div class='card'><div class='num'>$(Escape-Html $json.summary.topModule)</div><div class='lbl'>Top Module</div></div>
        <div class='card'><div class='num'>$(Escape-Html $json.summary.highestRiskArea)</div><div class='lbl'>Highest Risk Area</div></div>
        <div class='card highlight'><div class='num'>$(Escape-Html $json.summary.releaseRisk)</div><div class='lbl'>Release Risk Level</div></div>
      </div>
    </section>

    <section id='severity' class='panel'>
      <h2>Severity Distribution</h2>
      <table>
        <thead><tr><th>Severity</th><th>Count</th><th>Share</th></tr></thead>
        <tbody>
          <tr><td>Critical</td><td>$($json.severity.critical)</td><td>$(Get-Percent -Count $json.severity.critical -Total $total)%</td></tr>
          <tr><td>High</td><td>$($json.severity.high)</td><td>$(Get-Percent -Count $json.severity.high -Total $total)%</td></tr>
          <tr><td>Medium</td><td>$($json.severity.medium)</td><td>$(Get-Percent -Count $json.severity.medium -Total $total)%</td></tr>
          <tr><td>Low</td><td>$($json.severity.low)</td><td>$(Get-Percent -Count $json.severity.low -Total $total)%</td></tr>
        </tbody>
      </table>
    </section>

    <section id='priority' class='panel'>
      <h2>Priority Distribution</h2>
      <table>
        <thead><tr><th>Priority</th><th>Count</th><th>Share</th></tr></thead>
        <tbody>
          <tr><td>P1</td><td>$($json.priority.p1)</td><td>$(Get-Percent -Count $json.priority.p1 -Total $total)%</td></tr>
          <tr><td>P2</td><td>$($json.priority.p2)</td><td>$(Get-Percent -Count $json.priority.p2 -Total $total)%</td></tr>
          <tr><td>P3</td><td>$($json.priority.p3)</td><td>$(Get-Percent -Count $json.priority.p3 -Total $total)%</td></tr>
          <tr><td>P4</td><td>$($json.priority.p4)</td><td>$(Get-Percent -Count $json.priority.p4 -Total $total)%</td></tr>
        </tbody>
      </table>
    </section>

    <section id='categories' class='panel'>
      <h2>Category Distribution</h2>
      <table>
        <thead><tr><th>Category</th><th>Count</th><th>Share</th></tr></thead>
        <tbody>
          $($categoryRows -join "`n")
        </tbody>
      </table>
    </section>

    <section id='modules' class='panel'>
      <h2>Module Distribution (Top 20)</h2>
      <table>
        <thead><tr><th>Module</th><th>Count</th><th>Share</th></tr></thead>
        <tbody>
          $($moduleRows -join "`n")
        </tbody>
      </table>
    </section>

    <section id='root-causes' class='panel'>
      <h2>Root Cause Frequency</h2>
      <table>
        <thead><tr><th>Root Cause</th><th>Count</th><th>Share</th></tr></thead>
        <tbody>
          $($rootCauseRows -join "`n")
        </tbody>
      </table>
    </section>

    <section id='risk' class='panel'>
      <h2>Risk Concentration</h2>
      <table>
        <thead><tr><th>Area</th><th>Risk Level</th><th>Count</th></tr></thead>
        <tbody>
          $($riskRows -join "`n")
        </tbody>
      </table>
    </section>

    <section id='recommendations' class='panel'>
      <h2>Recommendations</h2>
      <h3>Immediate Actions</h3>
      <ul>
        $($immediateRows -join "`n")
      </ul>
      <h3>Near-Term Improvements</h3>
      <ul>
        $($nearTermRows -join "`n")
      </ul>
      <h3>Preventive Actions</h3>
      <ul>
        $($preventiveRows -join "`n")
      </ul>
    </section>

    <footer class='page-footer'>
      Generated by generate-bug-trend-html.ps1
    </footer>
  </main>
</body>
</html>
"@

Set-Content -Path $OutputHtmlPath -Value $html -Encoding utf8
Write-Host "Wrote $OutputHtmlPath"
