#!/usr/bin/env bash
# Newsletter validation script
set -euo pipefail

FILE="${1:?Usage: validate_newsletter.sh <newsletter_file>}"

if [[ ! -f "$FILE" ]]; then
  echo "FAIL: File not found: $FILE"
  exit 1
fi

ERRORS=0
WARNINGS=0

echo "=== Validating: $FILE ==="

# Check minimum length
LINES=$(wc -l < "$FILE" | tr -d ' ')
if [[ $LINES -lt 100 ]]; then
  echo "FAIL: Newsletter too short ($LINES lines, minimum 100)"
  ERRORS=$((ERRORS+1))
fi

# Check required sections
for section in "Introduction" "Copilot" "Events" "Closing"; do
  if ! grep -qi "$section" "$FILE"; then
    echo "FAIL: Missing section: $section"
    ERRORS=$((ERRORS+1))
  fi
done

# Check for archive link
if ! grep -q "lorenzomck/Customer-Newsletter" "$FILE"; then
  echo "WARN: Missing archive link"
  WARNINGS=$((WARNINGS+1))
fi

# Check forbidden patterns
if grep -E '(?<!\[)https?://\S+(?!\))' "$FILE" | grep -v '^\[' | head -5 | grep -q .; then
  echo "WARN: Possible raw URLs detected"
  WARNINGS=$((WARNINGS+1))
fi

if grep -q '—' "$FILE"; then
  echo "FAIL: Em dashes found (use commas or rephrase)"
  ERRORS=$((ERRORS+1))
fi

if grep -q '\[\[' "$FILE"; then
  echo "FAIL: Double-bracket links found"
  ERRORS=$((ERRORS+1))
fi

if grep -qi 'copilot free\|copilot individual\|copilot pro+\|copilot pro ' "$FILE"; then
  echo "FAIL: Consumer plan mentions found"
  ERRORS=$((ERRORS+1))
fi

# Summary
echo "=== Results: $ERRORS errors, $WARNINGS warnings ==="
if [[ $ERRORS -gt 0 ]]; then
  exit 1
fi
echo "PASS"
exit 0
