
FROM mongo:4.2.0-bionic

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for mongod"
LABEL publishdate="2018-8-27"

ENV DOCKER_ID 1000

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

RUN usermod -u $DOCKER_ID  mongodb \
	&& groupmod -g ${DOCKER_ID} mongodb

# RUN mkdir -p /etc/rc.d/rc.local/ \
#     && cat << EOF > /etc/rc.d/rc.local/thp.sh \
#     echo madvise > /sys/kernel/mm/transparent_hugepage/enabled \
#     echo madvise > /sys/kernel/mm/transparent_hugepage/defrag \
#     EOF
# RUN whoami && mount -o rw,remount /sys \
#     && echo never > /sys/kernel/mm/transparent_hugepage/enabled \
#     && echo never > /sys/kernel/mm/transparent_hugepage/defrag \
#     && sudo mount -o r,remount /sys

COPY dbinit/kadm-demo/ /data/kadm-demo/
COPY dbinit/*.sh /docker-entrypoint-initdb.d/

RUN chmod -R 755 /docker-entrypoint-initdb.d/ /data/kadm-demo/