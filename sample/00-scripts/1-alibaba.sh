#!/bin/sh

set -e

echo " "
echo " "
echo 'build alibaba start '

find ${GITHUB_WORKSPACE}/sample/alibaba/ -type f -iname '*.sh' -not -name "docker-entrypoint.sh" | sort -n | xargs -I {} sh {};


echo 'build alibaba finished '
echo " "
echo " "