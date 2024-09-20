FROM openjdk:17-alpine
COPY build/libs/*SNAPSHOT.jar app.jar
EXPOSE 3000
ENTRYPOINT ["java", "-jar", "app.jar"]