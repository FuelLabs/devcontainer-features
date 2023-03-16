#!/bin/sh
set -e

echo "Installing fuelup with provided toolchain: ${TOOLCHAIN}"

export DEBIAN_FRONTEND=noninteractive
export PATH=$HOME/.fuelup/bin:$PATH

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Add fuelup the the path for all new login shells.
echo "export PATH=\$PATH:\$HOME/.fuelup/bin" > /etc/profile.d/00-fuelup.sh
chmod +x /etc/profile.d/00-fuelup.sh

# Updates apt-get if the cache is empty.
apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not.
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Install required packages to build if missing.
check_packages curl git-all sudo

# Install fuelup.
curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path

# The latest toolchain is installed by default. If a specific toolchain is requested, install it and
# set it as the default.
if [ "${TOOLCHAIN}" != "latest" ]; then
    fuelup toolchain install ${TOOLCHAIN}
    fuelup default ${TOOLCHAIN}
fi

# If the remote user is a different user, copy the fuelup directory to the remote user's home.
if [ "$HOME" != "$_REMOTE_USER_HOME" ]; then
    sudo cp -r $HOME/.fuelup $_REMOTE_USER_HOME/.fuelup
fi

# Ensure fuelup and forc are installed.
fuelup --version
forc --version