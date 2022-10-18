#!/bin/sh

set -e

echo " "
echo " "
echo 'build openssh-server start'

# openssh-server
find ${GITHUB_WORKSPACE}/tools/openssh-server/ -type f -iname '*.sh' -not -name "**entrypoint.sh" | sort -n | xargs -I {} sh {};


echo 'build openssh-server finished'
echo " "
echo " "