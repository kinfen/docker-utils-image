#!/bin/bash

UTILS="utils-lite \
	utils-baseimage \
	utils-vsftpd \
	utils-privoxy
	utils-mongo
	utils-jenkins
	utils-ftp
	utils-nodexm
	utils-dockeragent"

for util in $UTILS; do
	docker push kinfen/$util:latest
done