FROM eclipse-temurin:17-jre-alpine
# Choose ONE subproject (recommended: my-webapp since it has bootJar)
COPY my-webapp/build/libs/my-webapp-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

