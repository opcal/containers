#!/bin/sh

set -e

echo " "
echo " "
echo 'build openssh-server-noble start'

IMAGE=ghcr.io/opcal/ubuntu:noble

# openssh-server-noble
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg BASE_IMAGE=${IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/openssh-server:noble-${LATEST_VERSION} \
    -t ${CI_REGISTRY}/opcal/openssh-server:noble \
    -f ${PROJECT_DIR}/openssh-server/base/Dockerfile . --no-cache

echo 'build openssh-server-noble finished'
echo " "
echo " "