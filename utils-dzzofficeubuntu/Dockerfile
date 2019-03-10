FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-baseimage:latest
MAINTAINER Kinfen
ENV NEW_USER=dzz
ENV NEW_HOME=/home/$NEW_USER
ENV DOCKER_ID=1000
ENV VERSION=2.02
ENV GIT_NAME=dzzoffice
ENV PORT=8080
RUN useradd --create-home --no-log-init --shell /bin/bash $NEW_USER
RUN adduser $NEW_USER sudo
# RUN apt-get update &&\
# 	apt-get install -y git &&\
RUN	apt-get install python-software-properties && add-apt-repository ppa:ondrej/php \
    && apt-get install  php7.0 php7.0-xml php7.0-mysql\
    && cd $NEW_HOME \
    && sudo -u $NEW_USER -H git clone --branch $VERSION https://github.com/zyx0814/$GIT_NAME.git \
    && chmod 666 -R $NEW_HOME/$GIT_NAME/config \
    && chmod 666 -R $NEW_HOME/$GIT_NAME/data \    
 	&& apt-get clean \                    
	&& apt-get autoremove \
    && apt-get uninstall git \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/archives 

    COPY server.sh $NEW_HOME/$GIT_NAME

RUN echo "extension=xml" >> /etc/php7/php.ini \
    && echo "error_log=/var/log/php_error.log" >> /etc/php7/php.ini

WORKDIR $NEW_HOME/$GIT_NAME
EXPOSE $PORT
CMD ["/bin/sh", "server.sh", "8080"]




