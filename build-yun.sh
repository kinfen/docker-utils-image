#!/bin/bash
ALIYUN_SERVER="registry.cn-shenzhen.aliyuncs.com/kstudio"
# UTILS="utils-lite
	# utils-baseimage
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
	# utils-tomcat
	# utils-ngrok
	# utils-v2r
	# utils-node-py"
UTILS="utils-v2r"
for util in $UTILS; do
	docker build ./$util -t $ALIYUN_SERVER/$util:latest
done