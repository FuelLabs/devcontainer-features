#!/bin/bash
set -e

source dev-container-features-test-lib

# Feature-specific tests
check "execute command" whoami | grep 'root'
check "execute command" fuelup --version | grep -E 'fuelup (\d+\.)+\d+'
check "execute command" forc --version | grep -E 'forc (\d+\.)+\d+'
check "execute command" fuelup default | grep 'latest'

reportResults
