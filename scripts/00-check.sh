#!/usr/bin/env bash
# This script ensure that all conditions are met

if [[ $EUID -eq 0 ]]; then
    echo ":: Do not run this script as root"
    exit 1
fi

if ! command -v pacman > /dev/null; then
    echo ":: This script is intended to run on Arch Linux"
    exit 1
fi

if ! sudo -v; then
    echo ":: Sudo not available"
    exit 1
fi
