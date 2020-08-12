FROM maven:3.6.0-jdk-11-slim AS build
MAINTAINER Vlad Kamerdinerov <anakin174jedi@gmail.com>
RUN apt update && apt install git docker.io