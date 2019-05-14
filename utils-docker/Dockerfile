
FROM registry.cn-beijing.aliyuncs.com/rdc-builds/base:1.0
RUN set -x \
	echo "安装 svn 支持" \
	&& sudo apt-get update \
	&& sudo apt-get install -y\
	subversion \
	&& sudo rm -rf /var/lib/apt/lists/* \
	&& sudo rm -rf /var/cache/apt/archives