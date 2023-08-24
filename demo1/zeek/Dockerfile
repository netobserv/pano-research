FROM zeek/zeek:5.0.9

ARG kafka=2.1.1
#ARG kafka=1.4.2

USER root
RUN apt-get update
RUN apt-get install -y wget \
     curl \
     net-tools \
     cmake \
     make \
     gcc \
     g++ \
     flex \
     git \
     bison \
     libpcap-dev \
     libssl-dev \
     python3-dev \
     python3-pip \
     swig \
     zlib1g-dev \
     libsasl2-dev \
     kafkacat \
     iputils-ping \
     socat \
     gdb \
     tcpdump

ENV PATH="/usr/local/zeek/bin:${PATH}"

# don't need this now as zkg is built with zeek
# RUN pip3 install zkg && zkg autoconfig

WORKDIR /tmp
RUN wget -qO- https://github.com/edenhill/librdkafka/archive/v${kafka}.tar.gz | tar xzf -
WORKDIR /tmp/librdkafka-${kafka}
RUN ./configure 
RUN make 
RUN make install
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
ENV LIBRDKAFKA_ROOT="/usr/local/lib"

RUN zkg install --force zeek-kafka
RUN zkg install --force zeek-pcapovertcp-plugin

WORKDIR /usr/local/zeek/logs

COPY ./site/* /usr/local/zeek/share/zeek/site/

RUN chmod +x /usr/local/zeek/bin/zeek 
