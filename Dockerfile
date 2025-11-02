FROM maven:3-openjdk-8 AS builder
WORKDIR /JavaWeb
COPY . .
RUN mvn clean package

FROM tomcat:9
COPY --from=builder /JavaWeb/target/*.jar /usr/local/tomcat/webapps
EXPOSE 8080


