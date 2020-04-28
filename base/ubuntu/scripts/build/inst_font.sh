#!/bin/bash
set -e

echo "Installing sarasa gothic font..."

apt install -y fontconfig

mkdir -p /usr/share/fonts
wget https://github.com/be5invis/Sarasa-Gothic/releases/download/v0.12.5/sarasa-gothic-ttc-0.12.5.7z -O sarasa.7z
7z x -o/usr/share/fonts sarasa.7z
rm -f sarasa.7z
fc-cache -v
