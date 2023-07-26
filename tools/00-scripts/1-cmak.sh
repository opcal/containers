#!/bin/sh

set -e

echo " "
echo " "
echo 'build cmak start'

CMAK_VERSION=$(curl https://api.github.com/repos/yahoo/CMAK/releases/latest | jq | grep tag_name | cut -d '"' -f 4)

docker build \
    --build-arg CMAK_VERSION=${CMAK_VERSION} \
    -t cmak:${TAG_VERSION} \
    -f ${PROJECT_DIR}/tools/CMAK/Dockerfile . --no-cache
docker image tag cmak:${TAG_VERSION} ${CI_REGISTRY}/opcal/cmak:${CMAK_VERSION}
docker image tag cmak:${TAG_VERSION} ${CI_REGISTRY}/opcal/cmak:latest
docker push ${CI_REGISTRY}/opcal/cmak:${CMAK_VERSION}
docker push ${CI_REGISTRY}/opcal/cmak:latest

echo 'build cmak finished'
echo " "
echo " "