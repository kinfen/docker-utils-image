FROM drone/drone:latest

# Set one or more individual labels
LABEL version="0.0.1"
LABEL description="for drone image"
LABEL publishdate="2019-7-23"

ENV DOCKER_ID 1000
ENV USER_NAME drone
ENV USER_HOME /home/$USER_NAME
ENV TIMEZONE Asia/Shanghai
RUN set -x \
    && sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && cat /etc/apk/repositories

RUN addgroup -g $DOCKER_ID  -S $USER_NAME \
    && adduser -G $USER_NAME -h $USER_HOME -u $DOCKER_ID  -s /bin/sh -S -g "$USER_NAME" $USER_NAME \
    && echo "${USER_NAME}:1qazXSW@" | chpasswd

RUN set -x \
    && apk update && apk upgrade &&  apk --update --no-cache --virtual .buildstep add tzdata \
    && cp -rf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && apk del .buildstep \
    && rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 
    
COPY server.sh /bin/

ENTRYPOINT [ "sh", "/bin/server.sh"]


