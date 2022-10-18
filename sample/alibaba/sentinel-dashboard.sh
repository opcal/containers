#!/bin/sh

set -e

echo " "
echo " "
echo 'build sentinel-dashboard start'

export SENTINEL_VERSION=$(curl https://api.github.com/repos/alibaba/Sentinel/releases/latest | grep tag_name | cut -d '"' -f 4)

docker build --build-arg SENTINEL_VERSION -t sentinel-dashboard:${TAG_VERSION} -f ${GITHUB_WORKSPACE}/sample/alibaba/sentinel-dashboard/Dockerfile . --no-cache
docker image tag sentinel-dashboard:${TAG_VERSION} ${CI_REGISTRY}/opcal/sentinel-dashboard:${SENTINEL_VERSION}
docker image tag sentinel-dashboard:${TAG_VERSION} ${CI_REGISTRY}/opcal/sentinel-dashboard:latest
docker push ${CI_REGISTRY}/opcal/sentinel-dashboard:${SENTINEL_VERSION}
docker push ${CI_REGISTRY}/opcal/sentinel-dashboard:latest

echo 'build sentinel-dashboard finished'
echo " "
echo " "