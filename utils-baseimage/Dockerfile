
# Use an official Python runtime as a parent image
FROM ubuntu:18.04

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for base image"
LABEL publishdate="2018-8-26"

ENV TIMEZONE Asia/Hong_Kong
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
RUN useradd --create-home --no-log-init --shell /bin/bash kinfen
RUN adduser kinfen sudo
RUN echo 'kinfen:deadkill' | chpasswd



