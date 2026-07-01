.PHONY: help validate-structure validate-all-skills validate-newsletter newsletter-gen

help: ## Show all targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

validate-structure: ## Validate repository structure
	@echo "=== Structure Validation ==="
	@test -d .github/skills || (echo "FAIL: .github/skills missing" && exit 1)
	@test -d .github/agents || (echo "FAIL: .github/agents missing" && exit 1)
	@test -d .github/prompts || (echo "FAIL: .github/prompts missing" && exit 1)
	@test -d kb || (echo "FAIL: kb/ missing" && exit 1)
	@test -d tools || (echo "FAIL: tools/ missing" && exit 1)
	@test -f config/profile.yaml || (echo "FAIL: config/profile.yaml missing" && exit 1)
	@test -f kb/SOURCES.yaml || (echo "FAIL: kb/SOURCES.yaml missing" && exit 1)
	@test -f AGENTS.md || (echo "FAIL: AGENTS.md missing" && exit 1)
	@echo "PASS: All required structure present"

validate-all-skills: ## Validate all skills have SKILL.md
	@echo "=== Skill Validation ==="
	@FAIL=0; \
	for dir in .github/skills/*/; do \
		if [ ! -f "$$dir/SKILL.md" ]; then \
			echo "FAIL: Missing SKILL.md in $$dir"; \
			FAIL=1; \
		fi; \
	done; \
	if [ $$FAIL -eq 0 ]; then echo "PASS: All skills valid"; fi; \
	exit $$FAIL

validate-newsletter: ## Validate a newsletter file (FILE=path)
	@bash .github/skills/newsletter-validation/scripts/validate_newsletter.sh $(FILE)

newsletter-gen: ## Generate newsletter (START= END= MODE=)
	@echo "=== Newsletter Generation ==="
	@echo "Range: $(START) to $(END)"
	@echo "Mode: $(MODE)"
	@bash tools/prepare_newsletter_cycle.sh $(START) $(END) --no-reuse
	@echo "Workspace prepared. Run the pipeline via the customer_newsletter agent."

score-structural: ## Run structural scoring
	@bash tools/score-structural.sh

score-heuristic: ## Run heuristic scoring
	@bash tools/score-heuristic.sh
