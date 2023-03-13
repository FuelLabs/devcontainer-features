#!/bin/sh
set -e

echo "Installing fuelup (latest toolchain)"

curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path
export PATH="${HOME}/.fuelup/bin:${PATH}"