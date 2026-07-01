#!/usr/bin/env bash
# Record a phase receipt
set -euo pipefail

START="${1:?Usage: record_phase_receipt.sh START END PHASE_ID ARTIFACT_PATH}"
END="${2:?Usage: record_phase_receipt.sh START END PHASE_ID ARTIFACT_PATH}"
PHASE_ID="${3:?Usage: record_phase_receipt.sh START END PHASE_ID ARTIFACT_PATH}"
ARTIFACT="${4:?Usage: record_phase_receipt.sh START END PHASE_ID ARTIFACT_PATH}"

RECEIPT_FILE="workspace/newsletter_phase_receipts_${END}.json"

if [[ ! -f "$RECEIPT_FILE" ]]; then
  echo '{}' > "$RECEIPT_FILE"
fi

# Add receipt entry
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
python3 -c "
import json, sys
f = '$RECEIPT_FILE'
with open(f) as fh:
    data = json.load(fh)
data['$PHASE_ID'] = {'artifact': '$ARTIFACT', 'timestamp': '$TIMESTAMP'}
with open(f, 'w') as fh:
    json.dump(data, fh, indent=2)
" 2>/dev/null || echo "{\"$PHASE_ID\": {\"artifact\": \"$ARTIFACT\", \"timestamp\": \"$TIMESTAMP\"}}" > "$RECEIPT_FILE"

echo "Receipt recorded: $PHASE_ID -> $ARTIFACT"
