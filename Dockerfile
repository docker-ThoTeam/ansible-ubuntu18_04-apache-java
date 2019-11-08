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
        ca-certificates \
        cron \
        rsync \
        curl \
        apt-transport-https && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod ssl rewrite proxy proxy_http headers

CMD ["/lib/systemd/systemd"]
