FROM registry.cn-shenzhen.aliyuncs.com/utils-lite:latest

# Set one or more individual labels
LABEL version="0.0.1"
LABEL description="for gitea image"
LABEL publishdate="2019-9-24"

ENV DOCKER_ID 1000
ENV USER_NAME gitea
ENV USER_HOME /home/$USER_NAME
ENV GITEA_WORK_DIR /var/lib/gitea


RUN addgroup -g $DOCKER_ID  -S $USER_NAME \
    && adduser -G $USER_NAME -h $USER_HOME -u $DOCKER_ID  -s /bin/sh -S -g "$USER_NAME" $USER_NAME \
    && echo "${USER_NAME}:1qazXSW@" | chpasswd

RUN set -x \
    && apk update && apk upgrade \
    && apk add sudo git \
    && rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 





ENV GITEA_VERSION=1.12.5

COPY server.sh /bin/server.sh
RUN wget -O /usr/local/bin/gitea https://dl.gitea.io/gitea/${GITEA_VERSION}/gitea-${GITEA_VERSION}-linux-amd64 \
    && mkdir -p /var/lib/gitea/custom /var/lib/gitea/data /var/lib/gitea/log \
    && chown -R $USER_NAME:$USER_NAME /var/lib/gitea/ \
    && chmod -R 750 /var/lib/gitea/ \
    && chmod 755 /usr/local/bin/gitea \
    && chmod +x /bin/server.sh

ENTRYPOINT [ "sh", "/bin/server.sh"]


