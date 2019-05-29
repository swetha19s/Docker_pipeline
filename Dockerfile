FROM tomcat:latest

MAINTAINER Swetha

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY manager.xml /usr/local/tomcat/conf/Catalina/localhost/manager.xml

COPY /target/mavenwebApp.war /usr/local/tomcat/webapps/mavenwebApp.war
CMD chmod +x /usr/local/tomcat/webapps/mavenwebApp.war
