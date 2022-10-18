#!/bin/sh

set -e

export TIMESTAMP=$(date +%y.%m.%d.%H.%M)
export LATEST_VERSION=v${PROJECT_VERSION}
export TAG_VERSION=${GITHUB_RUN_NUMBER}

echo 'current build tag ${TAG_VERSION}'

echo ${CI_DEPLOY_PASSWORD} | docker login ${CI_REGISTRY} -u ${CI_DEPLOY_USER} --password-stdin

chmod +x ${GITHUB_WORKSPACE}/sample/00-scripts/**.sh

find ${GITHUB_WORKSPACE}/sample/00-scripts/ -type f -iname '*.sh' | sort -n | xargs -I {} sh {}; 
