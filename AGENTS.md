# AGENTS.md

> Primary AI instruction surface for lorenzomck-customer-newsletter (platform-agnostic).
> Monthly GitHub customer newsletter pipeline: six core phases plus optional polish and editorial stages, driven by LLM skills, scoring, and intelligence mining.

## Operating Protocol

Every change follows this numbered workflow. No exceptions.

1. **Hypothesize** — State a testable prediction with explicit PASS criteria
2. **Score** — Define a scoring rubric with acceptance threshold
3. **Plan** — Design the approach before building
4. **Build** — Implement the change
5. **Test** — Validate against PASS criteria using layered scoring (cheapest first)
6. **Fix** — Iterate until all criteria pass
7. **Validate** — Run quality checks (scoring battery)
8. **Document** — Update relevant docs
9. **Clean up** — Delete old implementations, archive stale artifacts

## Core Principles

- **Skills-First**: Check `.github/skills/` before implementing ad-hoc procedures.
- **Trust Disk, Not Self-Reports**: Verify by reading files, not trusting agent claims.
- **Layered Scoring (Cheapest First)**: Structural → Heuristic → Selection → Editorial.
- **Feed-Forward Learnings**: Every finding becomes a lesson captured back into skills.

## Agents (2)

| # | Agent | Purpose |
|---|---|---|
| 1 | customer_newsletter | Pipeline orchestrator (phases 1A-5) |
| 2 | editorial-analyst | Editorial intelligence mining + corrections |

## Skills (10)

| # | Skill | Purpose |
|---|---|---|
| 1 | url-manifest | Phase 1A: Discover announcement URLs |
| 2 | content-retrieval | Phase 1B: Fetch and extract content |
| 3 | content-consolidation | Phase 1C: Merge discoveries |
| 4 | events-extraction | Phase 2: Extract events and dates |
| 5 | content-curation | Phase 3: Select and organize content |
| 6 | newsletter-assembly | Phase 4: Assemble final newsletter |
| 7 | newsletter-validation | Validate assembled newsletter |
| 8 | newsletter-polishing | Phase 4.5: Apply editorial polish |
| 9 | editorial-review | Post-assembly editorial corrections |
| 10 | kb-maintenance | Knowledge base upkeep |

Skills are at `.github/skills/<name>/SKILL.md`.

## Key Files

| File | Purpose |
|---|---|
| .github/skills/ | 10 skills |
| tools/ | Scoring + build automation |
| reference/ | Editorial intelligence + source intelligence |
| kb/ | Knowledge base (sources, taxonomy, maintenance) |
| config/profile.yaml | Newsletter personalization |
