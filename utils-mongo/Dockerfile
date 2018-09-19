
FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-baseimage

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for mongod"
LABEL publishdate="2018-8-27"

USER root
WORKDIR /home/root

RUN set -x \
	&& mkdir -p /data/db /var/log/mongo\
	&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends software-properties-common \
	&& echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

RUN set -x \
	&& apt-get update && apt-get install -y mongodb-org \
	&& rm -rf /var/lib/apt/lists/* \
 	&& rm -rf /var/lib/mongodb

RUN set -x && mkdir /etc/mongo && mv /etc/mongod.conf /etc/mongo/mongod.conf

EXPOSE 27017
CMD ["mongod", "--logpath", "/var/log/mongo/mongo.log", "--config", "/etc/mongo/mongod.conf"]


