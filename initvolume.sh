#!/bin/bash

VFS_PATH=/swarmvolumes
VOLUME_NAME="jenkins logs nginx mongo yarncache"

#if [ $(ps | grep convoy) ]>0; then
	killall convoy
#fi

if [ -d "$VFS_PATH/config" ]; then
	echo "清除设置，强制读取新设置"
	rm  $FS_PATH/config
fi

if [ -f "/var/lib/rancher/convoy/vfs/vfs.cfg" ]; then
	echo "清除旧的设置，强制读取新设置"
	rm /var/lib/rancher/convoy/vfs/vfs.cfg
fi




if [ ! -f "/usr/local/bin/convoy" ]; then
	#wget https://github.com/rancher/convoy/releases/download/v0.5.0/convoy.tar.gz
	tar xvzf convoy.tar.gz
	cp convoy/convoy convoy/convoy-pdata_tools /usr/local/bin/
	mkdir -p /etc/docker/plugins/
	bash -c 'echo "unix:///var/run/convoy/convoy.sock" > /etc/docker/plugins/convoy.spec'
fi



if [ ! $1 ]; then
	echo "需要指定服务器ip"
	exit 1
fi

if [ ! -d $VFS_PATH ]; then
	echo "创建目录"
	mkdir -p $VFS_PATH
	chmod -R 777 $VFS_PATH
fi
mount -t nfs4 -o soft -o retry=10 $1:/ $VFS_PATH

grep $1:/ /etc/fstab > /dev/null
if [ ! $? -eq 0 ]; then
	echo "$1:/ $VFS_PATH nfs rw" >> /etc/fstab
fi

if [ ! -f "/etc/init.d/convoy" ]; then

	header="### BEGIN INIT INFO
# Provides:          bbzhh.com
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: tomcat service
# Description:       tomcat service daemon
### END INIT INFO"
	echo "添加自启动项"
	#touch /etc/init.d/convoy
	echo "#!/bin/bash \n $header \nnohup convoy daemon --drivers vfs --driver-opts vfs.path=$VFS_PATH > /var/log/convoy.log 2>&1 &" > /etc/init.d/convoy
	chmod 755 /etc/init.d/convoy
	update-rc.d convoy defaults 95
fi

nohup convoy daemon --drivers vfs --driver-opts vfs.path=$VFS_PATH > /var/log/convoy.log 2>&1 &



# echo $@

# if [ ! $@ ]; then
# 	echo "err"
# 	exit 1
# fi

# for ip in $@; do
# 	echo $ip
# done
