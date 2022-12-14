#!/bin/sh

set -e

echo " "
echo " "
echo 'build opcal-nginx start'

docker build -t opcal-nginx:${TAG_VERSION} -f ${PROJECT_DIR}/tools/nginx/Dockerfile . --no-cache
docker image tag opcal-nginx:${TAG_VERSION} ${CI_REGISTRY}/opcal/opcal-nginx:${LATEST_VERSION}
docker image tag opcal-nginx:${TAG_VERSION} ${CI_REGISTRY}/opcal/opcal-nginx:latest
docker push ${CI_REGISTRY}/opcal/opcal-nginx:${LATEST_VERSION}
docker push ${CI_REGISTRY}/opcal/opcal-nginx:latest

echo 'build opcal-nginx finished'
echo " "
echo " "