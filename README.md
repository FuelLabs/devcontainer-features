# Fuel Labs Dev Container Features

## Contents

This repository contains a _collection_ of one Feature - `fuelup`.

### `fuelup`

Running `fuelup` inside the built container will install `fuelup` and the specified version of the Fuel toolchain, defaulting to `latest` if none is specified. The options for toolchains are:

- latest
- beta-1
- beta-2
- beta-3
- nightly

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/FuelLabs/devcontainer-features/fuelup:1": {}
    }
}
```

is equivalent to:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/FuelLabs/devcontainer-features/fuelup:1": {
            "toolchain": "latest"
        }
    }
}
```
