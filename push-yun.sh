#!/bin/bash
ALIYUN_SERVER="registry.cn-shenzhen.aliyuncs.com/kstudio"
# UTILS="utils-lite
# 	utils-baseimage
# 	utils-vsftpd"
	# utils-privoxy
	# utils-mongo
	# utils-jenkins
	# utils-nginx
	# utils-ftp
	# utils-nodexm
	# utils-dockeragent
	# utils-redis
	# utils-mysql
	# utils-cnpm.org
#	utils-tomcat
#	utils-node-py
	# utils-ngrok
	# utils-docker
	# utils-gogs"
	# utils-v2r
	#image-builder"
# UTILS="utils-v2r"
# for util in $UTILS; do
# 	docker push $ALIYUN_SERVER/$util:latest
# done
docker tag kinfen/utils-nodexm:10 $ALIYUN_SERVER/utils-nodexm:10
docker push $ALIYUN_SERVER/utils-nodexm:10