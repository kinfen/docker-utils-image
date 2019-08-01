FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-baseimage:latest as builder

<<<<<<< HEAD
RUN apt-get update
RUN apt-get install curl -y
RUN curl -L -o /tmp/go.sh https://install.direct/go.sh
RUN chmod +x /tmp/go.sh
RUN /tmp/go.sh
=======
RUN set -x \
    && apt-get update \
    && apt-get install curl -y \
    && curl -L -o /tmp/go.sh https://install.direct/go.sh \
    && chmod +x /tmp/go.sh \
    && apt remove curl -y \
    && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/archives
    
RUN  /tmp/go.sh 
>>>>>>> 53b36b2766e48e50d0128cb71b3f2b40293d7b59

FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest

LABEL maintainer "Kinfen <kinfen.in@gmail.com>"

COPY --from=builder /usr/bin/v2ray/v2ray /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/v2ctl /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/geoip.dat /usr/bin/v2ray/
COPY --from=builder /usr/bin/v2ray/geosite.dat /usr/bin/v2ray/
COPY config.json /etc/v2ray/config.json

RUN set -ex && \
<<<<<<< HEAD
    apk --no-cache add ca-certificates && \
    mkdir /var/log/v2ray/ &&\
=======
>>>>>>> 53b36b2766e48e50d0128cb71b3f2b40293d7b59
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray

ENV PATH /usr/bin/v2ray:$PATH

CMD ["v2ray", "-config=/etc/v2ray/config.json"]