# Research engineering instructions

Preserve the papers, assets, and existing research README.
Official Dream-RSI is vendored under vendor/dream-rsi; prefer narrow adapters over rewrites.
First reproduce the original benchmark and verify replay before extending the controller.
Run scripts/setup.sh and scripts/smoke.sh (dry-run default). Real model runs consume usage.
Keep evaluator, benchmark, and coding model fixed in comparisons. Never tune on hidden test outcomes.
Record revisions, configurations, seeds, failures, wall time, and model usage. Report negative results.
Do not claim experiments ran without saved execution evidence.
Only exploration-policy code is recursively optimized. Require prospective validation for promotion.
Generated candidate code needs execution isolation; upstream --full-auto alone is not proof of evaluator protection.
Never commit credentials, virtual environments, or generated workspace data.
