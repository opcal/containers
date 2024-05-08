#!/bin/sh

set -e

export TIMESTAMP=$(date +%y.%m.%d.%H.%M)
export LATEST_VERSION=v${PROJECT_VERSION}

echo 'current build tag ${TAG_VERSION}'

echo 'build openssh-server start'

find ${PROJECT_DIR}/openssh-server/ -type f -iname '*.sh' -not -name "**entrypoint.sh" | sort -n | xargs -I {} sh {};

echo 'build openssh-server finished'