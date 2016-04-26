FROM linuxserver/baseimage

MAINTAINER Adam (email@adamrbell.com)

ENV APTLIST="git build-essential libpthread-stubs0-dev libsqlite3-dev"

# install packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy

#Build udpt
RUN git clone https://github.com/cuttius1/udpt.git && \
cd udpt && \
make

# cleanup
RUN apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD udpt.conf /config/udpt.conf

# Volumes and Ports
VOLUME /config 
EXPOSE 6969
RUN /udpt/udpt -d  /config/udpt.log /config/udpt.conf
