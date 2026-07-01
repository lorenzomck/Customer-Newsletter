---
name: kb-maintenance
description: "Knowledge base upkeep: add sources, update versions, check link health."
metadata:
  category: meta
---

# KB Maintenance

Maintain the knowledge base: add new sources, update versions, check link health.

## Tasks

1. **Add source**: Add new entry to `kb/SOURCES.yaml` following schema
2. **Update version**: Update `latest_known` fields when new versions ship
3. **Link health**: Check all canonical_urls for 404s
4. **Event sources**: Update `kb/EVENT_SOURCES.yaml` with new series

## Done When

- [ ] SOURCES.yaml is valid YAML
- [ ] No broken canonical_urls
- [ ] Versions current
