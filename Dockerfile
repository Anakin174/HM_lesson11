FROM ubuntu:18.04
MAINTAINER Vlad Kamerdinerov <anakin174jedi@gmail.com>
RUN apt update && \
    apt install maven git docker.io -y
