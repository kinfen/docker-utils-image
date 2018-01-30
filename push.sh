#!/bin/bash

UTILS="utils-lite utils-nodexm"

for util in $UTILS; do
	docker push kinfen/$util:latest
done