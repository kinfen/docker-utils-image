#!/bin/bash

UTILS="utils-lite \
	utils-baseimage \
	utils-vsftpd \
	utils-privoxy
	utils-mongo
	utils-jenkins"

for util in $UTILS; do
	docker push kinfen/$util:latest
done