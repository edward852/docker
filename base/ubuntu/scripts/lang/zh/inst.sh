#!/bin/bash
set -e

! locale -a | grep -i "zh_CN.utf" &> /dev/null || exit 0

# timezone
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

apt install -y language-pack-zh-hans firefox-locale-zh-hans

locale-gen zh_CN.UTF-8

apt install -y fcitx-googlepinyin
