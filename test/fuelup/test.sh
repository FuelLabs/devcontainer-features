#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'fuelup' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Thus, the value of all options will fall back to the default value in the
# Feature's 'devcontainer-feature.json'.
# For the 'fuelup' feature, that means the default toolchain is 'latest'.
# 
# This test can be run with the following command:
#
#    devcontainer features test    \ 
#               --features fuelup   \
#               --remote-user root \
#               --skip-scenarios   \
#               --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#               /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute command" fuelup --version | grep 'fuelup'
check "execute command" forc --version | grep 'forc'
check "execute command" fuelup default | grep 'latest'

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults