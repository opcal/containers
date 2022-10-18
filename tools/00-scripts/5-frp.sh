#!/bin/sh

set -e

echo " "
echo " "
echo 'build frp start'

FRP_VERSION=$(curl https://api.github.com/repos/fatedier/frp/releases/latest | grep tag_name | cut -d '"' -f 4)

docker build \
    --build-arg FRP_VERSION=${FRP_VERSION} \
    -t frps:${TAG_VERSION} \
    -f ${GITHUB_WORKSPACE}/tools/frp/Dockerfile-server . --no-cache
docker image tag frps:${TAG_VERSION} ${CI_REGISTRY}/opcal/frps:${FRP_VERSION}
docker image tag frps:${TAG_VERSION} ${CI_REGISTRY}/opcal/frps:latest
docker push ${CI_REGISTRY}/opcal/frps:${FRP_VERSION}
docker push ${CI_REGISTRY}/opcal/frps:latest

docker build \
    --build-arg FRP_VERSION=${FRP_VERSION} \
    -t frpc:${TAG_VERSION} \
    -f ${GITHUB_WORKSPACE}/tools/frp/Dockerfile-client . --no-cache
docker image tag frpc:${TAG_VERSION} ${CI_REGISTRY}/opcal/frpc:${FRP_VERSION}
docker image tag frpc:${TAG_VERSION} ${CI_REGISTRY}/opcal/frpc:latest
docker push ${CI_REGISTRY}/opcal/frpc:${FRP_VERSION}
docker push ${CI_REGISTRY}/opcal/frpc:latest

echo 'build frp finished'
echo " "
echo " "