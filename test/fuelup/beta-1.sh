#!/bin/bash
set -e

source dev-container-features-test-lib

# Feature-specific tests
check "execute command" fuelup --version | grep 'fuelup'
check "execute command" forc --version | grep 'forc'
check "execute command" fuelup default | grep 'beta-1'

reportResults
