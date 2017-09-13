#!/bin/bash

set -x \
	&& cd /home/www/kadm \
	&& yarn install \
	&& docker login -u kinfen -p deadkill \
	&& docker build --tag kinfen/kadm:app_last . \
	&& docker push kinfen/kadm:app_last