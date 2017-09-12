#!/bin/bash

VFS_PATH=~/volumes
VOLUME_NAME="jenkins logs nginx mongo yarncache"

if [ ! -f "/usr/local/bin/convoy" ]; then
	wget https://github.com/rancher/convoy/releases/download/v0.5.0/convoy.tar.gz
	tar xvzf convoy.tar.gz
	cp convoy/convoy convoy/convoy-pdata_tools /usr/local/bin/
	mkdir -p /etc/docker/plugins/
	bash -c 'echo "unix:///var/run/convoy/convoy.sock" > /etc/docker/plugins/convoy.spec'
	cp ./convoy.sh /etc/init.d/convoy
fi



if [ ! $1 ]; then
	echo "需要指定服务器ip"
	exit 1
fi

if [ ! -f $VFS_PATH ]; then
	mkdir -p $VFS_PATH
	mount -t nfs4 $1:/ $VFS_PATH
fi

nohup convoy daemon --drivers vfs --driver-opts vfs.path=$VFS_PATH > /var/log/convoy.log 2>&1 &

# echo "准备创建volume"
# for key in $VOLUME_NAME; do
# 	echo "创建volume $key"
# 	docker volume create -d convoy mystack_$key
# done





# echo $@

# if [ ! $@ ]; then
# 	echo "err"
# 	exit 1
# fi

# for ip in $@; do
# 	echo $ip
# done
