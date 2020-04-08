FROM ubuntu

RUN apt-get update && \
    apt-get install -y curl iputils-ping dnsutils software-properties-common debconf-utils screen vim openjdk-8-jdk telnet openssl tcpdump netcat socat kafkacat

ADD https://github.com/r4um/jmx-dump/releases/download/0.9.3/jmx-dump-0.9.3-standalone.jar /usr/share/java
ADD https://github.com/tomnomnom/gron/releases/download/v0.6.0/gron-linux-386-0.6.0.tgz /usr/share/java
RUN cd /usr/share/java/ && tar -zxf gron-linux-386-0.6.0.tgz && chmod -R a+rx *

RUN groupadd -r testuser && useradd -r -g testuser testuser
RUN mkdir /home/testuser && chmod a+rw /home/testuser
ADD http://apache.mirrors.hoobly.com/kafka/2.4.1/kafka_2.12-2.4.1.tgz /home/testuser/
RUN cd /home/testuser && tar -zxf kafka_2.12-2.4.1.tgz
RUN chown -R testuser /home/testuser
USER 999