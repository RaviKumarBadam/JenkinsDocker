# FROM tomcat:9
# Take the war and copy to webapps of tomcat. i.e. Taking tomcat as base image and war file which was built is added to this image under tomcat webapps location
# COPY target/*.war /usr/local/tomcat/webapps/jenkinsdockerproject.war
# EXPOSE 8080
# CMD ["/opt/tomcat/bin/catalina.sh", "run"]
FROM tomcat:8.0-alpine
LABEL maintainer="ravi_badam@yahoo.com"
#ADD sample.war /usr/local/tomcat/webapps/
COPY target/*.war /usr/local/tomcat/webapps/demo.war
COPY tomcat-users.xml /usr/local/tomcat/conf/
EXPOSE 8080
