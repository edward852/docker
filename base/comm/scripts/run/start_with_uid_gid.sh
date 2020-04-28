#!/bin/bash
set -e

if [ "$(id -u)" == "0" ]; then
    ${SHR_SCRIPTS}/run/use_mirror.sh
    ${SHR_SCRIPTS}/run/use_lang.sh

    if [ "${USR_ID}" != "0" ]; then
        export USR_HOME=${SHR_PATH}/$USR_NAME

        if [ "${USR_NAME}" == "root" ]; then
            export USR_NAME=user$USR_ID
        fi

        ${SHR_SCRIPTS}/run/gen_uid_gid.sh
        su -l $USR_NAME -c "cp -fr ${SHR_CONFIGS}/user/. ${USR_HOME}/"
    else
        USR_HOME=/root
        cp -fr ${SHR_CONFIGS}/user/. ${USR_HOME}/
    fi
fi

if [ "$1" == "startup.sh" ]; then
    exec gosu $USR_NAME "$@"
fi

echo "started with uid $(id -u) gid $(id -g)"
exec "$@"
