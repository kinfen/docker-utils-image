
FROM alpine:3.6

# Set one or more individual labels
LABEL version="0.0.2"
LABEL description="for lite image"
LABEL publishdate="2018-3-17"

ENV TIMEZONE Asia/Guangzhou
RUN set -x \
    apk update && apk upgrade &&  apk --update --no-cache add tzdata redis \
    && rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 
    && ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo $TIMEZONE > /etc/timezone

RUN echo "root:1qazXSW@" | chpasswd

