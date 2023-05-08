#!/bin/sh

set -e

echo " "
echo " "
echo 'build frp start'

FRP_VERSION=$(curl https://api.github.com/repos/fatedier/frp/releases/latest | grep tag_name | cut -d '"' -f 4)

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg FRP_VERSION=${FRP_VERSION} \
    --push \
    -t ${CI_REGISTRY}/opcal/frps:${FRP_VERSION} \
    -t ${CI_REGISTRY}/opcal/frps:latest \
    -f ${PROJECT_DIR}/frp/Dockerfile-server . --no-cache

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg FRP_VERSION=${FRP_VERSION} \
    --push \
    -t ${CI_REGISTRY}/opcal/frpc:${FRP_VERSION} \
    -t ${CI_REGISTRY}/opcal/frpc:latest \
    -f ${PROJECT_DIR}/frp/Dockerfile-client . --no-cache

echo 'build frp finished'
echo " "
echo " "