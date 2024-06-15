#!/bin/bash

# Installation script for SysDiagX
# Webpage - https://sysdiagx.ondrejpacovky.cz
# Source - https://github.com/Ondra9071/sysdiagx/

if [ "$(id -u)" -ne 0 ]; then
  echo "Installation requires running with sudo."
  exit 1
fi

URL="https://sysdiagx.ondrejpacovsky.cz/ftp/sysdiagx.sh"
DIR="/etc/sysdiagx"
BIN="/usr/local/bin/sysdiagx"

echo "Installing SysDiagX..."

mkdir -p "$DIR"
mkdir -p "$DIR/output"
chmod -R 777 /etc/sysdiagx/output
curl -o "$DIR/sysdiagx.sh" "$URL"

if [ $? -ne 0 ]; then
  echo "Failed to download SysDiagX from source. Please check your network connection."
  exit 1
fi

chmod +x "$DIR/sysdiagx.sh"
ln -sf "$DIR/sysdiagx.sh" "$BIN"

echo "

▀█▀ █░█ ▄▀█ █▄░█ █▄▀   █▄█ █▀█ █░█ █
░█░ █▀█ █▀█ █░▀█ █░█   ░█░ █▄█ █▄█ ▄

SysDiagX has been successfully installed, use it with 'sysdiagx'.

Wanna support this project? Check https://buymeacoffee.com/ondra907"