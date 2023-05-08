#!/bin/sh

set -e

export TIMESTAMP=$(date +%y.%m.%d.%H.%M)
export LATEST_VERSION=v${PROJECT_VERSION}

echo 'current build tag ${TAG_VERSION}'

chmod +x ${PROJECT_DIR}/coredns/scripts/**.sh

find ${PROJECT_DIR}/coredns/scripts/ -type f -iname '*.sh' | sort -n | xargs -I {} sh {}; 
