
FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-nodexm

MAINTAINER Kinfen

# this image is base from nodejs and to install yarn in this step, it may use fo build apps or run apps

# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for node-build"
LABEL publishdate="2018-9-1"


ADD ssh-entry.sh /usr/local/bin

# update the apt package

ARG dockerGid=999

USER root
RUN set -x \
	&& apk --update add --no-cache --virtual .build-deps \
	yarn \
	openssh \
	&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
	&& chmod 100 /usr/local/bin/ssh-entry.sh \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key \
	&& mkdir -p /root/.ssh \
	&& touch /root/.ssh/authorized_keys


RUN set -x \
	&& mkdir -p /.tmp && cd /.tmp \
	&& apk --update add --no-cache --virtual .build-step curl \
 	&& curl -sSL https://download.docker.com/linux/static/stable/x86_64/docker-17.06.1-ce.tgz | tar xz --strip 1 \
	&& cp /.tmp/docker /usr/bin/docker \
	&& rm -rf /.tmp \
	&& apk del .build-step \
	&& rm -rf /var/cache/apk/* /tmp/* \ 
	&& rm -rf /var/lib/apt/lists/* 

EXPOSE 22

ENTRYPOINT ["ssh-entry.sh"]
CMD ["/usr/sbin/sshd","-D"]