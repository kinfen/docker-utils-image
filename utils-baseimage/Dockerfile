
# Use an official Python runtime as a parent image
FROM ubuntu:18.04

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for base image"
LABEL publishdate="2018-8-26"

ENV TIMEZONE Asia/Shanghai
RUN echo "root:1qazXSW@" | chpasswd
RUN cp -rf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
RUN useradd --create-home --no-log-init --shell /bin/bash kinfen
RUN adduser kinfen sudo
RUN echo 'kinfen:deadkill' | chpasswd



