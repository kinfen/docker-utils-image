FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen

ENV GIT_HOME=/home/git
# create git user and config git
ENV GO_RES=github.com/gogs/gogs
ENV GOGOS_VERSION=0.11.66
RUN addgroup -S git \
    && adduser -G git -s /bin/sh -D -S git \
	&& apk add --virtual .build-deps \
	go sudo
RUN cd $GIT_HOME \
	&& sudo -u git -H go get -u -tags "sqlite" github.com/gogs/gogs \
	&& cd $GIT_HOME/go/src/$GO_RES \
	&& sudo -u git -H go build -tags "sqlite"
RUN apk del .build-deps \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

EXPOSE 3000
WORKDIR $GIT_HOME/go/src/$GO_RES
ENTRYPOINT ./gogs
CMD ["web"]




