# Use Eclipse Temurin OpenJDK image
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy your jar file into the image
COPY target/*.jar app.jar

# Expose port
EXPOSE 8080

# Start the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
