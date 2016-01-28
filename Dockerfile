FROM ubuntu:14.04
MAINTAINER gabrielfs7@gmail.com
RUN apt-get update && apt-get install -y nginx && apt-get clean
