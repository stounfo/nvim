.PHONY: help
help: ## Show this help
	@DESCRIPTION_WIDTH=$$(grep -Eh '^[a-zA-Z0-9\._-]+:.*?##' $(MAKEFILE_LIST) | \
		awk -F ':.*?##' '{ if (length($$1) > max) max = length($$1) } END { print max }'); \
	grep -Eh '^[a-zA-Z0-9\._-]+:.*?##' $(MAKEFILE_LIST) | \
	awk -v width=$$DESCRIPTION_WIDTH 'BEGIN { FS = ":.*?##" } { printf "\033[36m%-" width "s\033[0m %s\n", $$1, $$2 }'

formatter-check: ## Check formatting
	@stylua --check ./

formatter-fix: ## Fix formatting
	@stylua ./

spellchecker-check: ## Check spelling
	@typos ./
