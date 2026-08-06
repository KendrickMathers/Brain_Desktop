#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config/Brain_Shell/src/user_data"
WALLPAPER_FILE="$CONFIG_DIR/wallpaper.json"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

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

    WALL=$(
        find "$WALLPAPER_DIR" -type f \
            | grep -Ei '\.(png|jpg|jpeg|webp)$' \
            | shuf -n1
    )

    [ -z "$WALL" ] && exit 1

    mkdir -p "$CONFIG_DIR"

    printf '%s\n' "$WALL" > "$WALLPAPER_FILE"

    awww img "$WALL" \
        --transition-type simple

    ;;

list)

    find "$WALLPAPER_DIR" -type f \
        | grep -Ei '\.(png|jpg|jpeg|webp)$' \
        | sort

    ;;

*)

    echo "Usage:"
    echo "  wallpaper.sh current"
    echo "  wallpaper.sh apply <file>"
    echo "  wallpaper.sh random"
    echo "  wallpaper.sh list"

    exit 1

    ;;

esac
