#!/bin/sh
set -x

echo "Installing fuelup with provided toolchain: ${TOOLCHAIN}"

# Install fuelup with `--no-modify-path`. The PATH is modified in `devcontainer-feature.json` instead
# so that it persists in the final image.
curl --proto '=https' --tlsv1.2 -sSf https://install.fuel.network/fuelup-init.sh | sh -s -- --no-modify-path

# The latest toolchain is installed by default. If a specific toolchain is requested, install it and
# set it as the default.
if [ "${TOOLCHAIN}" != "latest" ]; then
    export PATH="${PATH}:${HOME}/.fuelup/bin"
    fuelup toolchain install ${TOOLCHAIN}
    fuelup default ${TOOLCHAIN}
fi