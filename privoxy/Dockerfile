
FROM kinfen/kadm:base

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for privoxy"
LABEL publishdate="2018-8-29"


# Set the working directory to /app

# update the apt package
RUN set -x &&\
	apt-get update &&\
	apt-get install -y privoxy=3.0.24-1 &&\
	apt-get autoclean &&\              
 	apt-get clean     &&\                    
	apt-get autoremove &&\
	rm -rf /var/lib/apt/lists/* &&\
	rm -rf /var/cache/apt/archives

COPY ./config /etc/privoxy/
CMD ["privoxy", "/etc/privoxy/config"]
#EXPOSE 52080
