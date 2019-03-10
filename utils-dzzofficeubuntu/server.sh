#!/bin/sh
set -x
set -e
echo "dzzoffice is going to start" \
&& sudo -u dzz -H php -S 0.0.0.0:$1
