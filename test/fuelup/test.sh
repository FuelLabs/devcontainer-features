#!/bin/bash
set -x

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes no options.
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
# 
# This test can be run with the following command:
#
#    devcontainer features test \ 
#                   --features fuelup   \
#                   --remote-user root \
#                   --skip-scenarios   \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#                   /path/to/this/repo

# Optional: Import test library bundled with the devcontainer CLI


echo "Starting test!"

source dev-container-features-test-lib

echo ls $HOME/.fuelup/bin/.fuelup/bin
LS=`ls $HOME/.fuelup/bin`

echo $LS

echo which fuelup
FU=`which fuelup`

echo "$FU"

exec which forc
FO=`which fuelup`

echo "$FO"

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute command" which fuelup | grep '.fuelup/bin/fuelup'
check "execute command" which forc | grep '.fuelup/bin/fuelup'

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults