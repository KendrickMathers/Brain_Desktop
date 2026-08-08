#!/bin/bash

PROFILE="$1"

case "$PROFILE" in

    performance)
        powerprofilesctl set performance
        ;;

    balanced)
        powerprofilesctl set balanced
        ;;

    power-saver)
        powerprofilesctl set power-saver
        ;;

    *)
        exit 1
        ;;

esac
