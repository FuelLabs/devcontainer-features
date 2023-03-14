#!/bin/sh
set -e

echo "Installing fuelup (latest toolchain)"

echo "which apt-get"
echo $(which apt-get)

echo "apt-get install curl"
echo $(apt-get install curl)

echo "which curl"
echo $(which curl)

curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path
export PATH="${HOME}/.fuelup/bin:${PATH}"