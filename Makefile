# General.
SHELL = /usr/bin/env bash

help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) | sort

.PHONY: cue.mod
cue.mod:
	rm -rf cue.mod/gen
	cue get go github.com/kyverno/kyverno/api/kyverno/v1
