#!/usr/bin/env bash

deps=(
    quickshell
    hyprland
    awww
    mpvpaper
    cava
    grim
    slurp
)

missing=()

for dep in "${deps[@]}"; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        missing+=("$dep")
    fi
done

if [ ${#missing[@]} -ne 0 ]; then
    echo "Missing dependencies:"
    printf '%s\n' "${missing[@]}"
    exit 1
fi

echo "All dependencies installed."
