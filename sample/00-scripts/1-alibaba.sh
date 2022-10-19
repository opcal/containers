#!/bin/sh

set -e

echo " "
echo " "
echo 'build alibaba start '

find ${PROJECT_DIR}/sample/alibaba/ -type f -iname '*.sh' -not -name "docker-entrypoint.sh" | sort -n | xargs -I {} sh {};


echo 'build alibaba finished '
echo " "
echo " "