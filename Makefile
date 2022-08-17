SHELL=/bin/bash

.PHONY: changelog release publish-release latest latest-git-short-hash next-version

REGEX := ^v([0-9]{1,}\.){2}[0-9]{1,}$$
DEFAULT_BRANCH := $(shell git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)
LATEST_VERSION := $(shell git --no-pager tag --sort=committerdate | grep -E '^v[0-9]' | sort -V | tail -1)
LATEST_GIT_TAG_SHORT_HASH := $(shell git rev-list -n 1 ${LATEST_VERSION} --abbrev-commit)
NEXT_VERSION := $(shell semtag final -s minor -o)

ifeq ($(LATEST_GIT_TAG_SHORT_HASH), $(shell git rev-parse --short HEAD))
  NEXT_GIT_TAG:=$(LATEST_VERSION)
else
  NEXT_GIT_TAG:=$(shell semtag final -s minor -o)
endif

changelog:
	git-chglog -o CHANGELOG.md --next-tag ${NEXT_VERSION}

release:
	@echo "Release/Tag: ${NEXT_GIT_TAG}"
	@echo $(shell git tag ${NEXT_GIT_TAG} -a -m 'Created ${NEXT_GIT_TAG}')
	@echo $(shell git branch release/${NEXT_GIT_TAG})

publish-release:
	@echo $(shell git push origin $(LATEST_VERSION))
	@echo $(shell git push origin release/$(LATEST_VERSION))
	@echo $(shell gh release create $(LATEST_VERSION) --generate-notes)

latest:
	@echo "${LATEST_VERSION}"

latest-git-short-hash:
	@echo "${LATEST_GIT_TAG_SHORT_HASH}"

next-version:
	@echo "${NEXT_VERSION}"
