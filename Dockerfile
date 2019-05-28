FROM tomcat:latest
EXPOSE 8080
COPY /target/java.war /usr/local/tomcat/webapps/
