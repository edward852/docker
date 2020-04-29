#!/bin/bash
set -e

wget -qO- https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz | tar -xz --strip 1 -C /usr/local/
