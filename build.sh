#!/bin/bash

UTILS="utils-lite utils-nodexm"

for util in $UTILS; do
	docker build ./$util -t kinfen/$util:latest
done