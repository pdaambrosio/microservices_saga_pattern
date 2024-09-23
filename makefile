all: help

help: ## Show this help.
	@echo "Usage: make [target]"
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

RED='\033[0;31m'
NC='\033[0m'

docker_build: docker ## Build all containers with docker-compose (docker-compose up --build -d) 
gradle_build: gradle ## Compile the Spring Apps Services with Gradle (./gradlew build)
docker_stop: stop ## Stop all containers with docker-compose (docker-compose down)

gradle:
	@echo "Compile the Sring Apps Services"
	@for service in $(shell ls -d |egrep '*-service'); do \
		echo "Building $$service"; \
		cd $$service; \
		./gradlew build; \
		cd ..; \
	done

docker:
	@echo "Building docker-compose"
	docker-compose up --build -d

stop:
	@echo "Stopping docker-compose"
	docker-compose down