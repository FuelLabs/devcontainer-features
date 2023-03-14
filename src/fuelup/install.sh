#!/bin/sh
set -x

echo "Installing fuelup (latest toolchain)"

which apt-get

echo "apt-get install curl"
apt-get update
apt-get -qq -y install curl
apt-get -qq -y install git-all

which git

which curl

curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path
export PATH="${HOME}/.fuelup/bin:${PATH}"