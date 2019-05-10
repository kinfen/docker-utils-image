#!/bin/bash
docker login --username=$YUN_USERNAME --password=$YUN_PASSWORD registry.cn-shenzhen.aliyuncs.com
sh build-yun.sh
sh push-yun.sh