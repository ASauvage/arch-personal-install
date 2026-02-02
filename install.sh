#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ":: Arch setup initialisation"

for script in "$ROOT_DIR/scripts/"*.sh;
do
    bash "$script"
done

echo ":: setup complete. Reboot recommended"
