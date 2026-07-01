---
name: content-consolidation
description: "Merges, deduplicates, and filters 5 interim files for enterprise relevance. Phase 1C of the pipeline."
metadata:
  category: domain
  phase: "1C"
---

# Content Consolidation

Merge, deduplicate, and filter 5 Phase 1B interim files into a single discoveries document.

## Quick Start

1. Read all 5 interim files from Phase 1B
2. Aggregate items with source tracking
3. Deduplicate: same feature from multiple sources becomes one item
4. Categorize into taxonomy categories
5. Filter for enterprise relevance (score 5+)
6. Write output to `workspace/newsletter_phase1a_discoveries_YYYY-MM-DD_to_YYYY-MM-DD.md`

## Output

- **File**: `workspace/newsletter_phase1a_discoveries_YYYY-MM-DD_to_YYYY-MM-DD.md`
- **Target**: 20-40 items with balanced category distribution

## Core Workflow

1. **Aggregate** all items from 5 interim files
2. **Enrich** — check for known gaps (Visual Studio devblogs, Azure ecosystem, GitHub news-insights, enablement resources)
3. **Deduplicate** — same feature from multiple sources merges into one entry
4. **Categorize** into: Monthly Announcements (3-5), Copilot Releases (8-12), Copilot at Scale (4-6), Platform Updates (5-10), Deprecations (0-3)
5. **Filter** for enterprise relevance (score 5+ on 1-10 scale)
6. **Write** discoveries file

## Done When

- [ ] Discoveries file exists
- [ ] 20-40 total items
- [ ] Zero duplicates
- [ ] No consumer-plan items
- [ ] All items have source URLs
