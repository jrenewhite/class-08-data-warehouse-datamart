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
compose_file="$repo_root/docker-compose.yml"
database_url="${DATABASE_URL:-postgresql://developer:developer@postgres:5432/advanced_databases}"

usage() {
  cat >&2 <<'EOF'
Uso:
  ./scripts/session.sh up
  ./scripts/session.sh down
  ./scripts/session.sh reset
  ./scripts/session.sh seed
  ./scripts/session.sh psql
  ./scripts/session.sh test
  ./scripts/session.sh run <activity-name>
  ./scripts/session.sh run-all
EOF
  exit 1
}

command_name="${1:-}"
shift || true

compose() {
  docker compose -f "$compose_file" "$@"
}

case "$command_name" in
  up)
    compose up -d --build
    ;;
  down)
    compose down
    ;;
  reset)
    compose down -v
    compose up -d --build
    ;;
  seed)
    compose exec -T workspace psql "$database_url" -f /workspace/session/demo/seed.sql
    ;;
  psql)
    compose exec -it workspace psql "$database_url"
    ;;
  test)
    SCRIPT_PATH="$repo_root/scripts/run-all.sh" bash -s -- < <(tr -d '\r' < "$repo_root/scripts/run-all.sh")
    ;;
  run)
    activity_name="${1:-}"
    [[ -n "$activity_name" ]] || usage
    SCRIPT_PATH="$repo_root/scripts/run-activity.sh" bash -s -- "$activity_name" < <(tr -d '\r' < "$repo_root/scripts/run-activity.sh")
    ;;
  run-all)
    SCRIPT_PATH="$repo_root/scripts/run-all.sh" bash -s -- < <(tr -d '\r' < "$repo_root/scripts/run-all.sh")
    ;;
  "")
    usage
    ;;
  *)
    usage
    ;;
esac
