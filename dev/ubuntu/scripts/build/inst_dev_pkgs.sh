#!/bin/bash
set -e

echo "Installing dev packages..."
apt update
apt install -y build-essential software-properties-common git gdb libtinfo-dev bear net-tools acl

# cmake
${SHR_SCRIPTS}/build/inst_cmake.sh

# perf
${SHR_SCRIPTS}/build/inst_perf.sh

# golang
${SHR_SCRIPTS}/build/inst_golang.sh

# llvm
${SHR_SCRIPTS}/build/inst_llvm.sh

# emacs
${SHR_SCRIPTS}/build/inst_emacs.sh

# vscode
${SHR_SCRIPTS}/build/inst_vscode.sh

# hugo
${SHR_SCRIPTS}/build/inst_hugo.sh

# ccls
${SHR_SCRIPTS}/build/inst_ccls.sh

# gtest
${SHR_SCRIPTS}/build/inst_gtest.sh

# rust
${SHR_SCRIPTS}/build/inst_rust.sh

apt autoremove -y
apt clean -y
rm -rf /var/lib/apt/lists/*
