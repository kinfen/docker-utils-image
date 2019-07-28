FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest

LABEL version="0.0.1"
LABEL description="for jre7"
LABEL publishdate="2019-7-23"

RUN set -x \
    apk update && apk upgrade \
    && apk add openjdk7-jre \
    && rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

