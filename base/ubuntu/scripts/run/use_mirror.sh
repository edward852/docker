#!/bin/bash
set -e

if [ "${USE_MIRROR}" == "none" ]; then
    echo "Not using mirror..."
else
    if [ -r "${SHR_CONFIGS}/mirrors/${USE_MIRROR}/sources.list" ]; then
        echo "Using mirror: ${USE_MIRROR}..."
        cp -f ${SHR_CONFIGS}/mirrors/${USE_MIRROR}/sources.list /etc/apt/
    else
        echo "Ignored unknown mirror..."
    fi
fi

apt update
apt clean -y
