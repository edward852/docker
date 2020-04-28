#!/bin/bash
#set -e

# disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &

# ubuntu不重复调用 startxfce4
#startxfce4 --replace > ${HOME}/wm.log &

# sleep for a little while to avoid duplicate startup
sleep 2

# Test whether fcitx is running correctly with dbus...
fcitx-remote > /dev/null 2>&1
if [ $? = "1" ]; then
    echo "Fcitx seems is not running"
    fcitx &
fi
