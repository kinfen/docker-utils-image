#!/bin/bash

set -x \
	&& /usr/local/bin/npm install /home/www/kadm --prefer-offline --unsafe-perm=true \
	&& docker build --tag kinfen/kadm:app_last /home/www/kadm \
	&& docker login -u kinfen -p deadkill \
	&& docker push kinfen/kadm:app_last \
	&& docker service update --image kinfen/kadm:app_last mystack_apps
