FROM resin/rpi-raspbian:wheezy

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

ENTRYPOINT ["pi_fm_rds"]

