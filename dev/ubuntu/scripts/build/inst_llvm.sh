#!/bin/bash
set -e

wget -qO- https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz | tar -xJ --strip 1 -C /usr/
