#!/usr/bin/env bash
# Structural scoring (30pt max)
set -euo pipefail

SCORE=0
MAX=30

# Check required directories
for dir in .github/skills .github/agents .github/prompts kb config tools output; do
  if [[ -d "$dir" ]]; then
    SCORE=$((SCORE+3))
  else
    echo "MISSING: $dir"
  fi
done

# Check required files
for f in AGENTS.md README.md config/profile.yaml kb/SOURCES.yaml kb/EVENT_SOURCES.yaml Makefile; do
  if [[ -f "$f" ]]; then
    SCORE=$((SCORE+2))
  else
    echo "MISSING: $f"
  fi
done

echo "Structural score: $SCORE / $MAX"
[[ $SCORE -ge 20 ]] || exit 1
