FROM openjdk:8u151-jdk-alpine3.7

WORKDIR /app

# Install Maven
RUN apk add --no-cache maven

# Copy and verify pom.xml
COPY pom.xml .

# Download dependencies before building (improves build cache usage)
RUN mvn dependency:resolve

# Copy the source code
COPY src ./src

# Build the application
RUN mvn clean package -X

# Copy the JAR file
COPY target/*.jar /app/app.jar

# Expose port
EXPOSE 8070

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
