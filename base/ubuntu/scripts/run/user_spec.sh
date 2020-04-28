#!/bin/bash
set -e

mkdir -p ~/.vnc
VNC_PW_PATH="${HOME}/.vnc/passwd"
echo "${VNC_PW}" | vncpasswd -f > $VNC_PW_PATH
chmod 600 $VNC_PW_PATH

mkdir -p ~/.config
mv -n ~/xfce4 ~/.config/
