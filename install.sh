#!/bin/bash

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "================================="
echo " Brain Desktop Installer"
echo "================================="

CONFIG_DIR="$DOTFILES/configs"

mkdir -p ~/.config


install_config() {
    local name=$1

    if [ -d "$CONFIG_DIR/$name" ]; then
        echo "Installing $name..."
        cp -r "$CONFIG_DIR/$name" ~/.config/
    fi
}


install_config hypr
install_config Brain_Shell
install_config fastfetch
install_config ghostty
install_config waybar


if [ -d "$CONFIG_DIR/systemd/user" ]; then
    echo "Installing systemd services..."

    mkdir -p ~/.config/systemd/user

    cp "$CONFIG_DIR/systemd/user/"*.service \
    ~/.config/systemd/user/ 2>/dev/null || true

    systemctl --user daemon-reload
fi


echo ""
echo "================================="
echo " Brain Desktop installed!"
echo " Restart Hyprland."
echo "================================="
