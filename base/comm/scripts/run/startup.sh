#!/bin/bash

cd ~
source ~/.bashrc

echo "uid $(id -u) gid $(id -g) lang $LANG called startup.sh"

## correct forwarding of shutdown signal
cleanup () {
    kill -s SIGTERM $!
    exit 0
}
trap cleanup SIGINT SIGTERM

${SHR_SCRIPTS}/run/user_spec.sh

${SHR_PATH}/noVNC/utils/launch.sh --vnc localhost:$VNC_PORT --listen $NO_VNC_PORT &> /dev/null &
NO_VNC_PID=$!

vncserver -kill $DISPLAY > /dev/null 2>&1 \
    || rm -rf /tmp/.X*-lock /tmp/.X11-unix &> /dev/null \
    || echo "vnc cleanup done"

vncserver $DISPLAY -depth 24 -geometry $VNC_RES > /dev/null 2>&1

${SHR_SCRIPTS}/run/wm_startup.sh &> /dev/null

wait $NO_VNC_PID
