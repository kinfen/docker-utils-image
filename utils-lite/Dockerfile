
FROM alpine:3.9

# Set one or more individual labels
LABEL version="0.0.2"
LABEL description="for lite image"
LABEL publishdate="2019-7-23"

ENV TIMEZONE Asia/Shanghai
RUN set -x \
    && sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && cat /etc/apk/repositories

RUN set -x \
    apk update && apk upgrade &&  apk --update --no-cache --virtual .buildstep add tzdata \
    && cp -rf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && apk del .buildstep \
    && rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

RUN echo "root:1qazXSW@" | chpasswd
    

