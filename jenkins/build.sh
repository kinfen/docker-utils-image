#!/bin/bash

set -x \
	&& cd /home/www/kadm \
	&& /usr/local/bin/npm install --prefer-offline \
	&& docker login -u kinfen -p deadkill \
	&& docker build --tag kinfen/kadm:app_last . \
	&& docker push kinfen/kadm:app_last \
	&& docker service update --image kinfen/kadm:app_last mystack_apps