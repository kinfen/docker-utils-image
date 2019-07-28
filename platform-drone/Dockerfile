

FROM drone/drone:latest as drone


FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest

# Set one or more individual labels
LABEL version="0.0.1"
LABEL description="for drone image"
LABEL publishdate="2019-7-23"

ENV DOCKER_ID 1000
ENV USER_NAME drone
ENV USER_HOME /home/$USER_NAME
ENV TIMEZONE Asia/Shanghai
RUN set -x \
    && sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && cat /etc/apk/repositories

RUN addgroup -g $DOCKER_ID  -S $USER_NAME \
    && adduser -G $USER_NAME -h $USER_HOME -u $DOCKER_ID  -s /bin/sh -S -g "$USER_NAME" $USER_NAME \
    && echo "${USER_NAME}:1qazXSW@" | chpasswd

ENV GODEBUG netdns=go
ENV XDG_CACHE_HOME /data
ENV DRONE_DATABASE_DRIVER sqlite3
ENV DRONE_DATABASE_DATASOURCE /data/database.sqlite
ENV DRONE_RUNNER_OS=linux
ENV DRONE_RUNNER_ARCH=amd64
ENV DRONE_SERVER_PORT=:80
ENV DRONE_SERVER_HOST=localhost
ENV DRONE_DATADOG_ENABLED=true
ENV DRONE_DATADOG_ENDPOINT=https://stats.drone.ci/api/v1/series

COPY --from=drone /etc/ssl/certs/* /etc/ssl/certs/
COPY --from=drone /bin/drone-server /bin/
COPY server.sh /bin/
ENTRYPOINT [ "sh", "/bin/server.sh"]


