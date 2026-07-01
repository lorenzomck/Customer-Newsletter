---
name: newsletter-polishing
description: "Applies automated polishing rules to a Phase 4 newsletter. Phase 4.5 between assembly and editorial review."
metadata:
  category: domain
  phase: "4.5"
---

# Newsletter Polishing

Apply polishing rules to a Phase 4 newsletter.

## Quick Start

1. Read the Phase 4 newsletter from `output/YYYY-MM_month_newsletter.md`
2. Apply Tier 1 structural fixes (zero-risk, deterministic)
3. Apply Tier 2 content-aware fixes (normalization)
4. Apply Tier 3 editorial guidelines (LLM-assisted)
5. Write polished output back to `output/YYYY-MM_month_newsletter.md`

## Tier 1: Structural Fixes

| Rule | Action |
|------|--------|
| Heading space | Insert space after `#` |
| Bullet normalization | Replace `•`, `*` with `-` |
| Unicode cleanup | Remove control characters |
| Double spaces | Collapse to single |
| Month abbreviations | Use 3-letter in event dates |

## Tier 2: Content-Aware Fixes

| Rule | Action |
|------|--------|
| Product name capitalization | Apply canonical dictionary |
| Status label format | Normalize to `(GA)` and `(PREVIEW)` |
| Link syntax validation | Verify all `[text](url)` render correctly |
| Chronological event sorting | Sort events by date ascending |

## Tier 3: Editorial Guidelines

| Rule | Action |
|------|--------|
| Introduction accuracy | Verify highlights match content |
| Enterprise context | Every major bullet has a "so what" |
| Link text accuracy | Labels match source type |

## Done When

- [ ] All Tier 1 rules applied
- [ ] Product names match canonical dictionary
- [ ] Status labels in standard format
- [ ] Validation passes
