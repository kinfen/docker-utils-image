#!/bin/sh
echo "gitea is going to start"
chmod 777 -R /usr/local/bin/gitea
ls /usr/local/bin/gitea -l
sudo -u gitea -HE /usr/local/bin/gitea web
