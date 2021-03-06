#this is the base image we use to create our image from

FROM jenkins/jenkins:latest

#just info about who created this

MAINTAINER Eldhose 

#get rid of admin password setup

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#automatically installing all plugins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY downloads /var/jenkins_home/downloads
COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/

