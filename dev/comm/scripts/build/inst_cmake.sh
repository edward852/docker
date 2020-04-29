#!/bin/bash
set -e

wget -qO- https://github.com/Kitware/CMake/releases/download/v3.17.1/cmake-3.17.1-Linux-x86_64.tar.gz | tar -xz --strip 1 -C /usr/
