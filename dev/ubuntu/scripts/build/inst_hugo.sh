#!/bin/bash
set -e

wget https://github.com/gohugoio/hugo/releases/download/v0.69.2/hugo_0.69.2_Linux-64bit.deb -O hugo.deb
dpkg -i hugo.deb
rm -f hugo.deb
