FROM ubuntu:18.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        systemd \
        apache2 \
        openjdk-8-jre-headless \
        python \
        python-apt \
        sudo \
        bash \
        ca-certificates \
        cron \
        rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod ssl rewrite proxy proxy_http headers

