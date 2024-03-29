#!/bin/bash
set -e

source dev-container-features-test-lib

# Feature-specific tests
check "execute command" fuelup --version | grep 'fuelup [0-9].'
check "execute command" forc --version | grep 'forc [0-9].'
check "execute command" fuelup default | grep 'beta-4'

reportResults
