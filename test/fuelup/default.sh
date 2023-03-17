#!/bin/bash
# This test file will be executed against the default scenario.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
# 
# This test can be run with the following command:
#
#    devcontainer features test \ 
#                   --features fuelup   \
#                   --remote-user root \
#                   --skip-scenarios   \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#                   /path/to/this/repo

set -e

# Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "execute command" fuelup --version | grep 'fuelup [0-9].'
check "execute command" forc --version | grep 'forc [0-9].'
check "execute command" fuelup default | grep 'latest'

# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
