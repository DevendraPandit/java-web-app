FROM ubuntu

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk wget
WORKDIR /opt/
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
RUN tar -xvzf apache-maven-3.9.6-bin.tar.gz
RUN mv apache-maven-3.9.6-bin.tar.gz maven
COPY target /welcomeapp.war /opt/tomcat/webapps/

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh","run"]