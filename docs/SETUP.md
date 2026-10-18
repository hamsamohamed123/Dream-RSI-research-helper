# Dream-RSI setup

The original research notes and papers remain at the repository root.
The official implementation is a pinned Git submodule in `vendor/dream-rsi`, pinned to
`google-research/dream-rsi@8ec35bd2538220517ce1bfca4282db21b8c518db` (Apache-2.0).
Its README documents the original architecture and configuration.

Requirements: Python >=3.10, Git, Bash >=4, and authenticated OpenAI Codex CLI.
On macOS install a current Bash (`brew install bash python@3.11 node`).
Ensure the Homebrew Bash is first on PATH before running the scripts.

```bash
bash scripts/setup.sh
npm install -g @openai/codex
codex login
bash scripts/smoke.sh
# Explicitly launch a real model-backed experiment (consumes usage):
DRY_RUN=0 bash scripts/smoke.sh
```

Setup installs the editable upstream package with task and test dependencies,
runs unit tests, and fetches the circle-packing task from the upstream-pinned
SimpleTES revision. Those downloaded task files are AGPL-3.0 and are not
redistributed in this setup commit; the fetch script copies their license.

Smoke defaults: 2 rounds, 2 branches, 1 refinement, 1 worker, 1 policy rewrite.
Outputs go to root `workspace/smoke`; choose a new WORKSPACE for each independent run.
No robotics adapter or scientific improvement is claimed by this repository setup.

Architecture: `dream_rsi/agents/codex.py` drives Codex; `exploration/` executes
rollouts; `env/` shares the online/replay interface; `learning/` replays discovery
trees and searches policies; `orchestrate.py` coordinates exploration and promotion.

Before allowing generated code access to private data, implement and verify
separate isolation and protected evaluation. The upstream backend uses Codex
`--full-auto`; that alone does not provide an immutable evaluation boundary.
