#!/bin/sh

set -e

echo " "
echo " "
echo 'build opcal-coredns start'

export COREDNS_TAG=$(curl https://api.github.com/repos/coredns/coredns/releases/latest | grep tag_name | cut -d '"' -f 4)

echo ${COREDNS_TAG}

docker build --build-arg COREDNS_TAG -t opcal-coredns:${TAG_VERSION} -f ${PROJECT_DIR}/tools/coredns/Dockerfile . --no-cache
docker image tag opcal-coredns:${TAG_VERSION} ${CI_REGISTRY}/opcal/opcal-coredns:${COREDNS_TAG}
docker image tag opcal-coredns:${TAG_VERSION} ${CI_REGISTRY}/opcal/opcal-coredns:latest
docker push ${CI_REGISTRY}/opcal/opcal-coredns:${COREDNS_TAG}
docker push ${CI_REGISTRY}/opcal/opcal-coredns:latest

echo 'build opcal-coredns finished'
echo " "
echo " "