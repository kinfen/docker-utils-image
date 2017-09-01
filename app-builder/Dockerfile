
FROM kinfen/kadm:nodexm

MAINTAINER Kinfen


# Set one or more individual labels
LABEL version="0.0.1-beta"
LABEL description="for node-build"
LABEL publishdate="2018-9-1"


# Set the working directory to /app

# update the apt package
RUN apk add --no-cache --virtual .build-deps-yarn \
  yarn \
  && apk del .build-deps-yarn
