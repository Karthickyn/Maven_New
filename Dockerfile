FROM tomcat:9-jdk17
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/
