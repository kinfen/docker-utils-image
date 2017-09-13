#!/bin/bash
echo "启动本地虚拟机"

cd ~
docker-machine start default
eval $(docker-machine env default)