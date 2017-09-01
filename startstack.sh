#!/bin/bash

echo "复制yml文件"
docker-machine scp docker-compose.yml default:~

echo "启动stack任务"
docker-machine ssh default "docker stack deploy -c docker-compose.yml startstack"