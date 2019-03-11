FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV NEW_USER=dzz
ENV NEW_HOME=/home/$NEW_USER
ENV DOCKER_ID=1000
ENV VERSION=2.02
ENV GIT_NAME=dzzoffice
ENV PORT=8080
RUN addgroup -g $DOCKER_ID  -S $NEW_USER \
    && adduser -G $NEW_USER -h $NEW_HOME -s /bin/sh -S -g "$NEW_USER" $NEW_USER
RUN apk --update add --no-cache --virtual .build-step git \
    && apk add --no-cache sudo php7 php7-fpm php7-mysqli php7-pdo_mysql php7-xml php7-simplexml php7-zip php7-curl \
    && cd $NEW_HOME \
    && sudo -u $NEW_USER -H git clone --branch $VERSION https://github.com/zyx0814/$GIT_NAME.git \
    && chmod 666 -R $NEW_HOME/$GIT_NAME/config \
    && chmod 666 -R $NEW_HOME/$GIT_NAME/data \
    && apk del .build-step \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 
    COPY server.sh $NEW_HOME/$GIT_NAME
RUN echo "extension=xml" >> /etc/php7/php.ini \
    && echo "error_log=/var/log/php_error.log" >> /etc/php7/php.ini

WORKDIR $NEW_HOME/$GIT_NAME
EXPOSE $PORT
CMD ["/bin/sh", "server.sh", "8080"]




