.PHONY: all up \
	help

all: help

build: ## Build docker images
	docker compose build

up: ## Run all services
	docker compose up

bash: ## Run bash in server
	docker compose run --rm server bash

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
