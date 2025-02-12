FROM openjdk:8u151-jdk-alpine3.7
WORKDIR /app
RUN apt install mvn -y
COPY porm* .
RUN mvn clean package
COPY *.jar /app
EXPOSE 8070
ENTRYPOINT exec java -jar app.jar
