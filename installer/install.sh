#!/usr/bin/env bash

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOME_DIR="$HOME"

echo "Installing Brain Desktop..."

echo "[1/4] Creating directories..."

mkdir -p \
    "$HOME_DIR/.config/hypr" \
    "$HOME_DIR/.config/Brain_Shell" \
    "$HOME_DIR/.config/systemd/user" \
    "$HOME_DIR/Pictures/Wallpapers/Images" \
    "$HOME_DIR/Pictures/Wallpapers/Videos"


echo "[2/4] Installing Hyprland config..."

cp "$REPO_DIR/configs/hypr/hyprland.lua" \
   "$HOME_DIR/.config/hypr/"


echo "[3/4] Installing Brain Shell config..."

cp "$REPO_DIR/configs/Brain_Shell/"* \
   "$HOME_DIR/.config/Brain_Shell/"


echo "[4/4] Installing systemd service..."

cp "$REPO_DIR/configs/systemd/brainshell.service" \
   "$HOME_DIR/.config/systemd/user/"


systemctl --user daemon-reload

systemctl --user enable brainshell.service

echo ""
echo "Brain Desktop installed."
echo "Restart your session or run:"
echo "systemctl --user start brainshell.service"
