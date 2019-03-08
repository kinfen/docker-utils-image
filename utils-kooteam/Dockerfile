FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest
MAINTAINER Kinfen
ENV KOO_USER=koo
ENV KOO_HOME=/home/$KOO_USER
ENV DOCKER_ID=1000
ENV PORT=7053

RUN addgroup -g $DOCKER_ID  -S $KOO_USER \
    && adduser -G $KOO_USER -h $KOO_HOME -s /bin/sh -S -g "$KOO_USER" $KOO_USER
# 	&& echo 'export GOROOT="$HOME/local/go"' >> $GIT_HOME/.profile \
# 	&& echo 'export GOPATH="$HOME/go"' >> $GIT_HOME/.profile \
	# && echo 'export PATH="$PATH:$KOO_HOME"' >> $KOO_HOME/.profile 
RUN apk --update add --no-cache --virtual .build-step curl tar \
    && apk add --no-cache sudo openjdk8 lsof \
    && cd $KOO_HOME \
    && curl -L -o kooteam.tar.gz 'https://pangu.yimiyisu.com/home/download.do?app=kooteam&type=install' \
    && tar -xvf kooteam.tar.gz \
    && apk del .build-step \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* \
    && rm kooteam.tar.gz 
COPY run.sh $KOO_HOME
RUN mkdir -p /var/log/kooteam \
	&& chown -R $KOO_USER:$KOO_USER /var/log/kooteam \
    && chown -R $KOO_USER:$KOO_USER $KOO_HOME
WORKDIR $KOO_HOME
EXPOSE $PORT
CMD ["/bin/sh", "run.sh", "7053"]




