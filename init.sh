#!/bin/bash

# run in ubuntu

set -x \
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
	&&  sudo apt-get update && apt-get install -y docker-ce \
	&&	echo "准备监控工具" \
	&& sudo wget https://github.com/bcicen/ctop/releases/download/v0.6.1/ctop-0.6.1-linux-amd64 -O /usr/bin/ctop \
	&& sudo chmod +x /usr/bin/ctop

   	# && echo "安装aufs支持" \
	# && sudo apt-get update \
	# && sudo apt-get install \
 #    linux-image-extra-$(uname -r) \
 #    linux-image-extra-virtual \