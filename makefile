all: help

help: ## Show this help.
	@echo "Usage: make [target]"
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

BLUE='\033[0;34m'
NC='\033[0m'

docker_build: docker ## Build all containers with docker-compose (docker-compose up --build -d) 
gradle_build: gradle ## Compile the Spring Apps Services with Gradle (./gradlew build)
docker_stop: stop ## Stop all containers with docker-compose (docker-compose down)
deploy: gradle_build docker_build ## Compile the Spring Apps Services and Build all containers with docker-compose
undeploy: docker_stop gradle_clean ## Stop all containers with docker-compose and Clean the Spring Apps Services

gradle:
	@echo "Compile the Sring Apps Services"
	@for service in $(shell ls -l |egrep '-service' |awk '{print $$9}'); do \
		echo $(BLUE)"Building $$service"$(NC); \
		cd $$service; \
		gradle build; \
		cd ..; \
	done

gradle_clean:
	@echo "Clean the Sring Apps Services"
	@for service in $(shell ls -l |egrep '-service' |awk '{print $$9}'); do \
		echo $(BLUE)"Cleaning $$service"$(NC); \
		cd $$service; \
		gradle clean; \
		cd ..; \
	done

docker:
	@echo $(BLUE)"Building docker-compose"$(NC)
	docker-compose up --build -d

stop:
	@echo $(BLUE)"Stopping docker-compose"$(NC)
	docker-compose down
