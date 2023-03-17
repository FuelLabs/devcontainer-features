#!/bin/bash
set -e

source dev-container-features-test-lib

# Feature-specific tests
check "execute command" whoami | grep 'vscode'
check "execute command" fuelup --version | grep -E 'fuelup (\d+\.)+\d+'
check "execute command" forc --version | grep -E 'forc (\d+\.)+\d+'
check "execute command" fuelup default | grep 'latest'

# Test that this non-root user has permission to install new toolchains.
check "execute command" fuelup toolchain install nightly

reportResults
