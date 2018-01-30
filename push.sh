#!/bin/bash

UTILS="utils-lite \
	utils-baseimage \
	utils-vsftpd \
	utils-privoxy
	utils-baseimage"

for util in $UTILS; do
	docker push kinfen/$util:latest
done