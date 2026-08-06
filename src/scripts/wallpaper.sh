#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config/Brain_Shell/src/user_data"
WALLPAPER_FILE="$CONFIG_DIR/wallpaper.json"

case "$1" in

current)
    cat "$WALLPAPER_FILE" 2>/dev/null || true
    ;;

apply)
    WALL="$2"

    [ -z "$WALL" ] && exit 1
    [ ! -f "$WALL" ] && exit 1

    mkdir -p "$CONFIG_DIR"

    printf '%s\n' "$WALL" > "$WALLPAPER_FILE"

    awww img "$WALL" \
        --transition-type simple

    ;;

random)
    DIR="$HOME/Pictures/Wallpapers"

    WALL=$(find "$DIR" -type f \
        | grep -Ei '\.(png|jpg|jpeg|webp)$' \
        | shuf -n1)

    [ -z "$WALL" ] && exit 1

    mkdir -p "$CONFIG_DIR"

    printf '%s\n' "$WALL" > "$WALLPAPER_FILE"

    awww img "$WALL" \
        --transition-type simple

    ;;

*)
    echo "Usage:"
    echo "  wallpaper.sh current"
    echo "  wallpaper.sh apply <file>"
    echo "  wallpaper.sh random"
    exit 1
    ;;

esac
