# generic-image

Suited for applications should be partially bundled for production during containerization process.

## Prerequisites
- Bundled public assets.

## Build it
Works inside the application directory.
```
$ cp ./* PATH_TO_THE_APP_DIRECTORY
# Copy stuff to the application directory

$ docker build -t IMAGE_NAME .
```

## Use it
Assume that image should be linked to the another contaner:
```
$ docker run \
  --name RUNNING_IMAGE_NAME \
  -d APP_IMAGE_NAME

$ docker run \
  --link RUNNING_IMAGE_NAME:LINK_NAME \
  -d PROXY_IMAGE_NAME
```

## Links
- [reverse-proxy](../reverse-proxy)

## Refs
- [Builder](https://docs.docker.com/engine/reference/builder/#usage)

