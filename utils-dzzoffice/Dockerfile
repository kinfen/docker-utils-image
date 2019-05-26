FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV NEW_USER=dzz
ENV NEW_HOME=/home/$NEW_USER
ENV DOCKER_ID=1000
ENV VERSION=2.02
ENV GIT_NAME=dzzoffice
ENV PORT=80
RUN addgroup -g $DOCKER_ID  -S $NEW_USER \
    && adduser -G $NEW_USER -h $NEW_HOME -s /bin/sh -S -g "$NEW_USER" $NEW_USER
RUN apk --update add --no-cache --virtual .build-step git \
    && apk add --no-cache nginx php7 php7-fpm php7-mysqli php7-pdo_mysql php7-xml php7-simplexml php7-zip php7-curl \
    && cd $NEW_HOME \
    && git clone --branch $VERSION https://github.com/zyx0814/$GIT_NAME.git \
    && apk del .build-step \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

RUN { \
		echo '[global]'; \
		echo 'error_log = /proc/self/fd/2'; \
		echo; echo '; https://github.com/docker-library/php/pull/725#issuecomment-443540114';\
		echo; \
		echo '[www]'; \
		echo '; if we send this to /proc/self/fd/1, it never appears'; \
		echo 'access.log = /proc/self/fd/2'; \
		echo; \
		echo 'clear_env = no'; \
		echo; \
		echo '; Ensure worker stdout and stderr are sent to the main error log.'; \
		echo 'catch_workers_output = yes'; \
	} | tee /etc/php7/php-fpm.d/docker.conf \
RUN echo "extension=xml" >> /etc/php7/php.ini \
    && echo "error_log=/var/log/php_error.log" >> /etc/php7/php.ini \
    # && sed -i "s/user = nobody/user = ${NEW_USER}/" /etc/php7/php-fpm.d/www.conf \
    # && sed -i "s/group = nobody/group = ${NEW_USER}/" /etc/php7/php-fpm.d/www.conf \
    && sed -i "s/listen = 127.0.0.1:9000/listen = 9000/" /etc/php7/php-fpm.d/www.conf \
    # && sed -i "s/;listen.owner = nobody/listen.owner = ${NEW_USER}/" /etc/php7/php-fpm.d/www.conf \
    # && sed -i "s/;listen.group/listen.group/" /etc/php7/php-fpm.d/www.conf \
    && sed -i "s/;listen.mode/listen.mode/" /etc/php7/php-fpm.d/www.conf \
    && sed -i "s/;php_admin_value[error_log]/php_admin_value[error_log]/" /etc/php7/php-fpm.d/www.conf \
    && mkdir /run/nginx/ \
    && chmod 777 -R $NEW_HOME/$GIT_NAME
# RUN chown $NEW_USER:$NEW_USER /var/log/nginx
COPY dzznginx.conf /etc/nginx/conf.d/default.conf
COPY server.sh $NEW_HOME/$GIT_NAME

WORKDIR $NEW_HOME/$GIT_NAME
EXPOSE $PORT
CMD [ "sh", "/home/dzz/dzzoffice/server.sh" ]




