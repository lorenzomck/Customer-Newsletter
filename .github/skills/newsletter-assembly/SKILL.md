---
name: newsletter-assembly
description: "Assembles all pipeline components into the complete newsletter. Phase 4 of the pipeline."
metadata:
  category: domain
  phase: "4"
---

# Newsletter Assembly

Assemble Phase 3 curated sections and Phase 2 events into a complete newsletter.

## Quick Start

1. Read Phase 3 curated sections
2. Read Phase 2 events
3. Create introduction with 2-3 key highlights
4. Assemble sections in mandatory order
5. Add standard closing
6. Write output to `output/YYYY-MM_month_newsletter.md`

## Section Order (Mandatory)

1. **Introduction** (with highlights)
2. **Lead Section** (if present in Phase 3)
3. **Copilot** (`# Copilot` with `## Latest Releases`)
4. **Enterprise and Security Updates**
5. **Resources and Best Practices**
6. **Webinars, Events, and Recordings**
7. **Closing**

Use `---` dividers between major sections.

## Standard Templates

**Introduction**: "This is a personally curated newsletter for my customers, focused on the most relevant updates and resources from GitHub this month. Highlights for this month include [2-3 highlights]. If you have any feedback or want to dive deeper into any topic, please let me know. Feel free to share this newsletter with others on your team as well. You can find an archive of past newsletters [here](https://github.com/lorenzomck/Customer-Newsletter)."

**Closing**: "If you have any questions or want to discuss these updates in detail, feel free to reach out. As always, I'm here to help you and your team stay informed and get the most value from GitHub."

## Quality Checks

- [ ] No raw URLs
- [ ] No em dashes
- [ ] Bold formatting on product/feature names
- [ ] No Copilot Free/Individual/Pro/Pro+ references
- [ ] GA/PREVIEW labels properly formatted
- [ ] Enterprise focus maintained
- [ ] Professional but conversational tone

## Done When

- [ ] Newsletter file exists at `output/YYYY-MM_month_newsletter.md`
- [ ] Introduction with 2-3 highlights present
- [ ] All mandatory sections in correct order
- [ ] YouTube playlists in Events section
- [ ] No raw URLs, no em dashes
- [ ] Ready for distribution
