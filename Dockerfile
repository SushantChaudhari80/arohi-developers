FROM openjdk:17-jdk
COPY target/arohi-develpers-0.0.1-SNAPSHOT.war app.war
ENTRYPOINT ["java", "-jar", "/app.war"]


