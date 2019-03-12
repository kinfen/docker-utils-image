#!/bin/sh
set -x
set -e
echo "dzzoffice is going to start" \
&& php-fpm7 -D \
&& nginx -g "daemon off;";
