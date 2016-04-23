FROM linuxserver/baseimage

MAINTAINER 

ENV APTLIST=" gcc g++ make libsqlite3-dev git"

# install packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* &&\

#Adding Custom files
mkdir /config
   
# Volumes and Ports
VOLUME /config 
EXPOSE 6969
EXEC ["./udpt -c /udpt.conf"]
