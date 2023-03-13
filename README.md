# Dev Container Features: Self Authoring Template

> This repo provides a starting point and example for creating your own custom [dev container Features](https://containers.dev/implementors/features/), hosted for free on GitHub Container Registry.  The example in this repository follows the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/).  
>
> To provide feedback to the specification, please leave a comment [on spec issue #70](https://github.com/devcontainers/spec/issues/70). For more broad feedback regarding dev container Features, please see [spec issue #61](https://github.com/devcontainers/spec/issues/61).

## Example Contents

This repository contains a _collection_ of two Features - `hello` and `color`. These Features serve as simple feature implementations.  Each sub-section below shows a sample `devcontainer.json` alongside example usage of the Feature.

### `fuelup`

Running `fuelup` inside the built container will install `fuelup` and the `latest` version of the Fuel toolchain.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/FuelLabs/devcontainer-features/fuelup:1": {}
    }
}
```

```bash
$ hello

Hello, user.
```