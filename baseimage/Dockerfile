
# Use an official Python runtime as a parent image
FROM ubuntu:latest

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for base image"
LABEL publishdate="2018-8-26"


# Set the working directory to /app
#WORKDIR /app

# Copy the current directory contents into the container at /app
#ADD . /app

RUN echo "root:1qazXSW@" | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash kinfen
RUN adduser kinfen sudo
RUN echo 'kinfen:deadkill' | chpasswd



# update the apt package
# RUN apt-get update && apt-get install -y \
# 	sudo\
# 	net-tools\
# 	openssh-server\
# 	vim\
# 	iptables

# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# # SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# RUN mkdir /var/run/sshd
# EXPOSE 22

# ENTRYPOINT /usr/sbin/sshd -D


