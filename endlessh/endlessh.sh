#!/bin/sh

set -e

echo " "
echo " "
echo 'build endlessh start'

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg RUSERME_VERSION  \
    --push \
    -t ${CI_REGISTRY}/opcal/endlessh:latest \
    -f ${PROJECT_DIR}/endlessh/Dockerfile . --no-cache

echo 'build endlessh finished'
echo " "
echo " "