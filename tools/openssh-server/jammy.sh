#!/bin/sh

set -e

echo " "
echo " "
echo 'build openssh-server-jammy start'

IMAGE=ghcr.io/opcal/ubuntu:jammy

# openssh-server-jammy
docker buildx build \
    --platform linux/amd64,linux/arm64/v8,linux/arm/v7,linux/ppc64le,linux/s390x \
    --build-arg BASE_IMAGE=${IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/openssh-server:jammy-${LATEST_VERSION} \
    -t ${CI_REGISTRY}/opcal/openssh-server:jammy \
    -f ${PROJECT_DIR}/tools/openssh-server/base/Dockerfile . --no-cache

echo 'build openssh-server-jammy finished'
echo " "
echo " "