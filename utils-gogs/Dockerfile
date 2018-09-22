FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV GOGS_USER=gogs
ENV GIT_HOME=/home/$GOGS_USER
ENV DOCKER_ID=1000
COPY server.sh /usr/bin
RUN addgroup -g $DOCKER_ID  -S $GOGS_USER \
    && adduser -G $GOGS_USER -h $GIT_HOME -s /bin/sh -S -g "$GOGS_USER" $GOGS_USER \
	&& apk update && apk add gogs sudo \
	&& mkdir -p /usr/bin/custom/conf \
	&& cp /etc/gogs/conf/app.ini /usr/bin/custom/conf/app.ini \
	&& sed -i "s/RUN_USER = gogs/RUN_USER = $GOGS_USER/" /usr/bin/custom/conf/app.ini
RUN rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

# RUN sed -i '2a\GOGS_USER=git\nGOGS_PARH=\/home\/$GOGS_USER\nGOGS_CUSTOM=$GOGS_PARH' /etc/init.d/gogs
# COPY gogs /etc/init.d/gogs
RUN chmod 777 -R /var/cache/gogs \
	&& chmod 777 -R /etc/gogs \
	&& chmod 777 -R /etc/init.d/gogs \
	&& chmod 777 -R /usr/share/webapps/gogs \
	&& chmod 777 -R /var/lib/gogs \
	&& chmod 777 -R /var/log/gogs \
	&& chmod 777 -R /usr/bin/custom/conf \
	&& chmod 755 -R /usr/bin/server.sh \
	&& chown -R $GOGS_USER /var/lib/gogs

EXPOSE 3000
CMD ["/bin/sh", "/usr/bin/server.sh"]




