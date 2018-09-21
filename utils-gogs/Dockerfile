FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen

ENV GIT_HOME=/home/git
# create git user and config git
ENV GO_RES=github.com/gogs/gogs
ENV GOGOS_VERSION=0.11.66
RUN set -x \
	addgroup -g 1000 git \
    && adduser -u 1000 -G git -s /bin/sh -D git \
	&& apk add --virtual .build-deps \
	go sudo git
RUN set -x \
	cd $GIT_HOME \
	&& sudo -u git -H git clone --depth=1 -b v$GOGOS_VERSION https://github.com/gogs/gogs

RUN set -x \
	cd $GIT_HOME/gogs\
	&& sudo -u git -H go build -tags "sqlite" 

RUN apk del .build-deps \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

EXPOSE 3000
WORKDIR $GIT_HOME/go/src/$GO_RES
ENTRYPOINT ./gogs
CMD ["web"]




