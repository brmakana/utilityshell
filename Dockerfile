FROM ubuntu

RUN apt-get update && apt-get install -y curl iputils-ping dnsutils software-properties-common debconf-utils screen vim
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer
