---
name: content-curation
description: "Transforms discoveries into polished, newsletter-ready content sections. Phase 3 of the pipeline."
metadata:
  category: domain
  phase: "3"
---

# Content Curation

Transform Phase 1C discoveries into polished, newsletter-ready content sections.

## Quick Start

1. Read Phase 1C discoveries from `workspace/newsletter_phase1a_discoveries_*.md`
2. Select items using priority weights
3. Organize into sections: Copilot, Enterprise and Security, Platform, Resources
4. Apply formatting: bold terms, GA/PREVIEW labels, embedded links
5. Write to `workspace/newsletter_phase3_curated_sections_YYYY-MM-DD.md`

## Output

- **File**: `workspace/newsletter_phase3_curated_sections_YYYY-MM-DD.md`
- **Target**: 18+ curated bullets for standard 30-day ranges

## Priority Weights

1. **Governance/Admin** (3.0x) — policies, controls, billing, metrics
2. **Security/Compliance** (2.5x) — scanning, GHAS, supply chain
3. **GA Status** (2.0x) — GA always leads
4. **Novelty** (2.0x) — new categories, legal changes
5. **Platform openness** (2.0x) — BYOK, 3P integrations
6. **IDE Parity** (1.5x) — cross-IDE rollout
7. **Copilot Features** (1.0x baseline)

## Section Structure

- **Lead Section** (optional): Only when a clear dominant theme exists
- **Copilot + Latest Releases**: New features, model updates, agent capabilities
- **Enterprise and Security Updates**: Governance, billing, compliance
- **GitHub Platform Updates**: Actions, Projects, PR workflows
- **Resources and Best Practices**: Enablement assets, guides

## Formatting Rules

- Strip all raw metadata from output
- Bold key terms, no em dashes, no raw URLs
- GA/PREVIEW labels when known, omit when ambiguous
- Link priority: [Announcement] > [Docs] > [Release Notes] > [Changelog]

## Done When

- [ ] Curated sections file exists
- [ ] 18+ curated bullets
- [ ] Proper section structure
- [ ] GA/PREVIEW labels present where known
- [ ] No raw metadata, no em dashes, no raw URLs
- [ ] Enterprise focus throughout
