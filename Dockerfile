FROM tomcat:9-jdk17

# RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/HostelManagementSystem.war /usr/local/tomcat/webapps/

EXPOSE 8080
