FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV GOGS_USER=git
ENV GIT_HOME=/home/$GOGS_USER

COPY server.sh /usr/bin
RUN addgroup -S $GOGS_USER \
    && adduser -G $GOGS_USER -D -S $GOGS_USER \
	&& apk update && apk add gogs \
	&& cp /etc/gogs/conf/app.ini $GIT_HOME/app.ini \
	&& sed -i "s/RUN_USER = gogs/RUN_USER = git/" $GIT_HOME/app.ini 
RUN rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

RUN chmod 777 -R /var/cache/gogs \
	&& chmod 777 -R /etc/gogs \
	&& chmod 755 -R /etc/init.d/gogs \
	&& chmod 777 -R /usr/share/webapps/gogs \
	&& chmod 777 -R /var/lib/gogs \
	&& chmod 777 -R /var/log/gogs \
	&& chmod 755 -R /usr/bin/server.sh

USER $GOGS_USER
EXPOSE 3000
CMD ["/bin/sh", "/usr/bin/server.sh"]




