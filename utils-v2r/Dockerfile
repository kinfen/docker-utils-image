FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-baseimage:latest as builder

RUN apt-get update \
    && apt-get install curl -y \
    && curl -L -o /tmp/go.sh https://install.direct/go.sh \
    && chmod +x /tmp/go.sh \
    && sh /tmp/go.sh \
    && apt remove curl -y \
    && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/archives

COPY config.json /etc/v2ray/config.json

RUN set -ex && \
    mkdir /var/log/v2ray/ &&\
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray

ENV PATH /usr/bin/v2ray:$PATH

CMD ["v2ray", "-config=/etc/v2ray/config.json"]