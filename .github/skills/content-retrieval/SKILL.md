---
name: content-retrieval
description: "Fetches and extracts content from Phase 1A URL manifest into 5 interim files by source. Phase 1B of the pipeline."
metadata:
  category: domain
  phase: "1B"
---

# Content Retrieval

Fetch content from Phase 1A URLs and extract items into 5 interim files (one per source).

## Quick Start

1. Read the Phase 1A URL manifest from `workspace/newsletter_phase1a_url_manifest_*.md`
2. Process sources sequentially: GitHub, VS Code, Visual Studio, JetBrains, Xcode
3. For each source: fetch URLs, extract features, write interim file
4. Output: 5 files in `workspace/newsletter_phase1b_interim_{source}_*.md`

## Output

5 interim files in `workspace/`:
- `newsletter_phase1b_interim_github_YYYY-MM-DD_to_YYYY-MM-DD.md`
- `newsletter_phase1b_interim_vscode_YYYY-MM-DD_to_YYYY-MM-DD.md`
- `newsletter_phase1b_interim_visualstudio_YYYY-MM-DD_to_YYYY-MM-DD.md`
- `newsletter_phase1b_interim_jetbrains_YYYY-MM-DD_to_YYYY-MM-DD.md`
- `newsletter_phase1b_interim_xcode_YYYY-MM-DD_to_YYYY-MM-DD.md`

## Core Rules

- **Anchor Unit = Feature, NOT Version**: Decompose each version into individual feature entries.
- **IDE Monthly Update Deep-Read**: Deep-read the full release notes page, not just the changelog summary.
- **Surface Attribution**: Verify which surface a feature actually lives on.
- **Status Label Verification**: Never infer GA status. Check the exact source text.

## Per-Chunk Validation

Before moving to next chunk, verify:
- [ ] All manifest URLs for this source were processed
- [ ] Output is feature-based, not version-based
- [ ] Each entry has date, description, links, relevance score
- [ ] All dates within DATE_RANGE
- [ ] Interim file written and confirmed on disk

## Done When

- [ ] All 5 interim files exist in `workspace/`
- [ ] All files use feature-based format
- [ ] Total item count is reasonable (expect 40-100 items across all sources)
