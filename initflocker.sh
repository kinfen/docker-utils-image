#!/bin/bash



echo "install pip and virtual env"

sudo sudo python -m ensurepip \
	&& pip install virtualenv

virtualenv --python=/usr/bin/python2.7 flocker-client
source flocker-client/bin/activate
pip install --upgrade pip \
&& pip install git+git://github.com/ScatterHQ/flocker.git@1.15.0