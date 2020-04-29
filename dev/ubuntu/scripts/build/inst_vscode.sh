#!/bin/bash
set -e

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
dpkg -i vscode.deb
rm -f vscode.deb
