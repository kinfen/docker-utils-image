#!/bin/bash

UTILS="utils-lite utils-nodexm"

docker login -u $DOCKER-USERNAME -p $DOCKER-PASSWORD

for util in $UTILS; do
	docker push kinfen/$util:latest
done