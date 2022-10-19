#!/bin/sh

set -e

echo " "
echo " "
echo 'build openssh-server-focal start'

IMAGE=ghcr.io/opcal/ubuntu:focal

# openssh-server-focal
docker build \
    --build-arg BASE_IMAGE=${IMAGE} \
    -t openssh-server:${TAG_VERSION} \
    -f ${PROJECT_DIR}/tools/openssh-server/base/Dockerfile . --no-cache
docker image tag openssh-server:${TAG_VERSION} ${CI_REGISTRY}/opcal/openssh-server:focal-${LATEST_VERSION}
docker image tag openssh-server:${TAG_VERSION} ${CI_REGISTRY}/opcal/openssh-server:focal
docker push ${CI_REGISTRY}/opcal/openssh-server:focal-${LATEST_VERSION}
docker push ${CI_REGISTRY}/opcal/openssh-server:focal

echo 'build openssh-server-focal finished'
echo " "
echo " "