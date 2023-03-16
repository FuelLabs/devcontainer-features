# Dev Container Features: Self Authoring Template

> This repo provides a starting point and example for creating your own custom [dev container Features](https://containers.dev/implementors/features/), hosted for free on GitHub Container Registry.  The example in this repository follows the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/).  
>
> To provide feedback to the specification, please leave a comment [on spec issue #70](https://github.com/devcontainers/spec/issues/70). For more broad feedback regarding dev container Features, please see [spec issue #61](https://github.com/devcontainers/spec/issues/61).

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