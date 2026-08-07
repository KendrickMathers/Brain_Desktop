#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$DOTFILES/configs"

echo "================================="
echo " Brain Desktop Installer"
echo "================================="

echo ""

backup_config() {
    local target="$HOME/.config/$1"

    if [ -e "$target" ]; then
        BACKUP="$HOME/.config.backup-Brain_Desktop-$(date +%Y%m%d-%H%M%S)"

        echo "Backing up existing config..."
        mkdir -p "$BACKUP"

        cp -r "$target" "$BACKUP/"
    fi
}


install_config() {
    local name="$1"

    if [ -d "$CONFIG_DIR/$name" ]; then
        echo "Installing $name..."

        backup_config "$name"

        cp -r "$CONFIG_DIR/$name" "$HOME/.config/"
    fi
}


mkdir -p "$HOME/.config"


install_config hypr
install_config Brain_Shell
install_config fastfetch
install_config ghostty
install_config waybar


if [ -d "$CONFIG_DIR/systemd/user" ]; then

    echo "Installing systemd services..."

    mkdir -p "$HOME/.config/systemd/user"

    cp "$CONFIG_DIR/systemd/user/"*.service \
        "$HOME/.config/systemd/user/" 2>/dev/null || true


    systemctl --user daemon-reload


    if [ -f "$HOME/.config/systemd/user/brainshell.service" ]; then
        systemctl --user enable brainshell.service
    fi

fi


echo ""
echo "================================="
echo " Brain Desktop installed!"
echo ""
echo " Restart Hyprland to apply changes."
echo "================================="
