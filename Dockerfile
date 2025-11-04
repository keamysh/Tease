# ---------------------------
# 1️⃣ BUILD STAGE
# ---------------------------
FROM maven:3.9.9-eclipse-temurin-17 AS builder

# Set the working directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the rest of the source code
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# ---------------------------
# 2️⃣ RUNTIME STAGE
# ---------------------------
FROM eclipse-temurin:17-jdk


# Set the working directory
WORKDIR /app

# Copy the built jar from the previous stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the app port
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
 
