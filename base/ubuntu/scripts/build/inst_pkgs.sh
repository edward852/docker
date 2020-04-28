#!/bin/bash
set -e

echo "Installing packages..."

apt install -y supervisor xfce4 xfce4-terminal
apt-get purge -y pm-utils xscreensaver

#apt install -y tightvncserver
wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.10.1.x86_64.tar.gz | tar -xz --strip 1 -C /
apt install -y fcitx vim firefox

mkdir -p ${SHR_PATH}/noVNC
wget -qO- https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xz --strip 1 -C ${SHR_PATH}/noVNC
# noVNC requires websockify
apt install -y websockify

#apt install -y build-essential software-properties-common git gdb libtinfo-dev bear vim
