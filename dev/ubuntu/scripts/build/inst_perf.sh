#!/bin/bash
set -e

apt install -y linux-tools-generic
ln -fs /usr/lib/linux-tools/*-generic/perf /usr/bin/perf
${SHR_SCRIPTS}/build/inst_flame_graph.sh
