#!/bin/sh
set -x

echo "Installing fuelup (latest toolchain)"

# Install curl and git. Unfortunately the devcontainer features don't seem to work, so we
# have to install them manually.
apt-get update

# These variables are needed to avoid tzdata asking for a timezone on ubuntu.
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -qq -y install curl
apt-get -qq -y install git-all

curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path
