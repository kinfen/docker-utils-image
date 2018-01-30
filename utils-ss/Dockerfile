
FROM kinfen/utils-baseimage

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for ss"
LABEL publishdate="2018-8-26"


# Set the working directory to /app

RUN mkdir /ss /ss/logs

WORKDIR /ss

# Copy the current directory contents into the container at /app
ADD ./*.json /ss
ADD ./*.ini /ss

# update the apt package
RUN set -x \
	&& apt-get update \
	&& apt-get install -y \
	supervisor \
	python-pip \
	&& pip install --upgrade pip \
	&& pip install shadowsocks \
	&& apt-get autoclean \ 
 	&& apt-get clean     \                    
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/archives

ADD ./supervisord.conf /etc

ENTRYPOINT supervisord
CMD ['-c', '/etc/supervisord.conf']


#EXPOSE 5234 5235 5236 1086
