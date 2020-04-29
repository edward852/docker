#!/bin/bash
set -e

wget https://github.com/google/googletest/archive/release-1.10.0.tar.gz -O googletest.gz
tar -xf googletest.gz
cd googletest-*
cmake .
make -j$(nproc)
make install
cd ..
rm -fr googletest*
