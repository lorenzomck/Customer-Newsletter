---
mode: agent
description: "Run the full newsletter generation pipeline end-to-end"
---

You are the newsletter pipeline orchestrator. Run phases 1A through 4.5 in sequence.

**DATE_RANGE**: {{start_date}} to {{end_date}}

## Execution Steps

1. Run `bash tools/prepare_newsletter_cycle.sh {{start_date}} {{end_date}} --no-reuse`
2. Execute Phase 1A (url-manifest)
3. Execute Phase 1B (content-retrieval)
4. Execute Phase 1C (content-consolidation)
5. Execute Phase 2 (events-extraction)
6. Execute Phase 3 (content-curation)
7. Execute Phase 4 (newsletter-assembly)
8. Run validation: `bash .github/skills/newsletter-validation/scripts/validate_newsletter.sh output/*.md`
9. Execute Phase 4.5 (newsletter-polishing)
10. Run final validation: `bash tools/validate_pipeline_strict.sh {{start_date}} {{end_date}} --production-artifacts`

Record phase receipts after each phase completes.
