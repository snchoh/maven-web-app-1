FROM tomcat:8.0.20-jre8
# Dummy text to test 
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean

RUN wget http://apache.osuosl.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

RUN tar xzf apache-maven-3.6.3-bin.tar.gz -C /opt/

ENV MAVEN_HOME /opt/apache-maven-3.6.3
ENV PATH $MAVEN_HOME/bin:$PATH

RUN mvn --version
#COPY ./target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
