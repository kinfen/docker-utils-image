#!/bin/sh
echo "准备创建镜像"
echo "$PLUGIN_PASSWORD" | docker -H $PLUGIN_DOCKERHOST login $PLUGIN_REPO -u $PLUGIN_USERNAME --password-stdin
docker -H $PLUGIN_DOCKERHOST build --rm $PLUGIN_CONTEXT -t $PLUGIN_REGISTRY:${PLUGIN_TAG}
docker -H $PLUGIN_DOCKERHOST push $PLUGIN_REGISTRY:${PLUGIN_TAG}
echo "清理临时资源"
docker -H $PLUGIN_DOCKERHOST system prune -f