#!/bin/sh

set -e

echo " "
echo " "
echo 'build opcal-nginx start'

docker build -t opcal-nginx:${TAG_VERSION} -f ${GITHUB_WORKSPACE}/tools/nginx/Dockerfile . --no-cache
docker image tag opcal-nginx:${TAG_VERSION} ${CI_REGISTRY}/opcal/containers/opcal-nginx:${PROJECT_VERSION}-${TIMESTAMP}
docker image tag opcal-nginx:${TAG_VERSION} ${CI_REGISTRY}/opcal/containers/opcal-nginx:${LATEST_VERSION}
docker image tag opcal-nginx:${TAG_VERSION} ${CI_REGISTRY}/opcal/containers/opcal-nginx:latest
docker push ${CI_REGISTRY}/opcal/containers/opcal-nginx:${PROJECT_VERSION}-${TIMESTAMP}
docker push ${CI_REGISTRY}/opcal/containers/opcal-nginx:${LATEST_VERSION}
docker push ${CI_REGISTRY}/opcal/containers/opcal-nginx:latest

echo 'build opcal-nginx finished'
echo " "
echo " "