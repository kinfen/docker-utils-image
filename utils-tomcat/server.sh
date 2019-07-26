#!/bin/sh
set -ex
echo "tomcat is going to start"
#echo ${TOMCAT_HOME}
cd ${TOMCAT_HOME}/bin
sudo -u tomcat sh catalina.sh run
