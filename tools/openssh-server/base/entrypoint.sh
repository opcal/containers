#!/bin/bash

set -e

groupadd -r ${USER_NAME} --gid=1000; \
useradd -r -g ${USER_NAME} --uid=1000 -s "/bin/bash" -m ${USER_NAME}; \

if [[ ! -z "${USER_PASSWORD}" ]]; then
    echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd
fi

if [[ -f "${USER_PASSWORD_FILE}" ]]; then
    echo "${USER_NAME}:$(cat ${USER_PASSWORD_FILE})" | chpasswd
fi 

exec "$@"