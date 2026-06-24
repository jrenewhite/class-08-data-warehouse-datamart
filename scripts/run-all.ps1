Param()

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir '..')

$activities = @(
  'class-activity-01',
  'class-activity-02',
  'home-activity'
)

$PowerShellRunner = $null
foreach ($candidate in @('pwsh', 'powershell')) {
  $command = Get-Command $candidate -ErrorAction SilentlyContinue
  if ($command) {
    $PowerShellRunner = $command.Source
    break
  }
}

foreach ($activity in $activities) {
  Write-Host ''
  Write-Host '=================================================='
  Write-Host "Validando: $activity"
  Write-Host '=================================================='

  if ($PowerShellRunner) {
    & $PowerShellRunner -NoLogo -NoProfile -File "$RepoRoot/scripts/run-activity.ps1" $activity
    if ($LASTEXITCODE -ne 0) {
      exit $LASTEXITCODE
    }
  }
  else {
    & "$RepoRoot/scripts/run-activity.ps1" $activity
    if (-not $?) {
      exit 1
    }
  }
}

Write-Host ''
Write-Host 'OK: todas las actividades pasaron la validacion publica.'
