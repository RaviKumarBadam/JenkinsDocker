# FROM tomcat:9
# Take the war and copy to webapps of tomcat. i.e. Taking tomcat as base image and war file which was built is added to this image under tomcat webapps location
# COPY target/*.war /usr/local/tomcat/webapps/jenkinsdockerproject.war
# EXPOSE 8080
# CMD ["/opt/tomcat/bin/catalina.sh", "run"]
FROM centos

MAINTAINER aksarav@middlewareinventory.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
# RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
COPY target/*.war /usr/local/tomcat/webapps/jenkinsdockerproject.war
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
