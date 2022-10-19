#!/bin/sh

set -e

echo " "
echo " "
echo 'build opcal-nginx-alpine start'

docker build -t opcal-nginx-alpine:${TAG_VERSION} -f ${PROJECT_DIR}/tools/nginx-alpine/Dockerfile.alpine . --no-cache
docker image tag opcal-nginx-alpine:${TAG_VERSION} ${CI_REGISTRY}/opcal/opcal-nginx-alpine:${LATEST_VERSION}
docker image tag opcal-nginx-alpine:${TAG_VERSION} ${CI_REGISTRY}/opcal/opcal-nginx-alpine:latest
docker push ${CI_REGISTRY}/opcal/opcal-nginx-alpine:${LATEST_VERSION}
docker push ${CI_REGISTRY}/opcal/opcal-nginx-alpine:latest

echo 'build opcal-nginx-alpine finished'
echo " "
echo " "