#!/bin/bash
set -e

if [ -r "${SHR_SCRIPTS}/lang/${LANG_ABBR}/inst.sh" ]; then
    cp -f ${SHR_SCRIPTS}/lang/${LANG_ABBR}/.i18n ${SHR_CONFIGS}/user/
    source ${SHR_SCRIPTS}/lang/${LANG_ABBR}/inst.sh
else
    echo "Ignored unknown language..."
fi
