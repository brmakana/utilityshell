FROM ubuntu:20.10
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y build-essential \
                       python \
                       libssl-dev \
                       openssl \
                       curl \
                       iputils-ping \
                       dnsutils \
                       software-properties-common \
                       debconf-utils \
                       screen \
                       vim \
                       openjdk-8-jdk \
                       git \
                       telnet \
                       tcpdump \
                       netcat \
                       socat \
                       cmake \
                       libjansson-dev \
                       zlib1g \
                       librdkafka-dev \
                       apache2-utils \
                       jq \
                       kafkacat

ADD https://github.com/r4um/jmx-dump/releases/download/0.9.3/jmx-dump-0.9.3-standalone.jar /usr/share/java
ADD https://github.com/tomnomnom/gron/releases/download/v0.6.0/gron-linux-386-0.6.0.tgz /usr/share/java
RUN cd /usr/share/java/ && tar -zxf gron-linux-386-0.6.0.tgz && chmod -R a+rx *

RUN groupadd -r testuser && useradd -r -g testuser testuser
RUN mkdir /home/testuser && chmod a+rw /home/testuser
ADD https://apache.claz.org/kafka/2.8.0/kafka_2.12-2.8.0.tgz /home/testuser/
RUN cd /home/testuser && tar -zxf kafka_2.12-2.8.0.tgz

RUN chown -R testuser /home/testuser
USER 999
ENV PATH="${PATH}:/usr/local/bin/:/usr/share/java:/home/testuser/kafka_2.12-2.8.0/bin"
WORKDIR /home/testuser