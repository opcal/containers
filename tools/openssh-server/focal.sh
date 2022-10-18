#!/bin/sh

set -e

echo " "
echo " "
echo 'build openssh-server-focal start'

IMAGE=registry.gitlab.com/opcal/containers/ubuntu:focal

# openssh-server-focal
docker build \
    --build-arg BASE_IMAGE=${IMAGE} \
    -t openssh-server:${TAG_VERSION} \
    -f ${GITHUB_WORKSPACE}/tools/openssh-server/base/Dockerfile . --no-cache
docker image tag openssh-server:${TAG_VERSION} ${CI_REGISTRY}/opcal/containers/openssh-server:focal-${TIMESTAMP}
docker image tag openssh-server:${TAG_VERSION} ${CI_REGISTRY}/opcal/containers/openssh-server:focal
docker push ${CI_REGISTRY}/opcal/containers/openssh-server:focal-${TIMESTAMP}
docker push ${CI_REGISTRY}/opcal/containers/openssh-server:focal

echo 'build openssh-server-focal finished'
echo " "
echo " "