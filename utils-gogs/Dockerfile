FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV GIT_HOME=/home/git
RUN addgroup -S git \
    && adduser -G git -D -S git \
	&& apk update && apk add gogs \
	&& cp /etc/gogs/conf/app.ini $GIT_HOME/app.ini \
	&& sed -i "s/RUN_USER = gogs/RUN_USER=git/" $GIT_HOME/app.ini 
RUN rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 
COPY server.sh /usr/bin
EXPOSE 3000
CMD ["/bin/sh", "/usr/bin/server.sh"]




