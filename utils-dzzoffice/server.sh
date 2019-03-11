#!/bin/sh
set -x
set -e
echo "dzzoffice is going to start" \
&& sudo -u dzz -H php-fpm7 -D \
&& sudo -u dzz -H nginx -g "daemon off;";
