#!/bin/sh
set -x

echo "Installing fuelup (latest toolchain)"

# These variables are needed to avoid tzdata asking for a timezone on ubuntu.
export DEBIAN_FRONTEND=noninteractive
export TZ=Etc/UTC

# Install curl and git. Unfortunately the devcontainer features don't seem to work, so we
# have to install them manually.
apt-get update
apt-get -qq -y install curl
apt-get -qq -y install git-all

# Install fuelup.
curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path
