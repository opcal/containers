#!/bin/bash

set -e

export D_PARAMS="${D_PARAMS} -Dserver.port=8080 -Dcsp.sentinel.log.dir=/data/logs/csp/"
export PARAMS="${PARAMS}"


if [[ -n "${DASHBOARD_SERVER}" ]]; then
    export D_PARAMS="${D_PARAMS} -Dcsp.sentinel.dashboard.server=${DASHBOARD_SERVER}"
fi

if [[ -n "${USERNAME}" ]]; then
    export D_PARAMS="${D_PARAMS} -Dsentinel.dashboard.auth.username=${USERNAME}"
fi

if [[ -n "${PASSWORD}" ]]; then
    export D_PARAMS="${D_PARAMS} -Dsentinel.dashboard.auth.password=${PASSWORD}"
fi

if [[ -n "${SESSION_TIMEOUT}" ]]; then
    export D_PARAMS="${D_PARAMS} -Dserver.servlet.session.timeout=${SESSION_TIMEOUT}"
fi

if [[ -n "${PROJECT_NAME}" ]]; then
    export D_PARAMS="${D_PARAMS} -Dproject.name=${PROJECT_NAME}"
fi



if [[ "$(id -u)" == '0' ]]; then
    chown -R opcal "/app"
    exec gosu opcal "$0" "java ${D_PARAMS} -jar /app/sentinel-dashboard.jar ${PARAMS}"
fi

exec java \
    ${D_PARAMS} \
    -jar /app/sentinel-dashboard.jar \
    ${PARAMS}