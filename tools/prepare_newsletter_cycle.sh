#!/usr/bin/env bash
# Prepare workspace for a new newsletter cycle
set -euo pipefail

START="${1:?Usage: prepare_newsletter_cycle.sh START END [--no-reuse]}"
END="${2:?Usage: prepare_newsletter_cycle.sh START END [--no-reuse]}"
NO_REUSE="${3:-}"

echo "=== Preparing newsletter cycle: $START to $END ==="

if [[ "$NO_REUSE" == "--no-reuse" ]]; then
  echo "Clearing workspace intermediates..."
  rm -f workspace/newsletter_phase*.md workspace/newsletter_phase*.json
  rm -f workspace/curator_notes_processed_*.md workspace/curator_notes_editorial_signals_*.md
fi

# Ensure workspace directory exists
mkdir -p workspace output

echo "Workspace ready for $START to $END"
