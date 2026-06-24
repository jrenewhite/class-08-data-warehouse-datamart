#!/usr/bin/env bash
set -euo pipefail

if [[ -n ${SCRIPT_PATH-} ]]; then
  script_source="$SCRIPT_PATH"
elif [[ -n ${BASH_SOURCE[0]-} ]]; then
  script_source="${BASH_SOURCE[0]}"
else
  script_source="$0"
fi
script_dir="$(cd "$(dirname "$script_source")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

usage() {
  echo "Uso: $(basename "$0") <activity-name>" >&2
  exit 1
}

activity_name="${1:-}"
[[ -n "$activity_name" ]] || usage

activity_dir="$repo_root/activities/$activity_name"
submission_sql="$activity_dir/submission.sql"
report_md="$activity_dir/REPORT.md"
actual_dir="$activity_dir/actual"
validation_report="$actual_dir/validation.txt"

require_file() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    echo "ERROR: falta '$path'." >&2
    exit 1
  fi
}

require_nonempty() {
  local path="$1"
  if [[ ! -s "$path" ]]; then
    echo "ERROR: '$path' esta vacio." >&2
    exit 1
  fi
}

if [[ ! -d "$activity_dir" ]]; then
  echo "ERROR: no existe la actividad '$activity_name'." >&2
  exit 1
fi

mkdir -p "$actual_dir"
require_file "$submission_sql"
require_file "$report_md"
require_nonempty "$submission_sql"
require_nonempty "$report_md"

case "$activity_name" in
  class-activity-01)
    if ! grep -Eqi 'Capa elegida:' "$submission_sql"; then
      echo "ERROR: falta 'Capa elegida:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi 'Necesidad analitica:|Necesidad analítica:' "$submission_sql"; then
      echo "ERROR: falta 'Necesidad analitica:' o 'Necesidad analítica:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi 'Justificacion:|Justificación:' "$submission_sql"; then
      echo "ERROR: falta 'Justificacion:' o 'Justificación:' en submission.sql." >&2
      exit 1
    fi
    {
      echo "Actividad: $activity_name"
      echo "Capa elegida: presente"
      echo "Necesidad analitica: presente"
      echo "Justificacion: presente"
      echo "Estado: validacion publica aprobada"
    } > "$validation_report"
    ;;
  class-activity-02)
    if ! grep -Eqi 'Beneficio:' "$submission_sql"; then
      echo "ERROR: falta 'Beneficio:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi 'Limitacion:|Limitación:' "$submission_sql"; then
      echo "ERROR: falta 'Limitacion:' o 'Limitación:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi 'Tradeoff:' "$submission_sql"; then
      echo "ERROR: falta 'Tradeoff:' en submission.sql." >&2
      exit 1
    fi
    {
      echo "Actividad: $activity_name"
      echo "Beneficio: presente"
      echo "Limitacion: presente"
      echo "Tradeoff: presente"
      echo "Estado: validacion publica aprobada"
    } > "$validation_report"
    ;;
  home-activity)
    if ! grep -Eqi 'Caso elegido:' "$submission_sql"; then
      echo "ERROR: falta 'Caso elegido:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi 'Capa elegida:' "$submission_sql"; then
      echo "ERROR: falta 'Capa elegida:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi '^--[[:space:]]*Por que:|^--[[:space:]]*Por qué:' "$submission_sql"; then
      echo "ERROR: falta 'Por que:' o 'Por qué:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi 'Problema que resuelve:' "$submission_sql"; then
      echo "ERROR: falta 'Problema que resuelve:' en submission.sql." >&2
      exit 1
    fi
    if ! grep -Eqi 'Limitacion o tradeoff:|Limitación o tradeoff:' "$submission_sql"; then
      echo "ERROR: falta 'Limitacion o tradeoff:' o 'Limitación o tradeoff:' en submission.sql." >&2
      exit 1
    fi
    {
      echo "Actividad: $activity_name"
      echo "Caso elegido: presente"
      echo "Capa elegida: presente"
      echo "Por que: presente"
      echo "Problema que resuelve: presente"
      echo "Limitacion o tradeoff: presente"
      echo "Estado: validacion publica aprobada"
    } > "$validation_report"
    ;;
  *)
    echo "ERROR: actividad no soportada '$activity_name'." >&2
    exit 1
    ;;
esac

echo "OK: $activity_name -> $validation_report"
