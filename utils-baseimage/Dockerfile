
# Use an official Python runtime as a parent image
FROM ubuntu:latest

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for base image"
LABEL publishdate="2018-8-26"


RUN echo "root:1qazXSW@" | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash kinfen
RUN adduser kinfen sudo
RUN echo 'kinfen:deadkill' | chpasswd



