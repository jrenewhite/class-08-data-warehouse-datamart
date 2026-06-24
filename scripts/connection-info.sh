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

unset script_source script_dir

cat <<'INFO'
==================================================
Class 08 PostgreSQL connection info
==================================================
Inside the devcontainer or from another container:
  host: postgres
  port: 5432
  database: advanced_databases
  user: developer
  password: developer
  url: postgresql://developer:developer@postgres:5432/advanced_databases

From Windows or your host machine:
  host: localhost
  port: 5432
  database: advanced_databases
  user: developer
  password: developer
  url: postgresql://developer:developer@localhost:5432/advanced_databases

Use localhost:5432 if you connect from VS Code PostgreSQL, DBeaver,
pgAdmin, psql on Windows, or any client outside the devcontainer.

Web client fallback:
  Adminer: http://localhost:8080
  system: PostgreSQL
  server: postgres
  user: developer
  password: developer
  database: advanced_databases
INFO
