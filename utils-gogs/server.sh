#!/bin/sh
set -e
echo "gogs is going to start"
exec su - git
exec gogs web -c ~/app.ini