FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen

ENV GIT_HOME=/home/git
# create git user and config git
ENV GO_RES=github.com/gogs/gogs

RUN set -x \
	&& apk add --virtual .build-deps \
		go sudo \
	&& addgroup -S git \
	&& adduser -S -D -h $GIT_HOME -s /bin/sh -G git -g git git
RUN set -x \
	go get -u -tags "sqlite" ${GO_RES} \
	&& cd $(go env GOPATH)/src/${GO_RES} \
	&& go build -tags "sqlite" \
	&& ln -s $(go env GOPATH)/src/${GO_RES}/gogs /usr/bin/gogs

EXPOSE 3000
WORKDIR $(go env GOPATH)/src/${GO_RES}
ENTRYPOINT gogs
CMD ["web"]




