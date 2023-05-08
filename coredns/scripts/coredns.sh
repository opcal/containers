#!/bin/sh

set -e

echo " "
echo " "
echo 'build coredns start'

export COREDNS_TAG=$(curl https://api.github.com/repos/coredns/coredns/releases/latest | grep tag_name | cut -d '"' -f 4)

echo ${COREDNS_TAG}

docker buildx build \
    --platform linux/amd64,linux/arm64,linux/arm/v7 \
    --build-arg COREDNS_TAG  \
    --push \
    -t ${CI_REGISTRY}/opcal/coredns:${COREDNS_TAG} \
    -t ${CI_REGISTRY}/opcal/coredns:latest \
    -f ${PROJECT_DIR}/coredns/Dockerfile . --no-cache

echo 'build coredns finished'
echo " "
echo " "