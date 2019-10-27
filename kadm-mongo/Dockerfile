
FROM mongo:4.2.0-bionic

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for kadm mongo db"
LABEL publishdate="2019-10-16"

ENV TIMEZONE Asia/Shanghai
RUN echo "root:1qazXSW@" | chpasswd
RUN set -x \
	&& apt-get update \
    && apt-get install -y --no-install-recommends tzdata \
    && sed -i "1iTZ='${TIMEZONE}'" ~/.profile \ 
    && sed -i "1c${TIMEZONE}" /etc/timezone \
    && cp /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/tzdata

