FROM ubuntu

RUN apt-get update && apt-get install -y curl iputils-ping dnsutils software-properties-common debconf-utils screen vim openjdk-11-jdk telnet openssl