#!/bin/bash

UTILS="utils-lite utils-baseimage utils-vsftpd"

for util in $UTILS; do
	docker push kinfen/$util:latest
done