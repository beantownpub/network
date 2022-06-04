.PHONY: test
SHELL := /bin/bash

profile ?= ${AWS_PROFILE}

export SELF ?= $(MAKE)

.SHELLFLAGS += -e
.ONESHELL: test

## Install pre-commit hooks
pre-commit/install:
	pre-commit install --install-hooks --allow-missing-config -t pre-commit -t prepare-commit-msg

## Format Terraform code
fmt:
	terraform fmt --recursive

## Run a test plan for us-east-2
plan:
	cd examples/complete && \
		terraform init && \
		aws-vault exec $(profile) -- terraform plan

## This will create resources in AWS then test the output values and destroy
test:
	cd test/src && \
		go mod download && \
		aws-vault exec $(profile) -- go test -v -timeout 10m -run TestExamplesComplete

## This will create resources in AWS and not destroy them
apply:
	cd examples/complete && \
		terraform init && \
		aws-vault exec $(profile) -- terraform apply

## This will destroy test resources in AWS
destroy:
	cd examples/complete && \
		terraform init && \
		aws-vault exec $(profile) -- terraform destroy

## Clean up tfstate files in examples/complete
test/clean:
	rm -rf examples/complete/*.tfstate* || true
	rm -rf examples/complete/secrets || true
	rm -rf examples/complete/.terraform || true

## Show available commands
help:
	@printf "Available targets:\n\n"
	@$(SELF) -s help/generate | grep -E "\w($(HELP_FILTER))"

help/generate:
	@awk '/^[a-zA-Z\_0-9%:\\\/-]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = $$1; \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			gsub("\\\\", "", helpCommand); \
			gsub(":+$$", "", helpCommand); \
			printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' Makefile | sort -u
	@printf "\n\n"
