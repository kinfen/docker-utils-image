#!/bin/bash

echo "发布操作=======================" >> docker.log
echo date >> docker.log
echo "正在准备目录"  >> docker.log

#DOCKER_PATH= which docker
export DOCKER_FOLD=mydocker
export STACK_NAME=mystack
export DOCKER_PATH=$(which docker)
export USER_NAME=$(whoami)


#这里的-x 参数判断$myPath是否存在并且是否具有可执行权限  
if [ ! -x $DOCKER_FOLD ]; then  
	mkdir -p $DOCKER_FOLD
fi

if [ ! -x "$DOCKER_FOLD/jenkins" ]; then  
	mkdir -p $DOCKER_FOLD"/jenkins" 
fi

if [ ! -x "$DOCKER_FOLD/nginx" ]; then  
	mkdir -p $DOCKER_FOLD"/nginx" 
fi

if [ ! -x "$DOCKER_FOLD/log" ]; then  
	mkdir -p $DOCKER_FOLD"/log" 
fi


# chown -R $USER_NAME $DOCKER_FOLD
# chown -R $USER_NAME $DOCKER_PATH
# chown -R $USER_NAME /var/run/docker.sock
# chmod -R 777  $DOCKER_PATH
# chmod -R 777  /var/run/docker.sock
echo "准备发布服务"  >> docker.log
docker stack deploy --compose-file docker-compose.yml $STACK_NAME

#set all resources can rwx for all the containers
chmod -R 777 $DOCKER_FOLD
chmod -R 777 $DOCKER_PATH
chmod -R 777 /var/lib/docker/volumes
chmod -R 777 /var/run/docker.sock


