#!/usr/bin/env bash

set -e

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="/etc/nixos"
SCRIPT_NAME=$(basename "$0")

echo "Copying NixOS config"
echo "From: $SOURCE_DIR"
echo "To:   $DEST_DIR (ignoring $SCRIPT_NAME)"
sudo rsync -av --exclude="$SCRIPT_NAME" "$SOURCE_DIR"/ "$DEST_DIR"/

echo "Rebuilding NixOS config"
sudo nixos-rebuild switch

echo "Copying flake.lock back"
sudo cp "$DEST_DIR/flake.lock" "$SOURCE_DIR/"

echo "Done!"

