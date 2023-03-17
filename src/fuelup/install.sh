#!/bin/bash
set -e

echo "Installing fuelup with provided toolchain: ${TOOLCHAIN}"

export DEBIAN_FRONTEND=noninteractive
export FUELUP_HOME=$HOME/.fuelup
export REMOTE_FUELUP_HOME=$_REMOTE_USER_HOME/.fuelup
export PATH=$FUELUP_HOME/bin:$PATH

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Ensure that login shells get the correct path if the user updated the PATH using ENV.
rm -f /etc/profile.d/00-restore-env.sh
echo "export PATH=${PATH//$(sh -lc 'echo $PATH')/\$PATH}" > /etc/profile.d/00-restore-env.sh
chmod +x /etc/profile.d/00-restore-env.sh

# Updates bashrc and zshrc files with the given string if not already present.
updaterc() {
    echo "Updating /etc/bash.bashrc and /etc/zsh/zshrc..."
    if [[ "$(cat /etc/bash.bashrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/bash.bashrc
    fi
    if [ -f "/etc/zsh/zshrc" ] && [[ "$(cat /etc/zsh/zshrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/zsh/zshrc
    fi
}

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
check_packages curl git-all

# Install fuelup.
curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path

# The latest toolchain is installed by default. If a specific toolchain is requested, install it and
# set it as the default.
if [ "${TOOLCHAIN}" != "latest" ]; then
    fuelup toolchain install ${TOOLCHAIN}
    fuelup default ${TOOLCHAIN}
fi

# Ensure fuelup and forc are installed.
fuelup --version
forc --version

# If the remote user is a different user, copy the fuelup directory to the remote user's home.
if [ "$HOME" != "$_REMOTE_USER_HOME" ]; then
    mv $FUELUP_HOME $REMOTE_FUELUP_HOME
    chmod 775 -R $REMOTE_FUELUP_HOME
    chown -R $_REMOTE_USER:$_REMOTE_USER $REMOTE_FUELUP_HOME
fi

# Add FUELUP_HOME and bin directory into bashrc/zshrc files.
updaterc "$(cat << EOF
export FUELUP_HOME="${REMOTE_FUELUP_HOME}"
if [[ "\${PATH}" != *"\${FUELUP_HOME}/bin"* ]]; then export PATH="\${FUELUP_HOME}/bin:\${PATH}"; fi
EOF
)"
