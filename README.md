# microservices_patterns

## Description

This repository contains the source code for the book "Microservices Patterns" by Chris Richardson. The book is published by Manning Publications.

The book describes the architecture, design, and implementation of 25 microservices patterns. The patterns are implemented using Java and the Spring Framework.

The source code is organized into one Maven multi-module project. Each module implements a single pattern.

The book is currently in progress. The first MEAP release is expected in early 2020.

Link to the book: https://www.manning.com/books/microservices-patterns

## Requirements

To build and run the application you need:

- Java 17
- Gradle 7.2
- Docker 20.10.8
- Docker Compose 1.29.2

## Building the application

You can build the application by executing the following command:

First you need start the docker-compose file the Kafka, RedPanda and the Databases, in the root of the project execute the following command:

```bash
docker-compose up --build -d
```

Then you can build the application by executing the following command, in each folder service:

```bash
./gradlew build
```

## Running the application

To run the application, you need to have Java 8 installed. You can run the application by executing the following command:

```
java -jar <module-name>/target/<module-name>-1.0-SNAPSHOT.jar
```

Replace `<module-name>` with the name of the module you want to run.

## License

The content of this repository is licensed under the MIT License.
