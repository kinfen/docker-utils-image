#!/bin/bash

echo "准备nfs服务器"

SOURCE_FOLDER=/sharedvolume
VOLUME_NAME="logs nginx jenkins mongo yarncache"

apt-get install -y nfs-kernel-server

if [ ! $@ ]; then
	echo "请提供域名"
	exit 1
fi

for ip in $@; do
	if [ $ip="127.0.0.1" ]; then
		echo "检查本机目录"
		if [ ! -f "$SOURCE_FOLDER" ]; then
			set -x \
			&& mkdir -p $SOURCE_FOLDER \
			&& chmod 777 $SOURCE_FOLDER 
		fi

		for key in $VOLUME_NAME; do
			if [ ! -f "$SOURCE_FOLDER/$key" ]; then
				mkdir -p $SOURCE_FOLDER/$key && chmod 777 -R $SOURCE_FOLDER/$key
			fi
		done

	fi
	echo "$SOURCE_FOLDER $ip(rw,sync,fsid=0,no_root_squash,no_subtree_check)" >> /etc/exports
done

echo "nfs服务器启动"
service portmap restart
service nfs-kernel-server restart

