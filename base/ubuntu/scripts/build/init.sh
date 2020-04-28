#!/bin/bash
set -e

echo "Build init started..."

${SHR_SCRIPTS}/run/use_mirror.sh

apt install -y gosu sudo openssl wget curl p7zip-full p7zip-rar bsdtar locales
${SHR_SCRIPTS}/build/inst_font.sh

groupadd -g 120 no_pw_sudo
echo "%no_pw_sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

${SHR_SCRIPTS}/build/inst_pkgs.sh

cp ${SHR_SCRIPTS}/run/start*.sh /usr/bin/

apt autoremove -y
apt clean -y
rm -rf /var/lib/apt/lists/*
