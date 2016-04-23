FROM linuxserver/baseimage

MAINTAINER 

ENV APTLIST=" gcc g++ make libsqlite3-dev git"

# install packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

#Build udpt
git clone https://github.com/naim94a/udpt.git && \
cd udpt && \
make && \

# cleanup
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* && \

#Adding Custom files
mkdir /config
ADD udpt.conf /config/udpt.conf

# Volumes and Ports
VOLUME /config 
EXPOSE 6969
EXEC ["./udpt -c config/udpt.conf"]
