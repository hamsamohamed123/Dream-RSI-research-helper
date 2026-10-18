#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
git submodule update --init --recursive
PYTHON="${PYTHON:-python3}"
"$PYTHON" -m venv .venv
.venv/bin/python -m pip install -e './vendor/dream-rsi[tasks,dev,kernel]'
.venv/bin/python -m pytest -q vendor/dream-rsi/tests
# Upstream task fetching requires Bash >=4 (macOS system Bash is 3.2).
if (( BASH_VERSINFO[0] < 4 )); then
  echo 'Use Homebrew Bash: brew install bash; then bash scripts/setup.sh' >&2
  exit 1
fi
bash vendor/dream-rsi/scripts/fetch_tasks.sh circle_packing_26
