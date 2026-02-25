# Stage 1: Build (Maven)
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
#Copy pom.xml first(For docker layer caching.)
COPY pom.xml .
# Download Dependencies.
#RUN mvn dependency:go-offline
# Copy source ./src
COPY src ./src
# Build WAR file
RUN mvn clean package
# Stage 2: Runtime (Tomcat)
FROM tomcat:9-jdk17-temurin
# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

#Copy WAR from build stage
COPY --from=build /app/target/HostelManagementSystem.war \
                  /usr/local/tomcat/webapps/HostelManagementSystem.war
#or usr/local/tomcat/webapps/ROOT.war
EXPOSE 8081
CMD ["catalina.sh","run"] 
#-------------------------------------------------------------
# FROM tomcat:9
# RUn rm -rf /usr/local/tomcat/webapps/
# COPY target/HostelManagementSystem.war /usr/local/tomcat/webapps/ROOT.war
# EXPOSE 8080

# RUN rm -rf /usr/local/tomcat/webapps/*

#COPY target/HostelManagementSystem.war /usr/local/tomcat/webapps/

