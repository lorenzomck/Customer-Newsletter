#!/usr/bin/env bash
# Heuristic scoring (41pt max)
set -euo pipefail

SCORE=0

# Check skill count
SKILL_COUNT=$(find .github/skills -name "SKILL.md" | wc -l | tr -d ' ')
if [[ $SKILL_COUNT -ge 8 ]]; then
  SCORE=$((SCORE+10))
elif [[ $SKILL_COUNT -ge 5 ]]; then
  SCORE=$((SCORE+5))
fi

# Check agent count
AGENT_COUNT=$(find .github/agents -name "*.agent.md" | wc -l | tr -d ' ')
if [[ $AGENT_COUNT -ge 2 ]]; then
  SCORE=$((SCORE+5))
fi

# Check SOURCES.yaml has entries
if grep -q "canonical_urls" kb/SOURCES.yaml 2>/dev/null; then
  SCORE=$((SCORE+5))
fi

# Check profile.yaml
if grep -q "curator:" config/profile.yaml 2>/dev/null; then
  SCORE=$((SCORE+5))
fi

# Check workflows exist
if [[ -f .github/workflows/ci.yml ]]; then
  SCORE=$((SCORE+5))
fi

# Check tools exist
TOOL_COUNT=$(find tools -name "*.sh" | wc -l | tr -d ' ')
if [[ $TOOL_COUNT -ge 3 ]]; then
  SCORE=$((SCORE+5))
fi

echo "Heuristic score: $SCORE / 41"
[[ $SCORE -ge 20 ]] || exit 1
