#!/usr/bin/env bash

set -e


CONFIG="$HOME/.config/Brain_Shell/src/user_data/wallpaper.json"


mkdir -p "$(dirname "$CONFIG")"



case "$1" in


current)

    cat "$CONFIG" 2>/dev/null || true

    ;;



apply)


    WALL="$2"


    [ -z "$WALL" ] && exit 1

    [ ! -f "$WALL" ] && exit 1



    pkill mpvpaper 2>/dev/null || true



    mkdir -p "$(dirname "$CONFIG")"



    printf '%s\n' "$WALL" > "$CONFIG"



    EXT="${WALL##*.}"



    case "${EXT,,}" in


        mp4|mkv|webm|mov)

            mpvpaper \
                -o "no-audio --loop-file=inf" \
                "*" \
                "$WALL" &

            ;;



        png|jpg|jpeg|webp)

            awww img \
                "$WALL" \
                --transition-type fade

            ;;



        *)

            echo "Unsupported wallpaper type"

            exit 1

            ;;

    esac


    ;;



random)


    DIR="$HOME/Pictures/Wallpapers"


    find "$DIR" -type f \
    | shuf -n1 \
    | xargs -r "$0" apply


    ;;



*)

    echo "Usage:"
    echo "$0 current"
    echo "$0 apply <file>"
    echo "$0 random"

    exit 1

    ;;


esac
