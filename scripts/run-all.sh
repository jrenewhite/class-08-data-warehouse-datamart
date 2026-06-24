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

activities=(
  class-activity-01
  class-activity-02
  home-activity
)

for activity_name in "${activities[@]}"; do
  echo
  echo "=================================================="
  echo "Validando: $activity_name"
  echo "=================================================="
  if ! SCRIPT_PATH="$repo_root/scripts/run-activity.sh" bash -s -- "$activity_name" < <(tr -d '\r' < "$repo_root/scripts/run-activity.sh"); then
    exit 1
  fi
done

echo
echo "OK: todas las actividades pasaron la validacion publica."
