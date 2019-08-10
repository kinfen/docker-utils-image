
FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
ENV DOCKER_VERSION 18.06.3
RUN set -x \
	&& mkdir -p /.tmp && cd /.tmp \
	&& apk --update add --no-cache --virtual .build-step curl \
 	&& curl -sSL http://mirrors.aliyun.com/docker-ce/linux/static/stable/x86_64/docker-$DOCKER_VERSION-ce.tgz | tar xz --strip 1 \
	&& cp /.tmp/docker /usr/bin/docker \
	&& rm -rf /.tmp \
	&& apk del .build-step \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 