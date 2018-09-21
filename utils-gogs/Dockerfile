FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV GIT_HOME=/home/git
USER git
WORKDIR /home/git
RUN addgroup -S git \
    && adduser -G git -D -S git \
	&& apk update && apk add gogs \
	&& cp /etc/gogs/conf/app.ini $GIT_HOME/app.ini \
	&& chown -R git $GIT_HOME/app.ini
RUN rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

EXPOSE 3000

CMD ["gogs", "web", "-c", "$GIT_HOME/app.ini"]




