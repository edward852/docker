#!/bin/bash
set -e

add-apt-repository -y ppa:kelleyk/emacs
apt install -y emacs26
add-apt-repository --remove -y ppa:kelleyk/emacs
