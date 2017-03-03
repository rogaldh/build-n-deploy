# app-release-image

Contains application codebase. App should be injected on build. Works in pair with Nginx image.

## Prerequisites
Built on top of [`nodejs`](../nodejs/readme.md#L=14) docker image.
Uses [`nginx-proxy`](../nginx-proxy/readme.md) docker image to work with.

## Notes
[`Dockerfile`](./src/Dockerfile) contains kinda hack around `npm i` :\

## How to
```
# Build
## Copy stuff to the directory which contains folder with an application
$ cp ./* PATH_TO_THE_APP_PARENT_DIRECTORY
$ ./docker-build.sh

# Run
# Assume that we already have a server image and an app image

# In most cases INTERNAL_PORT and EXTERNAL_PORT should be equal to the port which is exposed from app image
$ sudo docker run -d \
    -p EXTERNAL_PORT:INTERNAL_PORT \
    --name RUNNING_IMAGE_NAME \
    APP_IMAGE_NAME

# Here we make a link to the running image by name (`RUNNING_IMAGE_NAME`). It is used at `proxy_pass` directive
$ sudo docker run -d \
    -p EXTERNAL_IP:EXTERNAL_PORT:80 \
    --link RUNNING_IMAGE_NAME:app \
    SERVER_IMAGE_NAME
```
