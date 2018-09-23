FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV GOGS_USER=gogs
ENV GIT_HOME=/home/$GOGS_USER
ENV DOCKER_ID=1000
ENV SOURCE_PATH=github.com/gogs/gogs
COPY server.sh /usr/bin
RUN addgroup -g $DOCKER_ID  -S $GOGS_USER \
    && adduser -G $GOGS_USER -h $GIT_HOME -s /bin/sh -S -g "$GOGS_USER" $GOGS_USER \
	&& echo 'export GOROOT="$HOME/local/go"' >> $GIT_HOME/.profile \
	&& echo 'export GOPATH="$HOME/go"' >> $GIT_HOME/.profile \
	&& echo 'export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"' >> $GIT_HOME/.profile
RUN apk add --no-cache --virtual .build-step \
		 g++ libstdc++ go \
	&& apk add --no-cache sudo git \
	&& sudo -u $GOGS_USER -H go get -u -tags "sqlite" $SOURCE_PATH \
	&& cd $GIT_HOME/go/src/$SOURCE_PATH \
	&& sudo -u $GOGS_USER -H go build -tags "sqlite" \
	&& ln -s $GIT_HOME/go/bin/gogs /usr/bin/gogs \
	&& mkdir -p $GIT_HOME/go/custom/conf/ \
	&& cp $GIT_HOME/go/src/$SOURCE_PATH/conf/app.ini $GIT_HOME/go/custom/conf/app.ini \ 
	&& mkdir -p $GIT_HOME/go/bin/webapps \
	&& cp -rf $GIT_HOME/go/src/$SOURCE_PATH/templates $GIT_HOME/go/bin/webapps \
	&& cp -rf $GIT_HOME/go/src/$SOURCE_PATH/public $GIT_HOME/go/bin/webapps \
	&& apk del .build-step \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf $GIT_HOME/go/src \
	&& rm -rf $GIT_HOME/.cache \
	&& chown -R gogs:gogs $GIT_HOME/go/

RUN sudo -u $GOGS_USER -H mkdir -p $GIT_HOME/go/custom/avatars \
	&& sudo -u $GOGS_USER -H mkdir -p $GIT_HOME/go/custom/attachements \
	&& sudo -u $GOGS_USER -H mkdir -p $GIT_HOME/go/custom/git \
	&& sudo -u $GOGS_USER -H mkdir -p $GIT_HOME/go/custom/db \
	&& sudo -u $GOGS_USER -H mkdir -p $GIT_HOME/go/bin/sessions

RUN mkdir -p /var/log/gogs \
	&& chown -R gogs:gogs /var/log/gogs

EXPOSE 3000
CMD ["/bin/sh", "/usr/bin/server.sh"]




