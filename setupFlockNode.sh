#!/bin/bash
echo "install env tools"
apt-get update
apt-get -y install apt-transport-https software-properties-common
add-apt-repository -y "deb https://clusterhq-archive.s3.amazonaws.com/ubuntu/$(lsb_release --release --short)/\$(ARCH) /"
cat "Package: *\nPin: origin clusterhq-archive.s3.amazonaws.com\nPin-Priority: 700\n" > /tmp/apt-pref
mv /tmp/apt-pref /etc/apt/preferences.d/buildbot-700
echo "install flocker node and plugin"
apt-get update \
&& apt-get -y install --force-yes clusterhq-flocker-node clusterhq-flocker-docker-plugin