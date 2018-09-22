FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV GOGS_USER=gogs
ENV GIT_HOME=/home/$GOGS_USER
ENV DOCKER_ID=1000
ENV SOURCE_PATH=github.com/gogs/gogs
COPY server.sh /usr/bin


RUN addgroup -g $DOCKER_ID  -S $GOGS_USER \
    && adduser -G $GOGS_USER -h $GIT_HOME -s /bin/sh -S -g "$GOGS_USER" $GOGS_USER \
	&& apk add --no-cache --virtual .build-step \
		 g++ libstdc++ go \
	&& apk add --no-cache sudo git
RUN sudo -u $GOGS_USER -H echo 'export GOROOT=~/local/go' >> $GIT_HOME/.bashrc \
	&& sudo -u $GOGS_USER -H echo 'export GOPATH=~/go' >> $GIT_HOME/.bashrc \
	&& sudo -u $GOGS_USER -H echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $GIT_HOME/.bashrc
	# && sudo -u $GOGS_USER -H source $GIT_HOME/.bashrc
RUN sudo -u $GOGS_USER -H go get -u -tags "sqlite" $SOURCE_PATH \
	&& cd $GIT_HOME/go/src/$SOURCE_PATH \
	&& sudo -u $GOGS_USER -H go build -tags "sqlite"

RUN mkdir -p $GIT_HOME/go/custom/conf/ \
	&& cp $GIT_HOME/go/src/$SOURCE_PATH/conf/app.ini $GIT_HOME/go/custom/conf/app.ini \ 
	&& cp -rf $GIT_HOME/go/src/$SOURCE_PATH/templates $GIT_HOME/go/bin
	
RUN apk del .build-step \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf $GIT_HOME/go/src \
	&& rm -rf $GIT_HOME/.cache
RUN chown -R gogs:gogs $GIT_HOME/go/
# # RUN sed -i '2a\GOGS_USER=git\nGOGS_PARH=\/home\/$GOGS_USER\nGOGS_CUSTOM=$GOGS_PARH' /etc/init.d/gogs
# # COPY gogs /etc/init.d/gogs
# RUN chmod 777 -R /var/cache/gogs \
# 	&& chmod 777 -R /etc/gogs \
# 	&& chmod 777 -R /etc/init.d/gogs \
# 	&& chmod 777 -R /usr/share/webapps/gogs \
# 	&& chmod 777 -R /var/lib/gogs \
# 	&& chmod 777 -R /var/log/gogs \
# 	&& chmod 777 -R /usr/bin/custom/conf \
# 	&& chmod 755 -R /usr/bin/server.sh \
# 	&& chown -R $GOGS_USER /var/lib/gogs
EXPOSE 3000
CMD ["/bin/sh", "/usr/bin/server.sh"]




