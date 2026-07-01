---
name: url-manifest
description: "Generates validated URL manifest from kb/SOURCES.yaml for a given DATE_RANGE. Phase 1A of the newsletter pipeline."
metadata:
  category: domain
  phase: "1A"
---

# URL Manifest Generator

Generate and validate candidate URLs from known sources for a given DATE_RANGE.

## Quick Start

1. Receive DATE_RANGE (YYYY-MM-DD to YYYY-MM-DD)
2. Read `kb/SOURCES.yaml` for canonical URLs and feed endpoints
3. Generate candidate URLs per source using known patterns
4. Spot-check 1-2 URLs per source to confirm patterns work
5. Write manifest to `workspace/newsletter_phase1a_url_manifest_YYYY-MM-DD_to_YYYY-MM-DD.md`

## Inputs

- **DATE_RANGE**: Start date and end date in YYYY-MM-DD format
- **kb/SOURCES.yaml**: Canonical URL source with machine-readable entries

## Output

- **File**: `workspace/newsletter_phase1a_url_manifest_YYYY-MM-DD_to_YYYY-MM-DD.md`

## Core Workflow

### Step 1: Generate Candidates

For each source in SOURCES.yaml, generate candidate URLs using known patterns and DATE_RANGE months.

**Mandatory sources**:
1. **GitHub Changelog** (`github.blog/changelog/YYYY/MM/`)
2. **GitHub Blog Homepage** (`github.blog/latest/page/1/`)
3. **GitHub News & Insights** (`github.blog/news-insights/company-news/`)
4. **VS Code Release Notes** (`code.visualstudio.com/updates/v1_{VERSION}`)
5. **Visual Studio DevBlogs** (`devblogs.microsoft.com/visualstudio/`)
6. **JetBrains Plugin API** (`plugins.jetbrains.com/api/plugins/17718/updates`)
7. **Xcode CHANGELOG** (`github.com/github/CopilotForXcode/blob/main/CHANGELOG.md`)

### Step 2: Spot-Check Validation

For each source, fetch 1-2 URLs to confirm they exist and contain expected content.

### Step 3: Write Manifest

Output validated candidate URLs grouped by source with boundary verification.

## Done When

- [ ] Manifest file exists at `workspace/newsletter_phase1a_url_manifest_*.md`
- [ ] All major sources covered
- [ ] Spot-check passed for each source
- [ ] Boundaries verified
