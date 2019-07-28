#!/bin/bash
ALIYUN_SERVER="registry.cn-shenzhen.aliyuncs.com/kstudio"
# UTILS="utils-lite
# 	utils-baseimage
# 	utils-vsftpd"
# 	utils-privoxy
# 	utils-mongo
# 	utils-jenkins
# 	utils-nginx
# 	utils-ftp
# 	utils-nodexm
# 	utils-dockeragent
#	utils-redis
#	utils-mysql
#	utils-cnpm.org
#	utils-tomcat
#	utils-node-py
	# utils-ngrok
	# utils-docker
	# utils-gogs"
	# utils-v2r
	#image-builder"
UTILS="utils-jre7 utils-tomcat utils-nginx"
for util in $UTILS; do
	docker tag $ALIYUN_SERVER/$util:latest kinfen/$util:latest
	docker push kinfen/$util:latest
done