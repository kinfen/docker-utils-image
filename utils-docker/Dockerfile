
FROM registry.cn-beijing.aliyuncs.com/rdc-builds/base:1.0

MAINTAINER Kinfen
USER admin
RUN set -x \
	echo "安装 apt https 支持" \
	&& sudo apt-get update \
	&& sudo apt-get install -y\
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common \
	nfs-common \
	&& echo "获取gpg key" \
	&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
	&& echo "安装amd64的repository" \
	&& sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable" \
	&& sudo  apt-get update && sudo apt-get install -y docker-ce \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/archives