Param(
  [Parameter(Position = 0)]
  [string]$ActivityName
)

function Show-Usage {
  Write-Host "Uso: .\scripts\run-activity.ps1 <activity-name>" -ForegroundColor Red
  throw "Falta el nombre de la actividad."
}

if (-not $ActivityName) {
  Show-Usage
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir '..')
$ActivityDir = Join-Path $RepoRoot "activities/$ActivityName"
$SubmissionSql = Join-Path $ActivityDir 'submission.sql'
$ReportMd = Join-Path $ActivityDir 'REPORT.md'
$ActualDir = Join-Path $ActivityDir 'actual'
$ValidationReport = Join-Path $ActualDir 'validation.txt'

function Require-File {
  param([string]$Path)
  if (-not (Test-Path $Path -PathType Leaf)) {
    throw "ERROR: falta '$Path'."
  }
}

function Require-NonEmpty {
  param([string]$Path)
  if (-not ((Get-Item $Path).Length -gt 0)) {
    throw "ERROR: '$Path' esta vacio."
  }
}

if (-not (Test-Path $ActivityDir -PathType Container)) {
  throw "ERROR: no existe la actividad '$ActivityName'."
}

try {
  New-Item -ItemType Directory -Force -Path $ActualDir | Out-Null
  Require-File $SubmissionSql
  Require-File $ReportMd
  Require-NonEmpty $SubmissionSql
  Require-NonEmpty $ReportMd

  switch ($ActivityName) {
    'class-activity-01' {
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Capa elegida:' -Quiet)) {
        throw "ERROR: falta 'Capa elegida:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Necesidad analitica:|Necesidad analítica:' -Quiet)) {
        throw "ERROR: falta 'Necesidad analitica:' o 'Necesidad analítica:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Justificacion:|Justificación:' -Quiet)) {
        throw "ERROR: falta 'Justificacion:' o 'Justificación:' en submission.sql."
      }
      @(
        "Actividad: $ActivityName"
        "Capa elegida: presente"
        "Necesidad analitica: presente"
        "Justificacion: presente"
        "Estado: validacion publica aprobada"
      ) | Set-Content -Encoding UTF8 $ValidationReport
    }
    'class-activity-02' {
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Beneficio:' -Quiet)) {
        throw "ERROR: falta 'Beneficio:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Limitacion:|Limitación:' -Quiet)) {
        throw "ERROR: falta 'Limitacion:' o 'Limitación:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Tradeoff:' -Quiet)) {
        throw "ERROR: falta 'Tradeoff:' en submission.sql."
      }
      @(
        "Actividad: $ActivityName"
        "Beneficio: presente"
        "Limitacion: presente"
        "Tradeoff: presente"
        "Estado: validacion publica aprobada"
      ) | Set-Content -Encoding UTF8 $ValidationReport
    }
    'home-activity' {
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Caso elegido:' -Quiet)) {
        throw "ERROR: falta 'Caso elegido:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Capa elegida:' -Quiet)) {
        throw "ERROR: falta 'Capa elegida:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern '^--\s*Por que:|^--\s*Por qué:' -Quiet)) {
        throw "ERROR: falta 'Por que:' o 'Por qué:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Problema que resuelve:' -Quiet)) {
        throw "ERROR: falta 'Problema que resuelve:' en submission.sql."
      }
      if (-not (Select-String -Path $SubmissionSql -Pattern 'Limitacion o tradeoff:|Limitación o tradeoff:' -Quiet)) {
        throw "ERROR: falta 'Limitacion o tradeoff:' o 'Limitación o tradeoff:' en submission.sql."
      }
      @(
        "Actividad: $ActivityName"
        "Caso elegido: presente"
        "Capa elegida: presente"
        "Por que: presente"
        "Problema que resuelve: presente"
        "Limitacion o tradeoff: presente"
        "Estado: validacion publica aprobada"
      ) | Set-Content -Encoding UTF8 $ValidationReport
    }
    default {
      throw "ERROR: actividad no soportada '$ActivityName'."
    }
  }
  Write-Host "OK: $ActivityName -> $ValidationReport"
}
catch {
  Write-Host $_.Exception.Message -ForegroundColor Red
  throw
}
