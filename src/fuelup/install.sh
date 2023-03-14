#!/bin/sh
set -e

echo "Installing fuelup (latest toolchain)"

apt-get update
apt-get -qq -y install curl
apt-get -qq -y install git-all

curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path
