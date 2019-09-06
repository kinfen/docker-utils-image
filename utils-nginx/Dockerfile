
FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-lite:latest

ENV DOCKER_ID 1000
ENV USER_NAME nginx
ENV USER_HOME /home/$USER_NAME

RUN addgroup -g $DOCKER_ID  -S $USER_NAME \
    && adduser -G $USER_NAME -h $USER_HOME -u $DOCKER_ID  -s /bin/sh -S -g "$USER_NAME" $USER_NAME \
    && echo "${USER_NAME}:1qazXSW@" | chpasswd

RUN apk --update add --no-cache sudo nginx \
    && mkdir /run/nginx/ \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

COPY server.sh /etc/nginx/
COPY *.conf /etc/nginx/
RUN chown -R $USER_NAME:$USER_NAME /etc/nginx /var/log/nginx /usr/lib/nginx /var/tmp/nginx /run/nginx/ \
    && chmod +x  /etc/nginx/server.sh
#RUN apt-add-repository ppa:nginx/stable && apt-get update && apt-get install -y nginx nginx-extras
EXPOSE 80
#ENTRYPOINT nginx
WORKDIR /etc/nginx/
CMD [ "./server.sh" ]