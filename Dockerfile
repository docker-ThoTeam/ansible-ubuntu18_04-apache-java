FROM ubuntu:18.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y apt-utils && \
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

