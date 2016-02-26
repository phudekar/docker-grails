#!/bin/bash
TAG=latest
VERSION=2.2.1
if [ $# -eq 1 ]
  then
    VERSION=$1
    TAG=$1
fi
echo "building grails:$VERSION"
docker build -t pradiphudekar/grails:$TAG --build-arg GRAILS_VERSION=$VERSION .
