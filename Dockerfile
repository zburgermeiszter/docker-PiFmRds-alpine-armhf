# docker run -d --privileged -v $PWD:/git pi_fm_rds -freq 88.5 -audio /git/src/stereo_44100.wav
# TODO: Try to reduce the image size

FROM resin/rpi-raspbian:wheezy

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

WORKDIR /root

ADD src /root/src

RUN apt-get update && \
    apt-get install -y build-essential libsndfile1-dev libsndfile1 && \
    cd src && \
    make && \
    cp pi_fm_rds /root && \
    cd /root && \
    rm -rf src && \
    apt-get purge -y build-essential libsndfile1-dev && \
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/root/pi_fm_rds"]

