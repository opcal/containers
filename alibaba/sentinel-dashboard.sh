#!/bin/sh

set -e

echo " "
echo " "
echo 'build sentinel-dashboard start'

export SENTINEL_VERSION=$(curl https://api.github.com/repos/alibaba/Sentinel/releases/latest | jq | grep tag_name | cut -d '"' -f 4)


docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg SENTINEL_VERSION=${SENTINEL_VERSION} \
    --push \
    -t ${CI_REGISTRY}/opcal/sentinel-dashboard:${SENTINEL_VERSION} \
    -t ${CI_REGISTRY}/opcal/sentinel-dashboard:latest \
    -f ${PROJECT_DIR}/alibaba/sentinel-dashboard/Dockerfile . --no-cache

echo 'build sentinel-dashboard finished'
echo " "
echo " "