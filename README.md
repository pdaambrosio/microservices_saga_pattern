# microservices_patterns

## Description

This repository contains the source code for the book "Microservices Patterns" by Chris Richardson. The book is published by Manning Publications.

The book describes the architecture, design, and implementation of 25 microservices patterns. The patterns are implemented using Java and the Spring Framework.

The source code is organized into one Maven multi-module project. Each module implements a single pattern.

Link to the book: <https://www.manning.com/books/microservices-patterns>

## Requirements

To build and run the application you need:

- Java 17
- Gradle 7.2
- Docker 20.10.8
- Docker Compose 1.29.2
- Make 4.2.1

## Applications

The repository contains the following applications:

- orchestrator-service - implements the orchestrator pattern
- inventory-service - implements the inventory pattern
- order-service - implements the order pattern
- payment-service - implements the payment pattern
- product-validation-service - implements the product validation pattern

## Building the application

The build process involves the following steps:

1. Build the application using Gradle in the `java` directory of each module
2. Build the Docker images
3. Start the application using Docker Compose

To facilitate the build process, the repository contains a Makefile that automates these steps.

To build the application, run the following command:

```bash
make deploy
```

The 'make deploy' command builds the application and starts it using Docker Compose.

We see other commands in the Makefile using the following command:

```bash
make help
```

## License

The content of this repository is licensed under the MIT License.
