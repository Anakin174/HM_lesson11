FROM ubuntu:18.04
MAINTAINER Vlad Kamerdinerov <anakin174jedi@gmail.com>
RUN apt update && \
    apt install maven git  -y &&\
    git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    mvn -f /boxfuse-sample-java-war-hello/pom.xml clean package && \
    apt remove git -y  && \
    rm -rf /var/cache/apk/*