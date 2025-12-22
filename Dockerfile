# FROM tomcat:9-jdk17
#COPY webapp/target/webapp.war /usr/local/tomcat/webapps/
# -------- BUILD STAGE --------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# -------- RUN STAGE --------
FROM tomcat:9-jdk17
COPY --from=build /app/webapp/target/webapp.war /usr/local/tomcat/webapps/

