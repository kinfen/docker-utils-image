FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-jre7:latest

LABEL version="0.0.1"
LABEL description="for tomcat image"
LABEL publishdate="2019-7-23"

ENV TOMCAT_VERSION_B 7
ENV TOMCAT_VERSION 7.0.94
ENV TOMCAT_HOME /etc/tomcat

ENV DOCKER_ID 1000
ENV USER_NAME tomcat
ENV USER_HOME /home/$USER_NAME

RUN addgroup -g $DOCKER_ID  -S $USER_NAME \
    && adduser -G $USER_NAME -h $USER_HOME -u $DOCKER_ID  -s /bin/sh -S -g "$USER_NAME" $USER_NAME \
    && echo "${USER_NAME}:1qazXSW@" | chpasswd

RUN set -x \
    apk update && apk upgrade \
    && apk add sudo font-adobe-100dpi ttf-dejavu fontconfig \
    && fc-cache --force \
    && rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

RUN set -x \
    && mkdir ${TOMCAT_HOME} && cd ${TOMCAT_HOME} \ 
    && wget https://archive.apache.org/dist/tomcat/tomcat7/tomcat-$TOMCAT_VERSION/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.zip -O tomcat.zip \
    && unzip tomcat.zip \
    && mv ${TOMCAT_HOME}/apache-tomcat-$TOMCAT_VERSION/* . \
    && rm -rf ${TOMCAT_HOME}/webapps/* \
    && rm -rf ${TOMCAT_HOME}/apache-tomcat-$TOMCAT_VERSION \
    && rm tomcat.zip

COPY server.sh ${TOMCAT_HOME}/

RUN chown -hR $USER_NAME:$USER_NAME $TOMCAT_HOME

WORKDIR ${TOMCAT_HOME}

CMD [ "./server.sh" ]