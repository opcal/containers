#!/bin/sh

set -e

echo " "
echo " "
echo 'build randomuser.me start'

export RUSERME_VERSION=$(curl https://api.github.com/repos/RandomAPI/Randomuser.me-Node/releases/latest | grep tag_name | cut -d '"' -f 4)

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg RUSERME_VERSION  \
    --push \
    -t ${CI_REGISTRY}/opcal/randomuser-me:${RUSERME_VERSION} \
    -t ${CI_REGISTRY}/opcal/randomuser-me:latest \
    -f ${PROJECT_DIR}/randomuser.me/Dockerfile . --no-cache

echo 'build randomuser.me finished'
echo " "
echo " "