#!/usr/bin/env bash
# Strict pipeline validation
set -euo pipefail

START="${1:?Usage: validate_pipeline_strict.sh START END [flags]}"
END="${2:?Usage: validate_pipeline_strict.sh START END [flags]}"
shift 2

REQUIRE_FRESH=false
PRODUCTION=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --require-fresh) REQUIRE_FRESH=true; shift ;;
    --production-artifacts) PRODUCTION=true; shift ;;
    *) shift ;;
  esac
done

echo "=== Strict Pipeline Validation ==="
echo "Range: $START to $END"
echo "Require fresh: $REQUIRE_FRESH"
echo "Production artifacts: $PRODUCTION"

ERRORS=0

# Check Phase 1A
if ! ls workspace/newsletter_phase1a_url_manifest_* 2>/dev/null | head -1 > /dev/null; then
  echo "FAIL: Phase 1A manifest missing"
  ERRORS=$((ERRORS+1))
fi

# Check Phase 1B (at least one interim file)
if ! ls workspace/newsletter_phase1b_interim_* 2>/dev/null | head -1 > /dev/null; then
  echo "FAIL: Phase 1B interim files missing"
  ERRORS=$((ERRORS+1))
fi

# Check Phase 1C
if ! ls workspace/newsletter_phase1a_discoveries_* 2>/dev/null | head -1 > /dev/null; then
  echo "FAIL: Phase 1C discoveries missing"
  ERRORS=$((ERRORS+1))
fi

# Check Phase 2
if ! ls workspace/newsletter_phase2_events_* 2>/dev/null | head -1 > /dev/null; then
  echo "FAIL: Phase 2 events missing"
  ERRORS=$((ERRORS+1))
fi

# Check Phase 3
if ! ls workspace/newsletter_phase3_curated_sections_* 2>/dev/null | head -1 > /dev/null; then
  echo "FAIL: Phase 3 curated sections missing"
  ERRORS=$((ERRORS+1))
fi

# Check final output
if ! ls output/*_newsletter.md 2>/dev/null | head -1 > /dev/null; then
  echo "FAIL: Final newsletter missing in output/"
  ERRORS=$((ERRORS+1))
fi

if [[ $ERRORS -eq 0 ]]; then
  echo "PASS: All pipeline artifacts present"
  exit 0
else
  echo "FAIL: $ERRORS artifact(s) missing"
  exit 1
fi
