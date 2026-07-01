---
name: events-extraction
description: "Extracts and formats upcoming events and webinars. Phase 2 of the pipeline."
metadata:
  category: domain
  phase: "2"
---

# Events Extraction

Extract, classify, and format upcoming events and webinars for the newsletter.

## Quick Start

1. Fetch event source URLs from `kb/EVENT_SOURCES.yaml`
2. Extract event details from each source
3. Classify: Virtual, In-person, or Hybrid
4. Format into tables
5. Write output to `workspace/newsletter_phase2_events_YYYY-MM-DD.md`

## Sources

- `https://github.com/resources/events`
- Microsoft Reactor series (GitHub/Copilot/DevOps tracks)
- Copilot Fridays back catalog

## Output Format

- `## Virtual Events` — table with Date + Event + Categories
- `## In-Person Events` — table with Date + Location + Event
- `## Behind the scenes` — short operational notes

## Canonical Categories

- **Copilot**: All GitHub Copilot related sessions
- **GitHub Platform**: Core platform, Actions, general features
- **Developer Experience**: Workflows, training, productivity
- **Enterprise**: Compliance, governance, administration, security

## Standard Content Blocks

Always include:
- Copilot Fridays back catalog link
- YouTube playlists (from config/profile.yaml)

## Done When

- [ ] Events file exists at `workspace/newsletter_phase2_events_*.md`
- [ ] Virtual and In-person sections present
- [ ] All links embedded as markdown
- [ ] Standard content blocks included
- [ ] Enterprise relevance satisfied
