---
name: newsletter-validation
description: "Validates newsletter output against quality standards."
metadata:
  category: domain
  phase: post
---

# Newsletter Validation

Validate newsletter output against quality standards.

## Quick Start

1. Run: `bash .github/skills/newsletter-validation/scripts/validate_newsletter.sh <newsletter_file>`
2. Exit 0 = pass, exit 1 = fail with details

## Automated Checks

### Required Sections
- Introduction with archive link
- Copilot section with Latest Releases
- Events section with YouTube playlists
- Closing section

### Forbidden Patterns
- Raw URLs not in markdown links
- Em dashes
- Double-bracket links `[[`
- Copilot Free/Individual/Pro/Pro+ plan mentions

### Format Compliance
- GA/PREVIEW labels in uppercase
- Events table has Date column
- File exists and has content (minimum 100 lines)

## Done When

- [ ] `validate_newsletter.sh` exits with code 0
- [ ] No required sections missing
- [ ] No forbidden patterns found
