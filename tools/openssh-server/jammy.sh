#!/bin/sh

set -e

echo " "
echo " "
echo 'build openssh-server-jammy start'

IMAGE=ghcr.io/opcal/ubuntu:jammy

# openssh-server-jammy
docker build \
    --build-arg BASE_IMAGE=${IMAGE} \
    -t openssh-server:${TAG_VERSION} \
    -f ${PROJECT_DIR}/tools/openssh-server/base/Dockerfile . --no-cache
docker image tag openssh-server:${TAG_VERSION} ${CI_REGISTRY}/opcal/openssh-server:jammy-${LATEST_VERSION}
docker image tag openssh-server:${TAG_VERSION} ${CI_REGISTRY}/opcal/openssh-server:jammy
docker push ${CI_REGISTRY}/opcal/openssh-server:jammy-${LATEST_VERSION}
docker push ${CI_REGISTRY}/opcal/openssh-server:jammy

echo 'build openssh-server-jammy finished'
echo " "
echo " "