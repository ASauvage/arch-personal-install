#!/usr/bin/env bash
# This script ensure that all conditions are met

if [[ $EUID -eq 0 ]]; then
    echo ":: do not run as root"
    exit 1
fi

if ! command -v pacman > /dev/null; then
    echo ":: this install script is intended to run on Arch Linux"
    exit 1
fi

if ! sudo -v; then
    echo ":: sudo not available"
    exit 1
fi
