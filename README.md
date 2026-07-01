# Customer Newsletter Generator

A fully automated, skills-based system for generating monthly GitHub customer newsletters. Built with a phased pipeline, layered scoring, and editorial intelligence.

## Quick Start

```bash
# Generate a newsletter
make newsletter-gen START=2026-05-01 END=2026-07-01 MODE=production
```

VS Code flow: open the repo, select the `customer_newsletter` agent, then run:

```text
please generate the newsletter from scratch for the dates <START> to <END>
```

## System Overview

| Component | Count | Key Files |
|-----------|-------|-----------|
| **Skills** | 10 | `.github/skills/*/SKILL.md` |
| **Agents** | 2 | `.github/agents/*.agent.md` |
| **Prompts** | 8 | `.github/prompts/*.prompt.md` |

## Pipeline Phases

| Phase | Skill | Input | Output |
|-------|-------|-------|--------|
| 1A | url-manifest | DATE_RANGE, SOURCES.yaml | Candidate URLs |
| 1B | content-retrieval | URL manifest | 5 interim files |
| 1C | content-consolidation | Interim files | 30-50 discoveries |
| 2 | events-extraction | Event URLs | Event tables |
| 3 | content-curation | Discoveries | 15-20 curated sections |
| 4 | newsletter-assembly | Curated + Events | Final newsletter |
| 4.5 | newsletter-polishing | Assembled newsletter | Polished newsletter |
| 5 | editorial-review | Human corrections | Updated newsletter |

## Target Audience

Engineering Managers, DevOps Leads, and IT Leadership at large regulated enterprises (Healthcare, Manufacturing, Financial Services).

## Key Directories

| Path | Purpose |
|------|---------|
| `.github/skills/` | Pipeline skills |
| `.github/prompts/` | Phase prompts + pipeline orchestrator |
| `reference/` | Editorial intelligence, source intelligence |
| `kb/` | Knowledge base with source entries |
| `tools/` | Scoring, validation, automation scripts |
| `output/` | Final newsletter files |
| `archive/` | Historical newsletters by year |
| `workspace/` | Pipeline intermediates during local runs |

## Makefile Targets

```bash
make validate-structure        # Validate repo structure
make validate-newsletter FILE= # Validate a newsletter
make newsletter-gen START= END= MODE= # Full pipeline
make help                      # Show all targets
```

## Category Taxonomy

- **Security & Compliance**: Secret protection, code scanning, Dependabot, supply chain
- **AI & Automation**: Copilot (all IDEs), Extensions, AI-powered features
- **Platform & DevEx**: Repos, PRs, Issues, Projects, Actions, Packages, Codespaces
- **Enterprise Administration**: EMU, SCIM, policies, billing, license management
