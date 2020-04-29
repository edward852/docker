#!/bin/bash
set -e

git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake . -DCMAKE_PREFIX_PATH=/usr/
make -j$(nproc)
make install
cd ..
rm -fr ccls/
