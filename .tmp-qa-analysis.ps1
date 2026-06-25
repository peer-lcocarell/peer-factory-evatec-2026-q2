$path = "docs/qa-test-estimates.csv"
$rows = Import-Csv -Path $path -Delimiter "`t"
$valid = $rows | Where-Object { $_.'Original Estimate' -and $_.'Original Estimate' -match '^-?\d+(\.\d+)?$' }
$withActual = $valid | Where-Object { $_.'Completed Work' -and $_.'Completed Work' -match '^-?\d+(\.\d+)?$' }

function Get-Median([double[]]$arr){
  if (-not $arr -or $arr.Count -eq 0){ return $null }
  $s = $arr | Sort-Object
  if ($s.Count % 2 -eq 1){ return $s[[int][math]::Floor($s.Count/2)] }
  $i = [int]($s.Count/2)
  return (($s[$i-1] + $s[$i]) / 2)
}

$estVals = $valid | ForEach-Object { [double]$_.'Original Estimate' }
$actVals = $withActual | ForEach-Object { [double]$_.'Completed Work' }
$diffs = $withActual | ForEach-Object {
  $est=[double]$_.'Original Estimate'; $act=[double]$_.'Completed Work'
  [pscustomobject]@{ ID=$_.ID; Title=$_.Title; Est=$est; Act=$act; Variance=($act-$est); Ratio=(if($est -ne 0){$act/$est}else{$null}) }
}

function Get-Category($title){
  $t = $title.ToLowerInvariant()
  if($t -match 'regression|smoke'){ return 'Regression testing' }
  if($t -match 'automation|e2e'){ return 'Automation testing' }
  if($t -match 'integration|secs/gem|edp|api|host'){ return 'Integration testing' }
  if($t -match 'bug|ticket #|fix|issue'){ return 'Bug verification' }
  if($t -match 'test plan|planning|template|proposal|research|write/test|write - test|test case'){ return 'Documentation and planning activities' }
  if($t -match 'config|configuration|setup|import|export|parameter|role|module type|logbook'){ return 'Configuration testing' }
  if($t -match 'update|improvement|change|enhancement|updates'){ return 'Enhancement testing' }
  return 'New feature testing'
}

function Get-Component($title){
  if($title -match '\(([^\)]+)\)'){ return $matches[1].Trim() }
  if($title -match 'Ticket\s*#\d+\s*-\s*(.+)$'){ return $matches[1].Trim() }
  return 'General'
}

$enriched = $valid | ForEach-Object {
  $est=[double]$_.'Original Estimate'
  $act = if($_.'Completed Work' -and $_.'Completed Work' -match '^-?\d+(\.\d+)?$'){ [double]$_.'Completed Work' } else { $null }
  [pscustomobject]@{
    ID=$_.ID; Title=$_.Title; Estimate=$est; Actual=$act
    Category=(Get-Category $_.Title)
    Component=(Get-Component $_.Title)
    Complexity=(if($est -lt 0.75){'Small'} elseif($est -le 2.0){'Medium'} else {'Large'})
  }
}

$overall = [pscustomobject]@{
  TotalTasks = $valid.Count
  TotalEstimatedHours = [math]::Round((($valid | Measure-Object -Property 'Original Estimate' -Sum).Sum),3)
  TotalActualHours = [math]::Round((($withActual | Measure-Object -Property 'Completed Work' -Sum).Sum),3)
  AvgEstimatedHours = [math]::Round((($valid | Measure-Object -Property 'Original Estimate' -Average).Average),3)
  MedianEstimatedHours = [math]::Round((Get-Median $estVals),3)
  MinEstimatedHours = [math]::Round((($valid | Measure-Object -Property 'Original Estimate' -Minimum).Minimum),3)
  MaxEstimatedHours = [math]::Round((($valid | Measure-Object -Property 'Original Estimate' -Maximum).Maximum),3)
  TasksWithActual = $withActual.Count
  AvgActualHours = [math]::Round((($withActual | Measure-Object -Property 'Completed Work' -Average).Average),3)
  MedianActualHours = [math]::Round((Get-Median $actVals),3)
  AvgVarianceHours = [math]::Round((($diffs | Measure-Object -Property Variance -Average).Average),3)
  MedianVarianceHours = [math]::Round((Get-Median ($diffs | ForEach-Object { [double]$_.Variance })),3)
  AvgEstimateToActualRatio = [math]::Round((($diffs | Where-Object { $_.Ratio -ne $null } | Measure-Object -Property Ratio -Average).Average),3)
}

$byCategory = $enriched | Group-Object Category | ForEach-Object {
  [pscustomobject]@{ Category=$_.Name; Tasks=$_.Count; AvgEstimate=[math]::Round((($_.Group | Measure-Object -Property Estimate -Average).Average),3); AvgActual=[math]::Round(((($_.Group | Where-Object { $_.Actual -ne $null } | Measure-Object -Property Actual -Average).Average)),3) }
} | Sort-Object AvgEstimate -Descending

$byComponent = $enriched | Group-Object Component | ForEach-Object {
  [pscustomobject]@{ Component=$_.Name; Tasks=$_.Count; AvgEstimate=[math]::Round((($_.Group | Measure-Object -Property Estimate -Average).Average),3); TotalEstimate=[math]::Round((($_.Group | Measure-Object -Property Estimate -Sum).Sum),3) }
} | Sort-Object TotalEstimate -Descending | Select-Object -First 15

$byComplexity = $enriched | Group-Object Complexity | ForEach-Object {
  [pscustomobject]@{ Complexity=$_.Name; Tasks=$_.Count; AvgEstimate=[math]::Round((($_.Group | Measure-Object -Property Estimate -Average).Average),3); AvgActual=[math]::Round(((($_.Group | Where-Object { $_.Actual -ne $null } | Measure-Object -Property Actual -Average).Average)),3) }
}

$under = $diffs | Sort-Object Variance -Descending | Select-Object -First 8 ID,Title,Est,Act,Variance,Ratio
$over = $diffs | Sort-Object Variance | Select-Object -First 8 ID,Title,Est,Act,Variance,Ratio

"===OVERALL==="
$overall | Format-List
"===BY_CATEGORY==="
$byCategory | Format-Table -AutoSize
"===BY_COMPONENT_TOP15_TOTAL_ESTIMATE==="
$byComponent | Format-Table -AutoSize
"===BY_COMPLEXITY==="
$byComplexity | Format-Table -AutoSize
"===MOST_UNDERESTIMATED==="
$under | Format-Table -AutoSize
"===MOST_OVERESTIMATED==="
$over | Format-Table -AutoSize