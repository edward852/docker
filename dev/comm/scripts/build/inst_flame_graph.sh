#!/bin/bash
set -e

wget https://github.com/brendangregg/FlameGraph/archive/v1.0.tar.gz -O FlameGraph.gz
tar -xf FlameGraph.gz
cp FlameGraph-1.0/{flamegraph.pl,stackcollapse-perf.pl} /usr/bin/
rm -fr FlameGraph*
