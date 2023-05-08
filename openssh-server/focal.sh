#!/bin/sh

set -e

echo " "
echo " "
echo 'build openssh-server-focal start'

IMAGE=ghcr.io/opcal/ubuntu:focal

# openssh-server-focal
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg BASE_IMAGE=${IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/openssh-server:focal-${LATEST_VERSION} \
    -t ${CI_REGISTRY}/opcal/openssh-server:focal \
    -f ${PROJECT_DIR}/openssh-server/base/Dockerfile . --no-cache

echo 'build openssh-server-focal finished'
echo " "
echo " "