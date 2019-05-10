
FROM registry.cn-shenzhen.aliyuncs.com/kstudio/utils-baseimage

MAINTAINER Kinfen
USER root
RUN set -x \
	echo "安装 apt https 支持" \
	&&  apt-get update \
	&&  apt-get install -y\
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common \
	nfs-common \
	&& echo "获取gpg key" \
	&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add - \
	&& echo "安装amd64的repository" \
	&&  add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable" \
	&&   apt-get update && apt-get install -y docker-ce \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/archives