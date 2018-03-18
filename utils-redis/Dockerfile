FROM kinfen/utils-lite:latest

RUN set -x \
    apk update && apk upgrade &&  apk --update --no-cache --virtual .buildstep add redis \
    && rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 
RUN set -x && mkdir /etc/redis
COPY ./redis.conf /etc/redis/redis.conf
EXPOSE 6379
CMD redis-server /etc/redis/redis.conf
