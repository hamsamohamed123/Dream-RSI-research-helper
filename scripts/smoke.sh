#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT/.venv/bin/activate"
command -v codex >/dev/null || { echo 'Install Codex CLI and run codex login first.' >&2; exit 1; }
codex login status
export AGENT=codex ROUNDS=2 BRANCHES=2 REFINE=1 MAX_WORKERS=1 DISCOVER_ROUNDS=1
export WORKSPACE="${WORKSPACE:-$ROOT/workspace/smoke}"
export DRY_RUN="${DRY_RUN:-1}"
cd "$ROOT/vendor/dream-rsi"
bash scripts/run_dream_rsi.sh circle_packing_26
