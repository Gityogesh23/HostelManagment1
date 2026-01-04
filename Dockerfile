FROM tomcat:9-jdk17
RUn rm -rf /usr/local/tomct/webapps/
COPY target/HostelManagementSystem.war usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

# RUN rm -rf /usr/local/tomcat/webapps/*

#COPY target/HostelManagementSystem.war /usr/local/tomcat/webapps/

