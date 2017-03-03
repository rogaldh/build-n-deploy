# nodejs-image

This "helper image" is a simple nginx image with installed nodejs. Suited for application images creation.

## Notes
Script installs nodejs from sources, not via NVM.

## How to
```
# Build
$ sudo docker build \
    --build-arg VERSIONNAME=NODE_VERSION
    --build-arg ARCHVALUE=32_OR_64
    -t node-app \
    .
```