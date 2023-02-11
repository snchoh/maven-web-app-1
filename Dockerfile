FROM maven
# Dummy text to test 
RUN mvn --version
COPY *./ ./
RUN mvn validate
RUN ls
RUN package
#COPY ./target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
